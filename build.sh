#!/bin/bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Setup environment
# shellcheck disable=SC1091
source "${DIR}/env.sh"

# Build the notebook image
docker-compose -f "${DIR}/docker-compose.yml" build