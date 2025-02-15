# Configurações base

Esse diretório contém a dashboard do K6 no grafana, script de carga do k6 e configuração base do prometheus

Se precisar alterar algum cenário

Finalmente você pode reconstruir o configmap :

```bash
kubectl -n k6-demo create configmap grafana-configs --from-file ./dashboard.json --from-file ./prometheus.json --dry-run=client -o yaml | kubectl apply -f -
kubectl -n k6-demo create configmap load-test --from-file ./k6-basic.js --dry-run=client -o yaml | kubectl apply -f -
```
