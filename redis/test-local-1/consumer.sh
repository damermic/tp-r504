redix-cli DBSIZE >/dev/null
if ! [ $? = 0 ]
then
    echo "Erreur, pas de connection avec le serveur redus!"
    exit 1
fi
threshold=32000
delay=2
while :
do
    nb=$(redis-cli --raw LLEN mafile)
    if [ $nb -gt 0 ]
    then
        a=$(redis-cli RPOP mafile)
        echo a
        if [ $a -gt $threshold ]
        then
            echo "alarm"
            sleep $delay
        fi
    else
        sleep 2
    fi
done
