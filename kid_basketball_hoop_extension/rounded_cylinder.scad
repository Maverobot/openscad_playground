include <BOSL2/std.scad>

module rounded_cylinder(r, h, chamfer=1, rounding=1) {
  difference() {
    cylinder(r=r, h=h, center=true);

    // Optional: Chamfer top and bottom edges
    if (chamfer > 0) {
      up(h/2) chamfer_cylinder_mask(r=r, chamfer=chamfer, ang=45, orient=UP);
      down(h/2) chamfer_cylinder_mask(r=r, chamfer=chamfer, ang=45, orient=DOWN);
    }

    // Optional: Round top and bottom edges
    if (rounding > 0) {
      up(h/2) rounding_hole_mask(r=r-rounding, rounding=rounding, orient=UP);
      down(h/2) rounding_hole_mask(r=r-rounding, rounding=rounding, orient=DOWN);
    }
  }
}
