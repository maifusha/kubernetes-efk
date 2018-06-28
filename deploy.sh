#!/bin/sh

NAMESPACE="efk"

sed -i "s/\$NAMESPACE/$NAMESPACE/g" manifests/kibana/configmap.yaml
sed -i "s/\$NAMESPACE/$NAMESPACE/g" manifests/fluentd/daemonset.yaml
sed -i "s/\$NAMESPACE/$NAMESPACE/g" manifests/fluentd/1-rbac-sa-psp.yaml
sed -i "s/\$NAMESPACE/$NAMESPACE/g" manifests/elasticsearch/configmap.yaml
sed -i "s/\$NAMESPACE/$NAMESPACE/g" manifests/elasticsearch/1-rbac-sa-psp.yaml
sed -i "s/\$NAMESPACE/$NAMESPACE/g" manifests/elasticsearch/elastalert/configmap-main.yaml

./build.sh

kubectl create namespace $NAMESPACE
kubectl -n $NAMESPACE apply -f ./manifests-all.yaml
