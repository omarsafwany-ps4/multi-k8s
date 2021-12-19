docker build -t omarsafwany/multi-client:latest -t omarsafwany/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t omarsafwany/multi-server:latest -t omarsafwany/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t omarsafwany/multi-worker:latest -t omarsafwany/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push omarsafwany/multi-client:latest
docker push omarsafwany/multi-server:latest
docker push omarsafwany/multi-worker:latest

docker push omarsafwany/multi-client:$SHA
docker push omarsafwany/multi-server:$SHA
docker push omarsafwany/multi-worker:$SHA

kubectl apply -f k8s

kubectl set image deployments/server-deployment server=omarsafwany/multi-server:$SHA
kubectl set image deployments/client-deployment client=omarsafwany/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=omarsafwany/multi-worker:$SHA
