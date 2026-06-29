// ============================================================
//  Cindi's Homeopathic Tube Organizer
//  Snap-in channel tray — tubes press into channels and lock
// ============================================================
//  Open top · solid block · channels cut into top surface
//  Each channel is slightly narrower than the tube so it snaps
//  in and stays put — won't roll out even upside down
//
//  HOW TO PRINT:
//    Open in OpenSCAD (free: openscad.org)
//    Press F6 → File → Export → Export as STL
//    Slicer: 20% infill, 3 walls, flat on bed, no supports
// ============================================================

// ── Tube size ────────────────────────────────────────────────
TUBE_D  = 16.5;   // tube outer diameter (mm)
TUBE_L  = 70.0;   // tube length + ~3 mm clearance
N_SLOTS = 5;      // number of tube slots

// ── Snap geometry ────────────────────────────────────────────
SNAP    = 2.5;    // how far below top surface the channel centre sits
                  // opening = 2*sqrt(r^2 - SNAP^2) = ~15.7 mm < 16.5 mm tube
                  // → tube must snap past the lip; stays locked when in

// ── Tray geometry ────────────────────────────────────────────
WALL    = 3.0;    // wall thickness between adjacent channels [mm]
MARGIN  = 4.0;    // border around outermost channels [mm]
CORNER_R = 3.0;   // rounded corner radius [mm]

// ── Derived ──────────────────────────────────────────────────
r       = TUBE_D / 2;
PITCH   = TUBE_D + WALL;              // centre-to-centre channel spacing
block_h = r + SNAP + 2.0;            // 2 mm floor below deepest point
x0      = MARGIN + r;                 // first channel centre X
tray_w  = 2*MARGIN + 2*r + (N_SLOTS - 1)*PITCH;
tray_l  = 2*MARGIN + TUBE_L;

$fn = 40;

echo(str("Snap tray  W=", tray_w, " mm  L=", tray_l, " mm  H=", block_h, " mm"));
echo(str("Channel opening = ", 2*sqrt(r*r - SNAP*SNAP), " mm  vs tube ", TUBE_D, " mm"));

// ── Tray ─────────────────────────────────────────────────────
module tray() {
    difference() {
        // Rounded-corner solid block
        hull() {
            translate([CORNER_R,          CORNER_R,          0]) cylinder(r=CORNER_R, h=block_h);
            translate([tray_w - CORNER_R, CORNER_R,          0]) cylinder(r=CORNER_R, h=block_h);
            translate([CORNER_R,          tray_l - CORNER_R, 0]) cylinder(r=CORNER_R, h=block_h);
            translate([tray_w - CORNER_R, tray_l - CORNER_R, 0]) cylinder(r=CORNER_R, h=block_h);
        }

        // Snap-in channel cuts — cylinder centres sit SNAP mm below top
        for (i = [0 : N_SLOTS - 1]) {
            cx = x0 + i * PITCH;
            translate([cx, -1, block_h - SNAP])
                rotate([-90, 0, 0])
                    cylinder(r=r, h=tray_l + 2, $fn=48);
        }
    }
}

tray();
