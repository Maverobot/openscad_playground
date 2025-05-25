include <BOSL2/std.scad>
include <rounded_cube.scad>

$fa = 1;
$fs = 0.2;

// Parameters
height = 200;       // Extrude height (depth of the |_|)
wall_thickness = 10;          // Thickness of the U walls
width = 101;        // Outer width of the U
depth = 30;         // Outer height of the U

// Screw hole
screw_hole_size=37; // mm
screw_hole_distance=120; // mm

module main() {
  rounded_cube([width + 2 * wall_thickness, wall_thickness, height], chamfer=2);
  translate([-width/2-wall_thickness/2, wall_thickness,  0])
    rotate([0, 0, 90])
    rounded_cube([depth, wall_thickness, height], chamfer=2);
  translate([width/2+wall_thickness/2, wall_thickness,  0])
    rotate([0, 0, 90])
    rounded_cube([depth, wall_thickness, height], chamfer=2);
}

difference () {
  main();
  // Create 2 screw holes
  for (i = [-0.5, 0.5]) {
    translate([0, 0, i * screw_hole_distance])
        cube([screw_hole_size, screw_hole_size, screw_hole_size], center=true);
  }
}
