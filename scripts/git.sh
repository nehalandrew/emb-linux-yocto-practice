#! /bin/bash

source .env & git submodule foreach git checkout ${version};
source .env & git submodule foreach git pull;