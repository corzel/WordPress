#!/bin/bash

set -ex

BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"`
VCS_REF=`git rev-parse --short HEAD`
VERSION=`cat VERSION`

if [ ! -f .env ];then
    {
		echo "SERVER_NAME=danza.xyz";
		echo "COMPOSE_PROJECT_NAME=wordpress";
        echo "#The email will be used for registering to Lets Encrypt for the TLS certificate"
		echo "ADMIN_EMAIL=soporte@culturaenlinea.net";
		echo "ADMIN_PASSWORD=Cu17ur43n1in34#ADM@";
		echo "WP_DB_USER=root";
		echo "WP_DB_PASSWORD=Cu17ur43n1in34#DB@";
		echo "WP_DB_NAME=db_xyz";
		echo "MYSQL_ROOT_PASSWORD=Cu17ur43n1in34#DB@";
        echo "DB_HOSTNAME=144.217.94.177:3306"
        echo "#uncomment and subsitute placeholder text from below instead, keeping same connection format,  if clonning a wordpress web site from private repo"
		echo "#GIT_SSH_URL=git@github.com:user/project.git";
		echo "GIT_SSH_URL=https://github.com/WordPress/WordPress.git";
		echo "GIT_DEPLOY_KEY=git_deploy_key";
		echo "IMAGE_NAME=wordpress";
		echo "REGISTRY_URL=registry.gitlab.com"
		echo "BUILD_DATE=$BUILD_DATE";
		echo "VCS_REF=$VCS_REF";
		echo "VERSION=$VERSION";
	} > .env
    echo ".env created"
else
    sed -i.bak -e "s/BUILD_DATE\s*=\s*.*$/BUILD_DATE=$BUILD_DATE/
                s/VCS_REF\s*=\s*.*$/VCS_REF=$VCS_REF/
                s/VERSION\s*=\s*.*$/VERSION=$VERSION/" .env
    echo ".env updated"
fi
