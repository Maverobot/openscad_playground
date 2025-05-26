include <BOSL2/std.scad>
include <BOSL2/threading.scad>
include <rounded_cube.scad>

$fa = 1;
$fs = 0.2;

screw_diameter = 30; // mm
screw_pitch = 5; // mm
screw_height = 35; // mm

screw_cube_1_size = 35; // mm
screw_cube_1_height = 30; // mm

screw_cube_2_size = 50; // mm
screw_cube_2_height = 10; // mm

threaded_rod(d=screw_diameter, l=screw_height, pitch=screw_pitch, orient=UP);

// Create a screw head
translate([0, 0, -(screw_height+screw_cube_1_height)/2+0.01])
rounded_cube([screw_cube_1_size, screw_cube_1_size, screw_cube_1_height], chamfer=2);

// translate([0, 0, -screw_height-screw_cube_1_height+0.01])
translate([0, 0, -screw_height/2-screw_cube_1_height-screw_cube_2_height/2+0.01])
rounded_cube([screw_cube_2_size, screw_cube_2_size, screw_cube_2_height], chamfer=2);
