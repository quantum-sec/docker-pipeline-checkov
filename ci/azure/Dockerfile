FROM quantumsec/docker-pipeline-checkov:latest

# Azure DevOps has specific container requirements not met by the base image.
# See: https://docs.microsoft.com/en-us/azure/devops/pipelines/process/container-phases?view=azure-devops#requirements
RUN apk add --update bash libc6-compat
