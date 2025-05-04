include <BOSL2/std.scad>
// This model aims to soften contact beween the table and a glass door.

$fa = 1;
$fs = 0.2;

max_table_thickness = 50; // mm
bumper_thickness = 7; // mm
bumper_width = 30; // mm
clamp_length = 80; // mm
clamp_tolerance = 12; // mm
clamp_tolerance_thickness = 1.5; // mm
clamp_tolerance_number = 8; // count
clamp_tolerance_distance = 5; // mm

// Bumper
difference() {
  cylinder(r=max_table_thickness/2, h=bumper_width, center=true);
  cylinder(r=max_table_thickness/2-bumper_thickness, h=bumper_width + 0.1, center=true);
  // Chamfer the up side of the bumper
  up(bumper_width/2) chamfer_cylinder_mask(r=max_table_thickness/2, chamfer=1, ang=45, orient=UP);
  // Chamfer the down side of the bumper
  down(bumper_width/2) chamfer_cylinder_mask(r=max_table_thickness/2, chamfer=1, ang=45, orient=DOWN);
  up(bumper_width/2) rounding_hole_mask(r=max_table_thickness/2-bumper_thickness, rounding=1, orient=UP);
  down(bumper_width/2) rounding_hole_mask(r=max_table_thickness/2-bumper_thickness, rounding=1, orient=DOWN);
}

// Clamp plates
translate([clamp_length/2, -(max_table_thickness - bumper_thickness)/2, 0])
diff()
cube([clamp_length, bumper_thickness, bumper_width], center=true) {
  edge_mask(TOP)
    #chamfer_edge_mask(l=clamp_length, chamfer=1);
  edge_mask(BOTTOM)
    #chamfer_edge_mask(l=clamp_length, chamfer=1);
}
translate([clamp_length/2, (max_table_thickness - bumper_thickness)/2, 0])
diff()
cube([clamp_length, bumper_thickness, bumper_width], center=true) {
  edge_mask(TOP)
    #chamfer_edge_mask(l=clamp_length, chamfer=1);
  edge_mask(BOTTOM)
    #chamfer_edge_mask(l=clamp_length, chamfer=1);
}

// Rounded corners of the clamp plates
translate([clamp_length, -(max_table_thickness - bumper_thickness)/2, 0])
difference() {
  cylinder(r=bumper_thickness/2, h=bumper_width, center=true);
  up(bumper_width/2) chamfer_cylinder_mask(r=bumper_thickness/2, chamfer=1, ang=45, orient=UP);
  down(bumper_width/2) chamfer_cylinder_mask(r=bumper_thickness/2, chamfer=1, ang=45, orient=DOWN);
}
translate([clamp_length, (max_table_thickness - bumper_thickness)/2, 0])
difference() {
  cylinder(r=bumper_thickness/2, h=bumper_width, center=true);
  up(bumper_width/2) chamfer_cylinder_mask(r=bumper_thickness/2, chamfer=1, ang=45, orient=UP);
  down(bumper_width/2) chamfer_cylinder_mask(r=bumper_thickness/2, chamfer=1, ang=45, orient=DOWN);
}

// Clamp tolerance
clamp_tolerance_adjustment = 2; // mm
for (i = [1 : clamp_tolerance_number]) {
  translate([clamp_length - i * clamp_tolerance_distance, -(max_table_thickness/2 - clamp_tolerance + clamp_tolerance_adjustment), 0])
    rotate([0, 0, -45])
    cube([clamp_tolerance*sqrt(2), clamp_tolerance_thickness, bumper_width], center=true);
  translate([clamp_length - i * clamp_tolerance_distance, (max_table_thickness/2 - clamp_tolerance + clamp_tolerance_adjustment), 0])
    rotate([0, 0, 45])
    cube([clamp_tolerance*sqrt(2), clamp_tolerance_thickness, bumper_width], center=true);
}
