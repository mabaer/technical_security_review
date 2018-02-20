To geneate a new script run the "generateScript.bat" file. Afterwards run the script on the target machine.

Running the output script (windows_security.ps1) will create a folder containing the following information:

Output files:
0. General
    1.      Execution Policy
    2.      Whoami
    3.      PowerShell Version
    
1. Network Information
    1.      RDP Configuration
    2.      Network shares (including privileges)
    3.      Established network connections
    4.      Network services (including port and executing user)
    5.      TCP and UDP Settings

2. System information
    1.      Sysinfo
    2.      Domain information
    3.      Administrator account renamed
    4.      Guest account disabled
    5.      Storage Information

3. Local user information
    1.      List of local users
    2.      List of local groups
    3.      Assigned administrative privileges for each user

4. Files and permissions
    1.      File permissions
    2.      Running processes (including executing user and path)
    3.      Running services
    4.      Scheduled tasks
    5.      Autostart items

5. Installed Software
    1.      OS patch
    2.      List of installed application (including version)
    3.      Security Patches within last 90 Days

6. Policies
    1.      Account policies
    2.      Audit policies

7. Security Protection
    1.      Antivirus installed and running
    2.      Firewall for active profiles

8. Misc
    1.      Screensaver protection
    2.      System resume protection
    3.      Elements within PATH
    4.      Secure Boot
    5.      Connected Devices
    6.      Expiring Certificates