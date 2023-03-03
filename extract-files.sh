#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

function blob_fixup() {
    case "${1}" in
        etc/wifi/nvram_mfg.txt)
            sed -i 's|ccode=ALL|ccode=00|g' "${2}"
            sed -i 's|regrev=0|regrev=6|g'  "${2}"
            ;;
        etc/wifi/nvram_net.txt)
            sed -i 's|ccode=US|ccode=00|g' "${2}"
	    sed -i 's|regrev=0|regrev=6|g' "${2}"
            ;;
    esac
}

# If we're being sourced by the common script that we called,
# stop right here. No need to go down the rabbit hole.
if [ "${BASH_SOURCE[0]}" != "${0}" ]; then
    return
fi

set -e

"./../../${VENDOR}/${DEVICE_UNIVERSAL_COMMON}/extract-files.sh" "$@"
