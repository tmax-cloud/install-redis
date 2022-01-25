# Redis Simple

### redis-simple.yaml
* standalone redis + 백업을 위한 pvc

### redis-with-exporter.yaml
* standalone redis + 백업을 위한 pvc + 모니터링을 위한 exporter 및 servicemonitor
* [grafana dashboard json 파일](https://github.com/tmax-cloud/catalog/blob/master/redis/redis-grafana-dashboard.json)