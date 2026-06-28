// ============================================================
//  Abigail's Homeopathic Tube Organizer - Stackable Tray v1.0
// ============================================================
//  Holds 5 large Boiron tubes + 10 small homeopathic vials
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

// Large tube (Boiron 80-pellet) — add ~1.5mm clearance
LARGE_D = 16.5;   // tube outer diameter + clearance [mm]
LARGE_L = 93.0;   // tube total length   + clearance [mm]
N_LARGE = 5;      // number of large tube slots

// Small vial (Washington Homeopathic amber glass) — add ~1mm clearance
SMALL_D = 14.0;   // vial outer diameter + clearance [mm]
SMALL_L = 51.0;   // vial total length   + clearance [mm]
N_SMALL_COLS = 5; // small vials per row
N_SMALL_ROWS = 2; // rows of small vials (total slots = cols × rows)

// =============================================
//  CONSTRUCTION PARAMETERS (usually leave as-is)
// =============================================
WALL     = 3.0;   // wall & rim thickness [mm]
GAP      = 2.5;   // spacing between adjacent tube slots [mm]
SEC_GAP  = 6.0;   // gap between large and small sections [mm]
TRAY_H   = 13.0;  // tray body height [mm] — must be > largest tube radius
RIM_H    = 3.5;   // stacking step/rim height [mm]
FIT      = 0.4;   // fit clearance per side for stacking [mm]

$fn = 48;  // cylinder smoothness (increase for ultra-smooth, slows render)

// =============================================
//  DERIVED DIMENSIONS  (do not edit)
// =============================================
large_pitch = LARGE_D + GAP;
small_pitch = SMALL_D + GAP;

large_section_w = N_LARGE      * large_pitch - GAP;
small_section_w = N_SMALL_COLS * small_pitch - GAP;
inner_w = max(large_section_w, small_section_w);

// Center each tube section left-right within the available inner width
large_x0 = WALL + (inner_w - large_section_w) / 2;
small_x0 = WALL + (inner_w - small_section_w) / 2;

tray_w = inner_w + 2 * WALL;

small_section_l = N_SMALL_ROWS * SMALL_L + (N_SMALL_ROWS - 1) * GAP;
tray_l = WALL + LARGE_L + SEC_GAP + small_section_l + WALL;

step_in = WALL + FIT;  // how much the bottom edge steps inward on each side

// Print overall dimensions to the OpenSCAD console for reference
echo("=== TRAY OUTER DIMENSIONS ===");
echo(str("  Width  : ", tray_w, " mm  (", tray_w  / 25.4, " in)"));
echo(str("  Length : ", tray_l, " mm  (", tray_l  / 25.4, " in)"));
echo(str("  Height : ", TRAY_H + RIM_H, " mm (body + rim)"));

// =============================================
//  TRAY MODULE
// =============================================

module tray() {
    difference() {

        // ── Solid tray body ──────────────────────────────────
        union() {

            // Narrower bottom step — nests into the rim of the tray below.
            // The step is (WALL + FIT) narrower on every side.
            translate([step_in, step_in, 0])
                cube([
                    tray_w - 2 * step_in,
                    tray_l - 2 * step_in,
                    RIM_H + 0.1            // slight overlap prevents thin gap
                ]);

            // Full-width body above the step
            translate([0, 0, RIM_H])
                cube([tray_w, tray_l, TRAY_H - RIM_H]);

            // Top stacking rim — a picture-frame wall that receives the
            // bottom step of the next tray above.
            translate([0, 0, TRAY_H]) {
                cube([WALL, tray_l, RIM_H]);                         // left
                translate([tray_w - WALL, 0, 0])
                    cube([WALL, tray_l, RIM_H]);                     // right
                cube([tray_w, WALL, RIM_H]);                         // front
                translate([0, tray_l - WALL, 0])
                    cube([tray_w, WALL, RIM_H]);                     // back
            }
        }
        // ── End solid body ───────────────────────────────────


        // ── Large tube cradles ───────────────────────────────
        // Each cradle is a half-cylinder channel running along the Y axis.
        // The cylinder is centred at Z = TRAY_H (tray top surface), so the
        // cut creates a U-shaped pocket exactly one tube-radius deep.
        for (i = [0 : N_LARGE - 1]) {
            cx = large_x0 + LARGE_D / 2 + i * large_pitch;

            // Cradle channel
            translate([cx, WALL - 0.1, TRAY_H])
                rotate([-90, 0, 0])
                    cylinder(d = LARGE_D, h = LARGE_L + 0.2);

            // Finger-lift notch at the cap end — a rounded scoop so you can
            // slide a finger under the tube to pop it out easily.
            translate([cx, WALL + LARGE_L, TRAY_H])
                scale([1, 0.7, 1])
                    sphere(d = LARGE_D * 0.85);
        }

        // ── Small vial cradles ───────────────────────────────
        for (row = [0 : N_SMALL_ROWS - 1]) {
            cy = WALL + LARGE_L + SEC_GAP + row * (SMALL_L + GAP);
            for (col = [0 : N_SMALL_COLS - 1]) {
                cx = small_x0 + SMALL_D / 2 + col * small_pitch;

                // Cradle channel
                translate([cx, cy - 0.1, TRAY_H])
                    rotate([-90, 0, 0])
                        cylinder(d = SMALL_D, h = SMALL_L + 0.2);

                // Finger-lift notch
                translate([cx, cy + SMALL_L, TRAY_H])
                    scale([1, 0.7, 1])
                        sphere(d = SMALL_D * 0.85);
            }
        }

    } // end difference
}

// =============================================
//  RENDER
// =============================================
tray();

// To preview multiple stacked trays, uncomment these lines:
// tray();
// translate([0, 0, TRAY_H + RIM_H]) tray();
// translate([0, 0, 2 * (TRAY_H + RIM_H)]) tray();
