Replacement library for the OpenSCAD MCAD nuts_and_bolts.scad library.

Aaron Ciuffo
23 December 2015


Import this library into your OpenSCAD design:
```
include </path/to/libraries/nuts_and_bolts.scad>
mBolt(m3);
```

Because of the lookup functions you will need to use `import` instead of `use`. Make sure you comment out the `simpleDemo()` line as well.

This library provides metric series fasteners in the following sizes: 2, 3, 4, 6, 8, 10, 12.  Additional sizes can be added easily.

The following fasteners are provided:
* M Bolts with hex socket and hex heads
* M Nuts (standard only, no thin)
* M Washers
* [T - Slot](https://www.google.com/search?q=t-slot+laser+cut&espv=2&biw=1344&bih=1318&source=lnms&tbm=isch&sa=X&ved=0ahUKEwiftoyW-vHJAhXKmHIKHdtNBQkQ_AUIBigB&dpr=1) cutouts for laser cut joints

#### NOTES
* This is **NOT** a drop in replacement for the MCAD library, but rather an extension with  more features
*Use the `tolerance = +0.X` to use the bolt and nut modules for cutting holes or making slots for bolt heads and captive nuts
* OpenSCAD 2015.03-2 crashes *HARD* if the called m bolt size does not exist due
  to a bug in the lookup() function. A bug report has been filed and should be fixed
  in the next release: https://github.com/openscad/openscad/issues/1528

```
mBolt(
    size = mX, // defined m bolt size (default: m3)
    len = N, // length of bolt shaft (default: 10)
    center = true/false, // center the shaft (not including the head) (default: true)
    style = "socket"/"hex" // default is socket drive (default: socket)
    tolerance = N // positve or negative number to add to the shaft diameter (def: 0)
);

mNut(
    size = mX, // defined m bolt size (default: m3)
    center = true/false // center the nut (default: true)
    tolerance = N // positive or negative number to add to the hole and body diameter
);

mWasher(
    size = mX, // defined m bolt size (default m3)
    tolerance = N // positive or negative number to add to the inner and outer diameter
);

This module creates a t-shaped slot for making perpendicular joints in laser cut objects. By default the bolt slot is 0.5mm larger than the distance across the nut FLATS. This shold make it easy to slot in a nut, but it should not be able to spin to make tightening easier.

tSlot(
    size = mX, // defined m bolt size (default: m3)
    material = N, // thickness of material in mm (default: 3)
    len = N, // total length of bolt to be used (default: 15)
    tolerence = N // positive or negative number to add to the bolt size (def 0.5)
);
```
####Examples:
```
mWasher(m10);
mNut(m3);
mBolt(m3);
mBolt(size = m3, style = "hex");
mBolt(m3, tolerance = 0.02, center = false, style = "hex", len = 15);
mBolt(m3, tolerance = 0.05, center = true, len = 6);
tSlot(size = m3, bolt = 10);
```

####Demos:
```
tSlotDemo();
demo();
simpleDemo();
```
