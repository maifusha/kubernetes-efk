>  Kubernetes Setup For EFK：ElasticSech（With Curator、ElastAlert）、Fluentd、Kibana


## Quick Start
1. EFK部署节点打标签 `efknode=true`
2. 调整部署脚本内的变量配置并部署服务 `./deploy.sh`
3. 创建ES索引
    * 创建日志存储的索引（要求使用`@timestamp`字段存储时间）
    * 进入`elastalert`容器中执行命令`elastalert-create-index`创建`elastalert`的状态存储索引
4. 下线服务 `kubectl delete namespace $NAMESPACE`


## 参考
* https://github.com/elastic/examples/tree/master/Miscellaneous/docker/full_stack_example
* https://github.com/giantswarm/kubernetes-elastic-stack
* https://github.com/kayrus/elk-kubernetes
* https://github.com/kubernetes/charts/tree/master/stable/elastalert
* https://github.com/fluent/fluentd-kubernetes-daemonset
