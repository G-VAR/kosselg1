include <configuration.scad>;

space = 43;  // Between horizontal OpenBeam pieces.
bracket_height = 12.5 + space/2 - 1;
extruder_height = 30.5;
extruder_width = 50.1;

module extrudermnt() {
  difference() {
    translate([0, bracket_height/2-5, (10+thickness)/2]) minkowski() {
        cube([extruder_width+12, bracket_height-10, thickness],
             center=true);
        cylinder(r=5, h=10, center=true);
    }
    translate([0, 0, 10+thickness])
      cube([extruder_width+30, 20, 20],
           center=true);
    translate([0, 7.5+space/2, 0]) #
      cube([extruder_width, extruder_height, 100], center=true);
    for (x = [-1, 1]) {
      translate([x*(extruder_width/2+5), 20, 9]) rotate([90, 0, 0])
        cylinder(r=m3_wide_radius, h=40, center=true, $fn=12);
      translate([x*(extruder_width/2+5), 0, 9])
        cylinder(r=m3_wide_radius, h=40, center=true, $fn=12);
      translate([x*(extruder_width/2+5), 20, 9]) rotate([90, 0, 0])
        cylinder(r=m3_nut_radius, h=40, $fn=12+x*6);
    }
   translate([(extruder_width/2)-25.05, 20, 9]) rotate([90, 0, 0])
        cylinder(r=m5_wide_radius, h=40, $fn=12+x*6);
  }
}


extrudermnt();