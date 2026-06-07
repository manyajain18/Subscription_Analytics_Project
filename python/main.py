import pandas as pd
import numpy as np
from pathlib import Path
from sqlalchemy import create_engine

# =========================
# Loading Data
# =========================


project_root = Path(__file__).parent.parent
data_dir = project_root / "data"


input_file_1 = data_dir / "dirty_app_subscription_analytics (1).csv"
input_file_2 = data_dir / "subscriptions_sample_500.csv"
output_file = project_root / "cleaned_subscriptions.csv"




df1 = pd.read_csv(input_file_1)
df2 = pd.read_csv(input_file_2)





# Merging subscription datasets
df = pd.concat([df1, df2], ignore_index=True)


#Checking DataSet Shape
print(df.shape)

#Previewing Dataset
print(df.head())

#Checking Column Information
print(df.info())
#Checking Duplicates
# print(df.duplicated().sum())





# =========================
# Data Cleaning
# =========================

# Removing duplicates
df.drop_duplicates(inplace=True)

#Again Checking Duplicates
print(df.duplicated().sum())

# Checking missing values
print(df.isnull().sum())

# Fill missing acquisition channel
df['Acquisition_Channel'] = (
    df['Acquisition_Channel']
    .fillna('Unknown')
)

# Filling missing watch time
df['Watch_Time_Mins'] = (
    df.groupby('Subscription_Tier')['Watch_Time_Mins']
    .transform(lambda x: x.fillna(x.median()))
)

# Checking again
print(df.isnull().sum())



# Fixing negative watch time
df['Watch_Time_Mins'] = df['Watch_Time_Mins'].abs()











# =========================
# Standardize Region Values
# =========================


df['Region'] = (
    df['Region']
    .astype(str)
    .str.strip()
    .str.lower()
)

region_mapping = {
    'north': 'North',
    'n_reg': 'North',

    'south': 'South',
    's_reg': 'South',

    'east': 'East',
    'e_reg': 'East',

    'west': 'West',
    'w_reg': 'West'
}

df['Region'] = df['Region'].replace(region_mapping)

# Checking final unique values
print(df['Region'].unique())

print("✔️ Region values standardized successfully.")








# =========================
# Date Processing
# =========================

# Convert signup date
df['Signup_Date'] = pd.to_datetime(
    df['Signup_Date'],
    format='mixed'
)

# Creating Signup Month
df['Signup_Month'] = (
    df['Signup_Date']
    .dt.month_name()
)


# Creating Signup Year
df['Signup_Year'] = (
    df['Signup_Date']
    .dt.year
)













# =========================
# Feature Engineering
# =========================



# User engagement classification
df['Engagement_Level'] = df['Watch_Time_Mins'].apply(
    lambda x: 'High'
    if x >= 120
    else 'Medium'
    if x >= 60
    else 'Low'
)

# Retention score calculation
df['Retention_Score'] = (
    df['Watch_Time_Mins'] * 0.3 +
    df['Quizzes_Completed'] * 5
).round(2)


# Retention segmentation
df['Retention_Category'] = df['Retention_Score'].apply(
    lambda x: 'High Retention'
    if x >= 120
    else 'Medium Retention'
    if x >= 50
    else 'Low Retention'
)

# # Assigning Random course id
course_ids = [101,102,103,104,105,106,107,108]

df['Course_ID'] = np.random.choice(
    course_ids,
    size=len(df)
)















# Final DataSet Preview
print(df.head())

# Final DataSet Information
print(df.info())












# =========================
# Exporting Clean Dataset
# =========================

#Saved Clean csv
df.to_csv(output_file, index=False, encoding="utf-8")

print(f"✅ Cleaned data saved to: {output_file}")

# =========================
# Loading Data into MySQL
# =========================
try:
    engine = create_engine(
        'mysql+pymysql://root:YOUR PASSWORD@localhost/subscription_analytics'
    )
    df.to_sql(
        name='cleaned_subscriptions',
        con=engine,
        if_exists='replace',
        index=False
    )
    print("✅ Data transferred successfully to MySQL!")
except Exception as e:
    print(f"⚠️ MySQL upload skipped: {e}")
    print("   (Make sure your MySQL is running with the correct credentials)")