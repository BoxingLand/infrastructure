#!/bin/bash


echo "Creating the api server credentials..."
kubectl create -f ./services/gateway/app/app-secret.yaml
echo ""

echo "Creating the FastAPI deployment and service..."
kubectl create -f ./services/gateway/app/app-deployment.yaml
kubectl create -f ./services/gateway/app/app-service.yaml
echo ""


echo "Creating the database credentials..."
kubectl create -f ./services/auth/db/db-secret.yaml
echo ""

echo "Creating the auth grpc server credentials..."
kubectl create -f ./services/auth/app/app-secret.yaml
echo ""

echo "Creating the Postgres deployment and service..."
kubectl create -f ./services/auth/db/db-deployment.yaml
kubectl create -f ./services/auth/db/db-service.yaml
echo ""

echo "Creating the auth grpc deployment and service..."
kubectl create -f ./services/auth/app/app-deployment.yaml
kubectl create -f ./services/auth/app/app-service.yaml
echo ""

echo "Creating the volume..."
kubectl create -f ./minio/minio-pvc.yaml
echo ""

echo "Creating minio credentials..."
kubectl create -f ./minio/minio-secret.yaml
echo ""

echo "Creating the minio deployment and service..."
kubectl create -f ./minio/minio-deployment.yaml
kubectl create -f ./minio/minio-service.yaml
echo ""

echo "Creating the database credentials..."
kubectl create -f ./services/user/db/db-secret.yaml
echo ""

echo "Creating the user grpc server credentials..."
kubectl create -f ./services/user/app/app-secret.yaml
echo ""

echo "Creating the Postgres deployment and service..."
kubectl create -f ./services/user/db/db-deployment.yaml
kubectl create -f ./services/user/db/db-service.yaml
echo ""

echo "Creating the user grpc deployment and service..."
kubectl create -f ./services/user/app/app-deployment.yaml
kubectl create -f ./services/user/app/app-service.yaml
echo ""
