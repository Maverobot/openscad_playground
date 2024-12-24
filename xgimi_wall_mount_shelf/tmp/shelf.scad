include <BOSL2/std.scad>
// WIP

// Minimal angle for a fragment
$fa = 1;
// Minimal size for a fragment
$fs = 0.4;

// Wall mount silouette
back_side_width = 80;
front_side_width = 65;
depth = 150;
p0 = [-front_side_width/2, 0];
p1 = [+front_side_width/2, 0];
p2 = [+back_side_width/2, depth];
p3 = [-back_side_width/2, depth];
points = [p0, p1, p2, p3];
color("red")
linear_extrude(height = 30)
  polygon(points);


strip_thickness = 5;
hexagon_distance = 12.5;
extruding_hexagon_diameter = 9.9;
extruding_hexagon_height = 4;
number_of_hexagons = 18;

module extruding_hexagon(height = extruding_hexagon_height, radius= extruding_hexagon_diameter/2) {
  linear_extrude(height = height) {
    rotate([0, 0, 30])
      circle(r=radius, $fn=6);
  }
}

translate([0, depth, 0]) {
  translate([0, 0, strip_thickness]) {
    for (i = [-((number_of_hexagons-1)/2):((number_of_hexagons-1)/2)]) {
      translate([hexagon_distance*i, 0, 0])
        extruding_hexagon();
    }

  }
  cube([hexagon_distance * number_of_hexagons, extruding_hexagon_diameter, strip_thickness], anchor=BOTTOM);
}
