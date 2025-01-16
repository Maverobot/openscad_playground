include <BOSL2/std.scad>
include <BOSL2/screws.scad>

$fa = 1;
$fs = 0.4;

screw("M5,15", head="none",anchor=BOTTOM);
translate([0, 0, 14])
  cylinder(r=4, h=5);
