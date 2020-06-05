$fn=100;

include <abmessungen.scad>;
use <stangenecke_90grad.scad>;
use <gepaeckbruecke_klappe.scad>

color("LightGray", 1.0) {
laengsstrebe_laenge=traeger_hoehe-2*rohr_durchmesser;
// Längsstreben links und rechts
translate([0,0,rohr_durchmesser])
cylinder(laengsstrebe_laenge,d=rohr_durchmesser);
translate([traeger_breite,0,rohr_durchmesser])
cylinder(laengsstrebe_laenge,d=rohr_durchmesser);

// Querstreben oben und unten
querstrebe_laenge=traeger_breite-2*rohr_durchmesser;
rotate([90,0,90])
translate([0,0,rohr_durchmesser])
cylinder(querstrebe_laenge,d=rohr_durchmesser);
rotate([90,0,90])
translate([0,traeger_hoehe,rohr_durchmesser])
cylinder(querstrebe_laenge,d=rohr_durchmesser);

// Querstrebe halbmittig
rotate([90,0,90])
translate([0,mittelstrebe_position,0])
cylinder(traeger_breite,d=rohr_durchmesser);

translate([rohr_durchmesser,0,traeger_hoehe-rohr_durchmesser])
rotate([90,0,180])
    stangenecke();

translate([querstrebe_laenge+rohr_durchmesser,0,traeger_hoehe-rohr_durchmesser])
rotate([90,0,0])
    stangenecke();

translate([querstrebe_laenge+rohr_durchmesser,0,rohr_durchmesser])
rotate([270,0,0])
    stangenecke();
   
translate([rohr_durchmesser,0,rohr_durchmesser])
rotate([0,90,90])
    stangenecke();

translate([0,-50,0])
    gepaeckbruecke_klappe();
// include <aufnahme_links.scad>;
}