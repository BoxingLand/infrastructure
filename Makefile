
deploy_minio:
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


deploy_user:
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


deploy_auth:
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


deploy_gateway:
	echo "Creating the api server credentials..."
	kubectl create -f ./services/gateway/app/app-secret.yaml
	echo ""

	echo "Creating the FastAPI deployment and service..."
	kubectl create -f ./services/gateway/app/app-deployment.yaml
	kubectl create -f ./services/gateway/app/app-service.yaml
	echo ""

deploy_monitoring:
	echo "Creating monitoring prometheus config map..."
	kubectl create -f ./monitoring/prometheus/prometheus-config.yaml
	echo ""

	echo "Creating monitoring prometheus deployment..."
	kubectl create -f ./monitoring/prometheus/prometheus-deployment.yaml
	echo ""

	echo "Creating monitoring prometheus service..."
	kubectl create -f ./monitoring/prometheus/prometheus-service.yaml
	echo ""

	echo "Creating monitoring grafana pvc..."
	kubectl create -f ./monitoring/grafana/grafana-pvc.yaml
	echo ""

	echo "Creating monitoring grafana deployment..."
	kubectl create -f ./monitoring/grafana/grafana-deployment.yaml
	echo ""

	echo "Creating monitoring grafana service..."
	kubectl create -f ./monitoring/grafana/grafana-service.yaml
	echo ""


deploy_all:  deploy_minio deploy_user deploy_auth deploy_gateway deploy_monitoring


delete_minio:
	echo "Deleting minio credentials..."
	kubectl delete secret minio-secret
	echo ""

	echo "Deleting the minio deployment and service..."
	kubectl delete deployment minio-deployment
	kubectl delete service minio-service
	echo ""

	echo "Deleting the volume..."
	kubectl delete pvc minio-pv-claim
	echo ""

delete_user:
	echo "Deleting the database credentials..."
	kubectl delete secret user-db-credentials
	echo ""

	echo "Deleting the user grpc server credentials..."
	kubectl delete secret user-app-urls
	echo ""

	echo "Deleting the Postgres deployment and service..."
	kubectl delete deployment postgres-db-user
	kubectl delete service postgres-db-service-user
	echo ""

	echo "Deleting the user grpc deployment and service..."
	kubectl delete deployment user-app
	kubectl delete service user-service
	echo ""

delete_auth:
	echo "Deleting the database credentials..."
	kubectl delete secret auth-db-credentials
	echo ""

	echo "Deleting the auth grpc server credentials..."
	kubectl delete secret auth-app-urls
	echo ""

	echo "Deleting the Postgres deployment and service..."
	kubectl delete deployment postgres-db-auth
	kubectl delete service postgres-db-service-auth
	echo ""

	echo "Deleting the auth grpc deployment and service..."
	kubectl delete deployment auth-app
	kubectl delete service auth-service
	echo ""

delete_gateway:
	echo "Deleting the api server credentials..."
	kubectl delete secret gateway-app-urls
	echo ""

	echo "Deleting the FastAPI deployment and service..."
	kubectl delete deployment gateway-app
	kubectl delete service gateway-service
	echo ""

delete_all: delete_minio delete_user delete_auth delete_gateway
