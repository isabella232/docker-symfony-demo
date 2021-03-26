
build:
		docker build -f Dockerfile.nginx -t bou7mis/demo-proxy .
		docker build -t bou7mis/demo-app .
run:
		docker run -d -p 9000:9000 --name demo-app bou7mis/demo-app
		docker run -d -p 80:80 --name demo-proxy --link demo-app bou7mis/demo-proxy
clean:
		docker stop $$(docker ps -q)
		docker rm $$(docker ps -aq)
push:
		docker push bou7mis/demo-proxy
		docker push bou7mis/demo-app
deploy:
		echo "deploy to EC2"