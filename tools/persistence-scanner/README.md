# Persistence Scanner
## Description
This is a starter script to be an educational exercise in developing a stronger understanding of how to scan and interact with common persistence mechanism locations within Windows using PowerShell to automate the process. The intention being to develop a scanner that is more targeted and focuses on recent activity instead of a general dump of all items to be sifted through an analyst's eyes, and thus is more targeted.

Must run as administrator.

### Code
- Default threshold is 15 minutes from the time of running the scanner
- Currently scans:
```text
C:\Users\$currentUser\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup
```
- Will output the name of the file or folder and timestamp of it if any changes detected

### Continuing Development
Students and users are welcome to continue building the script out for and can contribute to the development of this. Create a PR and have fun!

Some areas to consider:
- Runkeys
- Tasks
- Services
- Event IDs of interest, i.e. 106

Some thoughts to consider in troubleshooting:
- Certain logging may have to be enabled
- Shell execution may be disabled, this can be changed or ran with a bypass
- Timestamps may not be reliable/provided by certain areas, especially registry keys so other concepts of "changes in time" may need to be considered

### Screenshots
![Script running against startup entries](https://github.com/Level-Effect/booshware/assets/30155412/b2b858a3-d8f1-4f64-a8a6-40c1f164c863)
