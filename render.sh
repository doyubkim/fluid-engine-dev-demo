#!/usr/bin/env bash

if [ -z "$MITSUBA_EXE" ]; then
    if command -v mitsuba > /dev/null 2>&1; then
        MITSUBA_EXE="mitsuba"
    else
        # Tries to find Mitsuba executable from "standard" locations
        unamestr=`uname`
        if [[ "$unamestr" == 'Darwin' ]]; then
            MITSUBA_APP="/Applications/Mitsuba.app/Contents/MacOS/mitsuba"
            if [ -e "$MITSUBA_APP" ]; then
                MITSUBA_EXE=$MITSUBA_APP
            else
                echo Command \"mitsuba\" or \"/Applications/Mitsuba.app/\" is not available. 
                echo Specify its location by setting MITSUBA_EXE env var.
                exit 1
            fi
        else
            echo Command \"mitsuba\" is not available. 
            echo Specify its location by setting MITSUBA_EXE env var.
            exit 1
        fi
    fi
fi

INPUT_OBJ=$1
OUTPUT_IMG=$2
TEMPLATE_XML=$3

HOSTS="$4"
if [ -z "$HOSTS" ]; then
    $MITSUBA_EXE -o $OUTPUT_IMG -Dobjname=$INPUT_OBJ $TEMPLATE_XML
else
    $MITSUBA_EXE -c $HOSTS -o $OUTPUT_IMG -Dobjname=$INPUT_OBJ $TEMPLATE_XML
fi
