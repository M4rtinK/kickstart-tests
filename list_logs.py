#!/usr/bin/python3

import os
import sys

import subprocess

def call(command):
    #os.system(command)
    subprocess.call(str(command), shell=True)

# default
logs_folder = "data/logs/"

if len(sys.argv) >= 2:
    logs_folder = sys.argv[1]

custom_log_folder = ""

for folder in os.listdir(logs_folder):
    details_folder = os.path.join(logs_folder, folder, "anaconda")
    if os.path.exists(details_folder):
        print("###########################################################")
        print("** checking: %s" % folder)
        print("###########################################################")
        journal_path = os.path.join(details_folder, "journal.log")
        print("*************************")
        print("** fetching OS version **")
        print("*************************")
        call("cat %s | grep installer.." % journal_path)
        print("***************************")
        print("** fetching debug prints **")
        print("***************************")
        call("cat %s | grep AAA" % journal_path)
        print("******************************")
        print("** fetching fragment output **")
        print("******************************")
        call("cat %s | grep kstest_debug" % journal_path)
