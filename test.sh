#!/bin/sh
sh ./mkPlugin.sh test
docker plugin enable test
docker volume create -d test --name test -o share=10.0.6.43/gitlabMount/website_newspre/src -o username="share" -o password="share" -o dirMode="0600" -o fileMode="0755"
docker run --rm -v test:/mount alpine ls -al /mount
docker volume rm test
docker plugin disable test
docker plugin rm test
