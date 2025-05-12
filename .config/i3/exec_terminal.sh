#!/bin/bash

delay=${1}
direction=${2}

[[ $delay =~ [0-9]+(\.?[0-9]+)? ]] ||  { delay=0.5; }

[[ $direction =~ left|right|up|down ]] || direction=

sleep $delay
i3-msg 'exec --no-startup-id kitty --detach'

[[ $direction ]] && { 
	sleep $delay
	i3-msg "move $direction"
}
