use <vehicle_parts.scad>

// Minimal angle for a fragment
$fa = 1;
// Minimal size for a fragment
$fs = 0.4;

// Control parameters
track = 35;
wheel_turn = 0;
body_roll = 0;

// Lower car chassis
rotate([body_roll, 0, 0]) {
  body();
}

// Front left wheel
translate([-20, -track/2, 0])
rotate([0, 0, wheel_turn])
simple_wheel();

// Front right wheel
translate([-20, track/2, 0])
rotate([0, 0, wheel_turn])
simple_wheel();

// Front axle
translate([-20, 0, 0])
axle(track);

// Rear left wheel
translate([20, -track/2, 0])
complex_wheel();

// Front right wheel
translate([20, track/2, 0])
complex_wheel();

// Rear axle
translate([20, 0, 0])
axle(track);

// Local Variables:
// eval: (setq scad-preview-camera '(0 0 0 70 0 0 300))
// End:
