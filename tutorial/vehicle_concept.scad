use <vehicle_parts.scad>

$fa = 1;
$fs = 0.4;

track = 35;

body(base_length=100, top_length=100, offset=0);

translate([-45, -track/2, 12])
complex_wheel();
translate([-45, track/2, 12])
complex_wheel();
translate([-45, 0, 12])
axle(track);

translate([45, -track/2, 12])
complex_wheel();
translate([45, track/2, 12])
complex_wheel();
translate([45, 0, 12])
axle(track);

translate([0, -track/2, 0])
simple_wheel();
translate([0, track/2, 0])
simple_wheel();
translate([0, 0, 0])
axle(track);

translate([23, -track/2, 0])
simple_wheel();
translate([23, track/2, 0])
simple_wheel();
translate([23, 0, 0])
axle(track);

translate([-23, -track/2, 0])
simple_wheel();
translate([-23, track/2, 0])
simple_wheel();
translate([-23, 0, 0])
axle(track);
