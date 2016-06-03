  =====start documentation=====
  Create nuts, bolts, washers, tslots 

  This library was created to make adding nuts and bolts to 3D and 2D designs easier. The library provides features for making cut-outs for captive nuts and washers, bolt holes and t-slot joints.  Check the documentation below for more information.

  Aaron Ciuffo - http://www.thingiverse.com/txoof/about, 
  Reach me also at gmail: aaron.ciuffo

  ***These fasteners are close aproximations to the ISO standards, but in many cases are fudged.  Most notably the thread algorithm is not at all ISO compliant.***

  Latest version available on [GitHub](https://github.com/txoof/OpenSCAD_fasteners)

  Revision of http://www.thingiverse.com/thing:1220331


  ##### Thanks to:
  * Biomushroom: http://www.thingiverse.com/thing:965737 by biomushroom
  * TrevorM: Thread algorythm based on http://www.thingiverse.com/thing:27183 by Trevor Moseley

  

  ##### ISSUES:
    * only metric threads have been implemented
    * grub/set screws do not have socket heads
    * nodes do not work properly for sizes above M4
    * button head size is a bit of a fudge. 

  ##### TODO:
    * add socket to grub screws


#### How To Use:

  * Download this script 
  * comment out the bolt() call
  * add the following line to your script:
  ```
  include </path/to/script/nuts_and_bolts.scad>
  ```
  * see below for specifics


#### Available Nut, Bolt, Washer array sets:
  * metric_fasteners (alias: m)
    - sizes: 2, 3, 4, 6, 8, 10

   
#### demo(text = true/false);
  **show most of the the features**
  * text = true/false - add descriptive text

#### tSlotDemo();
  **demonstrate a t-slot joint with a bolt**
  * for a working example of t-slot consturction see this [box](http://www.thingiverse.com/thing:1251283) built with t-slots


#### bolt(size = fastener_type[index], head = "<type\>", length = N\*, threadType = "type", quality = N, tolerance = R, list = true/false, center = true/false, v = true/false);

  **draw a predefined bolt from fastener_type array**
  * size = metric_fastener[index] - see the fastener_type array below
    - default: M3
  * head = "button", "hex", "flatSocket"/"flatHead", "conical", "socket", "grub"/"set"
    - default: socket
  * length = thread length - \*in the case of a flat-head socket, the TOTAL length
    - default: 10
  * threadType = "metric", "none"
    - default: metric
  * quality = N - N = number of curve segments (integer)
    - default: 32
  * tolerance = R - R = amount to increase/decrease all dimensions other than length
  * list = true/false - list the available types
  * center = true/false - center the length of the THREADS excluding head
  * v = true/false - verbose echo for debugging

##### Examples:
  ```
  //M4 x 15mm
  bolt(size = metric_fastner[4], length = 15);
  ```
  ```
  //M3 x 6 No thread
  bolt(size = metric_fastener[3], length = 6, threadType = "none");
  ```


####  nut(size = fastener_type[index], threadType = thread type, quality = N, list = false, quality = N, center = false, v = false);
  **draw a predefined nut from fastener_type array**
  * size = metric_fastener[index] - see the fastener_type array below
  - default: M3
  * quality = N - N = number of curve segments (integer)
  - default: 32
  * center = true/false - center the object    
  * v = true/false - verbose echo for debugging

##### Examples:
  ```
  //M4 Nut
  nut(metric_fastener[4]);
  ```

  ```
  //M3 Nut - low resolution
  nut(metric_fastener[4], quality = 15);
  ```


#### washer(size =fastener_type[index] , quality = N, , tolerance = R, quality = N, center = false, v = false)
  **draw a predefined washer from fastener_type array**
  * size = metric_fastener[index] - see the fastener_type array below
    - default: M3
  * quality = N - N = number of curve segments (integer)
    - default: 32
  * tolerance = R - total amount to add or subtract from the washer dimensions
    - default: 0.2
  * center = true/false - center the length of the THREADS excluding head
  * v = true/false - verbose echo for debugging

##### Examples:
  ```
  //M10 washer
  washer(metric_fastener[10]);
  ```

  ```
  //M3 washer, +0.4 tolerance
  washer(metric_fastener[3], tolerance = 0.4);
  ```


#### boltHole(size = fastener_type[index], length = N, quality = N, tolerance = R, quality =N, 2d = true/false, center = true/false, v = true/false)
  **draw a predefined bolt hole from fastener_type array**
  * size = metric_fastener[index] + tolerance - see the fastener_type array below
    - default: M3
  * length = N - N = length of bolt hole 
    - default: 10
  * quality = N - N = number of curve segments (integer)
    - default: 32
  * tolerance = R - total amount to add or subtract from the washer dimensions
    - default: 0
  * quality = N - N = number of curve segments (integer)
    - default: 24
  * 2d = true/false - true for working with 2 dimensional objects
    - default: false
  * center = true/false - center the length of the THREADS excluding head
  * v = true/false - verbose echo for debugging

##### Examples:
  ```
  //M3 hole +0.3 tolerance through 3mm material
  mat = 10;
  thick = 3;
  difference() {
    cube([mat, mat, thick], center = true);
    #boltHole(size = metric_fastener[3], tolerance = 0.3, center = true);
  }
  ```


#### nutHole(size = fastener_type[index], tolerance = R, 2d = true/false, center = true/false, v = true/false);
  **draw a predefined nut for making negative spaces based on fastener_type array**
    - this is useful for creating spaces for captive nuts
  * size = metric_fastener[index] - see the fastener_type array below
    - default: M3
  * tolerance = R - total amount to add or subtract from the nut dimensions
    - default: 0.2
  * 2d = true/false - true for working with 2 dimensional objectsa
    - default: false
  * center = true/false - center the object
  * v = true/false - verbose echo for debugging

##### Examples:
  ```
  //M2 Nut hole in 3mm material with +0.7 tolerance 
  mat = 10;
  thick = 3; 
  nutThick = 2.09; //the nut thicknes can be found using the v = true option 

  difference() {
    cube([mat, mat, thick], center = true);
    translate([0, 0, thick/2-nutThick])   
    nutHole(size = metric_fastener[2], tolerance = 0.7, v = true);
  }

  color("silver")
  translate([0, 0, thick/2 - 1.6/2])
  nut(metric_fastener[2], v = true, center = true);  
  ```

#### washerHole(size = fastener_type[index], tolerance = R, 2d = true/false, center = true/false, v = true/false);
  **draw a predefined washer for making negative spaces based on fastener_type array**
    - this is useful for creating spaces for captive washers
  * size = metric_fastener[index] - see the fastener_type array below
    - default: M3
  * tolerance = R - total amount to add or subtract from the washer dimensions
    - default: 0.2
  * quality = N - N = number of curve segments (integer)
    - default: 24
  * 2d = true/false - true for working with 2 dimensional objects
    - default: false
  * center = true/false - center the object
  * v = true/false - verbose echo for debugging


#### tSlot(size = fastener_type[index], material = N, length = N, tolerance = R, node = P, 2d = true/false, v = true/false);
  **draw a T-Slot for making cutouts using  CNC or laser cutter**
  - T-Slot example: https://planiverse.wordpress.com/2014/04/07/construction-technique-tab-and-slot-with-t-nut/
    - Nodes: http://blog.ponoko.com/2010/06/17/how-to-make-snug-joints-in-acrylic/
  * size = metric_fastener[index] - see the fastener_type array belowa
    - default: M3
  * material = N - thickness of material the bolt goes through (see the demo)
    - default: 3
  * length = N - length of bolt
    - default: 10
  * tolerance = R - total amount to add or subtract from the nut dimensions
    - default: 0.25
  * node = P - node size as percentage of nut thickness
    - default: 0.15
  * 2d = true/false - true for working with 2 dimensional objects
    - default: false 

#### tSlotBolt(size = fastner_type[index], length = N, head = "head type", threadType = "type", quality = N, v = true/false);
  **draw a bolt with a nut attached in appropriate position for a tSlot**
    - This is useful for visualizing the tSlot placement
  * size = metric_fastener[index] - see the fastener_type array below
    - default: M3
  * length = N - length of bolt
    - default: 10
  * head = "head type" - socket, hex, conical, set, flatHead (try list = true to see all types)
    - default: socket
  * threadType = "thread type" - metric, none (try list = true to see all types)
    - default: none
  * quality = N - N = number of curve segments (integer); if quality is set < 24 simpler forms of bolts will be used
    - default: 24
  * v = true/false - verbose echo for debugging


#### list_types(fastener_type); 

  **List all available sizes within a fasnter type**
  * array_name = predefined array containing bolt information in metric

  list_types(metric_fastener);
  Output is as follows:
  ECHO: "name: M1 - UNDEFINED"
  ECHO: "array_index[1]"
  ECHO: "============================="
  ECHO: "name: M2 Bolt, Nut & Washer"
  ECHO: "array_index[2]"
  ECHO: "     [1] thread diameter: 2"
  ECHO: "     [2] hex head thickess: 2"
  ECHO: "     [3] hex head & nut size: 4"
  ECHO: "     [4] socket head diameter: 3.5"
  ECHO: "     [5] socket head thickness: 2"
  ECHO: "     [6] socket tool size: 1.5"
  ECHO: "     [7] nut thickness,: 1.6"
  ECHO: "     [8] pitch: 0.4"
  ECHO: "     [9] washer thickness: 0.3"
  ECHO: "     [10] washer diameter: 5.5"
  ECHO: "============================="

#### fastener_type array
  **predefined array of fastener sizes based on ISO threads**
    - array is zero-indexed; element[0] contains human readable descriptions
    - measurements based on the following sources:
  * http://www.roymech.co.uk/Useful_Tables/Screws/Hex_Screws.htm
  * http://www.numberfactory.com/nf%20metric%20screws%20and%20bolts.htm
    - elements are arranged in increasing size 
    - for metric sizes, M3 is indexed [3], M4 is indexed [4], etc.

##### array descriptors 
  * name - human readable name: M3 Bolt, 1/2 inch Bolt
  * thread diameter - diameter of threaded bolt
  * hex head thickness - overall thickness of hex head
  * hex head & bolt size - distance across flats, wrench size needed
  * socket head diameter - diameter of rounded socket head
  * socket head thickness - overall thickness of socket head
  * socket tool size - size of hex socket tool needed
  * nut thickness - standard thickness
  * pitch - ISO thread pitch value (not implemented yet)
  * washer thickness - thickness of washer
  * washer diameter - diameter of washer

  =====end documentation=====
