#!/bin/bash
set -e
echo "Creating namespaces"
kubectl apply -f ./manifests/namespaces.yaml

GRAFANA_VERSION=8.8.5
K6_VERSION=3.11.0

echo "install packages helm"

helm -n k6-demo upgrade --install grafana grafana/grafana --version $GRAFANA_VERSION --wait
helm -n k6 upgrade --install k6 grafana/k6-operator --version $K6_VERSION --set namespace.create=false --wait

echo "packages installed"

echo "Applying prometheus manifests"
kubectl apply -f ./manifests/prometheus-server-conf.yaml
kubectl apply -f ./manifests/prometheus-server.yaml
kubectl apply -f ./manifests/prometheus-service.yaml
echo "Prometheus manifests applied"

echo "Preparing demo configs and applications"
kubectl apply -f ./manifests/grafana-configs.yaml
echo "demo configs and deployment applieds"

echo "Preparing app Sample"
kubectl apply -f ./manifests/appsample.yaml
echo "app Sample deployed"
