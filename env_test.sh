#!/usr/bin/env bash
touch testnet_bt_readwrite.json
cat <<< "$TESTNET_SERVICE_ACCOUNT_JSON" > testnet_bt_readwrite.json
cat testnet_bt_readwrite.json
ls

