
// Author    KMS - Martin Dubois, P.Eng.
// Copyright (C) 2021 KMS
// Product   Base3D
// File      SAE/Screw6.scad

use <../Cylinder.scad>
use <../Inch.scad>

// Public
/////////////////////////////////////////////////////////////////////////////

module Screw6_FlatHead_ZR() { cylinder( 2, HEAD_R, SHANK_R, $fn=30 ); }

module Screw6_Pilot_Y( aLength ) { Cylinder_Y( aLength, PILOT_R, 20 ); }
module Screw6_Pilot_Z( aLength ) { Cylinder_Z( aLength, PILOT_R, 20 ); }

module Screw6_Shank_Y( aLength ) { Cylinder_Y( aLength, SHANK_R, 30 ); }
module Screw6_Shank_Z( aLength ) { Cylinder_Z( aLength, SHANK_R, 30 ); }

// Private
/////////////////////////////////////////////////////////////////////////////

HEAD_R  = 4.5;
PILOT_R = Inch_to_mm( 5 / 64 ) / 2;
SHANK_R = Inch_to_mm( 9 / 64 ) / 2 + 0.1;
