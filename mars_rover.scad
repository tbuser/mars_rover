/*
  Mars Rover
  by Tony Buser <tbuser@gmail.com>
  http://creativecommons.org/licenses/by-nc-sa/3.0/

  Dimple Tabs on the solar panels by gpvillamil http://www.thingiverse.com/thing:10095

  For bonus points, print body in yellow, panels in black, wheels in black, everything else in white

  20 models
  42 total parts

  BOM:
    1 body
    1 panel_center
    1 panel_back
    2 panel_side_back
    2 panel_side_front
    6 wheel
    2 axel_front
    2 axel_back
    12 bolt
    2 arm
    1 arm_sensor
    1 target
    1 antenna_uhf
    1 antenna_low
    1 antenna_high_bottom
    1 antenna_high_top
    1 camera_bottom
    1 camera_top
    2 camera_top_side
    1 camera
*/

// how much to increase holes where bolts need to snap into
tolerance = 0.2;

// which part to make
// use "tolerance_test" to help find your tolerance setting to use
// it will print a bar with holes that increase tolerance from 0.0 to 0.5 in 0.1 increments
// the one you want to use is the one where the bolt snaps in tightly and doesn't fall out
part = "panel_back";

bolt_hole_radius = 2+(2*(tolerance/2));

// layout();
// layout_panels();
// print_part("panel_center");

// body();
// panel_center();
// panel_back();
// panel_side_back();
// panel_side_front();
// wheel();
// axel_front();
// axel_back();
// bolt();
// arm();
// arm_sensor();
// target();
// antenna_uhf();
// antenna_low();
// antenna_high_bottom();
// antenna_high_top();
// camera_bottom();
// camera_top();
// camera_top_side();
// camera();

// stupid openscad recursion limitations...
if (part == "plate1") {
  // 1.5 hours
  print_plate("1");
} else if (part == "plate2") {
  // 1.5 hours
  print_plate("2");
} else if (part == "plate3") {
  // 1.25 hours
  print_plate("3");
} else if (part == "plate4") {
  // 1.25 hours
  print_plate("4");
} else if (part == "plate5") {
  // 2.25 hours
  print_plate("5");
} else if (part == "layout_panels") {
  layout_panels();
} else if (part == "layout") {
  layout();
} else {
  print_part(part);
}

module print_plate(number) {
  print_guide();
  
