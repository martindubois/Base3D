
// Author   KMS - Martin Dubois, ing.
// Product  Base3D
// File     Metric/M3.scad

use <../Cylinder.scad>

M2_Spacer(3);

// Private constants
/////////////////////////////////////////////////////////////////////////////

M2_FN             = 20  ;
M2_Insert_Radius0 =  1.4;
M2_Insert_Radius1 =  1.5;
M2_Ov             =  0.1;

// Public modules
/////////////////////////////////////////////////////////////////////////////

module M2_Head_Y( aLength ) { Cylinder_Y( aLength, HEAD_R, 30 ); }
module M2_Head_Z( aLength ) { Cylinder_Z( aLength, HEAD_R, 30 ); }

module M2_Insert_X() { rotate( [ 0, 90, 0 ] ) cylinder( INSERT_LENGTH + EPS, INSERT_R1, INSERT_R0, $fn = M2_FN ); }

module M2_Insert_ZR() { cylinder( INSERT_LENGTH + EPS, INSERT_R1, INSERT_R0, $fn = M2_FN ); }

module M2_Hex_ZR() { cylinder( INSERT_LENGTH + EPS, HEX_R1, HEX_R0, $fn = 6 ); }

// aZ0  Height of the screw hole
module M2_Insert( aZ0 )
{
    // Insert
    translate( [ 0, 0, aZ0 ] )
        cylinder( M2_Insert_Height + M2_Ov, M2_Insert_Radius0, M2_Insert_Radius1, $fn = M2_FN );

    // Screw
    translate( [ 0, 0, - M2_Ov ] )
        cylinder( aZ0 + 2 * M2_Ov, M2_Radius, M2_Radius, $fn = M2_FN );
}

// aZ0  Height of the screw hole
// aZ1  Height of the mount hole
module M2_InsertAndMountHole0( aZ0, aZ1 )
{
    translate( [ 0, 0, aZ0 + M2_Insert_Height ] )
        cylinder( aZ1 + M2_Ov, M2_Insert_Radius2, M2_Insert_Radius2, $fn = M2_FN );

    M2_Insert( aZ0 );
}

// aZ0  Height of the screw hole
// aZ1  Height of the mount hole
module M2_InsertAndMountHole1( aZ0, aZ1 )
{
    translate( [ 0, 0, aZ0 + M2_Insert_Height ] )
        cylinder( aZ1 + M2_Ov, M2_Washer_Radius, M2_Washer_Radius, $fn = M2_FN );

    M2_Insert( aZ0 );
}

module M2_Shank_X( aLength ) { Cylinder_X( aLength, SHANK_R, 30 ); }
module M2_Shank_Y( aLength ) { Cylinder_Y( aLength, SHANK_R, 30 ); }
module M2_Shank_Z( aLength ) { Cylinder_Z( aLength, SHANK_R, 30 ); }

module M2_Spacer( aLength )
{
    difference()
    {
        cylinder( aLength, SHANK_R + 1.5, SHANK_R + 1.5, $fn = M2_FN );

        translate( [ 0, 0, - EPS ] )
            cylinder( 2 * EPS + aLength, SHANK_R, SHANK_R, $fn = M2_FN );
    }
}

module M2_Thread_X( aLength ) { Cylinder_X( aLength, THREAD_R, 8 ); }
module M2_Thread_Y( aLength ) { Cylinder_Y( aLength, THREAD_R, 8 ); }
module M2_Thread_Z( aLength ) { Cylinder_Z( aLength, THREAD_R, 8 ); }

// Private
/////////////////////////////////////////////////////////////////////////////

EPS = 0.1;

HEAD_R = 2.1;

HEX_R0 = 2.2;
HEX_R1 = 2.3;

INSERT_LENGTH = 3;
INSERT_R0     = 1.4;
INSERT_R1     = 1.5;

SHANK_R = 1.2;

THREAD_R = 1;
