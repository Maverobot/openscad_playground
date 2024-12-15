$fa = 1;
$fs = 0.4;

module simple_wheel(wheel_radius=10, wheel_width=6) {
  rotate([90,0,0])
    cylinder(h=wheel_width,r=wheel_radius,center=true);
}

module complex_wheel(wheel_radius=10, side_sphere_radius=50, hub_thickness=4, cylinder_radius=2) {
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
module axle(track=35) {
  rotate([90, 0, 0])
    cylinder(h=track, r=2, center=true);
}
