all: up
prepare: 
	@echo "\n__________________checking for depedencies_________________\n"
	@sudo apt-get update
	@sudo apt install -y docker.io
	@sudo apt install -y docker-compose
	@sudo systemctl enable --now docker
up: prepare
	@echo "\n___________________container starting______________________\n"
	@if [ ! -d docker ]; then\
		mkdir docker;\
		if [ ! -d www ]; then\
			cd docker ;\
			mkdir www && cd ../../ ;\
		fi ;\
	fi
#	@sudo mkdir docker;
#	@sudo mkdir ./docker/www;
#	@sudo mkdir ./docker/db;
#	@sudo cd ../../ ;
	@sudo cp ./index.php ./docker/www/;
	@sudo docker-compose up -d
	@echo "\n__________Wait for 15 seconds_____________\n"
teardown:
	@echo "\n_______________Removing Containers and Files__________\n"
	@sudo docker-compose down
	@sudo rm -r ./docker
down:
	@echo "\n________________stopping containers________________\n"
	@sudo docker stop apa db
