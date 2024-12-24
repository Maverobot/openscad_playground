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
hexgon_distance = 12.5;
extruding_hexgon_diameter = 9.9;
extruding_hexgon_height = 4;
number_of_hexgons = 18;

module extruding_hexgon(height = extruding_hexgon_height, radius= extruding_hexgon_diameter/2) {
  linear_extrude(height = height) {
    rotate([0, 0, 30])
      circle(r=radius, $fn=6);
  }
}

translate([0, depth, 0]) {
  translate([0, 0, strip_thickness]) {
    for (i = [-((number_of_hexgons-1)/2):((number_of_hexgons-1)/2)]) {
      translate([hexgon_distance*i, 0, 0])
        extruding_hexgon();
    }

  }
  cube([hexgon_distance * number_of_hexgons, extruding_hexgon_diameter, strip_thickness], anchor=BOTTOM);
}
