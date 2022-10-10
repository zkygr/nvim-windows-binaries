#!/bin/bash

GIT_ROOT=$(git rev-parse --show-toplevel)
OUTPUT_DIR="${GIT_ROOT}/.zip"
GITHUB_ROOT_URL="git@github.com:meomeo187"

CONFIG_REPO_NAME="config"
CONFIG_REPO_URL="${GITHUB_ROOT_URL}/${CONFIG_REPO_NAME}.git"

BINARIES_REPO_NAME="binaries"
BINARIES_REPO_URL="${GITHUB_ROOT_URL}/${BINARIES_REPO_NAME}.git"


function main(){
    recreate_output_dir
    create_installer_zip
}

function recreate_output_dir() {
    rm -rf "${OUTPUT_DIR}" 2> /dev/null
    mkdir --parents "${OUTPUT_DIR}"
}

function create_installer_zip(){
    pushd "${OUTPUT_DIR}"

    git clone --depth 1 "${CONFIG_REPO_URL}"
    git clone --depth 1 "${BINARIES_REPO_URL}"

    rm -rf "${CONFIG_REPO_NAME}/.git"
    rm -rf "${BINARIES_REPO_NAME}/.git"

    7z a windows_dev_env.7z -- config binaries

    popd
}

# -----------------------------------------------------------------------------

time main

