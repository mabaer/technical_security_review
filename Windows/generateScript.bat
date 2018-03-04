:: IDelete old file if it already exist
IF EXIST windows_security.ps1 DEL /F windows_security.ps1

:: Create new file
copy NUL windows_security.ps1

:: Add all modules to the script
copy 00_general.ps1 + 01_network_information.ps1 + 02_system_information.ps1 + 03_local_user_information.ps1 + 04_files_and_permissions.ps1 + 05_installed_software.ps1 + 06_policies.ps1 + 07_security_protection.ps1 + 08_misc.ps1 windows_security.ps1
