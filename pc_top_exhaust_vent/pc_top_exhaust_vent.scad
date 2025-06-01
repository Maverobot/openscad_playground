include <BOSL2/std.scad>
include <rounded_cube.scad>

$fa = 1;
$fs = 0.2;

// Parameters
thickness = 5;          // Thickness of the vent
width = 210;        // Outer width of the vent - 210
height = 40;        // Outer height of the vent - 40
vent_length = 255;         // Length of the vent - 100
vent_slope_length = sqrt(height * height + vent_length * vent_length); // Length of the sloped vent
angle = atan2(height, vent_length); // Angle of the slope

cube([width+2*thickness, thickness, vent_slope_length], center=true); // Base of the vent

radius = vent_slope_length;      // Length of the fan (radial extent)

translate([width/2, thickness/2, vent_slope_length/2])
rotate([0, 90, 0])
rotate_extrude(angle=angle)
square([radius, thickness], center=false);

translate([-width/2-thickness, thickness/2, vent_slope_length/2])
rotate([0, 90, 0])
rotate_extrude(angle=angle)
square([radius, thickness], center=false);
