oldnb=0
$TERM -t PRODUCER -e ./producer.sh
while :
do
    nb=$(redis-cli LLEN mafile)
    iter=$((iter+1))
    echo "-iter $iter, taille liste=$nb"
    if [ $nb -gt $oldnb ]
    then
          ./consumer.sh & # lancement en arrière plan
    fi
    
    oldnb=$nb
    nbjobs=$(jobs | grep Running | wc -l)
    echo "Nb jobs en cours: $nbjobs"
    
    sleep 3
done
