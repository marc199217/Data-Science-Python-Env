#!/bin/bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Setup environment
# shellcheck disable=SC1091
source "${DIR}/env.sh"

# Bring up a notebook container, using container name as project name
echo "Bringing up notebook '${NAME}'"
docker-compose -f "${DIR}/docker-compose.yml" up -d