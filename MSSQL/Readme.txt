To geneate a new script run the "generateScript.bat" file. Afterwards run the script on the target machine.

Running the output script (mssql_security.ps1) will create a folder containing the following information:

Output files:
0. General
    1.      Execution Policy
    2.      Whoami
    
1. Database information
    1.      Version
    2.      Settings

2. User information
    1.      List of users
    2.      Users assigned to role
    3.      Users/role to change master database
    4.      Database owner

3.  Permissions
    1.      Users with sysadmin permissions
    2.      Access permissions to database

4. Policies
    1.      Account policies

5. Misc
    1.      Database chaining
    2.      Unencrypted connections
    3.      Linked Servers