  if (number == "1") {
    print_part("body");
  } else if (number == "2") {
    translate([0, 20, 0]) print_part("panel_center");
    translate([-30, -16, 0]) print_part("wheel");
    translate([-18, -37, 0]) print_part("wheel");
    translate([30, -16, 0]) print_part("wheel");
    translate([18, -37, 0]) print_part("wheel");
  } else if (number == "3") {
    translate([0, -34, 4]) rotate([0, 180, -90]) print_part("panel_side_back");
    translate([0, -3, 4]) rotate([0, 180, -90]) print_part("panel_side_front");
    translate([0, 35, 4]) rotate([0, 180, 0]) print_part("panel_back");
  } else if (number == "4") {
    translate([-15, 32, 0]) print_part("wheel");
    translate([15, 32, 0]) print_part("wheel");
    translate([0, -34, 0]) rotate([0, 0, -90]) print_part("panel_side_back");
    translate([0, -3, 0]) rotate([0, 0, 90]) print_part("panel_side_front");
  } else if (number == "5") {
    translate([-11, -42, 0]) print_part("bolt");
    translate([-11, -29, 0]) print_part("bolt");
    translate([-11, -16, 0]) print_part("bolt");
    translate([-11, -3, 0]) print_part("bolt");
    translate([-11, 10, 0]) print_part("bolt");
    translate([-11, 23, 0]) print_part("bolt");

    translate([7, -42, 0]) print_part("bolt");
    translate([7, -29, 0]) print_part("bolt");
    translate([7, -16, 0]) print_part("bolt");
    translate([7, -3, 0]) print_part("bolt");
    translate([7, 10, 0]) print_part("bolt");
    translate([7, 23, 0]) print_part("bolt");

    translate([44, 12, 0]) print_part("axel_front");
    translate([31, -13, 0]) rotate([0, 0, 190]) print_part("axel_back");

    translate([-44, -10, 0]) rotate([0, 0, 180]) print_part("axel_front");
    translate([-29, 19, 0]) rotate([0, 0, 10]) print_part("axel_back");

    translate([-33, -22, 0]) print_part("antenna_high_bottom");
    translate([27.5, 25, 0]) rotate([0, 0, 180+53]) print_part("antenna_high_top");

    translate([-4, 40, 0]) print_part("camera");

    translate([-2, 33, 0]) print_part("camera_bottom");

    translate([-2, 17, 0]) print_part("antenna_uhf");

    translate([-2, 3, 0]) print_part("camera_top");

    translate([-2, -10, 0]) print_part("antenna_low");

    translate([-22, -8, 0]) print_part("target");

    translate([-2, -22, 0]) print_part("camera_top_side");

    translate([-2, -35, 0]) print_part("camera_top_side");

    translate([17, -19, 0]) rotate([0, 0, 180]) print_part("arm");
    translate([30, -45, 0]) rotate([0, 0, -90]) print_part("arm");
    
    translate([-21.5, -20, 0]) rotate([0, 0, 180]) print_part("arm_sensor");
  } else {
    echo("I'm sorry Dave, I'm afraid I can't do that");
  }
}

module print_part(part) {
  echo("printing part: ", part);
  
  if (part == "body") {
    translate([38/2, -63/2, 25]) rotate([0, 180, 0]) body();
  } else if (part == "panel_center") {
    translate([38/2, -95/2, 4]) rotate([0, 180, 0]) panel_center();
  } else if (part == "panel_back") {
    translate([-90/2, -30/2, 0]) panel_back();
  } else if (part == "panel_side_back") {
    translate([-30/2, -70/2, 0]) panel_side_back();
  } else if (part == "panel_side_front") {
    translate([-30/2, -70/2, 0]) panel_side_front();
  } else if (part == "wheel") {
    wheel();
  } else if (part == "axel_front") {
    translate([0, -32.5, 0]) axel_front();
  } else if (part == "axel_back") {  
    translate([0, -40/2, 0]) axel_back();
  } else if (part == "bolt") {
    bolt();
  } else if (part == "arm") {
    translate([-5/2, -30/2, 0]) arm();
  } else if (part == "arm_sensor") {
    translate([-5/2, -10/2, 0]) arm_sensor();
  } else if (part == "target") {
    target();
  } else if (part == "antenna_uhf") {  
    antenna_uhf();
  } else if (part == "antenna_low") {
    antenna_low();
  } else if (part == "antenna_high_bottom") {  
    translate([-5, 10, 0]) rotate([90, 0, 0]) antenna_high_bottom();
  } else if (part == "antenna_high_top") {
    antenna_high_top();
  } else if (part == "camera_bottom") {
    camera_bottom();
  } else if (part == "camera_top") {
    camera_top();
  } else if (part == "camera_top_side") {  
    camera_top_side();
  } else if (part == "camera") {
    translate([-41/2, 0, 0]) camera();
  } else if (part == "tolerance_test") {
    tolerance_test();
  // openscad doesn't allow recursion :(
  // } else if (part == "layout") {
  //   layout();
  // } else if (part == "plate1") {
  //   print_plate("1");
  // } else if (part == "plate2") {
  //   print_plate("2");
  // } else if (part == "plate3") {
  //   print_plate("3");
  // } else if (part == "plate4") {
  //   print_plate("4");
  // } else if (part == "plate5") {
  //   print_plate("5");
  } else {
    echo("I'm sorry Dave, I'm afraid I can't do that.");
  }
}

