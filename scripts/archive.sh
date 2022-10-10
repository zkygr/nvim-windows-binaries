#!/bin/bash

GIT_ROOT_WINDOWS=$(git rev-parse --show-toplevel)

GIT_ROOT=$(cygpath "${GIT_ROOT_WINDOWS}")
APPDATA_LOCAL=$(cygpath "${LOCALAPPDATA}")

NVIM_DATA_TAR="${GIT_ROOT}/binaries/nvim-data.tar.gz"
NVIM_DATA_PATH="${APPDATA_LOCAL}/nvim-data"

COC_TAR="${GIT_ROOT}/binaries/coc.tar.gz"
COC_DATA_PATH="${APPDATA_LOCAL}/coc"

PIP_TAR="${GIT_ROOT}/binaries/pip.tar.gz"
PIP_PACKAGES_PATH="${APPDATA_LOCAL}\programs\python\python310\lib\site-packages"

NPM_TAR="${GIT_ROOT}/binaries/npm.tar.gz"
NPM_DATA_PATH="${APPDATA_LOCAL}/../Roaming/npm"

function main() {
    create_tar "${NVIM_DATA_TAR}" "${NVIM_DATA_PATH}"
    create_tar "${COC_TAR}" "${COC_DATA_PATH}"
    create_tar "${PIP_TAR}" "${PIP_PACKAGES_PATH}"
    create_tar "${NPM_TAR}" "${NPM_DATA_PATH}"

    git status
    ls -lh "${GIT_ROOT}/binaries"
}

function create_tar() {
    local tar_name=$1; shift
    local backup_path=$1; shift

    echo ''
    echo "delete ${tar_name}"
    rm "${tar_name}" 2> /dev/null

    echo "archive ${backup_path} into ${tar_name}"
    tar -czf "${tar_name}" --directory "${backup_path}" .
}

# ----------------------------------------------------------------------------

time main

