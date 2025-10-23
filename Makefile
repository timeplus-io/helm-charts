namespace = timeplus

install:
	helm -n ${namespace} install -f ./charts/$(chart)/values.yaml -f ./values/$(chart).yaml $(chart) ./charts/$(chart)

uninstall:
	helm -n ${namespace} uninstall $(chart)

upgrade:
	helm -n ${namespace} upgrade -f ./charts/$(chart)/values.yaml -f ./values/$(chart).yaml $(chart) ./charts/$(chart)

template:
	helm -n ${namespace} template -f ./charts/$(chart)/values.yaml -f ./values/$(chart).yaml --name-template=$(chart) ./charts/$(chart) > timeplus.yaml
	kubeconform -summary timeplus.yaml 

deps:
	helm dependency update ./charts/timeplus-enterprise

tool:
	brew install norwoodj/tap/helm-docs
	brew install kubeconform

docs:
	helm-docs -c ./charts -g charts/timeplus-enterprise
	helm-docs -c ./charts -g charts/timeplus-proton

versions:
	@echo "CONNECTOR_VERSION=$$(cat charts/timeplus-enterprise/values.yaml | yq .timeplusConnector.tag)"
	@echo "APPSERVER_VERSION=$$(cat charts/timeplus-enterprise/values.yaml | yq .timeplusAppserver.tag)"
	@echo "TIMEPLUSD_VERSION=$$(cat charts/timeplus-enterprise/values.yaml | yq .timeplusd.tag)"
	@echo "TIMEPLUS_CLI_VERSION=$$(cat charts/timeplus-enterprise/values.yaml | yq .timeplusCli.tag)"
	