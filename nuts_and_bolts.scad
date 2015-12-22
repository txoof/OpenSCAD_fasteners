/*
  Aaron Ciuffo
  Released under GPL V3

  Metric nut and bolt sizes based on 
  http://www.roymech.co.uk/Useful_Tables/Screws/Hex_Screws.htm
*/


/* 
  Add additional M sizes in the section below
  Fastner Dimensions:
  mX = [
    [boltDia, D], // D = bolt shaft diameter
    [headHexThick, T], // T = thickness of head
    [boltNut, N], // N = width across flats, wrench size for bolt head or nut
    [boltNutMax, M], // M = maximum width of bolt head or nut
    [nutThick, Q] // Q = nutThickness
    [washerDia, W], // W = external diameter of washer
    [washerThick, E] // E = washer thickness
    [socketHeadThick, H], // H = thickness of hex socket head
    [socketDia, S], // S = diameter hex socket head
    [socketSize, Z] // Z = socket wrench size
  ];

  BLANK 

  mX = [
    [boltDia, ],
    [headHexThick, ],
    [boltNut, ],
    [boltNutMax, ], 
    [nutThick, ],
    [washerDia, ],
    [washerThick, ],
    [socketHeadThick, ],
    [socketDia, ],
    [socketSize, ]
  ];
*/

/* [Hidden] */
// This is a bit of an abuse of the lookup() function; the temporary values
// need to be the *actual* values used in at least one of the defined sets
// values for lookup function
boltDia =  3;
headHexThick = 2;
boltNut = 5.5;
boltNutMax = 6.4; 
nutThick = 2.4;
washerDia = 7;
washerThick = 0.5;
socketHeadThick = 3;
socketDia = 5.5;
socketSize = 2.5;



// Meric Fastner Sizes
m2 = [
  [boltDia, 4],
  [headHexThick, 2],
  [boltNut, 4],
  [boltNutMax, 2.3], 
  [nutThick, 1.2], 
  [washerDia, 5.5],
  [washerThick, 0.3],
  [socketHeadThick, 2],
  [socketDia, 3.5],
  [socketSize, 1.5]
];

m3 = [
  [boltDia, 3],
  [headHexThick, 2],
  [boltNut, 5.5],
  [boltNutMax, 6.4], 
  [nutThick, 2.4], 
  [washerDia, 7],
  [washerThick, 0.5],
  [socketHeadThick, 3],
  [socketDia, 5.5],
  [socketSize, 2.5]
];

m4 = [
  [boltDia, 4],
  [headHexThick, 4],
  [boltNut, 7],
  [boltNutMax, 8.1],
  [nutThick, 3.2], 
  [washerDia, 9],
  [washerThick, 0.8],
  [socketHeadThick, 4],
  [socketDia, 7],
  [socketSize, 3]
];

m6 = [
  [boltDia, 6],
  [headHexThick, 4],
  [boltNut, 10],
  [boltNutMax, 11.5],  
  [nutThick, 5], 
  [washerDia, 12],
  [washerThick, 1.6],
  [socketHeadThick, 6],
  [socketDia, 10],
  [socketSize, 5]
];

m8 = [
  [boltDia, 8],
  [headHexThick, 5.5],
  [boltNut, 13],
  [boltNutMax, 15], 
  [nutThick, 6.5], 
  [washerDia, 17],
  [washerThick, 2],
  [socketHeadThick, 8],
  [socketDia, 13],
  [socketSize, 6]
];

m10 = [
  [boltDia, 10],
  [headHexThick, 7],
  [boltNut, 17],
  [boltNutMax, 19.6],
  [nutThick, 8], 
  [washerDia, 21],
  [washerThick, 2],
  [socketHeadThick, ],
  [socketDia, 16],
  [socketSize, 8]
];

m12 = [
  [boltDia, 12],
  [headHexThick, 8],
  [boltNut, 19],
  [boltNutMax, 22.1],
  [nutThick, 9.5], 
  [washerDia, 24],
  [washerThick, 2.5],
  [socketHeadThick, 12],
  [socketDia, 18],
  [socketSize, 10]
];


module mNut(size = m3, center = true, tolerance = 0) {
  fastnerType = size;
  t = tolerance; 

  // lookup values
  boltDiaL = lookup(boltDia, fastnerType);
  headHexThickL = lookup(headHexThick, fastnerType);
  boltNutL = lookup(boltNut, fastnerType);
  boltNutMaxL = lookup(boltNutMax, fastnerType);
  nutThickL = lookup(nutThick, fastnerType);
  washerDiaL = lookup(washerDia, fastnerType);
  washerThickL = lookup(washerThick, fastnerType);
  socketHeadThickL = lookup(socketHeadThick, fastnerType);
  socketDiaL = lookup(socketDia, fastnerType);
  socketSizeL = lookup(socketSize, fastnerType);

  echo ("type M", boltDiaL);
  difference() {
    cylinder(center = center, r = boltNutMaxL/2 + t/2, h = nutThickL + t , $fn = 6);
    cylinder(center = true, r = boltDiaL/2 + t/2, h = nutThickL*3, $fn = 72);

 
  echo ("nut thickness:", nutThickL+t);
  }
}

//mNut();

module mBolt(size = m3, len = 10, center = true, style = "socket", tolerance = 0) {
  fastnerType = size;
  t = tolerance; 

  // lookup values
  boltDiaL = lookup(boltDia, fastnerType);
  headHexThickL = lookup(headHexThick, fastnerType);
  boltNutL = lookup(boltNut, fastnerType);
  boltNutMaxL = lookup(boltNutMax, fastnerType);
  nutThickL = lookup(nutThick, fastnerType);
  washerDiaL = lookup(washerDia, fastnerType);
  washerThickL = lookup(washerThick, fastnerType);
  socketHeadThickL = lookup(socketHeadThick, fastnerType);
  socketDiaL = lookup(socketDia, fastnerType);
  socketSizeL = lookup(socketSize, fastnerType);

  echo ("type M", boltDiaL);
  $fn = 72;
  socketRad = (socketSizeL/2)/sin(60); // socket hole diameter
  headRad = boltNutMaxL/2;

  centerTranslate = center == true ? len/2 : len;

  union() {
    cylinder(r = boltDiaL/2 + t, h = len, center = center );

    if (style == "socket") {
      translate([0, 0, centerTranslate+socketHeadThickL/2])
        difference() {
          cylinder(r = socketDiaL/2, h = socketHeadThickL, center = true);
          translate([0, 0, socketHeadThickL/2 - socketHeadThickL*.74/2])
            cylinder(r = socketRad, h = socketHeadThickL*.75, center = true, $fn = 6);
        }

      echo ("total length:", len + socketHeadThickL);
      echo ("head thickness:", socketHeadThickL);
      echo ("bolt length:", len);
    }
    
    if (style == "hex") {
      //translate([0, 0, len/2+headHexThickL/2])
      translate([0, 0, centerTranslate+headHexThickL/2])
        cylinder(h = headHexThickL, r = headRad, center = true, $fn = 6);

      echo ("total length:", len + headHexThickL + t);
      echo ("head thickness:", headHexThickL);
      echo ("bolt length:", len);


    }
  }

}

fastnerList = [m2, m3, m4, m6, m8, m10, m12];

//mNut(m10);
mBolt(m3);

