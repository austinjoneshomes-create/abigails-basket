// ============================================================
//  Abigail's Homeopathic Tube Organizer - Stackable Tray v1.1
// ============================================================
//  Holds 5 large Boiron tubes + 5 small homeopathic vials
//  Both sections sit SIDE BY SIDE so the tray stays compact —
//  tray depth is just slightly more than the tube length.
//
//  Trays interlock via a step-and-rim system — same design
//  stacks on itself: bottom step nests into the rim above.
//
//  HOW TO PRINT:
//    - Open in OpenSCAD (free: openscad.org)
//    - Press F6 to render, then File → Export → Export as STL
//    - Slicer settings: 15-20% infill, 2-3 walls, no supports
//    - PLA works great; PETG for extra durability
//
//  HOW TO STACK:
//    - Each tray's narrow bottom step drops into the
//      raised rim of the tray below — locks in place
//    - Print as many as you like; they all stack together
// ============================================================

// =============================================
//  ADJUST THESE IF YOUR TUBES DIFFER IN SIZE
// =============================================

// Large tube (Boiron) — add ~3mm clearance to actual length/diameter
LARGE_D = 16.5;   // tube outer diameter + clearance [mm]
LARGE_L = 70.0;   // tube total length   + clearance [mm]  (measured ~67mm)
N_LARGE = 5;      // number of large tube slots

// Small vial (Washington Homeopathic amber glass)
SMALL_D = 14.0;   // vial outer diameter + clearance [mm]
SMALL_L = 51.0;   // vial total length   + clearance [mm]
N_SMALL = 5;      // number of small vial slots (increase to widen tray)

// =============================================
//  CONSTRUCTION PARAMETERS (usually leave as-is)
// =============================================
WALL     = 3.0;   // outer wall & rim thickness [mm]
GAP      = 2.5;   // spacing between adjacent tube slots [mm]
SEC_GAP  = 7.0;   // gap between large and small sections [mm]
TRAY_H   = 13.0;  // tray body height [mm] — must be > largest tube radius
RIM_H    = 3.5;   // stacking step/rim height [mm]
FIT      = 0.4;   // fit clearance per side for stacking [mm]

$fn = 48;

// =============================================
//  DERIVED DIMENSIONS  (do not edit)
// =============================================

large_pitch = LARGE_D + GAP;
small_pitch = SMALL_D + GAP;

// Inner span of each section along the X (width) axis
large_span = N_LARGE * large_pitch - GAP;
small_span = N_SMALL * small_pitch - GAP;

// Both sections sit side-by-side in X; tray depth (Y) = tube length + walls
tray_w = WALL + large_span + SEC_GAP + small_span + WALL;
tray_l = WALL + LARGE_L + WALL;   // ← compact: just the tube length + margins

step_in = WALL + FIT;

// X origin of each section's first tube centre
large_x0 = WALL + LARGE_D / 2;
small_x0 = WALL + large_span + SEC_GAP + SMALL_D / 2;

echo("=== TRAY OUTER DIMENSIONS ===");
echo(str("  Width  : ", tray_w, " mm  (", tray_w  / 25.4, " in)"));
echo(str("  Depth  : ", tray_l, " mm  (", tray_l  / 25.4, " in)"));
echo(str("  Height : ", TRAY_H + RIM_H, " mm (body + stacking rim)"));

// =============================================
//  TRAY MODULE
// =============================================

module tray() {
    difference() {

        // ── Solid tray body ──────────────────────────────────
        union() {

            // Narrower bottom step — nests into the rim of the tray below.
            translate([step_in, step_in, 0])
                cube([
                    tray_w - 2 * step_in,
                    tray_l - 2 * step_in,
                    RIM_H + 0.1
                ]);

            // Full-width body above the step
            translate([0, 0, RIM_H])
                cube([tray_w, tray_l, TRAY_H - RIM_H]);

            // Top stacking rim — picture-frame lip that catches tray above
            translate([0, 0, TRAY_H]) {
                cube([WALL, tray_l, RIM_H]);                          // left
                translate([tray_w - WALL, 0, 0])
                    cube([WALL, tray_l, RIM_H]);                      // right
                cube([tray_w, WALL, RIM_H]);                          // front
                translate([0, tray_l - WALL, 0])
                    cube([tray_w, WALL, RIM_H]);                      // back
            }
        }
        // ── End solid body ───────────────────────────────────


        // ── Large tube cradles ───────────────────────────────
        // Half-cylinder channels running front-to-back (Y axis).
        // Cylinder centred at Z = TRAY_H so the cut is exactly one
        // tube-radius deep — tube sits half-submerged, label faces up.
        for (i = [0 : N_LARGE - 1]) {
            cx = large_x0 + i * large_pitch;

            // Cradle channel
            translate([cx, WALL - 0.1, TRAY_H])
                rotate([-90, 0, 0])
                    cylinder(d = LARGE_D, h = LARGE_L + 0.2);

            // Finger-lift notch at the back (cap) end of each slot
            translate([cx, WALL + LARGE_L, TRAY_H])
                scale([1, 0.65, 1])
                    sphere(d = LARGE_D * 0.9);
        }

        // ── Small vial cradles ───────────────────────────────
        // Same idea — sits beside the large section in X.
        // Vials are shorter (SMALL_L < LARGE_L) so the slot is shallower;
        // remaining tray surface behind the vial is flat and open.
        for (j = [0 : N_SMALL - 1]) {
            cx = small_x0 + j * small_pitch;

            // Cradle channel (shorter than large tube slots)
            translate([cx, WALL - 0.1, TRAY_H])
                rotate([-90, 0, 0])
                    cylinder(d = SMALL_D, h = SMALL_L + 0.2);

            // Finger-lift notch at the end of the shorter slot
            translate([cx, WALL + SMALL_L, TRAY_H])
                scale([1, 0.65, 1])
                    sphere(d = SMALL_D * 0.9);
        }

    } // end difference
}

// =============================================
//  RENDER
// =============================================
tray();

// To preview multiple stacked trays, uncomment:
// tray();
// translate([0, 0, TRAY_H + RIM_H]) tray();
// translate([0, 0, 2 * (TRAY_H + RIM_H)]) tray();
