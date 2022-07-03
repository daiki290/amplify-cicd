#!/bin/bash
set -e
IFS='|'

AWSCLOUDFORMATIONCONFIG="{\
\"configLevel\":\"project\",\
\"useProfile\":true,\
\"profileName\":\"default\",\
\"accessKeyId\":\"${AMPLIFY_CICD_ACCESS_KEY}\",\
\"secretAccessKey\":\"${AMPLIFY_CICD_SECRET_KEY}\",\
\"region\":\"ap-northeast-1\"\
}"
AMPLIFY="{\
\"projectName\":\"amplify-cicd\",\
\"envName\":\"dev\",\
\"defaultEditor\":\"code\"\
}"
VUECTCONFIG ="{\ 
\” SourceDir \”：\” src \”、\ 
\” DistributionDir \”：\” build \”、\ 
\” BuildCommand \”：\” npm run-script build \”、\ 
\” StartCommand \”：\” npm run-script start \” \ 
}"
FRONTEND="{\
\” frontend \”：\” javascript \”、\ 
\” framework \”：\” vue \”、\ 
\” config \”：$ VUECTCONFIG \ 
}"
PROVIDERS="{\
\"awscloudformation\":$AWSCLOUDFORMATIONCONFIG\
}"
CODEGEN="{\
\”generateCode\”:true,\
\”codeLanguage\”:\”javascript\”,\
\”fileNamePattern\”:\”src/graphql/**/*.js\”,\
\”generatedFileName\”:\”API\”,\
\”generateDocs\”:true\
}”

amplify init \
--amplify $AMPLIFY \
--frontend $FRONTEND \
--providers $PROVIDERS \
--codegen $CODEGEN \
--yes