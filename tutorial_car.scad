// Minimal angle for a fragment
$fa = 1;
// Minimal size for a fragment
$fs = 0.4;

// Lower car chassis
cube([60, 20, 10], center=true);

// Upper car chassis
translate([5, 0, 10])
cube([30, 20, 10], center=true);

// Connect the upper and lower chassis
translate([0, 0, 5 - 0.001])
cube([30, 20, 0.002], center=true);

// Front left wheel
translate([-20, -15, 0])
rotate([90, 0, 0])
cylinder(h=3, r=8, center=true);

// Front right wheel
translate([-20, 15, 0])
rotate([90, 0, 0])
cylinder(h=3, r=8, center=true);

// Front axle
translate([-20, 0, 0])
rotate([90, 0, 0])
cylinder(h=30, r=2, center=true);

// Rear left wheel
translate([20, -15, 0])
  rotate([90, 0, 0])
    cylinder(h=3, r=8, center=true);

// Front right wheel
translate([20, 15, 0])
  rotate([90, 0, 0])
    cylinder(h=3, r=8, center=true);

// Rear axle
translate([20, 0, 0])
  rotate([90, 0, 0])
    cylinder(h=30, r=2, center=true);

// Local Variables:
// eval: (setq scad-preview-camera '(0 0 0 20 0 20 300))
// End:
