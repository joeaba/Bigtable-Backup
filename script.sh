#!/usr/bin/env bash


# if [[ $(basename "$0" .sh) = delete-cluster ]]; then
#   if [[ -n $API_DNS_NAME ]]; then
#     echo "Attempting to recover TLS certificate before deleting instances"
#     (
#       set -x
#       gcloud --project "$PROJECT" compute scp --zone "$DEFAULT_ZONE" "$API_INSTANCE":/letsencrypt.tgz "$LETSENCRYPT_TGZ"
#     ) || true
#     if [[ -f "$LETSENCRYPT_TGZ" ]]; then
#       echo "Warning: ensure you don't delete $LETSENCRYPT_TGZ"
#     fi
#   fi

#   for INSTANCE_ZONE in "${INSTANCES[@]}"; do
#     declare INSTANCE=${INSTANCE_ZONE%:*}
#     declare ZONE=${INSTANCE_ZONE#*:}
#     (
#       set -x
#       gcloud --project "$PROJECT" compute instances delete "$INSTANCE" \
#       --zone "$ZONE" \
#       --quiet
#     ) &
#     sleep 1
#   done
#   wait
#   exit 0
# fi


(
#   set -x
  sudo apt-get install apt-transport-https ca-certificates gnupg
  echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list')
  curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -')
  status = $(sudo apt-get update && sudo apt-get install google-cloud-sdk)
  if [[ -n $status ]]; then
    echo "Installed the google-cloud-sdk"
    exit 0
#   else
#     echo "google-cloud-sdk is previously installed on this system"
#     exit 0
#   fi
  gcloud config set account bigtable-backup-read-write@tour-de-sol.iam.gserviceaccount.com
  gcloud config set project tour-de-sol
  gcloud config configurations list
  cd /home/
  "$(file_path "$0")"
  echo 'file path is:  $file_path'
  cd  "$(file_path)"
  export secret_handler.yml
  echo "$TESTNET_SERVICE_ACCOUNT_JSON"
  wget "$TESTNET_SERVICE_ACCOUNT_JSON"
  sudo mv tour-de-sol-257e2a3b8b64.json testnet_bt_readwrite.json
  export GOOGLE_APPLICATION_CREDENTIALS=/home/testnet_bt_readwrite.json
  gcloud auth activate-service-account bigtable-backup-read-write@tour-de-sol.iam.gserviceaccount.com --key-file=/home/testnet_bt_readwrite.json
)
