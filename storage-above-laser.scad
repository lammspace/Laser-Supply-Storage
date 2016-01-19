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
shelf_height = 88;

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

shelf1 = 1600;

translate([0, cls_height, shelf1]) {
           cube([width, cls_width, cls_height]); } // front
translate([0, depth - cls_width - cls_height, shelf1]) {
           cube([width, cls_width, cls_height]); } // back
translate([cls_width, 0, shelf1]) {
           cube([cls_width, depth, cls_height]); } // left
translate([right_legs - cls_width, 0, shelf1]) {
           cube([cls_width, depth, cls_height]); } // right

color("green"){
//  translate([cls_width + thickness + thickness + ((material_x + 5) * 0),
//             0, shelf1 + cls_height]) { cube([material_x + 5, depth, thickness]); } 
//  translate([cls_width + thickness + thickness + ((material_x + 5) * 1),
//             0, shelf1 + cls_height]) { cube([material_x + 5, depth, thickness]); } 
//  translate([cls_width + thickness + thickness + ((material_x + 5) * 2),
//             0, shelf1 + cls_height]) { cube([material_x + 5, depth, thickness]); }
//  translate([cls_width + thickness + thickness + ((material_x + 5) * 3),
//             0, shelf1 + cls_height]) { cube([material_x + 5, depth, thickness]); }
  translate([cls_width,
             0, shelf1 + cls_height]) { cube([shelf_x, shelf_y, thickness]); }
}

color("black") {
  // Dividers
  translate([cls_width + ((material_x + 10 + thickness) * 0),
             0, shelf1 + cls_height]) { cube([thickness, depth, shelf_height]); }
  translate([cls_width + ((material_x + 10 + thickness) * 1),
             0, shelf1 + cls_height]) { cube([thickness, depth, shelf_height]); }
  translate([cls_width + ((material_x + 10 + thickness) * 2),
             0, shelf1 + cls_height]) { cube([thickness, depth, shelf_height]); }
  translate([cls_width + ((material_x + 10 + thickness) * 3),
             0, shelf1 + cls_height]) { cube([thickness, depth, shelf_height]); }
  translate([cls_width + ((material_x + 10 + thickness) * 4),
             0, shelf1 + cls_height]) { cube([thickness, depth, shelf_height]); }
}

// Test pieces
//color("blue"){
//
//  // 1 - Left
//  translate([cls_width + thickness + 2 + ((material_x + 5 + thickness) * 0),
//             -20, shelf1 + 63 + thickness + 20]) {
//    cube([material_x, material_y, material_z]);
//  }
//
//  // 2 - Left Center
//  translate([cls_width + thickness + 2 + ((material_x + 5 + thickness) * 1),
//             -20, shelf1 + 63 + thickness + 20]) {
//     cube([material_x, material_y, material_z]);
// }
//
//  // 3 - Right Center
//  translate([cls_width + thickness + 2 + ((material_x + 5 + thickness) * 2),
//             -20,
//             shelf1 + 63 + thickness + 20]) {
//    cube([material_x, material_y, material_z]);
//  }
//
//  // 4 - Right
//  translate([cls_width + thickness + 2 + ((material_x + 5 + thickness) * 3),
//				 -20,
//             shelf1 + 63 + thickness + 20]) {
//    cube([material_x, material_y, material_z]);
//  }
//}

/*
Variables to modify to mess with the basics:

mdf_shelf_thickness is the thickness of the shelf material.
shelf_count is the number of shelves you want.
shelf_spacing is how much of a gap you want between each shelf.

The other variables are fairly standard, play around!
*/

// Part Definitions

