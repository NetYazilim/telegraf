set VERSION=%1
echo Building version: %VERSION%
docker build -t netyazilim/telegraf:%VERSION% --build-arg VERSION=%VERSION% -f Dockerfile .
docker build -t netyazilim/telegraf:%VERSION%-alpine --build-arg VERSION=%VERSION% -f alpine.Dockerfile .