#!/usr/bin/env python

import os 
# # import subprocess
# # from subprocess import Popen

# sudo sh -c 'echo deb https://apt.buildkite.com/buildkite-agent stable main > /etc/apt/sources.list.d/buildkite-agent.list'
# sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 32A37959C2FA5C3C99EFBC32A79206696452D198
# sudo apt-get update && sudo apt-get install -y buildkite-agent
# sudo sed -i "s/xxx/eba2865bbf1fb672ee9b0f07d40db1a9bbfc3f88a208e925cf/g" /etc/buildkite-agent/buildkite-agent.cfg
# sudo systemctl enable buildkite-agent && sudo systemctl start buildkite-agent
# sudo buildkite-agent start --tags "bigtable=backup"

# To install apt-transport-https
os.system('sudo apt-get install apt-transport-https ca-certificates gnupg')
os.system('echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list')
os.system('curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -')
os.system('sudo apt-get update && sudo apt-get install google-cloud-sdk')
# os.system('gcloud init')
# os.system('')

# To create a configuration to use while working on the testnet projectos.system('gcloud config configurations create tour-de-sol-bt')
os.system('gcloud config set account bigtable-backup-read-write@tour-de-sol.iam.gserviceaccount.com')
os.system('gcloud config set project tour-de-sol')
os.system('gcloud config configurations list')


pwd_ = os.Popen('pwd')
file_path = (pwd_.readlines()).strip('\n')
pwd_.close()
print('file path is ', file_path)
TESTNET_SERVICE_ACCOUNT_JSON = os.environ.get("TESTNET_SERVICE_ACCOUNT_JSON")
# cat TESTNET_SERVICE_ACCOUNT_JSON
os.system('wget '+ str(TESTNET_SERVICE_ACCOUNT_JSON))
# os.system(' ')
os.system('sudo cp ' + str(file_path) + 'tour-de-sol-257e2a3b8b64.json /home/joe/')
os.system('cd /home/joe/')
os.system('sudo mv tour-de-sol-257e2a3b8b64.json testnet_bt_readwrite.json')
os.system('export GOOGLE_APPLICATION_CREDENTIALS=/home/joe/testnet_bt_readwrite.json ')
os.system('gcloud auth activate-service-account bigtable-backup-read-write@tour-de-sol.iam.gserviceaccount.com --key-file=/home/joe/testnet_bt_readwrite.json')

os.system('gcloud bigtable backups create Backup-Testing --instance=solana-ledger --cluster=solana-ledger-c1 --table=test2 --retention-period=3d --project=tour-de-sol')
