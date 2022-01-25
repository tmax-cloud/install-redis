# Install-Redis

### 설치 방법은 각 폴더의 ReadMe 확인

### simple
* standalone 구조

### replica
* master slave 구조
* master 1 + slave (1+a)

### sentinel
* redis sentinel 구조
* master 1 + slave (1+a) + sentinel

### cluster
* redis cluster 구조
* master n + slave (n+a)
* 같은 k8s 클러스터 내에서의 redis cluster
* 서로다른 k8s 클러스터에서의 redis cluster

### redis-insight
* redis 시각화 툴