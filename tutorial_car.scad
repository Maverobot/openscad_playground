// Minimal angle for a fragment
$fa = 1;
// Minimal size for a fragment
$fs = 0.4;

// Car parameters
base_height = 10;
top_height = 14;
track = 35;
wheel_radius = 10;
side_sphere_radius = 50;
hub_thickness = 4;
cylinder_radius = 2;
cylinder_height = wheel_radius * 2;
wheel_width = 10;
wheel_turn = 0;
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

// Front right wheel
translate([-20, track/2, 0])
rotate([0, 0, wheel_turn])
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


// Front axle
translate([-20, 0, 0])
rotate([90, 0, 0])
cylinder(h=track, r=2, center=true);


// Rear left wheel
translate([20, -track/2, 0])
rotate([0, 0, 0])
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


// Front right wheel
translate([20, track/2, 0])
rotate([0, 0, 0])
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


// Rear axle
translate([20, 0, 0])
rotate([90, 0, 0])
cylinder(h=track, r=2, center=true);

// Local Variables:
// eval: (setq scad-preview-camera '(0 0 0 70 0 -70 300))
// End:
