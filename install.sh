#!/bin/bash

scp jivecake-s3.settings backup.sh $1:~
ssh $1 'bash -s' < install-dependencies.sh