module layout() {
  union() {
    translate([-38/2, -63/2, 25]) body();
  
    translate([0, 0, 25+25]) {
      layout_panels();
    }
  
    translate([+15/2-30-2, 0, 15/2]) rotate([0, -90, 0]) {
      translate([0, -45, 0]) wheel();
      translate([0, 5, 4]) wheel();
      translate([0, 45, 4]) wheel();
    }

    // translate([-15/2+30+2, 0, 15/2]) rotate([0, 90, 0]) {
    //   translate([0, -45, 0]) wheel();
    //   translate([0, 5, 4]) wheel();
    //   translate([0, 45, 4]) wheel();
    // }
    //   
    translate([-38/2-1, -44, 8]) rotate([0, -90, 0]) rotate([0, 0, -30]) axel_front();
    // translate([+38/2+1+3, -44, 8]) rotate([0, -90, 0]) rotate([0, 0, -30]) axel_front();
  
    translate([-38/2-1-4, 3, 18]) rotate([0, -90, 0]) axel_back();
    // translate([+38/2+1+4+3, 3, 18]) rotate([0, -90, 0]) axel_back();

    translate([8, -22, 38-2]) rotate([0, 90, 180]) rotate([0, 0, 10]) arm();
    translate([0, -50, 43-1]) rotate([0, 90, 180]) rotate([0, 180, -135]) arm();
    translate([-6, -28, 17-1]) rotate([0, -90, 180]) arm_sensor();

    translate([-20, 69.5, 50-3]) target();
  
    translate([-35, 58/2-2.5, 50-3]) antenna_uhf();
    translate([15, 21, 99]) rotate([0, 180, 0]) antenna_low();
  
    translate([34.5, 23.5, 54]) rotate([0, 0, 90]) antenna_high_bottom();
    translate([51, 28.5, 70]) rotate([0, 0, 180]) antenna_high_top();
  
    translate([0, -24.5, 74]) rotate([0, 180, 0]) camera_bottom();
    translate([0, -24.5, 74-4]) rotate([0, 0, 0]) camera_top();
    translate([0, -24.5, 74+30]) rotate([0, 90, 0]) camera_top_side();
    translate([0, -24.5, 74+30]) rotate([0, -90, 0]) camera_top_side();
    translate([-41/2, -24.5+5, 74+38]) rotate([90, 0, 0]) camera();
  
    // print_guide();
  }
}

module layout_panels() {
  translate([-38/2, -63/2, 0]) panel_center();
  color([200/255, 200/255, 20/255]) translate([-90/2, -30/2+7+77/4+33, 0]) panel_back();
  rotate([0, 0, 30]) translate([-95/2+8.25, 70/2+2, 0]) {
    translate([-30/2, 1, 0]) panel_side_back();
    color([200/255, 200/255, 20/255]) translate([-30/2, -70-1, 0]) panel_side_front();
  }

  rotate([0, 180, 0]) translate([0, 0, -4]) rotate([0, 0, 30]) translate([-95/2+8.25, 70/2+2, 0]) {
    translate([-30/2, 1, 0]) panel_side_back();
    color([200/255, 200/255, 20/255]) translate([-30/2, -70-1, 0]) panel_side_front();
  }
}

module print_guide() {
  %difference() {
    cube([100, 100, 1], center=true);
    cube([100-1, 100-1, 2], center=true);
  }
}

module body() {
  difference() {
    body_and_panel();
    translate([-100, -100, 25]) cube([200, 200, 200]);
  }
}

