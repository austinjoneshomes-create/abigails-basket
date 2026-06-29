// ============================================================
//  Cindi's Homeopathic Tube Organizer
//  Flat-base groove tray — tubes rest in valleys between ridges
// ============================================================
//  Open top · no walls · no cover
//  5 grooves keep tubes from rolling
//  Stack multiple trays in a drawer
//
//  HOW TO PRINT:
//    Open in OpenSCAD (free: openscad.org)
//    Press F6 → File → Export → Export as STL
//    Slicer: 20% infill, 2-3 walls, flat on bed, no supports
// ============================================================

// ── Tube size ────────────────────────────────────────────────
TUBE_D  = 16.5;   // tube outer diameter + ~1 mm clearance
TUBE_L  = 70.0;   // tube length + ~3 mm clearance
N_SLOTS = 5;      // number of tube slots

// ── Tray geometry ────────────────────────────────────────────
BASE_T  = 5.0;    // base plate thickness [mm]
R_RIDGE = 8.0;    // ridge radius — nearly matches tube radius so tubes nest snugly
VALLEY  = TUBE_D; // groove width = tube diameter (snug fit)
MARGIN  = 3.0;    // extra border around outermost ridges
CORNER_R = 3.0;   // rounded corner radius

// ── Derived ──────────────────────────────────────────────────
PITCH    = VALLEY + 2*R_RIDGE;  // centre-to-centre ridge spacing
N_RIDGES = N_SLOTS + 1;         // one ridge on each side of every tube

x0     = MARGIN + R_RIDGE;      // first ridge centre X
tray_w = 2*MARGIN + 2*R_RIDGE + N_SLOTS * PITCH;
tray_l = 2*MARGIN + TUBE_L;

$fn = 40;

echo(str("Cindi's tray  W=", tray_w, " mm  L=", tray_l, " mm  H=", BASE_T+R_RIDGE, " mm"));

// ── Rounded rectangular base plate ───────────────────────────
module base_plate() {
    r = CORNER_R;
    hull() {
        translate([r,        r,        0]) cylinder(r=r, h=BASE_T);
        translate([tray_w-r, r,        0]) cylinder(r=r, h=BASE_T);
        translate([r,        tray_l-r, 0]) cylinder(r=r, h=BASE_T);
        translate([tray_w-r, tray_l-r, 0]) cylinder(r=r, h=BASE_T);
    }
}

// ── Full tray ─────────────────────────────────────────────────
module tray() {
    union() {
        base_plate();

        // Ridges — full cylinders centred at Z=BASE_T (so the
        // lower half is inside the base, upper half is the ridge)
        for (i = [0 : N_RIDGES - 1]) {
            cx = x0 + i * PITCH;
            translate([cx, MARGIN, BASE_T])
                rotate([-90, 0, 0])
                    cylinder(r=R_RIDGE, h=TUBE_L, $fn=36);
        }
    }
}

tray();
