$fa = 1;
$fs = 0.4;

module arc( height, depth, radius, degrees ) {
  render() {
    difference() {
      rotate_extrude($fn = 3600)
        translate([radius , 0, 0])
        square([height,depth]);

      translate([0,-(height+radius+1),-.5])
        cube ([height+radius+1,(height+radius+1)*2,depth+1]);

      rotate([0,0,180-degrees])
        translate([0,-(height+radius+1),-.5])
        cube ([height+radius+1,(height+radius+1)*2,depth+1]);

    }
  }
}

mount_depth = 20; // Depth of the mount
mount_height = 20; // Height of the mount
mount_radius = 105; // Radius of AMS (105mm) - inner radius of the mount

arc(height = mount_height, depth = mount_depth, radius = mount_radius, degrees = 60);
