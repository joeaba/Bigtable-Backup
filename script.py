import os 
# import subprocess
# from subprocess import Popen

os.system('gcloud config configurations create tour-de-sol-bt')
os.system('gcloud config set account bigtable-backup-read-write@tour-de-sol.iam.gserviceaccount.com')
os.system('gcloud config set project tour-de-sol')
os.system('export GOOGLE_APPLICATION_CREDENTIALS=/home/joe/testnet_bt_readwrite.json ')
os.system('gcloud auth activate-service-account bigtable-backup-read-write@tour-de-sol.iam.gserviceaccount.com --key-file=/home/joe/testnet_bt_readwrite.json')
os.system('gcloud bigtable backups create Backup-Testing --instance=solana-ledger --cluster=solana-ledger-c1 --table=test2 --retention-period=3d --project=tour-de-sol')
