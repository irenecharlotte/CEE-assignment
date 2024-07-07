#!/usr/bin/env python
# coding: utf-8

import pandas as pd
import psycopg2

# Function to connect to the PostgreSQL database
def connect_to_db():
    conn = psycopg2.connect(
            dbname="recs_data",
            user="",
            password="",
            host="localhost",
            port="5432"
    )
    return conn

# Function to load data from CSV
def load_data(file_path):
    df = pd.read_csv(file_path)
    return df

# Function to clean and validate data
def clean_data(df):
    # Select only the columns you want
    columns_to_keep = ['DOEID', 'state_name', 'HDD65', 'CDD65', 'TYPEHUQ',
                       'KOWNRENT', 'TOTROOMS', 'WALLTYPE', 'FUELHEAT', 'AIRCOND']

    # Filter columns
    df_cleaned = df[columns_to_keep].copy()

    # Remove records where heating degree days are less than 7000
    df_cleaned = df_cleaned[df_cleaned['HDD65'] >= 7000]

    # Drop rows with any missing values
    df_cleaned.dropna(inplace=True)

    # Drop duplicates based on 'DOEID'
    df_cleaned.drop_duplicates(subset=['DOEID'], inplace=True)

    # Filter out rows with invalid 'own_or_rent' values
    df_cleaned = df_cleaned[df_cleaned['KOWNRENT'].isin([1, 2, 3])]

    # Validate and filter 'FUELHEAT' values
    valid_fuelheat_values = [5, 1, 2, 3, 7, 99, -2]
    df_cleaned = df_cleaned[df_cleaned['FUELHEAT'].isin(valid_fuelheat_values)]

    # Validate and filter 'WALLTYPE' values
    valid_walltype_values = [1, 2, 3, 4, 5, 6, 7, 99]
    df_cleaned = df_cleaned[df_cleaned['WALLTYPE'].isin(valid_walltype_values)]

    return df_cleaned

# Function to insert data into the database
def insert_data(conn, df):
    cursor = conn.cursor()

    for _, row in df.iterrows():
        cursor.execute(
            """
            INSERT INTO Respondent (respondent_id, own_or_rent_id, total_number_of_rooms)
            VALUES (%s, %s, %s);
            """,
            (row['DOEID'], row['KOWNRENT'], row['TOTROOMS'])
        )

        cursor.execute(
            """
            INSERT INTO Location (respondent_id, state_name)
            VALUES (%s, %s);
            """,
            (row['DOEID'], row['state_name'])
        )

        cursor.execute(
            """
            INSERT INTO Climate (respondent_id, heating_degree_days_2020, cooling_degree_days_2020)
            VALUES (%s, %s, %s);
            """,
            (row['DOEID'], row['HDD65'], row['CDD65'])
        )

        cursor.execute(
            """
            INSERT INTO Housing (respondent_id, type_of_housing_unit, central_ac, heating_fuel_id, major_outside_wall_material_id)
            VALUES (%s, %s, %s::boolean, %s, %s);
            """,
            (row['DOEID'], row['TYPEHUQ'], row['AIRCOND'], row['FUELHEAT'], row['WALLTYPE'])
        )

    conn.commit()

def main():
    # File path to your CSV file
    file_path = '/Users/irenecharlotted/Downloads/recs2020_final.csv'

    # Connect to the database
    conn = connect_to_db()

    # Load data from CSV
    df = load_data(file_path)

    # Clean and validate data
    df_cleaned = clean_data(df)

    # Insert data into the database
    insert_data(conn, df_cleaned)

    # Close the database connection
    conn.close()

if __name__ == '__main__':
    main()

