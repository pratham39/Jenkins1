#!/bin/bash

echo "===== Dynatrace OneAgent Installation Started ====="

cd /home/site/wwwroot

# Download OneAgent
curl -o Dynatrace-OneAgent.sh "$DT_CONNECTION_POINT/api/v1/deployment/installer/agent/unix/default/latest?Api-Token=$DT_TENANTTOKEN&flavor=default&include=java"

chmod +x Dynatrace-OneAgent.sh

# Install OneAgent
./Dynatrace-OneAgent.sh APP_LOG_CONTENT_ACCESS=1

echo "===== Dynatrace OneAgent Installed ====="

# Enable auto-injection
export LD_PRELOAD=/opt/dynatrace/oneagent/agent/lib64/liboneagentproc.so

echo "===== Starting Tomcat ====="

/usr/local/tomcat/bin/catalina.sh run
