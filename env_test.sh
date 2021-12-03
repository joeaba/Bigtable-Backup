#!/usr/bin/env bash
touch testnet_bt_readwrite.json
cat <<< "$TESTNET_SERVICE_ACCOUNT_JSON" > testnet_bt_readwrite.json
cat testnet_bt_readwrite.json
pwd
ls

touch use_this_key
cat <<< "$use_this_key" > use_this_key
cat use_this_key


#copying the file to buildkite agent
# sudo scp -i use_this_key ./testnet_bt_readwrite.json joe@34.83.118.104:/var/lib/buildkite-agent/builds/metrics-solana-com-3/testing-bigtable/bigtable-backup
# sudo scp ./testnet_bt_readwrite.json joe@34.83.118.104:/var/lib/buildkite-agent/builds/metrics-solana-com-3/testing-bigtable/bigtable-backup


sudo apt-get install apt-transport-https ca-certificates gnupg
echo "sudo apt-get install apt-transport-https ca-certificates gnupg"
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
echo "curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -"
# status = $(sudo apt-get update && sudo apt-get install google-cloud-sdk )
sudo apt-get update && sudo apt-get install google-cloud-sdk

#   if [[ -n $status ]]; then
#     echo "Installed the google-cloud-sdk"
#     exit 0
#   else
#     echo "google-cloud-sdk is previously installed on this system"
#   fi

#creating the config for the GCP
gcloud config set account bigtable-backup-read-write@tour-de-sol.iam.gserviceaccount.com
echo "gcloud config set account bigtable-backup-read-write@tour-de-sol.iam.gserviceaccount.com"
gcloud config set project tour-de-sol
gcloud config configurations list

declare file_path="$0"
echo "file path is: "$file_path""
# cd file_path

#declaring a variable to store the value of the vaiable from the .yml file
# echo "$(snp "$TESTNET_SERVICE_ACCOUNT_JSON")"
declare snp="$TESTNET_SERVICE_ACCOUNT_JSON"
echo "snp is: "$snp""
pwd

#reading the content of the .json file
cat testnet_bt_readwrite.json
pwd

#exporting and authenticating the GCP service account
export GOOGLE_APPLICATION_CREDENTIALS=./testnet_bt_readwrite.json
gcloud auth activate-service-account bigtable-backup-read-write@tour-de-sol.iam.gserviceaccount.com --key-file=./testnet_bt_readwrite.json
