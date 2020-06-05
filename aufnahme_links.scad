// using https://github.com/JohK/nutsnbolts (GNU GPL)
include <../nutsnbolts/cyl_head_bolt.scad>;
include <../nutsnbolts/materials.scad>;
include <abmessungen.scad>;

seitenwand_hoehe = aufnahme_stift_hoehe;

module triangle(){
    difference(){
        cube([21,25,stahlrohr_materialstaerke]);
        rotate([0,0,45]) cube([50,50,50]);
    }
}

module vertical_triangle(){
    rotate([218,90,0])
    difference(){
        cube([10,25,stahlrohr_materialstaerke]);
        rotate([0,0,60]) cube([40,40,40]);
    };
}

module deckplatte() {
        // Deckplatte
    rotate(187)
    translate([-29,-(10+stahlrohr_materialstaerke),aufnahme_stift_hoehe])
////    cube([30,30,stahlrohr_materialstaerke]);  
    triangle();
    
    translate([-10,-2,aufnahme_stift_hoehe])
        linear_extrude(height=stahlrohr_materialstaerke)
        difference() {
          offset(10) {
          square(11);
        }
        { 
            translate([-24,-30])
            square([30,52]); 
        }
    }
}

module stift_mit_gewinde() {
        // Aufnahmestift
    stainless() cylinder(aufnahme_stift_hoehe,r=aufnahme_stift_durchmesser/2);
    // Gewinde an Aufnahmestift
    translate([0,0,-15]) stainless() thread(orad=aufnahme_stift_durchmesser/2, tl=15, p=2);
}

module seitenwand() {
    // Seitenwand
    rotate(-38)
    translate([aufnahme_stift_durchmesser,-1,0])
    cube([stahlrohr_materialstaerke,26.9,seitenwand_hoehe]);
    
    // Biegung
    r = 10;       // radius of the curve
    a = 60;       // angle of the curve
    
    rotate(270)
    rotate_extrude(angle = a) 
    translate([r, 0, 0]) 
    square(size = [stahlrohr_materialstaerke, seitenwand_hoehe], center = false);
    
    // Seitenwand schmal
    rotate(-90)
    translate([aufnahme_stift_durchmesser,-4.1,0])
    cube([stahlrohr_materialstaerke,5,seitenwand_hoehe]);
}

module rohr_zu_laengstraeger() {
    // Aufnahmerohr fuer Laengsstrebe Gepackbruecke
    difference() {
        cylinder(seitenwand_hoehe+30,d=rohr_durchmesser+2*stahlrohr_materialstaerke);
        cylinder(seitenwand_hoehe+30,d=rohr_durchmesser);
    }
}




module aufnahme ($fn=100) {
    
    translate([14,22,-15]) 
    rohr_zu_laengstraeger();

    //rotate([0,0,-rohr_durchmesser])
    //rotate(-30)
    //translate([0,-4.1,aufnahme_stift_hoehe])
    //cube([stahlrohr_materialstaerke,30,10]);

    stift_mit_gewinde();
    
    seitenwand();
    
    difference() {
        deckplatte();
        translate([14,22,-15]) cylinder(seitenwand_hoehe+30,d=rohr_durchmesser);
    }
    
    // senkrechte Verstaerkung
    translate([8,10,seitenwand_hoehe+10]) 
    vertical_triangle();
}

aufnahme();

// translate([0,90,0])
// mirror([0,1,0])
// aufnahme();