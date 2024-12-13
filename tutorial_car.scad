// Minimal angle for a fragment
$fa = 1;
// Minimal size for a fragment
$fs = 0.4;

// Car parameters
base_height = 10;
top_height = 10;
track = 30;
wheel_radius = 8;
wheel_width = 4;
wheel_turn = -20;
body_roll = 0;

// Lower car chassis
rotate([body_roll, 0, 0]) {
  rotate([0, 0, 0])
    cube([60, 20, base_height], center=true);
  // Upper car chassis
  translate([5, 0, base_height/2 + top_height/2])
    cube([30, 20, top_height], center=true);
  // Connect the upper and lower chassis
  translate([0, 0, base_height/2 - 0.001])
    cube([30, 20, 0.002], center=true);
}


// Front left wheel
translate([-20, -track/2, 0])
rotate([0, 0, wheel_turn])
resize([2*wheel_radius, wheel_width, 2*wheel_radius])
sphere(r=wheel_radius);

// Front right wheel
translate([-20, track/2, 0])
rotate([0, 0, wheel_turn])
resize([2*wheel_radius, wheel_width, 2*wheel_radius])
sphere(r=wheel_radius);

// Rear left wheel
translate([20, -track/2, 0])
rotate([0, 0, 0])
resize([2*wheel_radius, wheel_width, 2*wheel_radius])
sphere(r=wheel_radius);

// Front right wheel
translate([20, track/2, 0])
rotate([0, 0, 0])
resize([2*wheel_radius, wheel_width, 2*wheel_radius])
sphere(r=wheel_radius);

// Front axle
translate([-20, 0, 0])
rotate([90, 0, 0])
cylinder(h=track, r=2, center=true);

// Rear axle
translate([20, 0, 0])
  rotate([90, 0, 0])
    cylinder(h=track, r=2, center=true);

// Local Variables:
// eval: (setq scad-preview-camera '(0 0 0 80 0 -90 300))
// End:
