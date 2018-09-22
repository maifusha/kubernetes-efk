>  Kubernetes compose orchestra for EFK：ElasticSech（With Curator、ElastAlert）、Fluentd、Kibana


## Quick Start
1. `kubectl label nodes your-desired-node efk-node=true`
2. `cp -a .env.example .env` and update it (avoid the # char)
3. `./deploy`
4. 创建`ES`索引
    * 创建日志存储的索引（要求使用`@timestamp`字段存储时间）
    * 进入`elastalert`容器中执行命令`python /opt/elastalert/elastalert/create_index.py`创建`elastalert`的状态存储索引
5. `Kibana`配置
    * 目标检索的`index pattern`：`php.error-*`、`application.error-*`
6. 下线服务 `kubectl delete namespace $NAMESPACE`


## Reference
* https://github.com/giantswarm/kubernetes-elastic-stack
* https://github.com/elastic/examples/tree/master/Miscellaneous/docker/full_stack_example
* https://github.com/kubernetes/kubernetes/tree/master/cluster/addons/fluentd-elasticsearch
* https://github.com/kayrus/elk-kubernetes
* https://github.com/kubernetes/charts/tree/master/stable/elastalert
* https://github.com/fluent/fluentd-kubernetes-daemonset
