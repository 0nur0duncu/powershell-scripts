# Hash Function Checksum Verifier

This simple PowerShell script provides a graphical user interface for verifying the checksum of an executable file using various cryptographic hash functions. It allows the user to select a hash algorithm and then enter the object name (executable file) and its corresponding checksum. The script calculates the hash of the specified file and compares it with the provided checksum.

## How to Use

1. Run the script in a PowerShell environment.

2. The first dialog will prompt you to select a cryptographic hash function (e.g., SHA1, SHA256, SHA384, SHA512, MD5).

3. In the second dialog, enter the object name (file path) for the executable file you want to verify and the expected checksum.

4. The script will calculate the hash of the specified file and compare it with the provided checksum.

5. If the checksum matches, a success message will be displayed. Otherwise, an error message with details will be shown.


## Notes

- The script uses the `Get-FileHash` cmdlet to calculate the hash of the specified file.
- Supported hash algorithms: SHA1, SHA256, SHA384, SHA512, MD5.
- The GUI is created using Windows Forms.

Feel free to use and modify the script according to your needs.
