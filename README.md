# Folder Encryption/Decryption Script

This Bash script allows you to archive and encrypt a folder into an .mp4 file or decrypt an encrypted .mp4 file back into its original folder structure. The script uses tar for archiving and openssl for AES-256-CBC encryption. Additionally, this README provides instructions for leveraging a Google Pixel (1st Edition) to upload these encrypted files to Google Drive and Google Photos for effectively unlimited cloud storage of up to 10GB per file.

## Features

- **Encryption**: Archive a folder into a .tar file and encrypt it as an .mp4 file with a password.
- **Decryption**: Decrypt an _e.mp4 file back into a .tar archive and extract its contents.
- **Folder Structure Listing**: Displays the folder structure during encryption (requires the tree command for a clean output; falls back to ls -R if unavailable).
- **Cloud Storage**: Instructions for uploading encrypted files to Google Drive/Google Photos using a Google Pixel (1st Edition) for unlimited storage.

## Prerequisites

- **Linux/Unix Environment**: The script requires a Bash-compatible system (e.g., Linux, macOS, WSL on Windows).
- **Installed Tools**:
    - tar: For archiving folders.
    - openssl: For encryption and decryption.
    - tree (optional): For a detailed folder structure listing (install with sudo apt install tree on Debian/Ubuntu or equivalent).
- **Google Pixel (1st Edition)**: For the unlimited storage workaround (optional).

## Usage

1. **Make the Script Executable**:
    
```bash
    chmod +x script.sh
```
    
2. **Run the Script**:
    
```bash
    ./script.sh
```
    
3. **Choose an Option**:
    - Enter 1 to encrypt a folder.
    - Enter 2 to decrypt an encrypted .mp4 file.

### Encryption Process

- Provide the full path to the folder you want to encrypt (e.g., /home/user/myfolder).
- Enter and confirm a secure password.
- The script will:
    - Create a .tar archive of the folder.
    - Encrypt it into a file named <foldername>_<timestamp>_e.mp4.
    - Display the filename, password, and folder structure.
    - Delete the temporary .tar file.

### Decryption Process

- Provide the full path to the _e.mp4 file (e.g., /home/user/myfolder_20250310_123456_e.mp4).
- Enter the password used during encryption.
- The script will:
    - Decrypt the .mp4 file into a .tar archive.
    - Extract the contents into the current directory.
    - Delete the temporary .tar file.

## Example Output

### Encryption

```plaintext
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
```

### Decryption


```plaintext
Do you want to (1) encrypt a folder or (2) decrypt a file? Enter 1 or 2:
2
Please enter the full path to the _e.mp4 file you want to decrypt:
/home/user/documents_20250310_123456_e.mp4
Please enter the password used to encrypt this file:
[hidden input]
Decrypting file...
Extracting archive...
Decryption and extraction successful!
```

## Uploading to Google Drive and Google Photos (Unlimited Storage Workaround)

Using a **Google Pixel (1st Edition)**, you can upload encrypted .mp4 files (up to 10GB each) to Google Photos without consuming your storage quota, effectively providing unlimited cloud storage in 10GB blocks. Here's how:

### Requirements

- Google Pixel (1st Edition) phone.
- Google Drive and Google Photos apps installed and signed in.
- Encrypted .mp4 files (e.g., myfolder_20250310_123456_e.mp4) transferred to the phone (via USB, email, etc.).

### Steps

1. **Upload the Encrypted File to Google Drive**:
    - From a PC or the Google Pixel (1st Edition), upload the encrypted .mp4 file (up to 10GB) to Google Drive. Note: This will initially use your storage quota.
    - On a PC: Visit [drive.google.com](https://drive.google.com), sign in, and drag the file or use the **+ New** button to upload.
    - On the Pixel: Open the Google Drive app, tap **+**, select **Upload**, and choose the file from your device.
2. **Open the Files App on the Google Pixel**:
    - On your Google Pixel (1st Edition), open the built-in **Files** app.
3. **Access Google Drive via the Files App**:
    - Tap the hamburger menu (three horizontal lines) in the top-left corner.
    - Select **Google Drive** from the menu to view your Drive files.
4. **Select the Encrypted .mp4 File**:
    - Locate and press-and-hold the encrypted .mp4 file you uploaded (e.g., myfolder_20250310_123456_e.mp4).
5. **Share the File**:
    - Tap the **Share** button that appears in the options.
6. **Upload to Google Photos**:
    - From the share options, select **Google Photos** or **Upload to Photos** (wording may vary slightly).
    - Confirm the upload to Google Photos.
7. **Wait for Upload Completion**:
    - Allow time for the upload to finish. Larger files (e.g., close to 10GB) may take longer depending on your internet speed.
8. **Delete the File from Google Drive**:
    - After the .mp4 is successfully uploaded to Google Photos, go to Google Drive (via the app or [drive.google.com](https://drive.google.com)).
    - Locate the .mp4 file, select it, and delete it to reclaim your storage quota.
    - Because it was uploaded to Google Photos via a Pixel (1st Edition), it won’t count against your Photos storage.
9. **Organize in Google Photos**:
    - Open the **Google Photos** app on your Pixel.
    - Find the uploaded .mp4 file and add it to a new album (e.g., named "Filesystem").
    - Tap the file, then tap **Add to album**, and create/select the "Filesystem" album.
10. **Archive the File**:
    - In Google Photos, select the .mp4 file, tap the three-dot menu, and choose **Archive**.
    - This removes it from your main Photos view and excludes it from search, keeping your regular photo album uncluttered.
11. **Retrieve the Files (If Needed)**:
    - To download the encrypted .mp4 later, visit [photos.google.com/unsupportedvideos](https://photos.google.com/unsupportedvideos) on any device.
    - Locate your archived .mp4 file, select it, and download it to your computer for decryption using this script.

### Notes

- **File Size Limit**: Each .mp4 file must be ≤10GB to upload successfully via this method.
- **Security**: The files remain encrypted, so they’re secure in the cloud. Keep your password safe!
- **Accessing Files**: To retrieve the files, download them from Google Drive or Google Photos to your computer and decrypt them using this script.


## Troubleshooting

- **"tree" Command Missing**: Install it (sudo apt install tree) or use the fallback ls -R output.
- **Encryption/Decryption Fails**: Ensure openssl is installed (sudo apt install openssl) and the password is correct.
- **Upload Issues**: Verify your internet connection and ensure the file size is ≤10GB.

## Security Considerations

- Use a strong, unique password for encryption.
- Store passwords securely (e.g., in a password manager).
- The .mp4 extension is a disguise; these files are not playable videos but encrypted archives.
