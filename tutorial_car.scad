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

// Front axle and wheel
translate([-20, 0, 0])
axle_wheel_set() {
  simple_wheel();
}

// Rear left wheel
translate([20, 0, 0])
axle_wheel_set() {
  complex_wheel();
}

// Local Variables:
// eval: (setq scad-preview-camera '(0 0 0 70 0 0 300))
// End:
