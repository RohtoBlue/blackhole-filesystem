Folder Encryption/Decryption Script
This Bash script allows you to archive and encrypt a folder into an .mp4 file or decrypt an encrypted .mp4 file back into its original folder structure. The script uses tar for archiving and openssl for AES-256-CBC encryption. Additionally, this README provides instructions for leveraging a Google Pixel (1st Edition) to upload these encrypted files to Google Drive and Google Photos for effectively unlimited cloud storage of up to 10GB per file.

Features
Encryption: Archive a folder into a .tar file and encrypt it as an .mp4 file with a password.
Decryption: Decrypt an _e.mp4 file back into a .tar archive and extract its contents.
Folder Structure Listing: Displays the folder structure during encryption (requires the tree command for a clean output; falls back to ls -R if unavailable).
Cloud Storage: Instructions for uploading encrypted files to Google Drive/Google Photos using a Google Pixel (1st Edition) for unlimited storage.
Prerequisites
Linux/Unix Environment: The script requires a Bash-compatible system (e.g., Linux, macOS, WSL on Windows).
Installed Tools:
tar: For archiving folders.
openssl: For encryption and decryption.
tree (optional): For a detailed folder structure listing (install with sudo apt install tree on Debian/Ubuntu or equivalent).
Google Pixel (1st Edition): For the unlimited storage workaround (optional).
Usage
Make the Script Executable:
bash

Collapse

Wrap

Copy
chmod +x script.sh
Run the Script:
bash

Collapse

Wrap

Copy
./script.sh
Choose an Option:
Enter 1 to encrypt a folder.
Enter 2 to decrypt an encrypted .mp4 file.
Encryption Process
Provide the full path to the folder you want to encrypt (e.g., /home/user/myfolder).
Enter and confirm a secure password.
The script will:
Create a .tar archive of the folder.
Encrypt it into a file named <foldername>_<timestamp>_e.mp4.
Display the filename, password, and folder structure.
Delete the temporary .tar file.
Decryption Process
Provide the full path to the _e.mp4 file (e.g., /home/user/myfolder_20250310_123456_e.mp4).
Enter the password used during encryption.
The script will:
Decrypt the .mp4 file into a .tar archive.
Extract the contents into the current directory.
Delete the temporary .tar file.
Example Output
Encryption
plaintext

Collapse

Wrap

Copy
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
  "Filename": "documents_20250310_123456_e.mp4"
  "Password": "mysecretpassword"
  "Folder Contents":
    documents/
    ├── file1.txt
    ├── file2.pdf
    └── subfolder/
        └── file3.doc
Decryption
plaintext

Collapse

Wrap

Copy
Do you want to (1) encrypt a folder or (2) decrypt a file? Enter 1 or 2:
2
Please enter the full path to the _e.mp4 file you want to decrypt:
/home/user/documents_20250310_123456_e.mp4
Please enter the password used to encrypt this file:
[hidden input]
Decrypting file...
Extracting archive...
Decryption and extraction successful!
Uploading to Google Drive and Google Photos (Unlimited Storage Workaround)
Using a Google Pixel (1st Edition), you can upload encrypted .mp4 files (up to 10GB each) to Google Drive and Google Photos without consuming your storage quota, effectively providing unlimited cloud storage in 10GB blocks. Here's how:

Requirements
Google Pixel (1st Edition) phone.
Google Drive and Google Photos apps installed and signed in.
Encrypted .mp4 files (e.g., myfolder_20250310_123456_e.mp4) transferred to the phone (via USB, email, etc.).
Steps
Transfer Files to the Phone:
Connect your Google Pixel (1st Edition) to your computer via USB.
Copy the encrypted .mp4 files (up to 10GB each) to the phone’s internal storage (e.g., in the Downloads folder).
Open the Files App:
On your Google Pixel, open the built-in Files app.
Navigate to the File:
Locate the encrypted .mp4 file (e.g., in the Downloads folder).
Upload to Google Drive:
Long-press the .mp4 file and tap the Share icon.
Select Google Drive from the share options.
Choose a folder in Google Drive (or create a new one) and tap Save.
Wait for the upload to complete (ensure a stable internet connection).
Upload to Google Photos:
Open the Google Photos app on your Pixel.
Tap the + button (or Upload option).
Navigate to the Downloads folder (or wherever you stored the .mp4 file) using the file picker.
Select the .mp4 file and tap Upload.
Because this is a Google Pixel (1st Edition), the upload will not count toward your Google storage quota (even though it’s not a typical video).
Verify Storage:
Check your Google Drive and Google Photos storage at myaccount.google.com/storage. The uploaded .mp4 files should not deduct from your quota.
Notes
File Size Limit: Each .mp4 file must be ≤10GB to upload successfully via this method.
Security: The files remain encrypted, so they’re secure in the cloud. Keep your password safe!
Accessing Files: To retrieve the files, download them from Google Drive or Google Photos to your computer and decrypt them using this script.
Troubleshooting
"tree" Command Missing: Install it (sudo apt install tree) or use the fallback ls -R output.
Encryption/Decryption Fails: Ensure openssl is installed (sudo apt install openssl) and the password is correct.
Upload Issues: Verify your internet connection and ensure the file size is ≤10GB.
Security Considerations
Use a strong, unique password for encryption.
Store passwords securely (e.g., in a password manager).
The .mp4 extension is a disguise; these files are not playable videos but encrypted archives.
