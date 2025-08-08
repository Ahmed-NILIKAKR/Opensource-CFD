x = 6; //x cord of outer domain
y = 3; //y cord of outer domain

dia = 0.25; //Diameter of cylinder in m
cc = y/2; //centre of cylinder
cc1 = cc-(dia/2); //1st cord of cylinder
cc2 = cc+(dia/2); //2nd cord of cylinder


xc = 1.1; //1st cord of cylinder domain
yc = 1.9; //2nd cord of cylinder domain

cond=0; // 0 for circular, 1 for square region around the cylinder

nc = 50; // number of cuts of y1-y4 lines 
ncprog = 0.95; // progression values for y1-y4 lines


wv = 205; // wake region vertical cuts
wvprog = 1; // progression value for wake region

tbh = 50; // top and botton region horizontal cuts
tbfv = 55; // top and botton front region vertical cuts

cylc = 40; // cuts on cylinder surface in top left and bottom section
cylcbmp = 1; //bump
cylcprog = 1; //progression

cylwak = 50; // wake region of cylinder 
cylwakbmp = 1; // bump


//Outer Domain
Point(1) = {0, 0, 0, 1.0};
Point(2) = {x, 0, 0, 1.0};
Point(3) = {0, y, 0, 1.0};
Point(4) = {x, y, 0, 1.0};

//Cylinder
Point(5) = {cc1, cc2, 0, 1.0};
Point(6) = {cc2, cc1, 0, 1.0};
Point(7) = {cc2, cc2, 0, 1.0};
Point(8) = {cc1, cc1, 0, 1.0};
Point(9) = {cc, cc, 0, 1.0};

//Cylinder domain
Point(10) = {xc, yc, 0, 1.0};
Point(11) = {xc, xc, 0, 1.0};
Point(12) = {yc, yc, 0, 1.0};
Point(13) = {yc, xc, 0, 1.0};

//Inlet
Point(14) = {0, yc, 0, 1.0};
Point(15) = {0, xc, 0, 1.0};

//Top
Point(16) = {xc, y, 0, 1.0};
Point(17) = {yc, y, 0, 1.0};

//Bottom
Point(18) = {xc, 0, 0, 1.0};
Point(19) = {yc, 0, 0, 1.0};

//Wake
Point(20) = {x, yc, 0, 1.0};
Point(21) = {x, xc, 0, 1.0};

//Outer Domain 
//Line A
Line(1) = {3, 14}; Transfinite Curve {1} = tbh Using Progression 1;
//Line B
Line(2) = {14, 15}; Transfinite Curve {2} = cylc Using Bump cylcbmp;
//Line C
Line(3) = {15, 1}; Transfinite Curve {3} = tbh Using Progression 1;
//Line D
Line(4) = {1, 18}; Transfinite Curve {4} = tbfv Using Progression 1;
//Line E
Line(5) = {18, 19}; Transfinite Curve {5} = cylc Using Progression cylcprog;
//Line F
Line(6) = {19, 2}; Transfinite Curve {6} = wv Using Progression 1;
//Line G
Line(7) = {2, 21}; Transfinite Curve {7} = tbh Using Progression 1;
//Line H
Line(8) = {21, 20}; Transfinite Curve {8} = cylwak Using Bump 1;
//Line I
Line(9) = {20, 4}; Transfinite Curve {9} = tbh Using Progression 1;
//Line J
Line(10) = {4, 17}; Transfinite Curve {10} = wv Using Progression 1;
//Line K
Line(11) = {17, 16}; Transfinite Curve {11} = cylc Using Progression cylcprog;
//Line L
Line(12) = {16, 3}; Transfinite Curve {12} = tbfv Using Progression 1;


//Line Connecting Outer Domain to Inner Cylinder Domain
//Line M
Line(13) = {14, 10}; Transfinite Curve {13} = tbfv Using Progression 1;
//Line N
Line(14) = {15, 11}; Transfinite Curve {14} = tbfv Using Progression 1;
//Line O
Line(15) = {11, 18}; Transfinite Curve {15} = tbh Using Progression 1;
//Line P
Line(16) = {13, 19}; Transfinite Curve {16} = tbh Using Progression 1;
//Line Q
Line(17) = {13, 21}; Transfinite Curve {17} = wv Using Progression wvprog;
//Line R
Line(18) = {12, 20}; Transfinite Curve {18} = wv Using Progression wvprog;
//Line S
Line(19) = {12, 17}; Transfinite Curve {19} = tbh Using Progression 1;
//Line T
Line(20) = {10, 16}; Transfinite Curve {20} = tbh Using Progression 1;


