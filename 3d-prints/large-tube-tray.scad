// ============================================================
//  Abigail's Organizer — LARGE TUBE TRAY
//  For Boiron-style homeopathic tubes
// ============================================================
//  5 slots, roughly square footprint
//  Trays stack on each other via step-and-rim system
//
//  HOW TO PRINT:
//    Open in OpenSCAD (free: openscad.org)
//    Press F6 to render → File → Export → Export as STL
//    Slicer: 15-20% infill, 2-3 walls, flat on bed, no supports
// ============================================================

// ── Tube size ────────────────────────────────────────────────
TUBE_D  = 16.5;  // outer diameter + ~1.5 mm clearance [mm]
TUBE_L  = 70.0;  // length + ~3 mm clearance [mm]  (actual ~67 mm)
N_SLOTS = 5;     // number of slots

// ── Construction ─────────────────────────────────────────────
WALL  = 3.0;   // wall & rim thickness [mm]
GAP   = 2.5;   // gap between adjacent slots [mm]
H     = 13.0;  // tray body height — must exceed TUBE_D/2 = 8.25 mm
RIM_H = 3.5;   // stacking rim height [mm]
FIT   = 0.4;   // fit clearance per side for stacking [mm]
$fn   = 48;

// ── Derived ──────────────────────────────────────────────────
pitch  = TUBE_D + GAP;
span   = N_SLOTS * pitch - GAP;
tray_w = WALL + span + WALL;
tray_l = WALL + TUBE_L + WALL;
step   = WALL + FIT;
x0     = WALL + TUBE_D / 2;       // centre of first slot

echo(str("Large tray  W=", tray_w, " mm  L=", tray_l, " mm  H=", H+RIM_H, " mm"));

// ── Module ───────────────────────────────────────────────────
module tray() {
    difference() {
        union() {
            // Narrower bottom step (nests into rim of tray below)
            translate([step, step, 0])
                cube([tray_w-2*step, tray_l-2*step, RIM_H+0.1]);
            // Full-width body
            translate([0, 0, RIM_H])
                cube([tray_w, tray_l, H-RIM_H]);
            // Top rim (catches tray above)
            translate([0, 0, H]) {
                cube([WALL, tray_l, RIM_H]);
                translate([tray_w-WALL,0,0]) cube([WALL, tray_l, RIM_H]);
                cube([tray_w, WALL, RIM_H]);
                translate([0, tray_l-WALL,0]) cube([tray_w, WALL, RIM_H]);
            }
        }
        // Tube cradles — half-cylinder channels along Y axis
        // Cylinder centred at Z=H so cut depth = tube radius
        for (i = [0 : N_SLOTS-1]) {
            cx = x0 + i * pitch;
            translate([cx, WALL-0.1, H])
                rotate([-90,0,0]) cylinder(d=TUBE_D, h=TUBE_L+0.2);
            // Finger-lift notch at cap end
            translate([cx, WALL+TUBE_L, H])
                scale([1, 0.65, 1]) sphere(d=TUBE_D*0.9);
        }
    }
}

tray();

// Uncomment to preview a stack:
// tray();
// translate([0,0,H+RIM_H]) tray();
// translate([0,0,2*(H+RIM_H)]) tray();
