
// Author    KMS - Martin Dubois, P.Eng.
// Copyright (C) 2021 KMS
// Product   Base3D
// File      SAE/Screw8.scad

use <../Cylinder.scad>
use <../Inch.scad>

// Public
/////////////////////////////////////////////////////////////////////////////

module Screw8_FlatHead_YR()
{
    rotate( [ 90, 0, 0 ] )
        cylinder( 2, HEAD_R, SHANK_R, $fn=30 );
}

module Screw8_FlatHead_ZR() { cylinder( 2, HEAD_R, SHANK_R, $fn=30 ); }

module Screw8_Head_Y( aLength ) { Cylinder_Y( aLength, HEAD_R, 30 ); }
module Screw8_Head_Z( aLength ) { Cylinder_Z( aLength, HEAD_R, 30 ); }

module Screw8_Pilot_Y( aLength ) { Cylinder_Y( aLength, PILOT_R, 20 ); }
module Screw8_Pilot_Z( aLength ) { Cylinder_Z( aLength, PILOT_R, 20 ); }

module Screw8_Shank_X( aLength ) { Cylinder_X( aLength, SHANK_R, 30 ); }
module Screw8_Shank_Y( aLength ) { Cylinder_Y( aLength, SHANK_R, 30 ); }
module Screw8_Shank_Z( aLength ) { Cylinder_Z( aLength, SHANK_R, 30 ); }

module Screw8_ShankSlot_ZX( aLength, aSlot )
{
    for ( x = [ 0, aSlot ] )
    {
        translate( [ x, 0, 0 ] )
            Screw8_Shank_Z( aLength );
    }

    translate( [ 0, - SHANK_R, 0 ] )
        cube( [ aSlot, 2 * SHANK_R, aLength ] );
}

// Private
/////////////////////////////////////////////////////////////////////////////

HEAD_R  = 5;
PILOT_R = Inch_to_mm(  7 / 64 ) / 2;
SHANK_R = Inch_to_mm( 11 / 64 ) / 2 + 0.1;
