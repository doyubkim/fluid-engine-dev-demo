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

$MITSUBA_EXE -o sloshing_100_ani_0.6,0.9.png -Dobjname=data/hybrid_liquid_sim_demo6/100_ani_0.6,0.9.obj sloshing.xml
$MITSUBA_EXE -o sloshing_100_sph_0.5.png -Dobjname=data/hybrid_liquid_sim_demo6/100_sph_0.5.obj sloshing.xml
$MITSUBA_EXE -o sloshing_100_sphere.png -Dobjname=data/hybrid_liquid_sim_demo6/100_sphere.obj sloshing.xml
$MITSUBA_EXE -o sloshing_100_zb-0.23.png -Dobjname=data/hybrid_liquid_sim_demo6/100_zb-0.23.obj sloshing.xml
