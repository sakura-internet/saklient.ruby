#!/bin/bash

cd `dirname $0`
source config.sh
ruby test.rb "$SACLOUD_TOKEN" "$SACLOUD_SECRET"

