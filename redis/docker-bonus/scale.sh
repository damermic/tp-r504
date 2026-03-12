oldnb=0 #initialisation des valeurs
nbcons=0
nbjobs=0
while : # affiche l'iteration
do
    nb=$(redis-cli -u $PARAM LLEN mafile)
    iter=$((iter+1))
    echo "-iter $iter, taille liste=$nb"
    if [ $nb -gt $oldnb ] #si plus d'item que lors de l'ancien iteration alors
    then
          nbcons=$((nbjobs + 1))
          docker compose up -d --scale s_cons=$nbcons # lancement d'un nouveau consumer
    fi
    
    oldnb=$nb
    nbjobs=$(docker ps --filter "name=s_cons" --filter "status=running" --format "{{.Names}}" | wc -l)
    echo "Nb jobs en cours: $nbjobs"
    
    sleep 3
done
