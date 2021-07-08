#!/usr/bin/env bash
# This script initializes a repository deployed from this template.
set -e;

SED_COMMAND="sed -i"
if [[ "$OSTYPE" == "darwin"* ]]; then
  # macOS doesn't use GNU sed and has a slightly different syntax
  SED_COMMAND="sed -i '' -E"
fi

function update_package_json() {
  local -r package_name="$1"
  echo "Enter a short description for the repository (package.json):"
  read -r description
  eval "$SED_COMMAND 's/template-docker-container/$package_name/g' package.json"
  eval "$SED_COMMAND 's/{{package_description}}/$description/g' package.json"
  npm install
}

function update_readme() {
  local -r package_name="$1"
  echo "Enter a long description for the repository (README.md):"
  read -r description
  eval "$SED_COMMAND 's/template-docker-container/$package_name/g' README.md"
  eval "$SED_COMMAND 's/{{container_description}}/$description/g' README.md"
}

function update_registry_repository() {
  local -r package_name="$1"
  eval "$SED_COMMAND 's/template-docker-container/$package_name/g' azure-pipelines.yml"
}

function update_service_name() {
  echo "Enter a default docker-compose service name:"
  read -r service_name
  eval "$SED_COMMAND 's/service_name/$service_name/g' docker-compose.yml"
}

function main() {
  local -r repository_name=$(git remote -v | grep push | sed -e 's|.*/||' | sed -e 's/.git.*//')

  echo "Initializing repository from template..."
  echo "Using repository name as the package name ($repository_name)..."

  update_package_json "$repository_name"
  update_readme "$repository_name"
  update_registry_repository "$repository_name"
  update_service_name

  rm -rf .init-template.sh

  echo
  echo "Initialization complete. Committing to source control..."
  git add -A
  git commit -m "Initialize repository from template"
  git push -u origin master
  echo
  echo "Remember to finish setting up this repository in Terraform and Azure DevOps."
  echo "See https://github.com/quantum-sec/meta/tree/master/procedures/vcs/repository-setup"
  echo
}

main "$@"
