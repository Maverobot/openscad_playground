include <BOSL2/std.scad>
include <rounded_cube.scad>

$fa = 1;
$fs = 0.2;

width=100; // mm
depth=30; // mm
height=200; // mm

// Screw hole
screw_hole_size=37; // mm
screw_hole_distance=120; // mm

difference() {
  rounded_cube([width, depth, height], chamfer=5);
  // Create 3 screw holes
  for (i = [-0.5, 0.5]) {
    translate([0, 0, i * screw_hole_distance])
        cube([screw_hole_size, screw_hole_size, screw_hole_size], center=true);
  }
}
