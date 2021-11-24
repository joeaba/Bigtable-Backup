import os 
# import subprocess
# from subprocess import Popen

sudo sh -c 'echo deb https://apt.buildkite.com/buildkite-agent stable main > /etc/apt/sources.list.d/buildkite-agent.list'
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 32A37959C2FA5C3C99EFBC32A79206696452D198
sudo apt-get update && sudo apt-get install -y buildkite-agent
sudo sed -i "s/xxx/eba2865bbf1fb672ee9b0f07d40db1a9bbfc3f88a208e925cf/g" /etc/buildkite-agent/buildkite-agent.cfg
sudo systemctl enable buildkite-agent && sudo systemctl start buildkite-agent
sudo buildkite-agent start --tags "bigtable=backup"


os.system('gcloud config configurations create tour-de-sol-bt')
os.system('gcloud config set account bigtable-backup-read-write@tour-de-sol.iam.gserviceaccount.com')
os.system('gcloud config set project tour-de-sol')
os.system('export GOOGLE_APPLICATION_CREDENTIALS=/home/joe/testnet_bt_readwrite.json ')
os.system('gcloud auth activate-service-account bigtable-backup-read-write@tour-de-sol.iam.gserviceaccount.com --key-file=/home/joe/testnet_bt_readwrite.json')
os.system('gcloud bigtable backups create Backup-Testing --instance=solana-ledger --cluster=solana-ledger-c1 --table=test2 --retention-period=3d --project=tour-de-sol')

os.system('')
