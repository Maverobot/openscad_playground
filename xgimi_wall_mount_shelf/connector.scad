use <hexgon.scad>
// Minimal angle for a fragment
$fa = 1;
// Minimal size for a fragment
$fs = 0.4;

extruding_hexgon_diameter = 9.9;
extruding_hexgon_height = 4;

cap_height = 5;
cap_diameter = 12;
connector_height = 24;
connector_diameter = 9.9;

// connector part
translate([0, 0, cap_height])
  extruding_hexgon(height=connector_height, radius=connector_diameter/2);

// Cap part
scale([1, 1.2, 1])
extruding_hexgon(height=cap_height, radius=connector_diameter/2);

// Helper to merge the two parts
translate([0, 0, cap_height - 0.1])
  extruding_hexgon(height=0.2, radius=connector_diameter/2);
