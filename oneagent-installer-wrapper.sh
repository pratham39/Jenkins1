echo "===== Dynatrace OneAgent Installation Started ====="

cd /home/site/wwwroot || exit 1

# Download OneAgent installer
curl -s -o Dynatrace-OneAgent.sh "$DT_CONNECTION_POINT/api/v1/deployment/installer/agent/unix/default/latest?Api-Token=$DT_TENANTTOKEN&flavor=default&include=java"

chmod +x Dynatrace-OneAgent.sh

# Install OneAgent to correct App Service location
./Dynatrace-OneAgent.sh \
  APP_LOG_CONTENT_ACCESS=1 \
  INSTALL_PATH=/home/site/wwwroot/oneagent

echo "===== Dynatrace OneAgent Installed ====="

# Verify installation
ls -l /home/site/wwwroot/oneagent/agent/lib64/

echo "===== Wrapper Completed ====="
