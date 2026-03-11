redis-cli DBSIZE >/dev/null
n=1000
wait=3
if ! [ $? = 0 ]
then
    echo "Erreur, pas de connection avec le serveur redus!"
    exit 1
fi
while :
do
    for ((i=0;i<n;i++))
    do
        redis-cli LPUSH mafile $RANDOM
    done
    redis-cli DBSIZE
    sleep $wait
done
