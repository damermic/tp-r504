threshold=32000 #seuil
delay=2 #temps d'attente
redis-cli DBSIZE >/dev/null
if ! [ $? = 0 ] #test redis
then
    echo "Erreur, pas de connection avec le serveur redus!"
    exit 1
fi
while :
do
    nb=$(redis-cli --raw LLEN mafile) #nombre d'item dans la liste
    if [ $nb -gt 0 ] #si plus grand que 0 alors on recupere la valeur de droite (la plus ancienne)
    then
        a=$(redis-cli RPOP mafile)
        echo $a
        if [ $a -gt $threshold ] #si la valeur est plus grand que le seuil 
        then
            #echo "ALARME! $a"
            sleep $delay
        fi
    else #sinon arret du programme
		exit 0
    fi
done
