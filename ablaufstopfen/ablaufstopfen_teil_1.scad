include <BOSL2/std.scad>
include <BOSL2/screws.scad>

$fa = 1;
$fs = 0.4;

length=50;
radius=4;
screw_hole_type="M5,20";

diff()
  cylinder(h=length, r=radius, center=true)
      attach(TOP)
        screw_hole(screw_hole_type,anchor=TOP,thread=true,bevel1="reverse");
