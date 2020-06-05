use <stangenecke_90grad.scad>;

module gepaeckbruecke_klappe () {
    
include <abmessungen.scad>;
    
laengsstrebe_laenge=gepaeckbruecke_hoehe-2*rohr_durchmesser;
// Längsstreben links und rechts
translate([0,0,rohr_durchmesser])
cylinder(laengsstrebe_laenge,d=rohr_durchmesser);
translate([gepaeckbruecke_breite,0,rohr_durchmesser])
cylinder(laengsstrebe_laenge,d=rohr_durchmesser);

// Querstreben oben und unten
querstrebe_laenge=gepaeckbruecke_breite-2*rohr_durchmesser;
rotate([90,0,90])
translate([0,0,rohr_durchmesser])
cylinder(querstrebe_laenge,d=rohr_durchmesser);
rotate([90,0,90])
translate([0,gepaeckbruecke_hoehe,rohr_durchmesser])
cylinder(querstrebe_laenge,d=rohr_durchmesser);

// Querstrebe halbmittig
rotate([90,0,90])
translate([0,gepaeckbruecke_hoehe/2,0])
cylinder(gepaeckbruecke_breite,d=rohr_durchmesser);

translate([rohr_durchmesser,0,gepaeckbruecke_hoehe-rohr_durchmesser])
rotate([90,0,180])
    stangenecke();

translate([querstrebe_laenge+rohr_durchmesser,0,gepaeckbruecke_hoehe-rohr_durchmesser])
rotate([90,0,0])
    stangenecke();

translate([querstrebe_laenge+rohr_durchmesser,0,rohr_durchmesser])
rotate([270,0,0])
    stangenecke();
   
translate([rohr_durchmesser,0,rohr_durchmesser])
rotate([0,90,90])
    stangenecke();
}

gepaeckbruecke_klappe();