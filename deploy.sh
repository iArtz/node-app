#!/bin/bash
if ./script/test; then
    echo success
else
    exit
fi

ssh nano.dev << 'ENDSSH'
cd node-app
git pull
pm2 stop node-app
yarn install --production
pm2 start node-app
pm2 save
ENDSSH
echo ''
echo '🔥 Deploy finished 🔥'
echo ''
