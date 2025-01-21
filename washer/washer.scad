$fa = 1;
$fs = 0.4;

module washer(height, outer_radius, inner_radius, center = false) {
  linear_extrude(height = height, center=center) {
    difference() {
        circle(r=outer_radius);
        circle(r=inner_radius);
    }
  }
}

outer_radius = 7;
inner_radius = 7 - 3;
height = 2;

washer(height, outer_radius, inner_radius, center=true);
