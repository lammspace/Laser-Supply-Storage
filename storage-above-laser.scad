// Overall external size
width = 1700;
height = 2440;
depth  = 608;

cls_width = 38;
cls_height = 63;

material_x = 400;
material_y = 600;
material_z = 50;

shelf_x = 1700;
shelf_y = 600;
shelf_z = 88;

// Starting height for first shelf
shelf1 = 1400;

// Shelf thickness
thickness = 12;

// Right legs
right_legs = width + cls_width; // + (5 * thickness) + (4 * 405);

color("red"){
  // cls (63 x 38) left back & front
  translate([0,depth-cls_height,0])  { cube([38,63,height]); } // 1 x 2.4m
  translate([0,0,0])                 { cube([38,63,height]); } // 1 x 2.4m

  // cls (63 x 38) right back & front
  translate([right_legs,depth-cls_height,0]) { cube([38,63,height]); } // 1 x 2.4m
  translate([right_legs,0,0])                { cube([38,63,height]); } // 1 x 2.4m
}

/*

Measurements for laser shelving

Laser 170cm to wall from edge across
160 tall with lid up
115 from front to wall laser

*/

shelf_frame(shelf1);

s1 = shelf1 + cls_height;
s2 = s1 + thickness + shelf_z;
s3 = s2 + thickness + shelf_z;
s4 = s3 + thickness + shelf_z;

storage_shelf(s1);
storage_shelf(s2);
storage_shelf(s3);
storage_shelf(s4);
shelf_surface(s4 + thickness + shelf_z);

s5 = s4 + (3 * cls_height);
shelf_frame(s5);
shelf_surface(s5 + cls_height);

//test_pieces(s2);

shelf_frame(height - thickness - cls_height);
shelf_surface(height - thickness);

// Shelf surface
module shelf_surface(z) {
  color("green") {
    translate([cls_width,
               0, z]) { cube([shelf_x, shelf_y, thickness]); }
  }
}

// Mitred shelf frame
module shelf_frame(z) {

  // Shelf supports
  translate([0, cls_height, z]) {
             cube([width + (2 * cls_width), cls_width, cls_height]); } // front
  translate([0, depth - cls_width - cls_height, z]) {
             cube([width + (2 * cls_width), cls_width, cls_height]); } // back
  translate([cls_width, 0, z]) {
             cube([cls_width, depth, cls_height]); } // left
  translate([right_legs - cls_width, 0, z]) {
             cube([cls_width, depth, cls_height]); } // right
}

module storage_shelf(shelf_height) {

  // Shelf surface
  color("green") {
    translate([cls_width,
               0, shelf_height]) { cube([shelf_x, shelf_y, thickness]); }
  }

  // Vertical shelf dividers
  color("black") {
    for(x = [0: 1: 4]) {
      translate([cls_width + ((material_x + 10 + thickness) * x),
                 0, shelf_height + thickness]) { cube([thickness, depth, shelf_z]); }
    }
  }

  echo(str("Shelf Height: ", shelf_height, "mm"));
}

// Use these to verify dimensions
module test_pieces(shelf_height) {
  // Test pieces
  color("blue"){
    for(x = [0: 1: 3]) {
      translate([cls_width + thickness + 2 + ((material_x + 10 + thickness) * x),
                 -20, shelf_height + thickness + 10]) {
        cube([material_x, material_y, material_z]);
      }
    }
  }
}