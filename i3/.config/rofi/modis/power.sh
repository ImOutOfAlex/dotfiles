#!/usr/bin/env bash

if [ -z $@ ]; then
    echo Shutdown
    echo Reboot
#    echo Lock
    echo Logout
else
    POWER_FEATURES=$HOME/.config/i3/scripts/power_features
    COMMAND=$@
    case $@ in
        Shutdown)
            exec "$POWER_FEATURES/shutdown.sh"
            ;;
        Reboot)
            exec "$POWER_FEATURES/reboot.sh"
            ;;
# TODO: Fix locking with ROFI
#        Lock)
#            exec "$POWER_FEATURES/lock.sh"
#            ;;
        Logout)
            exec "$POWER_FEATURES/logout.sh"
            ;;
        *)
            exit 2
    esac
fi
