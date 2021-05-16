#! /bin/sh

echo $(which apictl)
apictl version

rm  -rf $HOME/.wso2apictl

echo 'setting up prod environment'
apictl add env prod \
                  --registration https://10.8.0.22:9444 \
                  --publisher https://10.8.0.22:9444 \
                  --devportal https://10.8.0.22:9444 \
                  --admin https://10.8.0.22:9444 \
                  --token https://10.8.0.22:8244/token \
                  --mi https://10.8.0.22:9444
echo 'logging into prod'
apictl login prod -u $USERNAME -p $PASSWORD