module panel_center() {
  translate([0, 0, -25]) {
    union() {
      difference() {
        body_and_panel();
        translate([-100, -100, 0]) cube([200, 200, 25]);

        // openscad limit :(
        translate([-31, -24, 25+4-0.5]) solar_panel_lines();
        // union() {
        //   for (i = [0:10]) {
        //     translate([i*10, 0, 0]) cube([2, 100, 1]);
        //   }
        //   for (i = [0:10]) {
        //     translate([0, i*10, 0]) cube([100, 2, 1]);
        //   }
        // }
        
        // makerbot logo
        translate([19, 32, 27]) rotate([0, 0, -90]) scale(0.9) import_stl("makerbot_logo.stl", convexity=30);
      
        // tab slots
        translate([(38/2)-30, 77-3, 25]) {
          translate([-2.5, -5, -1]) slot_female();
        }
        translate([(38/2)+30, 77-3, 25]) {
          translate([-2.5, -5, -1]) slot_female();
        }
      
        // // tab slots
        // translate([(38/2)-30, 77-3, 25]) {
        //   translate([-2.5, -5, -1]) cube([5, 6, 6]);
        // }
        // translate([(38/2)+30, 77-3, 25]) {
        //   translate([-2.5, -5, -1]) cube([5, 6, 6]);
        // }

        translate([38/2, 63/2, 25]) {
          rotate([0, 0, 30]) translate([-95/2+8.25+1, 70/2+2+2.5, 0]) {
            color([200/255, 200/255, 20/255]) translate([-30/2, -70-1, 0]) {
              rotate([0, 0, -90]) translate([-70/2-15, 30, -1]) slot_female();
              rotate([0, 0, -90]) translate([-70/2+15, 30, -1]) slot_female();
            }
          }

          rotate([0, 180, 0]) translate([0, 0, -4]) rotate([0, 0, 30]) translate([-95/2+8.25+1, 70/2+2+2.5, 0]) {
            color([200/255, 200/255, 20/255]) translate([-30/2, -70-1, 0]) {
              rotate([0, 0, -90]) translate([-70/2-15, 30, -1]) slot_female();
              rotate([0, 0, -90]) translate([-70/2+15, 30, -1]) slot_female();
            }
          }
          
          // ugly! but I'm in a hurry, copy paste copy paste
          // rotate([0, 0, 30]) translate([-95/2+8.25, 70/2+2, 0]) {
          //   color([200/255, 200/255, 20/255]) translate([-30/2, -70-1, 0]) {
          //     rotate([0, 0, -90]) translate([-70/2-15, 30, -1]) {
          //       translate([-2.5, 0, 0]) cube([5, 7, 6]);
          //       translate([-4.5, 0, 0]) cube([9, 2, 6]);
          //     }    
          //     rotate([0, 0, -90]) translate([-70/2+15, 30, -1]) {
          //       translate([-2.5, 0, 0]) cube([5, 7, 6]);
          //       translate([-4.5, 0, 0]) cube([9, 2, 6]);
          //     }            
          //   }
          // }
          // 
          // rotate([0, 180, 0]) translate([0, 0, -4]) rotate([0, 0, 30]) translate([-95/2+8.25, 70/2+2, 0]) {
          //   color([200/255, 200/255, 20/255]) translate([-30/2, -70-1, 0]) {
          //     rotate([0, 0, -90]) translate([-70/2-15, 30, -1]) {
          //       translate([-2.5, 0, 0]) cube([5, 7, 6]);
          //       translate([-4.5, 0, 0]) cube([9, 2, 6]);
          //     }    
          //     rotate([0, 0, -90]) translate([-70/2+15, 30, -1]) {
          //       translate([-2.5, 0, 0]) cube([5, 7, 6]);
          //       translate([-4.5, 0, 0]) cube([9, 2, 6]);
          //     }            
          //   }
          // }        
        }
              
      }
      // fill hole for 3rd mounting tab
      translate([38/2, 0, 21]) {
        translate([-15, 52, 0]) cylinder(h=8, r=bolt_hole_radius);
      }
    }
  }
}

