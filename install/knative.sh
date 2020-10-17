#!/bin/bash

export KNATIVE_VERSION="0.18.0"

## Knative Serving

kubectl apply --filename https://github.com/knative/serving/releases/download/v$KNATIVE_VERSION/serving-crds.yaml

kubectl apply --filename https://github.com/knative/serving/releases/download/v$KNATIVE_VERSION/serving-core.yaml

## Install contour
# kubectl apply --filename https://github.com/knative/net-contour/releases/download/v$KNATIVE_VERSION/contour.yaml
# kubectl apply --filename https://github.com/knative/net-contour/releases/download/v$KNATIVE_VERSION/net-contour.yaml
#kubectl patch configmap/config-network \
#  --namespace knative-serving \
#  --type merge \
#  --patch '{"data":{"ingress.class":"contour.ingress.networking.knative.dev"}}'

## Install kourier
kubectl apply --filename kourier.yaml

sleep 5

kubectl patch configmap/config-network \
  --namespace knative-serving \
  --type merge \
  --patch '{"data":{"ingress.class":"kourier.ingress.networking.knative.dev"}}'

sleep 5

kubectl patch configmap/config-domain \
  --namespace knative-serving \
  --type merge \
  --patch '{"data":{"127.0.0.1.nip.io":""}}'