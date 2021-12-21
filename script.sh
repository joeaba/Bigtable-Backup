#!/usr/bin/env bash

set -x
# trap read debug

# sudo apt-get install apt-transport-https ca-certificates gnupg
echo "sudo apt-get install apt-transport-https ca-certificates gnupg"

# echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
echo "curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -"

sudo apt-get update -y
# sudo apt-get update -y && sudo apt-get install google-cloud-sdk -y
# status = $(sudo apt-get update && sudo apt-get install google-cloud-sdk )
#   if [[ -n $status ]]; then
#     echo "Installed the google-cloud-sdk"
#     exit 0
#   else
#     echo "google-cloud-sdk is previously installed on this system"
#   fi

sudo gcloud config configurations create tour-de-sol
gcloud config set account bigtable-backup-read-write@tour-de-sol.iam.gserviceaccount.com
echo "gcloud config set account bigtable-backup-read-write@tour-de-sol.iam.gserviceaccount.com"
gcloud config set project tour-de-sol
gcloud config configurations list

# # cd /home/
# # echo "$(file_path "$0")"
declare file_path="$0"
echo "file path is: "$file_path""
pwd
# cd file_path

# #declaring a variable to store the value of the vaiable from the .yml file
# # echo "$(snp "$TESTNET_SERVICE_ACCOUNT_JSON")"
# declare snp="$TESTNET_SERVICE_ACCOUNT_JSON"
# echo "snp is "$snp""
# pwd

#printing credentials inside the file
# cat << EOF >> testnet_bt_readwrite.json
# echo "$snp"
# EOF

#testing for the debian system
# sudo ifconfig
# sudo ls /var/lib/buildkite-agent/builds/bigtable-backup-1/testing-bigtable/bigtable-backup
# sudo ls /var/lib/buildkite-agent/builds/bigtable-backup-1/testing-bigtable/
# sudo ls /var/lib/buildkite-agent/builds/bigtable-backup-1/
# sudo ls /var/lib/buildkite-agent/builds/
# sudo ls /var/lib/buildkite-agent
# sudo ls /home/anmesh/

# touch testnet_bt_readwrite.json
# cat <<< "$TESTNET_SERVICE_ACCOUNT_JSON" > testnet_bt_readwrite.json
# ls
# touch testnet_bt_readwrite.txt
# cat <<< "$TESTNET_SERVICE_ACCOUNT_JSON" > testnet_bt_readwrite.txt
# ls

#reading the content of the file
cat testnet_bt_readwrite.json
head testnet_bt_readwrite.json
# cat testnet_bt_readwrite.txt
# head testnet_bt_readwrite.txt

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

#adding the path to the "GOOGLE_APPLICATION_CREDENTIALS" and also authenticating the service account
export GOOGLE_APPLICATION_CREDENTIALS=/home/joe/testnet_bt_readwrite.json
gcloud auth activate-service-account bigtable-backup-read-write@tour-de-sol.iam.gserviceaccount.com \
--key-file=/home/joe/testnet_bt_readwrite.json


#command to tests whether this Backup exists
gcloud bigtable backups list --instance=solana-ledger

#command to list the tables inside the bigtable instanace
listing=$(gcloud bigtable instances tables list --instances=solana-ledger)


#command to loop over the "$arg" in the "$listing" variable & create the backup for the tables inside the testnet bigtable instance
for arg in "${listing[@]}" 
do
  for args in $arg; do
    echo "$args"
    gcloud bigtable backups create "$args" --instance=solana-ledger \
    --cluster=solana-ledger-c1 \
    --table="$args" \
    --retention-period=3d
    done
  done

# echo "hello"

#alternative command to run the backup
# listing=('tx','test2')
# for arg in "${listing[@]}" 
# do
#   echo "$arg"
#   gcloud bigtable backups create "$arg" --instance=solana-ledger \
#   --cluster=solana-ledger-c1 \
#   --table="$arg" \
#   --retention-period=3d
# done






#for project=devnet
sudo gcloud config configurations create devent
sudo gcloud config set account bigtable-backup-read-write@solana-devnet.iam.gserviceaccount.com
sudo gcloud config set project solana-devnet
sudo gcloud config configurations list

#adding the path to the "GOOGLE_APPLICATION_CREDENTIALS" and also authenticating the service account
export GOOGLE_APPLICATION_CREDENTIALS=/home/joe/devnet_bt_readwrite.json
gcloud auth activate-service-account bigtable-backup-read-write@solana-devnet.iam.gserviceaccount.com \
--key-file=/home/joe/devnet_bt_readwrite.json

#command to tests whether this Backup exists
gcloud bigtable backups list --instance=solana-ledger

#command to list the tables inside the bigtable instanace
listing=$(gcloud bigtable instances tables list --instances=solana-ledger)

#command to loop over the "$arg" in the "$listing" variable & create the backup for the tables inside the devnet bigtable instance
for arg in "${listing[@]}" 
do
  for args in $arg; do
    echo "$args"
    gcloud bigtable backups create "$args" --instance=solana-ledger \
    --cluster=solana-ledger-c1 \
    --table="$args" \
    --retention-period=3d
    done
  done





#for project=mainnet-beta
sudo gcloud config configurations create mainnet-beta
sudo gcloud config set account bigtable-backup-read-write@mainnet-beta.iam.gserviceaccount.com
sudo gcloud config set project mainnet-beta
sudo gcloud config configurations list

#adding the path to the "GOOGLE_APPLICATION_CREDENTIALS" and also authenticating the service account
export GOOGLE_APPLICATION_CREDENTIALS=/home/joe/mainnet-beta_bt_readwrite.json
gcloud auth activate-service-account bigtable-backup-read-write@mainnet-beta.iam.gserviceaccount.com \
--key-file=/home/joe/mainnet-beta_bt_readwrite.json

#command to tests whether this Backup exists
gcloud bigtable backups --instance=solana-ledger

#command to list the tables inside the bigtable instanace
listing=$(gcloud bigtable instances tables list --instances=solana-ledger)
#command to list clusters in the instanace
listing_cluster=$(gcloud bigtable clusters list --instances=solana-ledger)

#command to loop over the "$arg" in the "$listing" variable & create the backup for the tables inside the devnet bigtable instance
for arg in "${listing[@]}" 
do
  for args_clus in "${listing_cluster[@]}"
  do
  for args in $arg; do
    for args_cluster in $args_clus; do
      echo "$args"
      echo "$args_cluster"
      echo "hello ji"
#     gcloud bigtable backups create "$args" --instance=solana-ledger \
#     --cluster=solana-ledger-c1 \
#     --table="$args" \
#     --retention-period=3d
    done
  done
  done
done
 




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
#   gcloud auth activate-service-account bigtable-backup-read-write@tour-de-sol.iam.gserviceaccount.com --key-file=/var/lib/buildkite-agent/builds/metrics-solana-com-3/testing-bigtable/bigtable-backup/testnet_bt_readwrite.json
# )
echo ==========================================================
echo Success
exit 0
