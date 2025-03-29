include <BOSL2/std.scad>
include <BOSL2/screws.scad>

$fa = 1;
$fs = 0.2;

cylinder_diameter = 9; // mm
cylinder_height = 13; // mm

hole_diameter = 5; // mm
hole_center_offset = 0.5; // mm

screw_hole_type="M6,20";

difference() {
  intersection()
    {
      diff()
        cylinder(r=cylinder_diameter/2, h=cylinder_height, center=true)
        attach(RIGHT)
        {
          translate([0,hole_center_offset,1.0])
            screw_hole(screw_hole_type,anchor=TOP,thread=true,bevel1="reverse", head="flat");
        }

      difference() {
        cylinder(r=cylinder_diameter/2, h=cylinder_height, center=true);
        translate([-cylinder_diameter/3*2,0,hole_center_offset]) sphere (r = cylinder_diameter/2, $fn=100);
      }
    };

  translate([0,0,-cylinder_height/2]) cube([1, cylinder_diameter, 1], center=true);
  translate([0,0,-cylinder_height/2]) rotate([0, 0, 90]) cube([1, cylinder_diameter, 1], center=true);

  translate([0,0,cylinder_height/2]) cube([1, cylinder_diameter, 1], center=true);
  translate([0,0,cylinder_height/2]) rotate([0, 0, 90]) cube([1, cylinder_diameter, 1], center=true);
}
