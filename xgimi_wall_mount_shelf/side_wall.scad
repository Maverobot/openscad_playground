use <hexgon.scad>

// Minimal angle for a fragment
$fa = 1;
// Minimal size for a fragment
$fs = 0.4;

wall_thickness = 9;
wall_height = 50;
wall_width = 150;

hexgon_x_distance = 5 * sqrt(3) + 4;
hexgon_y_distance = 10;

number_of_hexgons_in_x = floor(wall_width / hexgon_x_distance);
number_of_hexgons_in_y = floor(wall_height / hexgon_y_distance);

difference() {
  cube([wall_width, wall_height, wall_thickness], center=true);
  for (y = [-floor(number_of_hexgons_in_y/2)+1:floor(number_of_hexgons_in_y/2 - 1)]) {
    indentation = y % 2 == 0 ? 1 : 0;
    x_offset = indentation == 0 ? hexgon_x_distance / 2 : 0;
    for (x = [-(number_of_hexgons_in_x / 2 - indentation ) :(number_of_hexgons_in_x / 2) - 1]) {
      translate([x * hexgon_x_distance + x_offset, y * 10, 0])
        extruding_hexgon(height=wall_thickness+0.1, center=true);
    }
  }
}
