
// Author    KMS - Martin Dubois, P.Eng.
// Copyright (C) 2021 KMS
// Product   Base3D
// File      Cylinder.scad

// Public
/////////////////////////////////////////////////////////////////////////////

module Cylinder_X( aLength, aRadius, aFN )
{
    rotate( [ 0, 90, 0 ] )
        cylinder( aLength, aRadius, aRadius, $fn=aFN );
}

module Cylinder_Y( aLength, aRadius, aFN )
{
    rotate( [ - 90, 0, 0 ] )
        cylinder( aLength, aRadius, aRadius, $fn=aFN );
}

module Cylinder_Z( aLength, aRadius, aFN )
{
    cylinder( aLength, aRadius, aRadius, $fn=aFN );
}
