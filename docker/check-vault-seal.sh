#!/bin/bash
set -ue

echo "Checking vault seal status..."

oc exec -i nerc-vault-0 -- vault status --format=json > /tmp/sealed.json

sealed=$(cat /tmp/sealed.json | yq -r '.sealed')
echo "Sealed: $sealed"

echo "Updating sealed annotation in nerc-vault sts:"
kubectl annotate statefulset/nerc-vault sealed=$sealed