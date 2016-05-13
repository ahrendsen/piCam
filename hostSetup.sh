#!/bin/bash
ssh-keygen -t rsa
# Press enter to choose default location for key
# Press enter to leave out creating passphrase.
#   This makes logging in easier, but less secure.

# Make sure to edit the username and password below to 
#   appropriately describe your system. 
cat ~/.ssh/id_rsa.pub | ssh pi@pi "mkdir -p ~/.ssh && cat >>  ~/.ssh/authorized_keys"


