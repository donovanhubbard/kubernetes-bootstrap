#!/bin/bash

# network CNI (calico)
kubectl apply -f https://docs.projectcalico.org/manifests/calico.yaml

#metrics server
kubectl apply -f https://raw.githubusercontent.com/linuxacademy/content-cka-resources/master/metrics-server-components.yaml
