#!/bin/bash
kind create cluster --name cloud-conference-day --config clusterconfig.yaml

kubectl cluster-info --context kind-cloud-conference-day