#!/bin/bash

# Variables
EMAIL="${1:-user@example.com}"  # Default email if not provided as an argument
KEY_NAME="${2:-id_rsa}"         # Default key name if not provided as an argument
KEY_PATH="$HOME/.ssh/$KEY_NAME"

# Check if SSH key already exists
if [ -f "$KEY_PATH" ]; then
  echo "SSH key already exists at $KEY_PATH."
else
  # Generate the SSH key
  echo "Generating SSH key at $KEY_PATH..."
  ssh-keygen -t rsa -b 4096 -C "$EMAIL" -f "$KEY_PATH" -N ""
fi

# Start the SSH agent
echo "Starting the SSH agent..."
eval "$(ssh-agent -s)"

# Add the SSH key to the agent
echo "Adding SSH key to the agent..."
ssh-add "$KEY_PATH"

# Display public key
echo "Your public key:"
cat "$KEY_PATH.pub"

# Optionally copy the key to a remote server
read -p "Would you like to copy this key to a remote server? (y/n): " COPY_KEY
if [[ "$COPY_KEY" == "y" || "$COPY_KEY" == "Y" ]]; then
  read -p "Enter the remote server's username: " REMOTE_USER
  read -p "Enter the remote server's hostname/IP: " REMOTE_HOST
  ssh-copy-id -i "$KEY_PATH.pub" "$REMOTE_USER@$REMOTE_HOST"
  echo "SSH key copied to $REMOTE_USER@$REMOTE_HOST."
else
  echo "SSH key setup complete. You can manually copy the public key if needed."
fi
