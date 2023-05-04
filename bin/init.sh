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
if [ $HOST = "fedora" || $HOST = "localhost"]; then
        echo -n "hostname[random]:"
        read NAME;
        if [ "$NAME" = "" ]; then
            gen
        fi
        sudo hostnamectl set-hostname $NAME

fi





