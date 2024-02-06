#!/bin/bash

echo "Deleting the volume..."
kubectl delete pvc minio-pv-claim
echo ""

echo "Deleting minio credentials..."
kubectl delete secret minio-secret
echo ""

echo "Deleting the minio deployment and service..."
kubectl delete deployment minio-deployment
kubectl delete service minio-service
echo ""