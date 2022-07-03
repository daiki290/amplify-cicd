#!/bin/bash
set -e
IFS='|'

AWSCLOUDFORMATIONCONFIG="{\
\"configLevel\":\"project\",\
\"useProfile\":true,\
\"profileName\":\"default\",\
\"accessKeyId\":\"${AWS_ACCESS_KEY_ID}\",\
\"secretAccessKey\":\"${AWS_SECRET_ACCESS_KEY}\",\
\"region\":\"ap-northeast-1\"\
}"

AMPLIFY="{\
\"projectName\":\"amplify-cicd\",\
\"envName\":\"dev\",\
\"defaultEditor\":\"code\"\
}"

VUECONFIG="{\ 
\” SourceDir \”:\” src \”、\ 
\” DistributionDir \”:\” build \”、\ 
\” BuildCommand \”:\” npm run-script build \”、\ 
\” StartCommand \”:\” npm run-script start \” \ 
}"

FRONTEND="{\
\” frontend \”:\” javascript \”、\ 
\” framework \”:\” vue \”、\ 
\” config \”: $VUECONFIG \ 
}"

PROVIDERS="{\
\"awscloudformation\": $AWSCLOUDFORMATIONCONFIG \
}"

amplify init \
--amplify $AMPLIFY \
--frontend $FRONTEND \
--providers $PROVIDERS \
--yes

amplify configure project \
--amplify $AMPLIFY \
--frontend $FRONTEND \
--providers $PROVIDERS \
--yes

amplify push --yes