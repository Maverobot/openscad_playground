use <hexagon.scad>

// Minimal angle for a fragment
$fa = 1;
// Minimal size for a fragment
$fs = 0.4;

wall_thickness = 10;
wall_height = 90;
wall_width = 230;

hexagon_x_distance = 12.5;
hexagon_y_distance = 10;
number_of_hexagons_in_x = floor(wall_width / hexagon_x_distance);
number_of_hexagons_in_y = floor(wall_height / hexagon_y_distance);

// Main wall
difference() {
  cube([wall_width, wall_height, wall_thickness], center=true);
  for (y = [-floor(number_of_hexagons_in_y/2)+1:floor(number_of_hexagons_in_y/2 - 1)]) {
    is_even = y % 2 == 0;
    hexagon_back_removal = is_even ? 1 : 0;
    x_offset = is_even ? hexagon_x_distance / 2 : 0;
    for (x = [-(number_of_hexagons_in_x / 2 - 1) :(number_of_hexagons_in_x / 2) - 1 - hexagon_back_removal]) {
      translate([x * hexagon_x_distance + x_offset, y * 10, 0])
        extruding_hexagon(height=wall_thickness+0.1, center=true);
    }
  }
}

module createConnector(){
        rotate([90, 0, 0])
        extruding_hexagon(height=connector_height, radius=connector_diameter/2, center=true);
}

// Connectors
connector_height = 8; // Only half of the height is visible
connector_diameter = 9.9;
translate([-wall_width/2, wall_height/2, 0]) {
  translate([35.67 + 5 * sqrt(3) / 2, 0, 0])
    createConnector();
}

translate([-wall_width/2, -wall_height/2, 0]) {
  translate([35.67 + 5 * sqrt(3) / 2, 0, 0])
    createConnector();
}

translate([0, wall_height/2, 0]) {
  translate([0, 0, 0])
    createConnector();
}

translate([0, -wall_height/2, 0]) {
  translate([0, 0, 0])
    createConnector();
}

translate([wall_width/2, wall_height/2, 0]) {
  translate([-35.67 - 5 * sqrt(3) / 2, 0, 0])
    createConnector();
}

translate([wall_width/2, -wall_height/2, 0]) {
  translate([-35.67 - 5 * sqrt(3) / 2, 0, 0])
    createConnector();
}
