## Logging with Elastic in Kubernetes

This setup is similar to the [`Full Stack Example`](https://github.com/elastic/examples/tree/master/Miscellaneous/docker/full_stack_example), but adopted to be run on a Kubernetes cluster.

There is no access control for the Kibana web interface. If you want to run this in public you need to secure your setup. The provided manifests here are for demonstration purposes only.


## Quick Start
1. EFK部署节点打标签 `efknode=true`
2. 修改各服务的 `Ingress`域名入口`manifests/elasticsearch/ingress.yaml` 及 `manifests/elasticsearch/elastalert/configmap-rules.yaml`中的kibana url
3. 调整fluentd配置 `manifests/fluentd/configmap.yaml`
4. 调整Kibana的登录密码 `manifests/kibana/deployment.yaml`
5. 调整elastalert告警的邮件配置 `manifests/elasticsearch/elastalert/configmap-main.yaml`
6. 调整elastalert告警的邮件及规则配置 `manifests/elasticsearch/elastalert/configmap-rules.yaml`
7. 启动服务 `./deploy.sh`
8. 创建索引
    * 创建日志存储的索引（要求使用`@timestamp`字段存储时间）
    * 进入`elastalert`容器中执行命令`elastalert-create-index`创建elastalert的状态存储索引
9. 下线服务 `kubectl delete namespace $NAMESPACE`


Switch to the "Discover" view.

Every log line by containers running within the Kubernetes cluster is enhanced by meta data like `namespace`, `labels` and so on.

This way it is easy to group and filter down on specific parts.


## 参考
* https://github.com/giantswarm/kubernetes-elastic-stack
* https://github.com/kayrus/elk-kubernetes
* https://github.com/kubernetes/charts/tree/master/stable/elastalert
* https://github.com/fluent/fluentd-kubernetes-daemonset
