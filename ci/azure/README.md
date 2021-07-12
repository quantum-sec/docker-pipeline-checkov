# Using with Azure DevOps

To use this pipeline job with Azure DevOps, add a `job` to your existing pipeline:

```yaml
jobs:
  - job: Checkov
    displayName: Run Checkov Validation
    container:
      image: quantumsec/docker-pipeline-checkov
    steps:
      - script: npx @quantum-sec/ci-analysis-collector checkov --soft-fail
```
