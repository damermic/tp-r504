oldnb=0 #initialisation de la valeur
$TERM -t PRODUCER -e ./producer.sh
while : # affiche l'iteration
do
    nb=$(redis-cli LLEN mafile)
    iter=$((iter+1))
    echo "-iter $iter, taille liste=$nb"
    if [ $nb -gt $oldnb ] #si plus d'item que lors de l'ancien iteration alors
    then
          ./consumer.sh & # lancement d'un nouveau consumer
    fi
    
    oldnb=$nb
    nbjobs=$(jobs | grep Running | wc -l)
    echo "Nb jobs en cours: $nbjobs"
    
    sleep 3
done
