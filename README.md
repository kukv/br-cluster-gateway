# br-cluster-gateway

gatewayとして必要な機能を管理するリポジトリ

## 機能一覧

- chrony
  - NTPサーバーを提供する
- coredns
  - DNS機能を提供する
     静的なドメイン解決に加え、ExternalDNSにによるレコードを受け付ける想定
- etcd
  - coredns用のデータベース
- haproxy
  - HA構成のkubernetesのロードバランサー
- isc-dhcp
  - DHCP機能を提供する

## 使用方法

```sh
docker compose up -d
```
