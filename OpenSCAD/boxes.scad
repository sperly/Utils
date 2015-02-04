seg = 50;

module mount(od,id,h,hd)
{
   translate([0,0,h/2])
      difference()
      {
         cylinder(r=od/2, h=h, center=true, $fn=seg);
         translate([0,0,h-hd+1])
            cylinder(r=id/2, h=hd+1, center=true, $fn=seg);
      }
}

module rounded_box(x,y,z,l,w,h,or,ir,t)
{
	difference()
	{
		hull()
		{
			translate([or,or,h/2])
				cylinder(r=or, h=h, center=true, $fn=seg);
			translate([l-or,or,h/2])
				cylinder(r=or, h=h, center=true ,$fn=seg);
			translate([l-or,w-or,h/2])
				cylinder(r=or, h=h, center=true,$fn=seg);
			translate([or,w-or,h/2])
				cylinder(r=or, h=h, center=true,$fn=seg);
		}
		hull()
		{
			translate([ir+t,ir+t,h/2])
				cylinder(r=ir, h=h-(2*t), center=true,$fn=seg);
			translate([l-ir-t,ir+t,h/2])
				cylinder(r=ir, h=h-(2*t), center=true,$fn=seg);
			translate([l-ir-t,w-ir-t,h/2])
				cylinder(r=ir, h=h-(2*t), center=true,$fn=seg);
			translate([ir+t,w-ir-t,h/2])
				cylinder(r=ir, h=h-(2*t), center=true,$fn=seg);
		}
	}
}

module bottom(x,y,z,l,w,h,or,ir,t)
{
	union()
   {
      difference()
      {
         rounded_box(x,y,z,l,w,h+t,or,ir,t);
         translate([(l/2)+(x-1),(w/2)+(y-1),(t+z+h)-1])
            cube(size=[l+2,w+2,t+1], center=true);
         hull()
         {
            translate([ir+t,ir+t,h-1])
               cylinder(r=ir+(t/2), h=3, center=true,$fn=seg);
            translate([l-ir-t,ir+t,h-1])
               cylinder(r=ir+(t/2), h=3, center=true,$fn=seg);
            translate([l-ir-t,w-ir-t,h-1])
               cylinder(r=ir+(t/2), h=3, center=true,$fn=seg);
            translate([ir+t,w-ir-t,h-1])
               cylinder(r=ir+(t/2), h=3, center=true,$fn=seg);
         }
      }
      
      translate([6.2,6.2,0])
         mount(6,3,h,h/2);
      translate([l-6.2,6.2,0])
         mount(6,3,h,h/2);
      translate([6.2,w-6.2,0])
         mount(6,3,h,h/2);
      translate([l-6.2,w-6.2,0])
         mount(6,3,h,h/2);
	}
   
}

length=70;
width=60;
height=15;

union()
{
   difference()
   {
      bottom(0,0,0,length,width,height,5,2,3);
      translate([35,2,15])
         rotate([0,90,90])
            cylinder(r=(6.2/2), h=7, center=true, $fn=seg);
      translate([24,2,15])
         rotate([0,90,90])
            cylinder(r=(6.2/2), h=7, center=true, $fn=seg);
      translate([46,2,15])
         rotate([0,90,90])
            cylinder(r=(6.2/2), h=7, center=true, $fn=seg);
   
   }
   translate([14,10,0])
      mount(6,3,8,6);
   translate([56,10,0])
      mount(6,3,8,6);
   translate([15,28,0])
      mount(6,3,8,6);
   translate([56,28,0])
      mount(6,3,8,6);
   
   
}