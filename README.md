# 🏥 Hospital Management System Database Project

A comprehensive **SQL Server Database** schema and implementation for a **Hospital Management System (HMS)**, designed to manage core operational data with an emphasis on data integrity and analytical reporting.

##  Key Features and Overview

This project simulates the complete data structure of a typical hospital environment. The architecture is built following database normalization principles to ensure efficiency and data reliability.

* **Robust Schema Design:** Includes core entities such as Hospitals, Departments, Staff (Doctors, Nurses, Personnel), Patients, and Medical Supplies (Medicine, Laboratory).
* **Data Integrity:** Extensive use of **Primary Keys**, **Foreign Keys**, and **Constraints** to enforce relationships and ensure data consistency across all tables.
* **Data Manipulation and Seeding:** Scripts include commands for creating and populating tables with realistic sample data (DDL & DML).
* **Advanced SQL Queries:** Implementation of complex analytical queries utilizing **JOINs**, **Aggregation Functions** (`AVG`, `COUNT`), and **Grouping** to generate critical business intelligence reports.
* **Referential Integrity Management:** Demonstrates the use of advanced relationship options like `ON UPDATE CASCADE` and `ON DELETE NO ACTION` for robust data handling.

## Project Files

| File Name | Type | Description |
| :--- | :--- | :--- |
| `sql/visio.pdf` | PDF Diagram | The **Entity-Relationship (ER) Diagram** or Database Schema Visualization, illustrating the tables and their relationships visually. |
| `sql/fa2.sql` | SQL Script (DDL/DML) | **Phase 1 Script:** Contains the `CREATE TABLE` statements for the initial database structure and `INSERT` commands for seeding the tables with sample data. |
| `sql/faz3.sql` | SQL Script (DML/DCL) | **Phase 2 & 3 Script:** Includes advanced SQL operations such as `ALTER TABLE` commands, relationship management adjustments, and complex analytical queries for data reporting. |
| `sql/faz2aritazandi.bak` | SQL Backup File | A complete database backup file for direct restoration in SQL Server Management Studio (SSMS). |

##  Getting Started

To run and explore this project, you need access to a SQL Server instance and its management tools.

### Prerequisites

1.  **Microsoft SQL Server:** (Any recent version is compatible).
2.  **SQL Server Management Studio (SSMS):** Used for connecting to the server and executing the scripts.

### Installation Options

#### Option 1: Restoring from Backup (Recommended)

1.  Restore the `faz2aritazandi.bak` file directly into your SQL Server instance using SSMS.
2.  The database schema and sample data will be instantly available.

#### Option 2: Running Scripts Manually

1.  Create a new, empty database (e.g., `HospitalDB`) in your SQL Server instance.
2.  Execute the `sql/fa2.sql` script first to create all tables and insert initial data.
3.  Execute the `sql/faz3.sql` script to apply structural adjustments and run the analytical queries.

## 📝 Example Queries 

The project includes queries to provide insights, such as:

* Calculating the average shift hours for doctors and nurses in each department.
* Analyzing medicine consumption rates and identifying the total number of prescribing doctors per medicine.
* Demonstrating how to update and manage Foreign Key relationships.