If (cond==1)
	//Inner Cylinder Domain
	//Line U
	Line(21) = {10, 11}; Transfinite Curve {21} = cylc Using Bump cylcbmp;
	//Line V
	Line(22) = {11, 13}; Transfinite Curve {22} = cylc Using Progression cylcprog;
	//Line W
	Line(23) = {13, 12}; Transfinite Curve {23} = cylwak Using Bump cylwakbmp;
	//Line X
	Line(24) = {12, 10}; Transfinite Curve {24} = cylc Using Progression cylcprog;
	exit

Else
	//Inner Cylinder Domain(Circular domain)
	//Line U
	Circle(21) = {10, 9, 11}; Transfinite Curve {21} = cylc Using Bump cylcbmp;
	//Line V
	Circle(22) = {11, 9, 13}; Transfinite Curve {22} = cylc Using Progression cylcprog;
	//Line W
	Circle(23) = {13, 9, 12}; Transfinite Curve {23} = cylwak Using Bump cylwakbmp;
	//Line X
	Circle(24) = {12, 9, 10}; Transfinite Curve {24} = cylc Using Progression cylcprog;

//Line Connecting Cylinder to Inner Cylinder Domain
//Line Y1
Line(25) = {10, 5}; Transfinite Curve {25} = nc Using Progression ncprog;
//Line Y2
Line(26) = {11, 8}; Transfinite Curve {26} = nc Using Progression ncprog;
//Line Y3
Line(27) = {13, 6}; Transfinite Curve {27} = nc Using Progression ncprog;
//Line Y4
Line(28) = {12, 7}; Transfinite Curve {28} = nc Using Progression ncprog;

//Cylinder
//Line Z1
Circle(29) = {5, 9, 7}; Transfinite Curve {29} = cylc Using Progression cylcprog;
//Line Z2
Circle(30) = {5, 9, 8}; Transfinite Curve {30} = cylc Using Progression cylcprog;
//Line Z3
Circle(31) = {8, 9, 6}; Transfinite Curve {31} = cylc Using Progression cylcprog;
//Line Z4
Circle(32) = {6, 9, 7}; Transfinite Curve {32} = cylwak Using Progression 1;


//Surfaces
Curve Loop(1) = {12, 1, 13, 20};
Plane Surface(1) = {1};
//+
Curve Loop(2) = {13, 21, -14, -2};
Plane Surface(2) = {2};
//+
Curve Loop(3) = {14, 15, -4, -3};
Plane Surface(3) = {3};
//+
Curve Loop(4) = {15, 5, -16, -22};
Plane Surface(4) = {4};
//+
Curve Loop(5) = {16, 6, 7, -17};
Plane Surface(5) = {5};
//+
Curve Loop(6) = {17, 8, -18, -23};
Plane Surface(6) = {6};
//+
Curve Loop(7) = {18, 9, 10, -19};
Plane Surface(7) = {7};
//+
Curve Loop(8) = {19, 11, -20, -24};
Plane Surface(8) = {8};
//+
Curve Loop(9) = {24, 25, 29, -28};
Plane Surface(9) = {9};
//+
Curve Loop(10) = {25, 30, -26, -21};
Plane Surface(10) = {10};
//+
Curve Loop(11) = {26, 31, -27, -22};
Plane Surface(11) = {11};
//+
Curve Loop(12) = {27, 32, -28, -23};
Plane Surface(12) = {12};
//+
Transfinite Surface {1};
//+
Transfinite Surface {2};
//+
Transfinite Surface {3};
//+
Transfinite Surface {4};
//+
Transfinite Surface {5};
//+
Transfinite Surface {6};
//+
Transfinite Surface {7};
//+
Transfinite Surface {8};
//+
Transfinite Surface {9};
//+
Transfinite Surface {10};
//+
Transfinite Surface {11};
//+
Transfinite Surface {12};
//+
Recombine Surface {1};
//+
Recombine Surface {2};
//+
Recombine Surface {3};
//+
Recombine Surface {4};
//+
Recombine Surface {5};
//+
Recombine Surface {6};
//+
Recombine Surface {7};
//+
Recombine Surface {8};
//+
Recombine Surface {9};
//+
Recombine Surface {10};
//+
Recombine Surface {11};
//+
Recombine Surface {12};
//+
Extrude {0, 0, 0.05} {
  Surface{1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12};
Layers{1};
Recombine;
}
//+
Physical Surface("Inlet", 297) = {75, 45, 97};
//+
Physical Surface("Outlet", 298) = {177, 155, 137};
//+
Physical Surface("FrtBck", 300) = {54, 1, 8, 208, 7, 186, 6, 164, 296, 230, 9, 11, 274, 10, 252, 2, 76, 3, 98, 120, 4, 5, 142, 12};
//+
Physical Surface("Top", 301) = {41, 199, 181};
//+
Physical Surface("Btm", 302) = {133, 111, 93};
//+
Physical Surface("Cylinder", 303) = {225, 265, 287, 243};
//+
Physical Volume("Internal", 304) = {1, 8, 2, 10, 3, 4, 11, 12, 9, 6, 5, 7};
//+


