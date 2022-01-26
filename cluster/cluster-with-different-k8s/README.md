# Redis Cluster

### NodePort
* redis 버그로 지원되지 않음
* 해당 이슈 [참고](https://github.com/redis/redis/issues/6432)

### LoadBalancer
* 사전 작업
    * k8s 클러스터에 master 2 + slave 2 분배 (해당 노드에서 사용하지 않는 yaml은 삭제할 것)
    * 예시
        * 1번 노드 : leader00, leader02, slave01, slave03
        * 2번 노드 : slave00, slave02, leader01, leader03
* 설치
    * 각 k8s 노드에서 아래 명령어 실행
```bash
sudo chmod +x install.sh
./install.sh install
```
* 삭제
```bash
./install.sh uninstall
```

### 클러스터 구성 명령어

* 임의의 redis container에 접속해서 아래 명령어를 입력
* 명령어
```bash
redis-cli -a {비밀번호} --cluster create --cluster-replicas {slave갯수} \
{redis-ip}:{redis-port} {redis-ip}:{redis-port} ......
```

* 예시
```bash
redis-cli -a mypassword --cluster create --cluster-replicas 1 \
192.168.9.149:6379 192.168.9.163:6379 192.168.9.150:6379 192.168.9.164:6379 \
192.168.9.165:6379 192.168.9.151:6379 192.168.9.166:6379 192.168.9.152:6379
```