module panel_back() {
  union() {
    difference() {
      cube([90, 30, 4]);
      rotate([0, 0, -30]) translate([-50, 0, -1]) cube([50, 50, 6]);
      translate([90, 0, -1]) rotate([0, 0, 30]) cube([50, 50, 6]);
      // target hole
      translate([25, 25, -1]) cylinder(h=6, r=bolt_hole_radius);
      
      translate([-10.2, 1, -0.5]) solar_panel_lines();
      translate([-10.2, 1, 4-0.5]) solar_panel_lines();
    }
    
    // tabs
    translate([(90/2)-30, 0, 0]) rotate([0, 0, 180]) tab_male();
    translate([(90/2)+30, 0, 0]) rotate([0, 0, 180]) tab_male();
    
    // // tabs
    // translate([(90/2)-30, 0, 0]) {
    //   translate([-2.5, -7, 0]) cube([5, 7, 4]);
    //   translate([-4.5, -2, 0]) cube([9, 2, 4]);
    // }
    // translate([(90/2)+30, 0, 0]) {
    //   translate([-2.5, -7, 0]) cube([5, 7, 4]);
    //   translate([-4.5, -2, 0]) cube([9, 2, 4]);
    // }
  }
}

module panel_side_back() {
  difference() {
    cube([30, 70, 4]);
    translate([30, 70, -1]) rotate([0, 0, 90+30]) cube([60, 60, 6]);

    translate([-5.0, -1, -0.5]) solar_panel_lines();
    translate([-5.0, -1, 4-0.5]) solar_panel_lines();

    // tab slots
    translate([-2.5, -1, -1]) {
      translate([30/2-7.5, 0, 0]) slot_female();
      translate([30/2+7.5, 0, 0]) slot_female();
    }
    
    // // tab slots
    // translate([-2.5, -1, -1]) {
    //   translate([30/2-7.5, 0, 0]) cube([5, 6, 6]);
    //   translate([30/2+7.5, 0, 0]) cube([5, 6, 6]);
    // }
  }
}

module panel_side_front() {
  union() {
    difference() {
      cube([30, 70, 4]);
      translate([30, 0, -1]) rotate([0, 0, -180-30]) cube([60, 30, 6]);
      
      translate([-5, -1, -0.5]) solar_panel_lines();
      translate([-5, -1, 4-0.5]) solar_panel_lines();      
    }
   
    // back tabs
    translate([(30/2)-7.5, 70, 0]) tab_male();
    translate([(30/2)+7.5, 70, 0]) tab_male();
    
    // side tabs
    rotate([0, 0, -90]) translate([-70/2-15, 30, 0]) tab_male();
    rotate([0, 0, -90]) translate([-70/2+15, 30, 0]) tab_male();
   
    // // back tabs
    // translate([(30/2)-7.5, 70, 0]) {
    //   translate([-2.5, 0, 0]) cube([5, 7, 4]);
    //   translate([-4.5, 0, 0]) cube([9, 2, 4]);
    // }    
    // translate([(30/2)+7.5, 70, 0]) {
    //   translate([-2.5, 0, 0]) cube([5, 7, 4]);
    //   translate([-4.5, 0, 0]) cube([9, 2, 4]);
    // }    
    // 
    // // side tabs
    // rotate([0, 0, -90]) translate([-70/2-15, 30, 0]) {
    //   translate([-2.5, 0, 0]) cube([5, 7, 4]);
    //   translate([-4.5, 0, 0]) cube([9, 2, 4]);
    // }    
    // rotate([0, 0, -90]) translate([-70/2+15, 30, 0]) {
    //   translate([-2.5, 0, 0]) cube([5, 7, 4]);
    //   translate([-4.5, 0, 0]) cube([9, 2, 4]);
    // }    
  }
}

