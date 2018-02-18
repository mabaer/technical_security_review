:: IDelete old file if it already exist
IF EXIST mssql_security.ps1 DEL /F mssql_security.ps1

:: Create new file
copy NUL mssql_security.ps1

:: Add all modules to the script
copy 00_general.ps1 + 01_database_information.ps1 + 02_user_information.ps1 + 03_permissions.ps1 + 04_policies.ps1 + 05_misc.ps1 mssql_security.ps1

