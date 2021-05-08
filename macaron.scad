$fn=200;

pan_width = 240;
pan_height = 210;
macaron_outer_radius = 25;
macaron_inner_radius = 20;

macaron_centers = [
    [-75, 60],
    [0, 60],
    [75, 60],
    
    [-90, 0],
    [-30, 0],
    [30, 0],
    [90, 0],
    
    [-75, -60],
    [0, -60],
    [75, -60],
];

module macaron_inner(center) {
    translate([center[0], center[1], 0])
    union() {
        circle(macaron_inner_radius);
    };
}

module macaron_outer(center) {
    translate([center[0], center[1], 0])
    union() {
        circle(macaron_outer_radius);
    };
}

rotate([0, 0, 90])
difference() {
    square([pan_width, pan_height], true);
    
    for (i = [0:len(macaron_centers) - 1]) {
        macaron_outer(macaron_centers[i]);
    }
};

rotate([0, 0, 90])
for (i = [0:len(macaron_centers) - 1]) {
    macaron_inner(macaron_centers[i]);
};
