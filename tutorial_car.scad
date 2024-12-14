// Minimal angle for a fragment
$fa = 1;
// Minimal size for a fragment
$fs = 0.4;

// Control parameters
track = 35;
wheel_turn = 0;
body_roll = 0;

// Module wheel
module wheel(wheel_radius=10, side_sphere_radius=50, hub_thickness=4, cylinder_radius=2) {
  cylinder_height=wheel_radius*2;
  difference() {
    sphere(r=wheel_radius);
    translate([0, -side_sphere_radius-hub_thickness/2, 0])
      sphere(r=side_sphere_radius);
    translate([0, side_sphere_radius+hub_thickness/2, 0])
      sphere(r=side_sphere_radius);
    translate([0, 0, wheel_radius / 2])
      rotate([90, 0, 0])
      cylinder(h=cylinder_height, r=cylinder_radius, center=true);
    translate([0, 0, -wheel_radius / 2])
      rotate([90, 0, 0])
      cylinder(h=cylinder_height, r=cylinder_radius, center=true);
    translate([-wheel_radius / 2, 0, 0])
      rotate([90, 0, 0])
      cylinder(h=cylinder_height, r=cylinder_radius, center=true);
    translate([wheel_radius / 2, 0, 0])
      rotate([90, 0, 0])
      cylinder(h=cylinder_height, r=cylinder_radius, center=true);
  }
}

// Car chassis
module body(base_height=10, top_height=14, base_length=60, top_length=30, width = 20, offset = 5) {
  // Lower car chassis
    rotate([0, 0, 0])
      cube([base_length, width, base_height], center=true);
    // Upper car chassis
    translate([offset, 0, base_height/2 + top_height/2])
      cube([top_length, width, top_height], center=true);
    // Connect the upper and lower chassis
    translate([0, 0, base_height/2 - 0.001])
      cube([top_length, width, 0.002], center=true);
}

// Axle
module axle(track=track) {
  rotate([90, 0, 0])
    cylinder(h=track, r=2, center=true);
}

// Lower car chassis
rotate([body_roll, 0, 0]) {
  body();
}

// Front left wheel
translate([-20, -track/2, 0])
rotate([0, 0, wheel_turn])
wheel();

// Front right wheel
translate([-20, track/2, 0])
rotate([0, 0, wheel_turn])
wheel();

// Front axle
translate([-20, 0, 0])
axle();

// Rear left wheel
translate([20, -track/2, 0])
wheel();

// Front right wheel
translate([20, track/2, 0])
wheel();

// Rear axle
translate([20, 0, 0])
axle();

// Local Variables:
// eval: (setq scad-preview-camera '(0 0 0 70 0 0 300))
// End:
