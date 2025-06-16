use <hexagon.scad>
include <BOSL2/std.scad>;

// Minimal angle for a fragment
$fa = 1;
// Minimal size for a fragment
$fs = 0.4;

connector_height = 20; // Only half of the height is visible
thickness = 10;
height = 40;
width = 180;
connector_diameter = 9.8;

hexagon_x_distance = 12.5;
hexagon_y_distance = 10;

rail_top_size = [10, 190];
rail_bottom_size = [20, 190];
rail_height = 7;

module plate_and_connectors() {
  for (y = [-1, 0, 1]) {
    is_even = y % 2 == 0;
    hexagon_back_removal = is_even ? 1 : 0;
    x_offset = is_even ? hexagon_x_distance / 2 : 0;
    if (is_even) {
      for (x = [-5, 4]) {
        translate([x * hexagon_x_distance + x_offset, y * hexagon_y_distance, 0])
          extruding_hexagon(radius=connector_diameter/2, height=connector_height+0.1, center=true);
      }
    } else {
      x = 0;
      translate([x * hexagon_x_distance + x_offset, y * hexagon_y_distance, 0])
        extruding_hexagon(radius=connector_diameter/2, height=connector_height+0.1, center=true);
    }
  }
  translate([0, 0, -thickness/2])
    cube([width, height, thickness], center=true);
}

difference() {
  plate_and_connectors();

  translate([0, 0, -thickness/3-rail_height/2])
  rotate([0, 180, 90])
    prismoid(size1=rail_bottom_size, size2=rail_top_size, h=rail_height+0.1, center=true);
}
