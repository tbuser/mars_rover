#!/bin/sh

parts=( body panel_center panel_back panel_side_back panel_side_front wheel axel_front axel_back bolt arm arm_sensor target antenna_uhf antenna_low antenna_high_bottom antenna_high_top camera_bottom camera_top camera_top_side camera plate1 plate2 plate3 plate4 plate5)
# parts=( body )

for part in "${parts[@]}"
do
  mkdir -p ./stl
	echo Building $part...
	openscad -s ./stl/$part.stl -D "part=\"$part\"" mars_rover.scad
done
