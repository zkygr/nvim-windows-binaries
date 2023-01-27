#!/bin/bash

SCRIPTPATH=$(cd $(dirname ${BASH_SOURCE[0]}) && pwd)
ROOT_DIR="${SCRIPTPATH}/.."
BINARIES_PATH="${ROOT_DIR}/binaries"

function main() {
    print_vars
    extract_nvim_data
    extract_coc_extensions
    extract_pip_packages
    extract_npm_packages
}

function print_vars() {
    echo "ROOT_DIR: $ROOT_DIR"

    echo ''
    echo '----------------------------------------------------------'
    echo ''
}

function extract_nvim_data() {
    nvim_data_dest="${LOCALAPPDATA}/nvim-data"
    nvim_data_archive="${ROOT_DIR}/binaries/nvim-data.tar.gz"

    echo 'update nvim data'
    rm -rf "${nvim_data_dest}" 2> /dev/null
    mkdir --parents "${nvim_data_dest}"
    tar -xf "${nvim_data_archive}" --directory "${nvim_data_dest}"
}

function extract_coc_extensions() {
    local coc_destination_dir="${LOCALAPPDATA}/coc"
    local coc_tar="${ROOT_DIR}/binaries/coc.tar.gz"

    echo 'update coc extensions ...'
    rm -rf "${coc_destination_dir}" 2> /dev/null
    mkdir --parents "${coc_destination_dir}"
    tar -xf "${coc_tar}" --directory "${coc_destination_dir}"
}

function extract_pip_packages() {
    local pip_tar="${ROOT_DIR}/binaries/pip.tar.gz"
    local pip_packages_path="${LOCALAPPDATA}\programs\python\python310\lib
\site-packages"

    echo "update pip packages"
    rm -rf "${pip_packages_path}" 2> /dev/null
    mkdir --parents "${pip_packages_path}"
    tar -xf "${pip_tar}" --directory "${pip_packages_path}"
}

function extract_npm_packages() {
    local npm_tar="${ROOT_DIR}/binaries/npm.tar.gz"
    local npm_packages_path="${LOCALAPPDATA}/../Roaming/npm"

    echo "update npm packages"
    rm -rf "${npm_packages_path}" 2> /dev/null
    mkdir --parents "${npm_packages_path}"
    tar -xf "${npm_tar}" --directory "${npm_packages_path}"
}

#
-----------------------------------------------------------------------------

main
