#!/bin/bash

sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key

yum update -y 
yum install -y java-1.8.0-openjdk*
yum install -y jenkins

java -jar /usr/lib/jenkins/jenkins.war --httpPort=9091 > /var/log/jenkins/jenkins-$(date +%Y-%m-%d).log 2>&1 &