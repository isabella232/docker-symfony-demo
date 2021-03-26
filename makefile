create:
		docker build -f Dockerfile.nginx -t demo-proxy .
		docker build -t demo-app .
		docker run -d -p 9000:9000 --name demo-app demo-app
		docker run -d -p 80:80 --name demo-proxy --link demo-app demo-proxy


clean:
		docker stop $$(docker ps -q)
		docker rm $$(docker ps -aq)
