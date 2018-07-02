#!/bin/sh

./build.sh
NAMESPACE="efk"
sed -i "s/\$NAMESPACE/$NAMESPACE/g" ./manifests-all.yaml 

kubectl create namespace $NAMESPACE
kubectl -n $NAMESPACE apply -f ./manifests-all.yaml
