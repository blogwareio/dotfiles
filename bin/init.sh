#This script does varius tasks to get blogware sway setup
#
#Generate a random word
function gen() {
                TMP=$(grep -o -w '\w\{5,9\}' /usr/share/dict/words | shuf | head -n 1)
                echo $TMP
                echo "[y/n]"
                read answer
                if [[ "$answer" = "y" ]]; then
                        NAME=$TMP
                else
                        gen
                fi
}
#Get the current hostname
HOST=`hostname`
#Check if we have a default hostname
if [ $HOST = "fedora" || $HOST = "localhost" ]; then
        echo -n "hostname[random]:"
        read NAME;
        if [ "$NAME" = "" ]; then
            gen
        fi
        sudo hostnamectl set-hostname $NAME

fi





#localbin
mkdir -p ~/.local/bin
#Git
mkdir -p /home/${USER}/git
##SSH settings
#mkdir -p /home/${USER}/.ssh/socket/
#cp ~/git/dotfiles/config/ssh.conf ~/.ssh/config
#chown -R ${USER}:${USER} /home/${USER}/.ssh/
#chmod -R 700 /home/${USER}/.ssh/


PACKAGES=""

##Install tools
PACKAGES="${PACKAGES} git tmux cmake python3-pip"

#Install desktop things
PACKAGES="${PACKAGES} sway waybar dialog kitty mako wofi firefox nwg-launchers clipman"

#Install Fancy 
#PACKAGES="${PACKAGES} neofetch sl"

sudo dnf upgrade -y

sudo dnf install -y $PACKAGES
