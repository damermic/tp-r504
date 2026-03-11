redis-cli DBSIZE >/dev/null
n=1000 #nombre d'item rajouter par burst
wait=3 #temps entre chaque burst
if ! [ $? = 0 ]
then
    echo "Erreur, pas de connection avec le serveur redus!"
    exit 1
fi
while :
do
    for ((i=0;i<n;i++))
    do #le burst
        redis-cli LPUSH mafile $RANDOM >/dev/null #on retire l'affichage de la sortie
    done
    redis-cli LLEN mafile # affichage de la taille de la liste
    sleep $wait #attente entre chaque burst
done
