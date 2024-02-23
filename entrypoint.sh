#!/bin/sh

set -e

if [ -n "$NPM_AUTH_TOKEN" ]; then
  # Respect NPM_CONFIG_USERCONFIG if it is provided, default to $HOME/.npmrc
  NPM_CONFIG_USERCONFIG="${NPM_CONFIG_USERCONFIG-"$HOME/.npmrc"}"

  # Allow registry.npmjs.org to be overridden with an environment variable
  echo "//${NPM_REGISTRY_URL-registry.npmjs.org}/:_authToken=$NPM_AUTH_TOKEN" > "$NPM_CONFIG_USERCONFIG"
  chmod 0600 "$NPM_CONFIG_USERCONFIG"
fi

exec npm "$@"
