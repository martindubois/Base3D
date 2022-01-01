
// Author    KMS - Martin Dubois, P. Eng.
// Copyright (C) 2022 KMS
// License   http://www.apache.org/licenses/LICENSE-2.0
// Product   Base3D
// File      SAE/Screw10.scad

use <../Cylinder.scad>

// Public
/////////////////////////////////////////////////////////////////////////////

module Screw10_Shank_Z( aLength ) { Cylinder_Z( aLength, SHANK_R, 20 ); }

module Screw10_Thread_Z( aLength ) { Cylinder_Z( aLength, THREAD_R, 8 ); }

// Private
/////////////////////////////////////////////////////////////////////////////

SHANK_R = 2.6;
THREAD_R = 2.4;
