#!/bin/bash
set -e

helm -n k6-demo uninstall grafana --wait
helm -n k6 uninstall k6 --wait

kubectl delete -f ./manifests/namespaces.yaml
