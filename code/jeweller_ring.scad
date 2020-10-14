// Create ring with specified radius, width, thickness, and symbol
ring(8.5,7,1,"e");

// Create a solid bracelet band
module ring(radius=8.6, band_width=7, band_thickness=1, letter) {
  union() {
    // Simple ring by rotating contour around 360 degrees
    rotate_extrude($fn=100, angle=360)
        polygon(points=[[radius,0],[radius+band_thickness,0],[radius+band_thickness,band_width],[radius,band_width],[radius,0]]);

    // Mount
    mount_size = 7;
    mount_height = 1.2;
    translate([radius,-mount_size/2,0])
    linear_extrude(height=mount_size)
    polygon(points=[[0,0],[mount_height,0],[mount_height,band_width], [0,band_width],[0,0]]);
        
    // Symbol
    rotate([90,0,0])
    translate([radius+mount_height-0.2,band_width/2+0.2,0])
    rotate([90,0,90])
    linear_extrude(height = 1.2) 
    text(letter, font = "IR Labyrinth:style=Regular", halign="center", valign="center", size=8);    
  }
}