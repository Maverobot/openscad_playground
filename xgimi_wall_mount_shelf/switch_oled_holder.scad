use <hexagon.scad>
// Minimal angle for a fragment
$fa = 1;
// Minimal size for a fragment
$fs = 0.4;

connector_height = 10;
connector_diameter = 10;

number_of_connectors = 3;
distance_between_connectors = 21.651;

difference() {
  import("switch_oled_halter.stl", convexity = 5);
  translate([178, 9, 0])
    rotate([0, 0, 90])
    for (i = [0 : number_of_connectors - 1]) {
      translate([i * distance_between_connectors, 0, 0])
        rotate([0, 0, 90])
        extruding_hexagon(height=connector_height, radius=connector_diameter/2, center=true);
    }

 translate([6, 9, 0])
    rotate([0, 0, 90])
    for (i = [0 : number_of_connectors - 1]) {
      translate([i * distance_between_connectors, 0, 0])
        rotate([0, 0, 90])
        extruding_hexagon(height=connector_height, radius=connector_diameter/2, center=true);
    }

}
