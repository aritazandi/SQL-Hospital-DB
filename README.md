# SQL-Hospital-DB
A comprehensive SQL database schema and implementation for a Hospital Management System, including table creation, sample data insertion, and complex queries.
This database project was developed with the goal of fully simulating the information structure required for a Hospital Management System (HMS). The database architecture is designed with a strong emphasis on Normalization and ensuring Data Integrity through the proper application of Primary and Foreign Keys.

Key Project Phases:
Initial Modeling and Structure (fa2.sql):

Creation of all core tables (e.g., Hospital, Department, Doctor, Nurse, Patient, Medicine, etc.).

Definition of relationships and Constraints, including Foreign Keys to link tables and Primary Keys for unique record identification.

Insertion of Sample Data for structure validation.

Optimization and Relationship Management (faz3.sql):

Focus on managing referential integrity using clauses like ON DELETE CASCADE and NO ACTION to control behavior during updates and deletions.

Execution of ALTER TABLE commands to add or drop columns and constraints for system flexibility.

Reporting and Data Analysis (faz3.sql):

Implementation of complex queries using JOINs and Aggregation Functions (AVG, COUNT) to extract critical managerial insights, such as:

Calculating the average shift hours for doctors and nurses per department.

Analyzing the most consumed medicines and the number of prescribing doctors.

This project serves as a practical, usable example for gaining a deeper understanding of SQL concepts and Database Modeling in real-world scenarios.
