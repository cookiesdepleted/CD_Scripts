#!/bin/bash
# Run as root. For Kali Linux distribution [2024.4].

# Change to home directory
cd "$HOME" || exit


# Create directory ("NEW") if it doesn't exist and navigate into it
if [ ! -d "NEW" ]; then
    mkdir NEW && cd NEW
    touch upd_sum.txt
    echo "$(date): Created NEW directory" >> upd_sum.txt
fi

# Update and upgrade system. -y answers yes for all prompts
echo "$(date): Starting system update and upgrade..." >> upd_sum.txt
sudo apt-get update && sudo apt-get upgrade -y 2>/dev/null
if [ $? -eq 0 ]; then
    echo "$(date): System up to date." >> upd_sum.txt
else
    echo "$(date): System update/upgrade failed." >> upd_sum.txt
fi

# Install Sliver
echo "$(date): Installing Sliver..." >> $HOME/upd_sum.txt
curl -sSL https://sliver.sh/install | sudo bash
if [ $? -eq 0 ]; then
    echo "$(date): Sliver installed successfully." >> $HOME/upd_sum.txt
else
    echo "$(date): Sliver installation failed." >> $HOME/upd_sum.txt
fi

# Install Sherlock
#echo "$(date): Installing Sherlock..." >> $HOME/upd_sum.txt
#git clone https://github.com/sherlock-project/sherlock.git
#cd sherlock || exit
#sudo python3 -m pip install -r requirements.txt
#cd ..
#if [ $? -eq 0 ]; then
#    echo "$(date): Sherlock installed successfully." >> $HOME/upd_sum.txt
#else
#    echo "$(date): Sherlock installation failed." >> $HOME/upd_sum.txt
#fi

# Update aliases
echo "alias cls='clear'" >> ~/.bashrc
source ~/.bashrc
echo "$(date): Updated aliases." >> upd_sum.txt

# Clone personal script repositories
echo "$(date): Cloning personal script repositories..." >> $HOME/upd_sum.txt
git clone <url_for_personal_script1> &
git clone <url_for_personal_script2> &
git clone <url_for_personal_script3> &
wait
echo "$(date): Cloned personal script repositories." >> $HOME/upd_sum.txt

# Summarize recent commands (last 10)
echo "$(date): Recent commands summary:" >> $HOME/upd_sum.txt
history | tail -n 10 >> upd_sum.txt

echo "$(date): Setup completed successfully." >> $HOME/upd_sum.txt

# To Do file 
