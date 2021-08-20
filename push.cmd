set VERSION=%1
echo Pushing version: %VERSION%
docker push netyazilim/telegraf:%VERSION% 
docker push netyazilim/telegraf:%VERSION%-alpine 