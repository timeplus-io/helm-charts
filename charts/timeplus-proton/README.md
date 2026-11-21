# Introduction

![Version: 1.0.0](https://img.shields.io/badge/Version-1.0.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 3.0.3](https://img.shields.io/badge/AppVersion-3.0.3-informational?style=flat-square)

Please refer to https://docs.timeplus.com/k8s-helm

## Values

| Key                              | Type    | Default                | Description                                                                                                                                                                  |
| -------------------------------- | ------- | ---------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| config                           | object  | `{}`                   |                                                                                                                                                                              |
| image                            | string  | `"timeplus-io/proton"` |                                                                                                                                                                              |
| imagePullPolicy                  | string  | `"IfNotPresent"`       |                                                                                                                                                                              |
| imageRegistry                    | string  | `"d.timeplus.com"`     |                                                                                                                                                                              |
| resources                        | object  | `{}`                   |                                                                                                                                                                              |
| service.enabled                  | boolean | `true`                 | Disable the Service provisioning from this Chart                                                                                                                             |
| service.nodePorts.httpSnapshot   | int     | `30123`                |                                                                                                                                                                              |
| service.nodePorts.httpStreaming  | int     | `30218`                |                                                                                                                                                                              |
| service.nodePorts.metrics        | int     | `30363`                |                                                                                                                                                                              |
| service.nodePorts.tcpSnapshot    | int     | `30587`                |                                                                                                                                                                              |
| service.nodePorts.tcpStreaming   | int     | `30863`                |                                                                                                                                                                              |
| service.type                     | string  | `"NodePort"`           |                                                                                                                                                                              |
| serviceName                      | string  | `"proton-svc"`         | Name that is given to the provisioned Service and referred to by the StatefulSet. If provisioning the Service independently, this should then match the name of that Service |
| storage.className                | string  | `"local-storage"`      |                                                                                                                                                                              |
| storage.selector.matchLabels.app | string  | `"proton"`             |                                                                                                                                                                              |
| storage.size                     | string  | `"10Gi"`               |                                                                                                                                                                              |
| tag                              | string  | `"3.0.3"`              |                                                                                                                                                                              |