#!/bin/bash

echo "Create namespace for monitoring"
kubectl create namespace monitoring
echo ""

echo "Create cluster role"
kubectl create -f ./monitoring/prometheus/cluster-role.yaml
echo ""

echo "Create config map"
kubectl create -f ./monitoring/prometheus/config-map.yaml
echo ""

echo "Create prometheus deployment"
kubectl create -f ./monitoring/prometheus/prometheus-deployment.yaml
echo ""

echo "Create prometheus service"
kubectl create -f ./monitoring/prometheus/prometheus-service.yaml
echo ""
