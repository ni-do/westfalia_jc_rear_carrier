module stangenecke () {
include <abmessungen.scad>;    
// Stange gebogen 90°
rotate_extrude(angle=90)
translate([rohr_durchmesser,0,0])
//scale([1,2])
circle(d=rohr_durchmesser, $fn=100);
}

stangenecke();

//cylinder(traeger_hoehe,d=rohr_durchmesser);    
    
// translate([traeger_breite,0,0])
// cylinder(traeger_hoehe,d=rohr_durchmesser);