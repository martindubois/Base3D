
// Author   KMS - Martin Dubois, ing.
// Product  Base3D
// File     Metric/M3.scad

// Default unit  mm

// Public constants
/////////////////////////////////////////////////////////////////////////////

M3_Insert_Height = 3 + Printer_Error;

// Private constants
/////////////////////////////////////////////////////////////////////////////

M3_FN             = 20  ;
M3_Insert_Radius0 =  2.1;
M3_Insert_Radius1 =  2.2;
M3_Insert_Radius2 =  2.3 + Printer_Error;
M3_Ov             =  0.1;
M3_Radius         =  1.5 + Printer_Error;
M3_Washer_Radius  =  3.5 + Printer_Error;

// Public modules
/////////////////////////////////////////////////////////////////////////////

// aZ0  Height of the screw hole
module M3_Insert( aZ0 )
{
    // Insert
    translate( [ 0, 0, aZ0 ] )
        cylinder( M3_Insert_Height + M3_Ov, M3_Insert_Radius0, M3_Insert_Radius1, $fn = M3_FN );

    // Screw
    translate( [ 0, 0, - M3_Ov ] )
        cylinder( aZ0 + 2 * M3_Ov, M3_Radius, M3_Radius, $fn = M3_FN );
}

// aZ0  Height of the screw hole
// aZ1  Height of the mount hole
module M3_InsertAndMountHole0( aZ0, aZ1 )
{
    translate( [ 0, 0, aZ0 + M3_Insert_Height ] )
        cylinder( aZ1 + M3_Ov, M3_Insert_Radius2, M3_Insert_Radius2, $fn = M3_FN );

    M3_Insert( aZ0 );
}

// aZ0  Height of the screw hole
// aZ1  Height of the mount hole
module M3_InsertAndMountHole1( aZ0, aZ1 )
{
    translate( [ 0, 0, aZ0 + M3_Insert_Height ] )
        cylinder( aZ1 + M3_Ov, M3_Washer_Radius, M3_Washer_Radius, $fn = M3_FN );

    M3_Insert( aZ0 );
}
