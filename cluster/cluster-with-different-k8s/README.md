# Redis Cluster

### NodePort
* 진행중

### LoadBalancer
* 설치
```bash
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