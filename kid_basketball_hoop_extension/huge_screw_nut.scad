include <BOSL2/std.scad>
include <BOSL2/threading.scad>
$fa = 1;
$fs = 0.2;

nutwidth = 50; // mm
screw_diameter = 30; // mm
screw_pitch = 5; // mm
screw_height = 30; // mm

threaded_nut(nutwidth=nutwidth, id=screw_diameter, h=screw_height, pitch=screw_pitch, $slop=0.5);
