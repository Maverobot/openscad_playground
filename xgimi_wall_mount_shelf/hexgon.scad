module extruding_hexgon(height = 4, radius = 5, center = false) {
  linear_extrude(height = height, center=center) {
      rotate([0, 0, 30])
        circle(r=radius, $fn=6);
  }
}

extruding_hexgon(10, 10);
