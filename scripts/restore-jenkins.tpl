#!/bin/bash -x
# Script used in restore Jenkins
# shellcheck disable=SC2154

cd /root || exit

service jenkins stop

S3_BUCKET="jenkins-backup-${accountno}"

JENKINS_CONFIG_ARCHIVE=$(/var/awslogs/bin/aws s3 ls s3://"$S3_BUCKET" | sort | tail -n 1 | awk '{print $4}')
/var/awslogs/bin/aws s3 cp "s3://$S3_BUCKET/$JENKINS_CONFIG_ARCHIVE" .

if [ -f "$JENKINS_CONFIG_ARCHIVE" ]; then
echo "Archive found, restoring..."
tar -xvf "$JENKINS_CONFIG_ARCHIVE"
mkdir -p /var/lib/jenkins
cp -rf var/lib/jenkins/* /var/lib/jenkins/
chown jenkins:jenkins /var/lib/jenkins -Rf
rm ./"$JENKINS_CONFIG_ARCHIVE"
rm -rf ./var/
else
echo "No backups found on s3, skipping..."
exit 2
fi

service jenkins start