module body_and_panel() {
  union() {
    difference() {
      union() {
        cube([38, 63, 25+4]);
        translate([-95/2+38/2, -3, 25]) {
          difference() {
            cube([95, 77, 4]);
            translate([0, 77-5, -1]) rotate([0, 0, 65]) cube([10, 10, 10]);
            translate([91.5, 80, -1]) rotate([0, 0, -65]) cube([10, 10, 10]);
          }
        }
        
        // openscad limit :(
        // translate([-5, -1, 25+4-0.5]) solar_panel_lines();        
      }

      // front cutout
      translate([-1, -1, -1]) cube([38+2, 20+1, 15+1]);
      translate([38, 20, 0]) rotate([0, 0, -90-30]) translate([-70, 0, 0]) cube([100, 100, 25+4+1]);
      translate([0, 20, 25+4+1]) rotate([0, 180, 90+30]) translate([-70, 0, 0]) cube([100, 100, 25+4+1]);

      // side tapers
      rotate([0, -6, 0]) translate([-38+1.6, 0, -3]) cube([38, 63+2, 15+5]);
      rotate([0, 6, 0]) translate([+38-1.8, 0, +3]) cube([38, 63+2, 15+5]);
  
      // wheel holes
      translate([-1, 25, 5]) rotate([0, 90, 0]) cylinder(h=40, r=2);
      
      // top holes
      translate([38/2, 0, 20]) {
        // cam
        translate([0, 7, 0]) cylinder(h=10, r=bolt_hole_radius);
        // antenna low
        translate([15, 52, 0]) cylinder(h=9, r=bolt_hole_radius);
        // mount tab
        translate([-15, 52, 0]) cylinder(h=9, r=bolt_hole_radius);
        // antenna high
        translate([30, 60, 0]) cylinder(h=9, r=bolt_hole_radius);
        // antenna uhf
        translate([-35, 58, 0]) cylinder(h=9, r=bolt_hole_radius);
      }
    }
  
    // front arm mount
    difference() {
      translate([38/2, 7, 15-10]) cylinder(h=11, r=4);
      translate([38/2-7, 7, 15-10+4]) rotate([0, 90, 0]) cylinder(h=14, r=bolt_hole_radius);
    }
  
    // front sensors
    translate([38/2, 1, 25-5]) body_sensors();

    // back sensors
    translate([38/2, 63+1, 25-5]) body_sensors();
  }
}

module body_sensors() {
  rotate([90, 0, 0]) {
    translate([-3, 0, 0]) {
      translate([-2, -2, 0]) cube([4, 4, 2]);
      translate([0, 0, -1]) cylinder(h=4, r=1);
    }
    translate([3, 0, 0]) {
      translate([-2, -2, 0]) cube([4, 4, 2]);
      translate([0, 0, -1]) cylinder(h=4, r=1);
    }
  }
}

module wheel() {
  difference() {
    union() {
      translate([0, 0, 10]) cylinder(h=5, r1=20/2, r2=17/2);
      translate([0, 0, 5]) cylinder(h=5, r=20/2);
      translate([0, 0, 0]) cylinder(h=5, r1=17/2, r2=20/2);
    }
    
    translate([0, 0, 15/2]) cylinder(h=15, r=13/2);    
    translate([0, 0, -1]) cylinder(h=15+2, r=bolt_hole_radius);
    
    // translate([0, 0, -1]) cylinder(h=5, r=10/2);
  }
}

module axel_front() {
  difference() {
    union() {
      cube([5, 65, 3]);
      translate([0, 65, 0]) rotate([0, 0, 45+45]) {
        cube([5, 20, 3]);
        // back hole
        translate([0, 20, 0]) cylinder(h=3, r=6);
      }
      
      translate([0, 65, 0]) cylinder(h=3, r=6);

      // middle hole    
      translate([0, 65/3*2, 0]) cylinder(h=3, r=6);
        
      // front hole
      translate([0, 0, 0]) cylinder(h=3, r=6);
    }
    
    // back hole
    translate([0, 65, 0]) rotate([0, 0, 45+45]) translate([0, 20, -1]) cylinder(h=7, r=bolt_hole_radius);
    
    // middle hole
    translate([0, 65/3*2, -1]) cylinder(h=7, r=3);

    // front hole
    translate([0, 0, -1]) cylinder(h=7, r=3);
  }
}

