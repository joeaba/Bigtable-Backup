#!/usr/bin/env bash
touch new_file.json
cat <<< "$FOO_ROOT" > new_file.json
cat new_file.json
