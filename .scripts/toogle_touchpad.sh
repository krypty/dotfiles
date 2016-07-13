#!/bin/bash

touchpad_value=`synclient | grep -Po "TouchpadOff[ ]+= \K(\d)"`

if [ $touchpad_value = "0" ]
then
    synclient TouchpadOff=1
else
    synclient TouchpadOff=0
fi
