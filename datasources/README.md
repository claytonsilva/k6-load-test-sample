# Configurações base

Esse diretório contém a dashboard do K6 no grafana, script de carga do k6 e configuração base do prometheus

If you need to change some configmap use this folder as datasource for your files.

Finally create or update a existing configmap using a command similar this:

```bash
kubectl -n k6-demo create config-map <<config-map-name>> --from-file=./dashboard.json ... --dry-run=client -o yaml
```