/*
mdf_shelf_thickness = 12;
mdf_shelf_width = 600;
mdf_shelf_depth = 400;
mdf_color = "red";
cls_thickness = 38;
cls_height = 63;
cls_color = "green";
studding_diameter = 10;

// Drill holes for studding

hole_fudge = 2;
hole_offset = 14;
hole_diameter = studding_diameter + hole_fudge;

// Material specs
mdf_shelves_per_mdf_sheet = 8;
full_cls_length = 2400;

shelf_spacing = 0;
shelf_count = 10;

// CLS Long lengths

cls_long_length_count = shelf_count + 1;
cls_long_length_per_cls =
  floor(full_cls_length / mdf_shelf_depth);
cls_long_length_cls_count =
  ceil(cls_long_length_count / cls_long_length_per_cls);

// CLS Short lengths

cls_short_length_count = (shelf_count * 2) + 2;
cls_short_length_per_cls =
  floor(full_cls_length / mdf_shelf_width);
cls_short_length_cls_count =
  ceil(cls_short_length_count / cls_short_length_per_cls);

// Totals

total_height = (mdf_shelf_thickness + cls_thickness)*shelf_count + (shelf_spacing * (shelf_count - 1)) + cls_thickness;
total_width = mdf_shelf_width;
total_depth = mdf_shelf_depth;

// Material Counting

total_mdf_sheets = ceil(shelf_count / mdf_shelves_per_mdf_sheet);
total_cls_lengths = ceil((cls_long_length_cls_count + cls_short_length_cls_count)/2);

// Printing Data

echo(str("Total Height: ", total_height, "mm"));
echo(str("Total Width: ", total_width, "mm"));
echo(str("Total Depth: ", total_depth, "mm"));

echo(str("MDF Shelf Count: ", shelf_count));
echo(str("CLS short length Count: ", cls_short_length_count));
echo(str("CLS long length Count: ", cls_long_length_count));

echo(str("Total MDF Sheets: ", total_mdf_sheets));
echo(str("Total CLS Lengths: ", total_cls_lengths));

// Design Layout

bottom_shelf();

for(z = [1 : shelf_count-1])
  translate([
    0,
    0,
    (mdf_shelf_thickness + cls_height + shelf_spacing) * z
  ])
    shelf_construct();

// Modules

module bottom_shelf() {
  shelf_construct();
//  for(y = [0,mdf_shelf_depth-cls_thickness])
//    translate([0,y,-cls_height])
//      rotate([90,0,90])
//        cls_bar(mdf_shelf_width);

  for(x = [0,mdf_shelf_width-cls_thickness])
    translate([x + cls_thickness, cls_thickness, -cls_height])
      rotate([90,0,180])
        cls_bar(mdf_shelf_depth - (cls_thickness * 2), "yellow");

//  for(x = [hole_offset, mdf_shelf_width - hole_offset])
//    for(y = [hole_offset, mdf_shelf_depth - hole_offset])
//      translate([x,y,-1])
//        cylinder(d=studding_diameter,h=(mdf_shelf_thickness + cls_height+ shelf_spacing)*shelf_count - shelf_spacing);
}

module shelf_construct() {
  difference() {
    union() {
      mdf_shelf();
      for(y = [0,mdf_shelf_depth-cls_thickness])
        translate([0,y,mdf_shelf_thickness])
          rotate([90,0,90])
            cls_bar(mdf_shelf_width);
      translate([cls_thickness, cls_thickness, mdf_shelf_thickness])
        rotate([90,0,180])
          cls_bar(mdf_shelf_depth - (cls_thickness * 2), "yellow");
    }
//    for(x = [hole_offset, mdf_shelf_width - hole_offset])
//      for(y = [hole_offset, mdf_shelf_depth - hole_offset])
//        translate([x,y,-1])
//          cylinder(d=hole_diameter,h=mdf_shelf_thickness + cls_height + 2);
  }
}

module mdf_shelf(my_color = mdf_color) {
  color(my_color)
    cube([mdf_shelf_width,mdf_shelf_depth,mdf_shelf_thickness]);
}

module cls_bar(length = 100, my_color = cls_color) {
  color(my_color)
    cube([cls_thickness,cls_height,length]);
}

*/