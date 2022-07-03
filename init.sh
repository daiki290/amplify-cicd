#!/bin/bash
set -e
IFS='|'

AWSCLOUDFORMATIONCONFIG="{\
\"configLevel\":\"project\",\
\"useProfile\":false,\
\"profileName\":\"amplify-cicd-user\",\
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

CODEGEN="{\
\"”generateCode\":true,\
\"codeLanguage\":\"typescript\",\
\"fileNamePattern\":\"src/graphql/**/*.ts\",\
\"generatedFileName\":\"API\",\
\"generateDocs\":true\
}"

amplify init \
--amplify $AMPLIFY \
--frontend $FRONTEND \
--providers $PROVIDERS \
--yes
