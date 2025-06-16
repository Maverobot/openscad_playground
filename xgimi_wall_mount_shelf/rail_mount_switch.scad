use <hexagon.scad>
include <BOSL2/std.scad>;
include <BOSL2/shapes3d.scad>;

// Minimal angle for a fragment
$fa = 1;
// Minimal size for a fragment
$fs = 0.4;

plate_thickness = 10;
plate_height = 40;
plate_width = 180;

rail_top_size = [8, 180];
rail_bottom_size = [17.5, 180];
rail_height = 7;

screw_hole_distance = 153;


// Hex hole dimensions
m4_across_flats = 4.2; // Across-flats distance for M4 nut
hex_height = rail_height;

difference() {
  union() {
    rotate([0, 180, 90])
      prismoid(size1=rail_bottom_size, size2=rail_top_size, h=rail_height+0.1, center=true);
    translate([0, 0, -(rail_height+plate_thickness)/2+1])
      cube([plate_width, plate_height, plate_thickness], center=true);
  }

  // M4 Screw holes
  translate([-screw_hole_distance/2, 0, -(rail_height/2+plate_thickness/2)/2])
    cylinder(r=2.5, h=rail_height+plate_thickness+0.1, center=true);
  translate([screw_hole_distance/2, 0, -(rail_height/2+plate_thickness/2)/2])
    cylinder(r=2.5, h=rail_height+plate_thickness+0.1, center=true);

  // Hexagonal hole for M4 nut
  translate([screw_hole_distance/2, 0, -rail_height/2 + 0.1])
    hexhole(m4_across_flats, hex_height);
  translate([-screw_hole_distance/2, 0, -rail_height/2 + 0.1])
    hexhole(m4_across_flats, hex_height);
}

// Function to create a hexagonal hole
module hexhole(flat_distance, height) {
    linear_extrude(height=height)
        offset(r=-0.1) // Small offset to ensure fit
        hexagon(flat_distance);
}
