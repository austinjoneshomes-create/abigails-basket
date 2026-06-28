// ============================================================
//  Abigail's Organizer — SMALL VIAL TRAY
//  For Washington Homeopathic amber glass vials
// ============================================================
//  5 slots, compact near-square footprint
//  Trays stack on each other via step-and-rim system
//
//  HOW TO PRINT:
//    Open in OpenSCAD (free: openscad.org)
//    Press F6 to render → File → Export → Export as STL
//    Slicer: 15-20% infill, 2-3 walls, flat on bed, no supports
// ============================================================

// ── Vial size ────────────────────────────────────────────────
VIAL_D  = 14.0;  // outer diameter + ~1 mm clearance [mm]
VIAL_L  = 51.0;  // length + ~3 mm clearance [mm]
N_SLOTS = 5;     // number of slots
                 // tip: N_SLOTS = 4 gives the most square footprint

// ── Construction ─────────────────────────────────────────────
WALL  = 3.0;   // wall & rim thickness [mm]
GAP   = 2.5;   // gap between adjacent slots [mm]
H     = 11.0;  // tray body height — must exceed VIAL_D/2 = 7 mm
RIM_H = 3.5;   // stacking rim height [mm]
FIT   = 0.4;   // fit clearance per side for stacking [mm]
$fn   = 48;

// ── Derived ──────────────────────────────────────────────────
pitch  = VIAL_D + GAP;
span   = N_SLOTS * pitch - GAP;
tray_w = WALL + span + WALL;
tray_l = WALL + VIAL_L + WALL;
step   = WALL + FIT;
x0     = WALL + VIAL_D / 2;

echo(str("Small tray  W=", tray_w, " mm  L=", tray_l, " mm  H=", H+RIM_H, " mm"));

// ── Module ───────────────────────────────────────────────────
module tray() {
    difference() {
        union() {
            // Narrower bottom step
            translate([step, step, 0])
                cube([tray_w-2*step, tray_l-2*step, RIM_H+0.1]);
            // Full-width body
            translate([0, 0, RIM_H])
                cube([tray_w, tray_l, H-RIM_H]);
            // Top rim
            translate([0, 0, H]) {
                cube([WALL, tray_l, RIM_H]);
                translate([tray_w-WALL,0,0]) cube([WALL, tray_l, RIM_H]);
                cube([tray_w, WALL, RIM_H]);
                translate([0, tray_l-WALL,0]) cube([tray_w, WALL, RIM_H]);
            }
        }
        // Vial cradles
        for (i = [0 : N_SLOTS-1]) {
            cx = x0 + i * pitch;
            translate([cx, WALL-0.1, H])
                rotate([-90,0,0]) cylinder(d=VIAL_D, h=VIAL_L+0.2);
            // Finger-lift notch
            translate([cx, WALL+VIAL_L, H])
                scale([1, 0.65, 1]) sphere(d=VIAL_D*0.9);
        }
    }
}

tray();

// Uncomment to preview a stack:
// tray();
// translate([0,0,H+RIM_H]) tray();
// translate([0,0,2*(H+RIM_H)]) tray();
