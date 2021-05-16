#! /bin/sh

echo $(which apimcli)
apimcli version

rm  -rf $HOME/.wso2apimcli

echo 'setting up prod environment'
apimcli add-env -n prod \
                      --registration https://10.8.0.23:9444/client-registration/v0.14/register \
                      --apim https://10.8.0.23:9444 \
                      --token https://10.8.0.23:8244/token \
                      --import-export https://10.8.0.23:9444/api-import-export-2.6.0-v1 \
                      --admin https://10.8.0.23:9444/api/am/admin/v0.13 \
                      --api_list https://10.8.0.23:9444/api/am/publisher/v0.14/apis \
                      --app_list https://10.8.0.23:9444/api/am/store/v0.14/applications
echo 'logging into prod'
apictl login prod -u $USERNAME -p $PASSWORD
