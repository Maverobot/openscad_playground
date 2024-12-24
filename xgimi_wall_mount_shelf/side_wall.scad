use <hexgon.scad>

// Minimal angle for a fragment
$fa = 1;
// Minimal size for a fragment
$fs = 0.4;

wall_thickness = 5 * sqrt(3);
wall_height = 50;
wall_width = 150;

hexgon_x_distance = 12.5;
hexgon_y_distance = 10;
number_of_hexgons_in_x = floor(wall_width / hexgon_x_distance);
number_of_hexgons_in_y = floor(wall_height / hexgon_y_distance);

// Main wall
difference() {
  cube([wall_width, wall_height, wall_thickness], center=true);
  for (y = [-floor(number_of_hexgons_in_y/2)+1:floor(number_of_hexgons_in_y/2 - 1)]) {
    is_even = y % 2 == 0;
    hexgon_back_removal = is_even ? 1 : 0;
    x_offset = is_even ? hexgon_x_distance / 2 : 0;
    for (x = [-(number_of_hexgons_in_x / 2 - 1) :(number_of_hexgons_in_x / 2) - 1 - hexgon_back_removal]) {
      translate([x * hexgon_x_distance + x_offset, y * 10, 0])
        extruding_hexgon(height=wall_thickness+0.1, center=true);
    }
  }
}

// Connectors
connector_height = 8; // Only half of the height is visible
connector_diameter = 9.9;
translate([-wall_width/2, wall_height/2, 0]) {
  translate([20.825, 0, 0])
    rotate([90, 30, 00])
    extruding_hexgon(height=connector_height, radius=connector_diameter/2, center=true);

  translate([64.126, 0, 0])
    rotate([90, 30, 00])
    extruding_hexgon(height=connector_height, radius=connector_diameter/2, center=true);
}

translate([-wall_width/2, -wall_height/2, 0]) {
  translate([20.825, 0, 0])
    rotate([90, 30, 00])
    extruding_hexgon(height=connector_height, radius=connector_diameter/2, center=true);

  translate([64.126, 0, 0])
    rotate([90, 30, 00])
    extruding_hexgon(height=connector_height, radius=connector_diameter/2, center=true);
}
