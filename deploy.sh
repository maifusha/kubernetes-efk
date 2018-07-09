#!/bin/sh

NAMESPACE=efk
ELASTICSEARCH_URL=elasticsearch.efk.yoursite.com
KIBANA_URL=kibana.efk.yoursite.com
ELASTICSEARCH_PASSWORD=elasticsearchpassword
KIBANA_PASSWORD=kibanapassword
SMTP_ELASTALERT_FROM=ElastAlert@yoursite.com
SMTP_ELASTALERT_TO=dev@yoursite.com
SMTP_HOST=smtp.exmail.qq.com
SMTP_PORT=465
SMTP_USER=dev@yoursite.com
SMTP_PASSWORD=yourpassword

./build.sh
sed -i "s/\$NAMESPACE/$NAMESPACE/g" ./manifests-all.yaml
sed -i "s/\$ELASTICSEARCH_URL/$ELASTICSEARCH_URL/g" ./manifests-all.yaml
sed -i "s/\$KIBANA_URL/$KIBANA_URL/g" ./manifests-all.yaml
sed -i "s/\$ELASTICSEARCH_PASSWORD/$ELASTICSEARCH_PASSWORD/g" ./manifests-all.yaml
sed -i "s/\$KIBANA_PASSWORD/$KIBANA_PASSWORD/g" ./manifests-all.yaml
sed -i "s/\$SMTP_ELASTALERT_FROM/$SMTP_ELASTALERT_FROM/g" ./manifests-all.yaml
sed -i "s/\$SMTP_ELASTALERT_TO/$SMTP_ELASTALERT_TO/g" ./manifests-all.yaml
sed -i "s/\$SMTP_HOST/$SMTP_HOST/g" ./manifests-all.yaml
sed -i "s/\$SMTP_PORT/$SMTP_PORT/g" ./manifests-all.yaml
sed -i "s/\$SMTP_USER/$SMTP_USER/g" ./manifests-all.yaml
sed -i "s/\$SMTP_PASSWORD/$SMTP_PASSWORD/g" ./manifests-all.yaml

kubectl create namespace $NAMESPACE
kubectl -n $NAMESPACE apply -f ./manifests-all.yaml