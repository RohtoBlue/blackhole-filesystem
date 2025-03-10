#!/bin/bash

# Script to archive/encrypt or decrypt a folder

# Ask user what they want to do
echo "Do you want to (1) encrypt a folder or (2) decrypt a file? Enter 1 or 2:"
read choice

if [ "$choice" = "1" ]; then
    # ENCRYPTION FUNCTIONALITY

    # 1. Prompt user for folder path
    echo "Please enter the full path to the folder you want to archive:"
    read folder_path

    # Check if folder exists
    if [ ! -d "$folder_path" ]; then
        echo "Error: Folder does not exist!"
        exit 1
    fi

    # Get folder name for archive naming
    folder_name=$(basename "$folder_path")
    timestamp=$(date +%Y%m%d_%H%M%S)
    archive_name="${folder_name}_${timestamp}.tar"

    # Generate the folder structure listing
    echo "Generating folder structure..."
    if command -v tree >/dev/null 2>&1; then
        # Use 'tree' to generate a clean, hierarchical output
        folder_structure=$(tree -F --noreport "$folder_path" | sed "s|$folder_path/|$folder_name/|")
    else
        echo "Warning: 'tree' command not found. Install it for a better folder structure view."
        # Fallback to 'ls -R' for a basic recursive listing
        folder_structure=$(ls -R "$folder_path" | grep -v '^$' | sed "s|$folder_path/|$folder_name/|")
    fi

    # 2. Create tar archive
    echo "Creating tar archive..."
    tar -cf "$archive_name" -C "$(dirname "$folder_path")" "$folder_name"

    if [ $? -ne 0 ]; then
        echo "Error: Failed to create tar archive!"
        exit 1
    fi

    # 3. Prompt for password
    echo "Please enter a secure password for encryption:"
    stty -echo
    read password
    stty echo
    echo ""

    # Confirm password
    echo "Please confirm your password:"
    stty -echo
    read password_confirm
    stty echo
    echo ""

    # Check if passwords match
    if [ "$password" != "$password_confirm" ]; then
        echo "Error: Passwords do not match!"
        rm "$archive_name"
        exit 1
    fi

    # 4. Encrypt the tar file with openssl, output as .mp4
    encrypted_file="${folder_name}_${timestamp}_e.mp4"
    echo "Encrypting archive..."
    openssl enc -aes-256-cbc -salt -in "$archive_name" -out "$encrypted_file" -k "$password"

    if [ $? -ne 0 ]; then
        echo "Error: Encryption failed!"
        rm "$archive_name"
        exit 1
    fi

    # Clean up original tar file
    rm "$archive_name"

    # Print final output with filename, password, and folder structure
    echo "Encryption successful!"
    echo "Details:"
    echo "  \"Filename\": \"$encrypted_file\""
    echo "  \"Password\": \"$password\""
    echo "  \"Folder Contents\":"
    echo "$folder_structure" | sed 's/^/    /'  # Indent each line for readability


elif [ "$choice" = "2" ]; then
    # DECRYPTION FUNCTIONALITY

    # 1 & 2. Prompt user for encrypted file
    echo "Please enter the full path to the _e.mp4 file you want to decrypt:"
    read encrypted_file

    # Check if file exists
    if [ ! -f "$encrypted_file" ]; then
        echo "Error: File does not exist!"
        exit 1
    fi

    # 3. Prompt for password
    echo "Please enter the password used to encrypt this file:"
    stty -echo
    read password
    stty echo
    echo ""

    # Generate output tar filename
    tar_file="${encrypted_file%.mp4}.tar"

    # 4. Decrypt the file to tar archive
    echo "Decrypting file..."
    openssl enc -aes-256-cbc -d -in "$encrypted_file" -out "$tar_file" -k "$password"

    if [ $? -ne 0 ]; then
        echo "Error: Decryption failed! Wrong password or corrupted file."
        rm -f "$tar_file"  # Clean up if partial file was created
        exit 1
    fi

    # 5. Extract tar archive to folder
    echo "Extracting archive..."
    tar -xf "$tar_file"

    if [ $? -ne 0 ]; then
        echo "Error: Failed to extract archive!"
        rm "$tar_file"
        exit 1
    fi

    # Clean up tar file
    rm "$tar_file"

    echo "Decryption and extraction successful!"

else
    echo "Error: Invalid choice! Please enter 1 or 2."
    exit 1
fi
