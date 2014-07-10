#!/bin/bash

cd `dirname $0`
source config.sh
ruby example.rb "$SACLOUD_TOKEN" "$SACLOUD_SECRET"

