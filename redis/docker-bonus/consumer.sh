threshold=32000 #seuil
delay=2 #temps d'attente
redis-cli -u $PARAM DBSIZE >/dev/null
if ! [ $? = 0 ] #test redis
then
    echo "Erreur, pas de connection avec le serveur redus!"
    exit 1
fi
while :
do
    nb=$(redis-cli -u $PARAM --raw LLEN mafile) #nombre d'item dans la liste
    if [ $nb -gt 0 ] #si plus grand que 0 alors on recupere la valeur de droite (la plus ancienne)
    then
        a=$(redis-cli -u $PARAM RPOP mafile)
        echo $a
        if [ $a -gt $threshold ] #si la valeur est plus grand que le seuil 
        then
            echo "ALARME! $a" # on declenche une alarme et un temps d'attente
            sleep $delay
        fi
    else # sinon on reste en attente
		exit 0
    fi
done
