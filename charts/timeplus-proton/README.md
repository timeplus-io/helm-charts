# Introduction

![Version: 1.0.0](https://img.shields.io/badge/Version-1.0.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 3.0.3](https://img.shields.io/badge/AppVersion-3.0.3-informational?style=flat-square)

## Values

| Key                              | Type   | Default                | Description |
| -------------------------------- | ------ | ---------------------- | ----------- |
| config                           | object | `{}`                   |             |
| image                            | string | `"timeplus-io/proton"` |             |
| imagePullPolicy                  | string | `"IfNotPresent"`       |             |
| imageRegistry                    | string | `"d.timeplus.com"`     |             |
| resources                        | object | `{}`                   |             |
| service.nodePorts.httpSnapshot   | int    | `30123`                |             |
| service.nodePorts.httpStreaming  | int    | `30218`                |             |
| service.nodePorts.metrics        | int    | `30363`                |             |
| service.nodePorts.tcpSnapshot    | int    | `30587`                |             |
| service.nodePorts.tcpStreaming   | int    | `30863`                |             |
| service.type                     | string | `"NodePort"`           |             |
| storage.className                | string | `"local-storage"`      |             |
| storage.selector.matchLabels.app | string | `"proton"`             |             |
| storage.size                     | string | `"10Gi"`               |             |
| tag                              | string | `"3.0.3"`              |             |
