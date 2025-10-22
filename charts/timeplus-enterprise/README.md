# Introduction

![Version: 1.0.0](https://img.shields.io/badge/Version-1.0.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 3.0.1](https://img.shields.io/badge/AppVersion-3.0.1-informational?style=flat-square)

Please refer to https://docs.timeplus.com/k8s-helm

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| global.affinity | object | `{}` | This is the global affinity settings. Once set, it will be applied to every single component. If you'd like to set affinity for each component, you can set `affinity` under component name. For example you can use `timeplusd.affinity` to control the affinity of timeplusd Refer to https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/ |
| global.imagePullPolicy | string | `"IfNotPresent"` | This setting is available for each component as well. |
| global.imagePullSecrets | list | `[]` | This applies to all pods |
| global.imageRegistry | string | `"docker.timeplus.com"` | This setting is available for each component as well. |
| global.nodeSelector | object | `{}` | See https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#nodeselector |
| global.pvcDeleteOnStsDelete | bool | `false` | Only valid with k8s >= 1.27.0. Ref: https://kubernetes.io/docs/concepts/workloads/controllers/statefulset/#persistentvolumeclaim-retention |
| global.pvcDeleteOnStsScale | bool | `false` | Only valid with k8s >= 1.27.0. Ref: https://kubernetes.io/docs/concepts/workloads/controllers/statefulset/#persistentvolumeclaim-retention |
| global.tolerations | list | `[]` | See https://kubernetes.io/docs/concepts/scheduling-eviction/taint-and-toleration/ |
| ingress.appserver | object | `{"domain":null,"enabled":false}` | Only Nginx controller is tested. https://kubernetes.github.io/ingress-nginx/ ingressClassName: nginx Uncomment the tls section below to enable https. You will need to follow   1. https://kubernetes.io/docs/concepts/services-networking/ingress/#tls   2. https://kubernetes.github.io/ingress-nginx/user-guide/tls/ to create a k8s secret that contains certificate and private key tls:   - hosts: [timeplus.local]   secretName: "secret-name" |
| ingress.appserver.domain | string | `nil` | If you want use an ip, please remove it. it's will match all (equal *). |
| ingress.timeplusd.domain | string | `nil` | If you want use an ip, please remove it. it's will match all (equal *). |
| ingress.timeplusd.enabled | bool | `false` | To send REST API call to timeplusd, the URL will be http(s)://<publicDomain>:<port><restPath> e.g.   - curl http://timeplus.local/timeplusd/info   - curl http://timeplus.local/timeplusd/v1/ddl/streams |
| ingress.timeplusd.httpSnapshotPath | string | `"/snapshot"` | * update thte `httpSnapshotPath` to be `/` and use different domain for appserver and timeplusd ingress |
| prometheus_metrics.enabled | bool | `false` |  |
| prometheus_metrics.remote_write_endpoint | string | `"http://timeplus-prometheus:80"` |  |
| prometheus_metrics.vector.image | string | `"timberio/vector"` |  |
| provision.enabled | bool | `false` | Provision job will ONLY be run once after the first installation if it is enabled. A Job will be created to provision default resources such as licenses. This Job shares the same configurations (e.g. resource limit) as `timeplusCli` below. Disable it during installation and re-enable it later won't work. |
| timeplusAppserver.configs | object | `{}` | Configurations for appserver. e.g. `enable-authentication: true`. See https://docs.timeplus.com/server_config#appserver |
| timeplusAppserver.enabled | bool | `true` |  |
| timeplusAppserver.enabledAIService | bool | `false` |  |
| timeplusAppserver.extraContainers | list | `[]` | Extra containers that to be run together with the main container. |
| timeplusAppserver.extraVolumes | list | `[]` | Extra volumes that to be mounted |
| timeplusAppserver.image | string | `"timeplus/timeplus-appserver"` |  |
| timeplusAppserver.service.clusterIP | string | `nil` |  |
| timeplusAppserver.service.nodePort | string | `nil` |  |
| timeplusAppserver.service.type | string | `"ClusterIP"` |  |
| timeplusCli.enabled | bool | `false` |  |
| timeplusCli.image | string | `"timeplus/timeplus-cli"` |  |
| timeplusConnector.configMap | object | `{"logger":{"add_timestamp":true,"file":{"path":"/timeplus/connector-server.log","rotate":true,"rotate_max_age_days":1},"level":"INFO"}}` | With this default config map, the logs will be written to local ephemeral volume. You can set configMap to be `null` and the logs will be written to stdout. However, you will not be able to view logs of the source and sink on UI if it is `null`. |
| timeplusConnector.enabled | bool | `true` |  |
| timeplusConnector.extraContainers | list | `[]` | Extra containers that to be run together with the main container. |
| timeplusConnector.extraVolumes | list | `[]` | Extra volumes that to be mounted |
| timeplusConnector.image | string | `"timeplus/timeplus-connector"` |  |
| timeplusd.computeNode | object | `{"config":{},"replicas":0,"resources":{"limits":{"cpu":"32","memory":"60Gi"},"requests":{"cpu":"2","memory":"4Gi"}}}` | Compute node |
| timeplusd.computeNode.config | object | `{}` | Configurations for timeplusd compute node. See https://docs.timeplus.com/server_config#timeplusd |
| timeplusd.config | object | `{}` | Configurations for timeplusd. See https://docs.timeplus.com/server_config#timeplusd |
| timeplusd.defaultAdminPassword | string | `"timeplusd@t+"` | Timeplus appserver will use this username and password to connect to timeplusd to perform some administration operations such as user management. |
| timeplusd.enableCoreDump | bool | `false` |  |
| timeplusd.enabled | bool | `true` |  |
| timeplusd.extraContainers | list | `[]` | Extra containers that to be run together with the main container. |
| timeplusd.extraEnvs | list | `[]` | Extra environment variables |
| timeplusd.extraInitContainers | list | `[]` | Extra init containers. It will be run before other init containers. |
| timeplusd.extraUsers | object | `{}` | Extra users |
| timeplusd.extraVolumes | list | `[]` | Extra volumes that to be mounted |
| timeplusd.image | string | `"timeplus/timeplusd"` |  |
| timeplusd.initJob.image | string | `"timeplus/boson"` |  |
| timeplusd.livenessProbe | object | `{"failureThreshold":20,"httpGet":{"path":"/timeplusd/ping","port":"http-streaming","scheme":"HTTP"},"initialDelaySeconds":30,"periodSeconds":30,"successThreshold":1,"timeoutSeconds":1}` | K8s liveness probe for timeplusd. Please refer to https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/ |
| timeplusd.metadataNodeQuorum | string | `nil` |  |
| timeplusd.replicas | int | `3` | A typical deployment contains 1, 3, or 5 replicas. The max number of Metadata node is 3. If you specify more than 3 replicas, the first 3 will always be Metadata and Data node and the rest of them will be Data node only. |
| timeplusd.resources | object | `{"limits":{"cpu":"32","memory":"60Gi"},"requests":{"cpu":"2","memory":"4Gi"}}` | Make sure at least 2 cores are assigned to each timeplusd |
| timeplusd.service.clusterIP | string | `nil` | Set clusterIP to be `None` to create a headless service. |
| timeplusd.service.nodePort | int | `30863` |  |
| timeplusd.service.type | string | `"ClusterIP"` | Update type to `NodePort` if you want to access timeplusd directly (rest API, metrics, and etc.) |
| timeplusd.serviceAccountName | string | `""` |  |
| timeplusd.sleep | bool | `false` | Don't start timeplusd automatically when pod is up. Instead, just run sleep command so that you can exec into the pod to debug. |
| timeplusd.storage.history | object | `{"className":"local-storage","selector":{"matchLabels":{"app":"timeplusd-data-history"}},"size":"100Gi","subPath":"./"}` | PV settings for historical storage. |
| timeplusd.storage.log | object | `{"className":"local-storage","enabled":true,"selector":{"matchLabels":{"app":"timeplusd-log"}},"size":"30Gi","subPath":"./"}` | PV settings for logs. |
| timeplusd.storage.log.enabled | bool | `true` | When disabled, log will be written to stream storage (/var/lib/timeplusd/nativelog) |
| timeplusd.storage.stream | object | `{"className":"local-storage","metastoreSubPath":"./","nativelogSubPath":"./","selector":{"matchLabels":{"app":"timeplusd-data-stream"}},"size":"100Gi"}` | PV settings for streaming storage. |
