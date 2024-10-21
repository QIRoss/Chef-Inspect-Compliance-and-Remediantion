#!/bin/bash

echo "Running Chef InSpec compliance check..."
inspec exec fastapi-compliance-check > inspec_output.txt

if grep -q 'failed' inspec_output.txt; then
  echo "Compliance check failed. Triggering remediation..."
  ./remediate_fastapi.sh
else
  echo "Compliance check passed. No remediation needed."
fi
