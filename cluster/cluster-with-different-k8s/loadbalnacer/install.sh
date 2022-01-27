#!/bin/bash
apply(){
    set -x
    kubectl apply -f ./service

    for((i=0; i<4; i++))
    do
        external_ip=`kubectl get service -n redis -l leader=0$i | grep leader0$1 | awk '{print $4}'`
        if [ $external_ip ]
        then
            while [[ "$external_ip" =~ "pending" ]]
            do
                sleep 3s
                external_ip=`kubectl get service -n redis -l leader=0$i | grep leader0$1 | awk '{print $4}'`
            done
            sed -i 's#{leader0'$i'_IP}#'$external_ip'#g' ./deployment/redis-leader0$i.yaml
            kubectl apply -f ./deployment/redis-leader0$i.yaml
        fi
    done

    for((i=0; i<4; i++))
    do
        external_ip=`kubectl get service -n redis -l slave=0$i | grep slave0$1 | awk '{print $4}'`
        if [ $external_ip ]
        then
            while [[ "$external_ip" =~ "pending" ]]
            do
                sleep 3s
                external_ip=`kubectl get service -n redis -l slave=0$i | grep slave0$1 | awk '{print $4}'`
            done
            sed -i 's#{slave0'$i'_IP}#'$external_ip'#g' ./deployment/redis-slave0$i.yaml
            kubectl apply -f ./deployment/redis-slave0$i.yaml
        fi
    done
}

delete(){
    set -x
    kubectl delete -f ./deployment
    kubectl delete -f ./service


    for((i=0; i<4; i++))
    do
	    sed -i '/cluster-announce-ip/ c\    cluster-announce-ip {leader0'$i'_IP}' ./deployment/redis-leader0$i.yaml
    done

    for((i=0; i<4; i++))
    do
	    sed -i '/cluster-announce-ip/ c\    cluster-announce-ip {slave0'$i'_IP}' ./deployment/redis-slave0$i.yaml
    done

}

if [ -z $1 ]
then
    echo "Please give paramater"
    echo "1. install : Install redis"
    echo "2. uninstall : Uninstall redis"
elif [ $1 == "install" ]
then
    apply
elif [ $1 == "uninstall" ]
then
    delete
else
    echo "Unkonwn parameter"
fi
