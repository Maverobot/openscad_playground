module extruding_hexagon(height = 4, radius = 5, center = false) {
  linear_extrude(height = height, center=center) {
      rotate([0, 0, 30])
        circle(r=radius, $fn=6);
  }
}