module axel_back() {
  difference() {
    union() {
      cube([5, 45, 3]);

      // middle hole
      translate([5, 45/2-3, 0]) cylinder(h=3, r=6);

      translate([-10, 0, 0]) {
        cube([10, 5, 3]);
        // front hole
        translate([0, 2.5, 0]) cylinder(h=3, r=6);

        translate([0, 45-5, 0]) cube([10, 5, 3]);
        // back hole
        translate([0, 45-2.5, 0]) cylinder(h=3, r=6);
      }
    }
    
    // middle hole
    translate([5, 45/2-3, -1]) cylinder(h=7, r=3);
    
    // front hole
    translate([-10, 2.5, -1]) cylinder(h=7, r=3);

    // back hole
    translate([-10, 45-2.5, -1]) cylinder(h=7, r=3);
  }
}

module bolt() {
  union() {
    cylinder(h=3, r=6);
    cylinder(h=11, r=2);
  }
}

module arm() {
  difference() {
    union() {
      cube([5, 30, 3]);
      translate([2.5, 0, 0]) {
        // front shaft
        translate([0, 2, 0]) {
          cylinder(h=10, r=2);
          cylinder(h=3, r=4);
        }

        // back hole
        translate([0, 30, 0]) {
          cylinder(h=3, r=5);
        }
      }
    }
    
    // back hole
    translate([2.5, 30, -1]) cylinder(h=10, r=bolt_hole_radius);
  }
}

module arm_sensor() {
  union() {
    cube([6, 10, 5]);
    translate([6/2, 2, 0]) cylinder(h=10, r=2);
    translate([6/2-1, 0, 0]) cube([2, 15, 5]);
  }
}

module target() {
  union() {
    cylinder(h=4+4+3, r=2);
    cylinder(h=3, r=4);
  }
}

module antenna_uhf() {
  union() {
    cylinder(h=8+15+3, r=2);
    cylinder(h=3, r=4);
  }
}

module antenna_low() {
  union() {
    cylinder(h=45+8, r=2);
    cylinder(h=3, r=4);
    translate([0, 0, 15]) cylinder(h=2.5, r1=3, r2=2);
    translate([0, 0, 15-2.5]) cylinder(h=2.5, r1=2, r2=3);
    translate([0, 0, 25]) cylinder(h=5, r=3);
    translate([0, 0, 30]) cylinder(h=15, r1=2, r2=5);
  }
}

module antenna_high_bottom() {
  difference() {
    union() {
      // base
      cube([10, 10, 2]);
      translate([5, 5, 0]) cylinder(h=7, r=3);
      translate([5-1.5, 0, 0]) cube([3, 5, 7]);
      //translate([5, 5, 0]) cylinder(h=4, r=3);

      // top
      difference() {
        translate([1, 0, 7]) cube([8, 8, 10]);
        // cutout
        translate([0, 10, 8]) rotate([45, 0, 0]) cube([10, 8, 20]);        
        translate([0, 0, 15]) cube([10, 8, 20]);        
      }
 
      //translate([2, 2, 6]) cube([6, 6, 1]);
 
      translate([5, 3, 19]) rotate([90, 0, 0]) cylinder(h=3, r=6);
    }
    
    // side hole
    translate([5, 5, 19]) rotate([90, 0, 0]) cylinder(h=10, r=3);
    
    // bottom bolt hole
    translate([5, 5, -1]) cylinder(h=5, r=bolt_hole_radius);
  }
}

