include <BOSL2/std.scad>

module rounded_cube(size, chamfer=1, center=true) {
  max_chamfer_edge=max(size);
  diff()
    cube(size, center=center) {
      edge_mask(TOP)
        #chamfer_edge_mask(l=max_chamfer_edge, chamfer=chamfer);
      edge_mask(BOTTOM)
        #chamfer_edge_mask(l=max_chamfer_edge, chamfer=chamfer);
      edge_mask(LEFT)
        #chamfer_edge_mask(l=max_chamfer_edge, chamfer=chamfer);
      edge_mask(RIGHT)
        #chamfer_edge_mask(l=max_chamfer_edge, chamfer=chamfer);
    }
}
