Hospital Database Management System

A comprehensive database project designed to manage hospital-related operations such as patient records, doctor details, services, visits, surgeries, and department management. This project supports robust reporting, advanced queries, and data validations with SQL triggers and views.

Features
Manage patient records with admission and discharge dates.
Track surgeries, services, and visits across multiple departments.
Link doctors to their specialties and services provided.
Generate detailed reports using pre-defined SQL views.
Enforce data integrity with triggers and constraints.
File Structure
The project files are organized as follows:

graphql
Copy code
HOSPITAL_DATA_BASE/
├── .vscode/
│   └── settings.json     # Configuration for VS Code database extensions
├── data.sql              # Contains all data insertions
├── initialize.sql        # Script to execute all project files sequentially
├── new_Records.sql       # Additional test data insertions
├── README.md             # Project documentation
├── schema.sql            # Database schema definition
├── triggers.sql          # Triggers for data validation
├── views.sql             # Pre-defined SQL views for reporting
Prerequisites
To run this project, ensure you have the following installed:

MySQL (Version 8.0 or higher recommended)
Visual Studio Code with the following extensions:
SQL Tools
MySQL
Setup Instructions
1. Clone the Repository
bash
Copy code
git clone https://github.com/your-username/hospital-database.git
cd hospital-database
2. Set Up the Database
Launch MySQL Server on your local machine.
Open a terminal or MySQL Workbench and execute the initialize.sql script to set up the database.
sql
Copy code
SOURCE path/to/initialize.sql;
This script will:
Create the schema and tables (schema.sql).
Insert initial data (data.sql).
Add triggers (triggers.sql).
Define views for reporting (views.sql).
3. Configure Visual Studio Code
Open the HOSPITAL_DATA_BASE directory in VS Code.
In .vscode/settings.json, update the database connection details:
json
Copy code
{
   "sqltools.connections": [
      {
         "mysqlOptions": {
            "authProtocol": "default",
            "enableSsl": "Disabled"
         },
         "previewLimit": 50,
         "server": "localhost",
         "port": 3306,
         "driver": "MySQL",
         "name": "Hospital Data Base",
         "database": "hospitaldb",
         "username": "root",
         "password": "your_password"
      }
   ]
}
How to Use
1. Querying the Database
After setup, you can run SQL queries on the hospitaldb database. Use MySQL Workbench, VS Code, or any SQL client to:

Retrieve patient, doctor, and visit information.
Generate reports from pre-defined views:
report_1_Patients_with_10_days_staying
report_2_Doctors_visited_patients
report_3_patient_surgery_spring
2. Adding New Data
To add more test data, use the new_Records.sql file:

sql
Copy code
SOURCE path/to/new_Records.sql;
3. Validating Data
Ensure data consistency using the triggers.sql file. For example:

Surgery dates must be within the patient’s admission and discharge period.
Reporting Views
The project includes the following SQL views for insights:

report_1_Patients_with_10_days_staying:
Lists patients with hospital stays longer than 10 days.
report_2_Doctors_visited_patients:
Lists doctors who have attended long-staying patients in the inpatient department.
report_3_patient_surgery_spring:
Lists patients who underwent surgeries during the spring months.
report_4_services_of_inpatient_dept:
Lists all services provided in the inpatient department.
report_5_doctor_service:
Lists services provided by specific doctors.
report_6_cost_of_services:
Summarizes the total cost of services for a given patient.
Improvements & Future Enhancements
Add More Test Data: Introduce edge cases to validate triggers and constraints.
Expand Departments: Include outpatient services, radiology, and diagnostics.
Advanced Analytics: Add stored procedures for more complex calculations and insights.
Troubleshooting
Schema Not Found: Ensure schema.sql is executed before inserting data.
Connection Issues: Check the .vscode/settings.json file for correct database credentials.
Trigger Errors: Validate data to ensure surgeries align with admission/discharge dates.