module antenna_high_top() {
  difference() {
    union() {
      difference() {
        cylinder(h=6, r=10);
        translate([20-10/8, 0, 4]) cube([20, 20, 10], center=true);
      }
      translate([8, 0, 3]) cube([16, 6, 6], center=true);
    }
    
    translate([16-4, 0, 3]) rotate([0, 90, 0]) cylinder(h=5, r=bolt_hole_radius);
  }
}

module camera_bottom() {
  difference() {
    union() {
      // central tube/mounting tab
      cylinder(h=20+8, r=2);
    
      // middle bar
      cylinder(h=8, r=6.7);
    
      // main tube
      cylinder(h=20, r=4.5);
    
      // sensor
      translate([-2, -5, 13]) cube([4, 2, 6]);
      translate([0, 0, 14.5]) rotate([90, 0, 0]) cylinder(h=6, r=1);
      translate([0, 0, 17.5]) rotate([90, 0, 0]) cylinder(h=6, r=1);
    }
    
    // top main tube slot
    translate([0, 0, -1]) cylinder(h=8, r=4.7);
  }
}

module camera_top() {
  difference() {
    union() {
      cylinder(h=34, r=4.5);
      translate([-9/2, 0, 34]) rotate([0, 90, 0]) cylinder(h=9, r=6.5);
    }

    // tube slot
    translate([-9/2-1, 0, 34]) rotate([0, 90, 0]) cylinder(h=11, r=4.6);

    translate([-1, 0, 34]) rotate([0, 90, 0]) cylinder(h=2, r=4.8);
    
    translate([0, 0, 40]) cube([15, 1.5, 10], center=true);
  }
}

module camera_top_side() {
  union() {
    cylinder(h=20, r=2);
    cylinder(h=15, r=4.5);
    // translate([0, 0, 7]) cylinder(h=5, r1=4.5, r2=3.5);
    // translate([0, 0, 12]) cylinder(h=2, r1=3.5, r2=4);
    // translate([0, 0, 14]) cylinder(h=2, r=4);
  }
}

module camera() {
  difference() {
    union() {
      difference() {
        cube([41, 10, 10]);
        // cutout
        translate([4, 2, 2]) cube([41-8, 10-2+1, 10-2+1]);
      }
      
      // cameras
      translate([10, 6, 0]) {
        cylinder(h=12, r=4);
        cylinder(h=14, r=2);
      }

      translate([41-10, 6, 0]) {
        cylinder(h=12, r=4);
        cylinder(h=14, r=2);
      }
      
      // tabs
      translate([0, -13, 0]) cube([4, 13, 10]);
      translate([41-4, -13, 0]) cube([4, 13, 10]);
    }
    
    // holes
    translate([-1, -8, 5]) rotate([0, 90, 0]) cylinder(h=50, r=bolt_hole_radius);
  }
}

module tolerance_test() {
  translate([0, 15, 0]) {
    bolt();
  }
  
  translate([-40, -6, 0]) {
    difference() {
  	  cube([80, 12, 4]);
	
    	for (i = [0:6]) {
      	translate([10*(i+1), 6, -1]) cylinder(h=7, r=2+(2*(i*0.05)));
    	}
  	}
	}
}

module tab_male() {
  translate([-2.5, 0, 0]) {
    cube([5, 7, 4]);
    translate([0.5,5,2]) sphere(r=1.2, center = true, $fn = 12);
    translate([4.5,5,2]) sphere(r=1.2, center = true, $fn = 12);
    translate([-2, 0, 0]) cube([9, 2, 4]);
  }
}

module slot_female() {
  cube([5, 6, 6]);
  translate([0,3.5,3]) sphere(r=1.2, center = true, $fn = 12);
  translate([5,3.5,3]) sphere(r=1.2, center = true, $fn = 12);
}

module solar_panel_lines() {
  union() {
    for (i = [0:10]) {
      translate([i*10, 0, 0]) cube([0.5, 100, 1]);
    }
    for (i = [0:10]) {
      translate([0, i*10, 0]) cube([100, 0.5, 1]);
    }
  }
}