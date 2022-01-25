# Redis Sentinel

### redis-sentinel
* 설치 순서
    * master-slave 구조의 redis 배포
    ```bash
    kubectl apply -f redis-master.yaml
    kubectl apply -f redis-slave.yaml
    ```

    * redis-sentinel 배포
    ```bash
    kubectl apply -f redis-sentinel.yaml
    ```