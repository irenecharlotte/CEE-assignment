# Project Name

CEE assignment

## Table of Contents

1. [Introduction](#introduction)
2. [Setup](#setup)
3. [Database Schema](#database-schema)
4. [Python Script](#python-script)
5. [Usage](#usage)

## Introduction

A project to clean and gather insights from the Residential Energy Consumption Survey data - (https://www.eia.gov/consumption/residential/data/2020/index.php?view=microdata).

## Setup

### Requirements

Software dependencies needed to run the project:
- Python 3.x
- PostgreSQL
- Pandas
- psycopg2

### Installation

1. **PostgreSQL**: Download and install PostgreSQL from [https://www.postgresql.org/](https://www.postgresql.org/).

2. **Database Setup**: Ensure PostgreSQL is installed and running. Create a database named `recs_data` using the following steps:
   - Open a terminal or pgAdmin.
   - Log in to PostgreSQL.
   - Create a new database: `CREATE DATABASE recs_data;`.

3. **Tables Creation**: Execute the SQL script provided (`table_name.sql`) to create the necessary tables and populate lookup tables with initial data.

## Database Schema

### Tables

#### Respondent
- **respondent_id**: Primary key, unique identifier for each respondent.
- **own_or_rent_id**: Foreign key referencing OwnOrRent(id).
- **total_number_of_rooms**: Number of rooms in the respondent's housing unit.

#### Location
- **location_id**: Primary key, unique identifier for each location.
- **respondent_id**: Foreign key referencing Respondent(respondent_id).
- **state_name**: Name of the state where the respondent is located.

#### Climate
- **climate_id**: Primary key, unique identifier for each climate record.
- **respondent_id**: Foreign key referencing Respondent(respondent_id).
- **heating_degree_days_2020**: Number of heating degree days in 2020.
- **cooling_degree_days_2020**: Number of cooling degree days in 2020.

#### Housing
- **housing_id**: Primary key, unique identifier for each housing record.
- **respondent_id**: Foreign key referencing Respondent(respondent_id).
- **type_of_housing_unit**: Foreign key referencing HousingType(id).
- **central_ac**: Boolean indicating if the housing unit has central AC.
- **heating_fuel_id**: Foreign key referencing HeatingFuel(id).
- **major_outside_wall_material_id**: Foreign key referencing OutsideWallMaterial(id).

### Lookup Tables

#### OwnOrRent
- **id**: Primary key, unique identifier.
- **description**: Description of whether the respondent owns, rents, or occupies without rent.

#### HousingType
- **id**: Primary key, unique identifier.
- **description**: Description of the type of housing unit.

#### HeatingFuel
- **id**: Primary key, unique identifier.
- **description**: Description of the heating fuel used in the housing unit.

#### OutsideWallMaterial
- **id**: Primary key, unique identifier.
- **description**: Description of the major outside wall material of the housing unit.

## Python Script

### Purpose

The python script is used to populate the PostgreSQL database with data from a CSV file (`recs2020_public_v7.csv`).

### Dependencies

The Python libraries and packages required:
- Pandas
- psycopg2

### Usage

Instructions on how to use the Python script:
1. **Setup**: Ensure PostgreSQL is running and accessible.
2. **Run the Script**: Execute the Python script to load and clean the data from the CSV file, and insert it into the database using an IDE of your choice.

Example:
```bash
python recs_data_import.py
