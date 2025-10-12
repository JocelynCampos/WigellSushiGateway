@echo off
echo Stopping wigellsushigateway
docker stop wigellsushigateway
echo Deleting container wigellsushigateway
docker rm wigellsushigateway
echo Deleting image wigellsushigateway
docker rmi wigellsushigateway
echo Running mvn package
call mvn package -DskipTests
echo Creating image wigellsushigateway
docker build -t wigellsushigateway .
echo Creating and running container wigellsushigateway
docker run -d -p 4545:4545 --name wigellsushigateway --network services-network wigellsushigateway
echo Done!