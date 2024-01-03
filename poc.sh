#!/bin/bash

openssl genrsa -out ca.key 4096
openssl req -new -key ca.key -subj "/CN=My CA" -out ca.csr
# openssl x509 -req -in ca.csr -signkey ca.key -out ca.crt -extfile myca.cnf -extensions v3_ca
openssl x509 -req -in ca.csr -signkey ca.key -out ca.crt

openssl genrsa -out server1.key 4096
openssl req -new -key server1.key -subj "/CN=server1" -out server1.csr
echo subjectAltName = DNS:localhost,DNS:server.local.dev,IP:192.168.254.108,IP:127.0.0.1 >> server1.cnf
echo extendedKeyUsage = serverAuth >> server1.cnf
openssl x509 -req -in server1.csr -CAkey ca.key -CA ca.crt -out server1.crt -CAcreateserial -extfile server1.cnf

openssl genrsa -out user1.key 4096
openssl req -new -key user1.key -subj "/CN=user1"  -out user1.csr
echo extendedKeyUsage = clientAuth >> user1.cnf
openssl x509 -req -in user1.csr -CAkey ca.key -CA ca.crt -out user1.crt -CAcreateserial -extfile user1.cnf

openssl genrsa -out stranger.key 4096
openssl req -new -key stranger.key -subj "/CN=stranger" -out stranger.csr
openssl x509 -req -in stranger.csr -signkey stranger.key -out stranger.crt

openssl dhparam -out dhparam 2048
