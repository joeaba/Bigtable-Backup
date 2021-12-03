#!/usr/bin/env bash

set -x
# trap read debug
sudo apt-get install apt-transport-https ca-certificates gnupg
echo "sudo apt-get install apt-transport-https ca-certificates gnupg"
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
echo "curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -"
status = $(sudo apt-get update && sudo apt-get install google-cloud-sdk )
#   if [[ -n $status ]]; then
#     echo "Installed the google-cloud-sdk"
#     exit 0
#   else
#     echo "google-cloud-sdk is previously installed on this system"
#   fi
gcloud config set account bigtable-backup-read-write@tour-de-sol.iam.gserviceaccount.com
echo "gcloud config set account bigtable-backup-read-write@tour-de-sol.iam.gserviceaccount.com"
gcloud config set project tour-de-sol
gcloud config configurations list
# cd /home/
# echo "$(file_path "$0")"
declare file_path="$0"
echo "file path is: "$file_path""
cd file_path

#declaring a variable to store the value of the vaiable from the .yml file
# echo "$(snp "$TESTNET_SERVICE_ACCOUNT_JSON")"
declare snp="$TESTNET_SERVICE_ACCOUNT_JSON"
echo "snp is "$snp""
pwd

#printing credentials inside the file
# cat << EOF >> testnet_bt_readwrite.json
# echo "$snp"
# EOF

touch testnet_bt_readwrite.json
cat <<< "$TESTNET_SERVICE_ACCOUNT_JSON" > testnet_bt_readwrite.json
ls


#reading the content of the file
cat testnet_bt_readwrite.json

#printing the pwd and also the content of the directory
# echo "pwd is: "pwd""
ls


# declare pwd_="$pwd"
# echo "$pwd_"
# echo "$pwd"
# ls
# cd /home/runner/work/Bigtable-Backup/Bigtable-Backup
# declare pwd_="$pwd"
# echo "$pwd_"
# echo "$pwd"
# ls


# source ./secret_handler.yml
# snp="$TESTNET_SERVICE_ACCOUNT_JSON"
# export snp_="$snp"
# echo "$TESTNET_SERVICE_ACCOUNT_JSON" >> testnet_bt_readwrite.json
# cat testnet_bt_readwrite.json


# wget "$TESTNET_SERVICE_ACCOUNT_JSON"
# sudo mv tour-de-sol-257e2a3b8b64.json testnet_bt_readwrite.json
export GOOGLE_APPLICATION_CREDENTIALS=./testnet_bt_readwrite.json
gcloud auth activate-service-account bigtable-backup-read-write@tour-de-sol.iam.gserviceaccount.com --key-file=./testnet_bt_readwrite.json

# (
#   set -x
#   sudo apt-get install apt-transport-https ca-certificates gnupg
#   echo "sudo apt-get install apt-transport-https ca-certificates gnupg"
#   echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
#   curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
#   echo "curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -"
#   status = $(sudo apt-get update && sudo apt-get install google-cloud-sdk
# #   if [[ -n $status ]]; then
# #     echo "Installed the google-cloud-sdk"
# #     exit 0
# #   else
# #     echo "google-cloud-sdk is previously installed on this system"
# #   fi
#   gcloud config set account bigtable-backup-read-write@tour-de-sol.iam.gserviceaccount.com
#   echo "gcloud config set account bigtable-backup-read-write@tour-de-sol.iam.gserviceaccount.com"
#   gcloud config set project tour-de-sol
#   gcloud config configurations list
#   cd /home/
#   '$(file_path "$0")'
#   echo 'file path is: $file_path'
#   cd  "$(file_path)"
#   export secret_handler.yml
#   echo "$TESTNET_SERVICE_ACCOUNT_JSON"
#   wget "$TESTNET_SERVICE_ACCOUNT_JSON"
#   sudo mv tour-de-sol-257e2a3b8b64.json testnet_bt_readwrite.json
#   export GOOGLE_APPLICATION_CREDENTIALS=/home/testnet_bt_readwrite.json
#   gcloud auth activate-service-account bigtable-backup-read-write@tour-de-sol.iam.gserviceaccount.com --key-file=/home/testnet_bt_readwrite.json
# )
echo ==========================================================
echo Success
exit 0
