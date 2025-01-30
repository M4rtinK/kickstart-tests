#!/bin/bash

SOURCE_FOLDER="data/logs"
LOG_ARCHIVE="log_archive/resolve_conf"
TEST_NAME=$1

RUN_FOLDER=$(date +%F_%H-%M-%S)

STORAGE_FOLDER=${LOG_ARCHIVE}/${RUN_FOLDER}__${TEST_NAME}

#echo "** running Rawhide test **"
#sudo containers/runner/launch $TEST_NAME

#echo "** running RHEL 9 test **"
#sudo containers/runner/launch $TEST_NAME --platform rhel9

echo "** running RHEL 10 test **"
sudo containers/runner/launch $TEST_NAME --platform rhel10


echo "** archiving logs **"
echo $STORAGE_FOLDER
echo "** check  logs **"
echo ./list_logs.py $STORAGE_FOLDER
mv $SOURCE_FOLDER $STORAGE_FOLDER
