#!/bin/sh

docker run -d --name=grafana -p 3000:3000 grafana/grafana

sleep 5 # sleep for 5secs before attempting to create datasource

# add datasource for telegraf
curl -X POST \
  http://0.0.0.0:3000/api/datasources \
  -H 'authorization: Basic YWRtaW46YWRtaW4=' \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/json' \
  -d '{
  "name":"telegraf",
  "type":"influxdb",
  "url":"http://ec2-13-56-223-214.us-west-1.compute.amazonaws.com:8086",
  "access":"direct",
  "basicAuth":false,
  "database":"telegraf"
}'

: <<'end_long_comment'
# create the dashboards
curl -X POST \
  http://0.0.0.0:3000/api/dashboards/db \
  -H 'authorization: Basic YWRtaW46YWRtaW4=' \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/json' \
  -H 'postman-token: 76fb9ae1-a1c1-70df-a277-b9e22106f9bb' \
  -d '{
  "dashboard": {
  "annotations": {
    "list": [
      {
        "builtIn": 1,
        "datasource": "-- Grafana --",
        "enable": true,
        "hide": true,
        "iconColor": "rgba(0, 211, 255, 1)",
        "name": "Annotations & Alerts",
        "type": "dashboard"
      }
    ]
  },
  "editable": true,
  "gnetId": null,
  "graphTooltip": 0,
  "hideControls": false,
  "id": null,
  "links": [],
  "refresh": "10s",
  "rows": [
    {
      "collapse": false,
      "height": 250,
      "panels": [
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "telegraf",
          "fill": 1,
          "id": 2,
          "legend": {
            "avg": false,
            "current": false,
            "max": false,
            "min": false,
            "show": true,
            "total": false,
            "values": false
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "span": 6,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "alias": "$tag_container_name",
              "dsType": "influxdb",
              "groupBy": [
                {
                  "params": [
                    "$__interval"
                  ],
                  "type": "time"
                },
                {
                  "params": [
                    "null"
                  ],
                  "type": "fill"
                }
              ],
              "orderByTime": "ASC",
              "policy": "default",
              "query": "SELECT mean(\"usage_percent\") FROM \"docker_container_cpu\" WHERE (\"container_name\" =~ /webapp_one*/) AND $timeFilter GROUP BY time($__interval), \"container_name\" fill(0)",
              "rawQuery": true,
              "refId": "A",
              "resultFormat": "time_series",
              "select": [
                [
                  {
                    "params": [
                      "value"
                    ],
                    "type": "field"
                  },
                  {
                    "params": [],
                    "type": "mean"
                  }
                ]
              ],
              "tags": []
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeShift": null,
          "title": "Load webapp_one",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "percent",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": "150",
              "min": "0",
              "show": false
            }
          ]
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "telegraf",
          "fill": 1,
          "id": 4,
          "legend": {
            "avg": false,
            "current": false,
            "max": false,
            "min": false,
            "show": true,
            "total": false,
            "values": false
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "span": 6,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "alias": "$tag_container_name",
              "dsType": "influxdb",
              "groupBy": [
                {
                  "params": [
                    "$__interval"
                  ],
                  "type": "time"
                },
                {
                  "params": [
                    "null"
                  ],
                  "type": "fill"
                }
              ],
              "orderByTime": "ASC",
              "policy": "default",
              "query": "SELECT mean(\"usage_percent\") FROM \"docker_container_cpu\" WHERE (\"container_name\" =~ /webapp_two*/) AND $timeFilter GROUP BY time($__interval), \"container_name\" fill(0)",
              "rawQuery": true,
              "refId": "A",
              "resultFormat": "time_series",
              "select": [
                [
                  {
                    "params": [
                      "value"
                    ],
                    "type": "field"
                  },
                  {
                    "params": [],
                    "type": "mean"
                  }
                ]
              ],
              "tags": []
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeShift": null,
          "title": "Load webapp_two",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "percent",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": "150",
              "min": "0",
              "show": false
            }
          ]
        }
      ],
      "repeat": null,
      "repeatIteration": null,
      "repeatRowId": null,
      "showTitle": false,
      "title": "Dashboard Row",
      "titleSize": "h6"
    },
    {
      "collapse": false,
      "height": "250px",
      "panels": [
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "telegraf",
          "fill": 1,
          "id": 1,
          "legend": {
            "avg": false,
            "current": false,
            "max": false,
            "min": false,
            "show": true,
            "total": false,
            "values": false
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "span": 6,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "alias": "$tag_container_name",
              "dsType": "influxdb",
              "groupBy": [
                {
                  "params": [
                    "$__interval"
                  ],
                  "type": "time"
                },
                {
                  "params": [
                    "container_name"
                  ],
                  "type": "tag"
                },
                {
                  "params": [
                    "null"
                  ],
                  "type": "fill"
                }
              ],
              "measurement": "docker_container_cpu",
              "orderByTime": "ASC",
              "policy": "default",
              "query": "SELECT mean(\"usage_percent\") FROM \"docker_container_cpu\" WHERE (\"container_name\" =~ /webapp_three*/) AND $timeFilter GROUP BY time($__interval), \"container_name\" fill(0)",
              "rawQuery": true,
              "refId": "A",
              "resultFormat": "time_series",
              "select": [
                [
                  {
                    "params": [
                      "usage_percent"
                    ],
                    "type": "field"
                  },
                  {
                    "params": [],
                    "type": "mean"
                  }
                ]
              ],
              "tags": [
                {
                  "key": "container_name",
                  "operator": "=",
                  "value": "webapp_one_1"
                }
              ]
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeShift": null,
          "title": "Load webapp_three",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "percent",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ]
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "telegraf",
          "fill": 1,
          "id": 3,
          "legend": {
            "avg": false,
            "current": false,
            "max": false,
            "min": false,
            "show": true,
            "total": false,
            "values": false
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "span": 6,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "alias": "$tag_container_name",
              "dsType": "influxdb",
              "groupBy": [
                {
                  "params": [
                    "$__interval"
                  ],
                  "type": "time"
                },
                {
                  "params": [
                    "container_name"
                  ],
                  "type": "tag"
                },
                {
                  "params": [
                    "null"
                  ],
                  "type": "fill"
                }
              ],
              "measurement": "docker_container_cpu",
              "orderByTime": "ASC",
              "policy": "default",
              "query": "SELECT mean(\"usage_percent\") FROM \"docker_container_cpu\" WHERE (\"container_name\" =~ /webapp_four*/) AND $timeFilter GROUP BY time($__interval), \"container_name\" fill(0)",
              "rawQuery": true,
              "refId": "A",
              "resultFormat": "time_series",
              "select": [
                [
                  {
                    "params": [
                      "usage_percent"
                    ],
                    "type": "field"
                  },
                  {
                    "params": [],
                    "type": "mean"
                  }
                ]
              ],
              "tags": [
                {
                  "key": "container_name",
                  "operator": "=",
                  "value": "webapp_one_1"
                }
              ]
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeShift": null,
          "title": "Load webapp_four",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "percent",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ]
        }
      ],
      "repeat": null,
      "repeatIteration": null,
      "repeatRowId": null,
      "showTitle": false,
      "title": "Dashboard Row",
      "titleSize": "h6"
    }
  ],
  "schemaVersion": 14,
  "style": "dark",
  "tags": [],
  "templating": {
    "list": []
  },
  "time": {
    "from": "now-5m",
    "to": "now"
  },
  "timepicker": {
    "refresh_intervals": [
      "5s",
      "10s",
      "30s",
      "1m",
      "5m",
      "15m",
      "30m",
      "1h",
      "2h",
      "1d"
    ],
    "time_options": [
      "5m",
      "15m",
      "1h",
      "6h",
      "12h",
      "24h",
      "2d",
      "7d",
      "30d"
    ]
  },
  "timezone": "",
  "title": "Container Load",
  "version": 5
  },
  "overwrite": false
}'
end_long_comment