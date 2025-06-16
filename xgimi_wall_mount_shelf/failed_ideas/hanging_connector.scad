use <hexagon.scad>
//     Top
// ______________________
// |                    | <--- Connector hexagon
// |
// |
// |
// | <--- Side
// |
// |
// |
// |____________________| <--- Connector hexagon
//    Bottom
//
// Top, Side and Bottom together form a U profile.

// Note: This idea did not work out because the Nitendo switch won't have enough space behind the projector.

// Minimal angle for a fragment
$fa = 1;
// Minimal size for a fragment
$fs = 0.4;

connector_height = 10; // Only 5 mm is visible, 4 mm is needed for the connector
connector_diameter = 9.9;

// U profile
u_profile_thickness = 10;
u_profile_top_length = 40;
u_profile_bottom_length = 60;
u_profile_side_length = 200;


// Top connector hexagon
translate([u_profile_side_length/2-connector_height/2, u_profile_top_length-connector_diameter/2, 0])
rotate([0, 90, 0])
extruding_hexagon(height=connector_height, radius=connector_diameter/2, center=true);

// U profile - side
cube([u_profile_side_length, u_profile_thickness, u_profile_thickness], center=true);
// U profile - top
translate([u_profile_side_length/2, u_profile_top_length/2, 0])
rotate([0, 0, 90])
cube([u_profile_top_length, u_profile_thickness, u_profile_thickness], center=true);
// U profile - bottom
translate([-u_profile_side_length/2, u_profile_bottom_length/2, 0])
rotate([0, 0, 90])
cube([u_profile_bottom_length, u_profile_thickness, u_profile_thickness], center=true);
// U profile - rounded corners - side<->top
translate([u_profile_side_length/2, 0, 0])
cylinder(r=u_profile_thickness/2, h=u_profile_thickness, center=true);

// U profile - rounded corners - side<->bottom
translate([-u_profile_side_length/2, 0, 0])
cylinder(r=u_profile_thickness/2, h=u_profile_thickness, center=true);

// Bottom connector hexagon
translate([-u_profile_side_length/2+connector_height/2, u_profile_bottom_length-connector_diameter/2, 0])
rotate([0, 90, 0])
extruding_hexagon(height=connector_height, radius=connector_diameter/2, center=true);
