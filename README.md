Archive and Encryption Script Manual

Overview

This Bash script allows users to either archive and encrypt a folder into a single encrypted file (disguised as an .mp4) or decrypt and extract an encrypted file back into its original folder structure. It uses tar for archiving and openssl for encryption/decryption with AES-256-CBC encryption.

- Encryption Mode: Archives a folder into a .tar file, encrypts it with a user-provided password, and outputs it as a file with an _e.mp4 suffix.
    
- Decryption Mode: Decrypts an _e.mp4 file using the original password and extracts its contents into a folder.
    

The script also generates a folder structure listing for encrypted files to help users remember the contents.

---

Requirements

- Operating System: Linux, macOS, or any Unix-like system with Bash.
    
- Dependencies:
    
    - bash: The script interpreter.
        
    - tar: For creating and extracting archives.
        
    - openssl: For AES-256-CBC encryption and decryption.
        
    - tree (optional): For a clean folder structure display in encryption mode. If not installed, the script falls back to ls -R.
        
- Permissions: The user must have read/write access to the folder/file paths provided.
    

To install missing dependencies on Debian/Ubuntu:

bash

```bash
sudo apt update
sudo apt install tar openssl tree
```

On macOS (via Homebrew):

bash

```bash
brew install openssl tree
```

---

Usage

1. Save the script to a file, e.g., archive_encrypt.sh.
    
2. Make it executable:
    
    bash
    
    ```bash
    chmod +x archive_encrypt.sh
    ```
    
3. Run the script:
    
    bash
    
    ```bash
    ./archive_encrypt.sh
    ```
    

Options

The script prompts the user to choose between two modes:

- 1: Encrypt a folder.
    
- 2: Decrypt a file.
    

Encryption Mode (Choice 1)

1. Input:
    
    - Full path to the folder you want to encrypt (e.g., /home/user/my_folder).
        
    - A secure password (entered twice for confirmation).
        
2. Process:
    
    - Creates a .tar archive of the folder.
        
    - Encrypts the .tar file using AES-256-CBC with the provided password.
        
    - Saves the encrypted file with a name like <folder_name>_<timestamp>_e.mp4.
        
    - Deletes the temporary .tar file.
        
3. Output:
    
    - Displays the encrypted filename, password, and folder structure.
        

Decryption Mode (Choice 2)

1. Input:
    
    - Full path to the encrypted _e.mp4 file (e.g., /home/user/my_folder_20250309_163630_e.mp4).
        
    - The password used during encryption.
        
2. Process:
    
    - Decrypts the _e.mp4 file to a .tar archive using the provided password.
        
    - Extracts the .tar archive to restore the original folder.
        
    - Deletes the temporary .tar file.
        
3. Output:
    
    - Confirms successful decryption and extraction.
        

---

Script Workflow

Encryption Mode

1. Prompts for folder path and validates its existence.
    
2. Generates a timestamped .tar archive (e.g., my_folder_20250309_163630.tar).
    
3. Optionally uses tree (or ls -R as fallback) to list folder contents.
    
4. Prompts for and confirms a password (input hidden for security).
    
5. Encrypts the .tar file to <folder_name>_<timestamp>_e.mp4.
    
6. Outputs metadata (filename, password, folder structure).
    

Decryption Mode

1. Prompts for the encrypted file path and validates its existence.
    
2. Prompts for the decryption password (input hidden).
    
3. Decrypts the file to a .tar archive.
    
4. Extracts the .tar to restore the folder.
    
5. Confirms success.
    

---

Example Usage

Encrypting a Folder

bash

```bash
$ ./archive_encrypt.sh
Do you want to (1) encrypt a folder or (2) decrypt a file? Enter 1 or 2:
1
Please enter the full path to the folder you want to archive:
/home/user/documents
Generating folder structure...
Creating tar archive...
Please enter a secure password for encryption:
[hidden input]
Please confirm your password:
[hidden input]
Encrypting archive...
Encryption successful!
Details:
  "Filename": "documents_20250309_163630_e.mp4"
  "Password": "mypassword123"
  "Folder Contents":
    documents/
    ├── file1.txt
    └── file2.jpg
```

Decrypting a File

bash

```bash
$ ./archive_encrypt.sh
Do you want to (1) encrypt a folder or (2) decrypt a file? Enter 1 or 2:
2
Please enter the full path to the _e.mp4 file you want to decrypt:
/home/user/documents_20250309_163630_e.mp4
Please enter the password used to encrypt this file:
[hidden input]
Decrypting file...
Extracting archive...
Decryption and extraction successful!
```

---

Output Format

- Encryption Mode: Custom format with key-value pairs and a tree-like folder structure:
    
    ```text
    "Filename": "<folder_name>_<timestamp>_e.mp4"
    "Password": "<user-provided-password>"
    "Folder Contents":
      <folder_name>/
      ├── <file1>
      └── <file2>
    ```
    
- Decryption Mode: Simple success message or error if the password/file is invalid.
    

---

Error Handling

- Invalid Choice: Exits if the user enters something other than 1 or 2.
    
- Non-Existent Folder/File: Exits with an error message.
    
- Password Mismatch: Deletes the .tar file and exits.
    
- Failed Tar/Encryption/Decryption: Cleans up temporary files and exits with an error message.
    

---

Security Notes

- Password Visibility: Password input is hidden using stty -echo.
    
- Encryption: Uses AES-256-CBC with a salt for strong security.
    
- File Cleanup: Removes temporary .tar files to avoid leaving unencrypted data.
    
- Caution: The password is displayed in the encryption output. Avoid sharing this output publicly.
    

---

Limitations

- Requires tar and openssl to be installed.
    
- The .mp4 suffix is a disguise; the file isn’t a playable video.
    
- Older systems without tree will get a less readable folder listing.
    
- No option to overwrite existing files; users must manually manage duplicates.
    

---

Troubleshooting

- "tree: command not found": Install tree or accept the ls -R fallback.
    
- "openssl: command not found": Install openssl.
    
- "Decryption failed": Check the password or file integrity.
    
- Permission denied: Run with sudo if needed, or adjust file permissions.
    

---
