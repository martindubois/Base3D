
// Author   KMS - Martin Dubois, ing.
// Product  Base3D
// File     Metric/M4.scad

use <../Cylinder.scad>

// Private constants
/////////////////////////////////////////////////////////////////////////////

M4_FN             = 30  ;
M4_Insert_Radius0 =  2.8;
M4_Insert_Radius1 =  2.9;
M4_Ov             =  0.1;

// Public modules
/////////////////////////////////////////////////////////////////////////////

module M4_Head_Z( aLength ) { Cylinder_Z( aLength, HEAD_R, 30 ); }

module M4_Insert_X() { rotate( [ 0, 90, 0 ] ) cylinder( INSERT_LENGTH + EPS, INSERT_R1, INSERT_R0, $fn = 20 ); }

module M4_Insert_ZR() { cylinder( INSERT_LENGTH + EPS, INSERT_R1, INSERT_R0, $fn = 20 ); }

module M4_Hex_ZR() { cylinder( INSERT_LENGTH + EPS, HEX_R1, HEX_R0, $fn = 6 ); }

// aZ0  Height of the screw hole
module M4_Insert( aZ0 )
{
    // Insert
    translate( [ 0, 0, aZ0 ] )
        cylinder( M4_Insert_Height + M4_Ov, M4_Insert_Radius0, M4_Insert_Radius1, $fn = M4_FN );

    // Screw
    translate( [ 0, 0, - M4_Ov ] )
        cylinder( aZ0 + 2 * M4_Ov, M4_Radius, M4_Radius, $fn = M4_FN );
}

// aZ0  Height of the screw hole
// aZ1  Height of the mount hole
module M4_InsertAndMountHole0( aZ0, aZ1 )
{
    translate( [ 0, 0, aZ0 + M4_Insert_Height ] )
        cylinder( aZ1 + M4_Ov, M4_Insert_Radius2, M4_Insert_Radius2, $fn = M4_FN );

    M4_Insert( aZ0 );
}

// aZ0  Height of the screw hole
// aZ1  Height of the mount hole
module M4_InsertAndMountHole1( aZ0, aZ1 )
{
    translate( [ 0, 0, aZ0 + M4_Insert_Height ] )
        cylinder( aZ1 + M4_Ov, M4_Washer_Radius, M4_Washer_Radius, $fn = M4_FN );

    M3_Insert( aZ0 );
}

module M4_Shank_X( aLength ) { Cylinder_X( aLength, SHANK_R, 30 ); }
module M4_Shank_Z( aLength ) { Cylinder_Z( aLength, SHANK_R, 30 ); }

// Private
/////////////////////////////////////////////////////////////////////////////

EPS = 0.1;

HEAD_R = 4.3;

HEX_R0 = 4.7;
HEX_R1 = 4.8;

INSERT_LENGTH = 4;
INSERT_R0     = 2.8;
INSERT_R1     = 2.9;

SHANK_R = 2.3;
