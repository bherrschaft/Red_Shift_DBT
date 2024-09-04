# DBT + Redshift Transaction Processing Project

## Overview

This project demonstrates the use of DBT (Data Build Tool) to manage and transform a dataset of bank transactions loaded into Amazon Redshift. The project includes:

- Loading a CSV dataset into Redshift
- Transforming the dataset using DBT models
- Verifying the transformations

## Prerequisites

Before running this project, ensure you have the following installed:

- Python 3.9+
- DBT 1.8+
- Amazon Redshift (Serverless or Cluster)
- Anaconda (optional but recommended for environment management)

## Project Structure

- `models/`: Contains DBT SQL models for data transformation.
  - `example/transaction_transform.sql`: Transformation model for transaction data.
- `data/`: Contains seed CSV files.
  - `raw_transactions.csv`: Sample transaction data to load into Redshift.
- `dbt_project.yml`: DBT project configuration file.
- `profiles.yml`: DBT connection configuration for Redshift.

## Steps to Set Up and Run

### 1. Clone the Project

Clone the repository to your local machine:

```bash
git clone <repository-url>
cd redshift_project
2. Set Up a Virtual Environment (Optional)
It’s recommended to use a virtual environment to manage dependencies:

bash
Copy code
conda create -n redshift-env python=3.9
conda activate redshift-env
3. Install Dependencies
Install DBT using pip:

bash
Copy code
pip install dbt-redshift
4. Configure Connection to Redshift
Edit the profiles.yml file located in the .dbt folder:

yaml
Copy code
redshift_project:
  outputs:
    dev:
      dbname: dev
      host: <your-redshift-endpoint>
      password: <your-password>
      port: 5439
      schema: public
      threads: 1
      type: redshift
      user: <your-username>
  target: dev
Ensure your Redshift instance is running and accessible.

5. Load Data Into Redshift
Load the seed data into Redshift using the following command:

bash
Copy code
dbt seed
This will load the raw_transactions.csv file into Redshift.

6. Run Transformations
Once the data is loaded, you can run the transformation models:

bash
Copy code
dbt run
This will run the SQL transformation defined in transaction_transform.sql.

7. Verify Results
You can check the results in Redshift using a SQL client to query the transaction_transform table.

Troubleshooting
If you encounter connection issues, verify the credentials and network configuration in your profiles.yml.
Make sure your Redshift instance is accessible by checking your security group and VPC settings.
```
