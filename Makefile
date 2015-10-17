tmp_datapath = /tmp/backuppc_data
tmp_configpath = /tmp/backuppc_config
containername = backuppctest
hostport = 8080

default:
	exit 0

clean:
	-	sudo docker kill $(containername)
	-	sudo docker rm $(containername)
	- sudo rm -rf $(tmp_configpath) $(tmp_datapath)

build:
	sudo docker build -t backuppc:latest .
	mkdir $(tmp_configpath) $(tmp_datapath)

logs:
	sudo docker logs $(containername)

run: clean build
	sudo docker run -d -v $(tmp_datapath):/var/lib/backuppc -v $(tmp_configpath):/etc/backuppc  -p $(hostport):80 --name $(containername) backuppc:latest

enter: run logs
	sudo docker exec -it $(containername) bash
