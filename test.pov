#include "colors.inc"
#include "textures.inc"
#include "woods.inc"
#include "metals.inc"
#include "stones.inc"

camera {
    location <-.5, 2.8, -10>
    look_at  <0, 2, 10>
}

light_source {
    <0, 3, 3> // <x, y, z>
    color <1.0, 1.0, 1.0>*1 // <red, green, blue>
        
}

box {
    <-4, -0.1, -2>, <4, 0, 4> // <x, y, z> near lower left corner, <x, y, z> far upper right corner
    texture {T_Stone31}
}
box {
    <-4.5, -0.2, -2.7>, <4.5, -0.1, 4.7> // <x, y, z> near lower left corner, <x, y, z> far upper right corner
    texture {T_Stone31}
}
box {
    <-5, -0.3, -3.4>, <5, -0.2, 5.4> // <x, y, z> near lower left corner, <x, y, z> far upper right corner
    texture {T_Stone31}
}

plane {<0,1,0>,0 
        finish{reflection{0,1 fresnel}
               specular .3
               roughness .005
               phong 1
               phong_size 50000
               ambient .1
               reflection .6
        }
        normal{average
               normal_map{[1 granite -.8 scale 30 poly_wave .2]
                          [1 granite -.6 scale 10 poly_wave .2]
                          [1 granite -.4 scale 3 poly_wave .2]
               }
        }
        pigment{color rgb<0.0,0.2,1.0>}
        interior{ior 1.33}
        translate<0,0,0>
}

sky_sphere {pigment{gradient y
                    color_map{
                        [0.0 White]
                        [0.1 SkyBlue]
                        [1.0 Blue]
                    }
            }
            pigment{wrinkles
                    color_map{
                        [0.0 rgbft<1,1,1,0,1>]
                        [0.5 rgbft<1,1,1,0,1>]
                        [0.8 White]
                        [1.0 Gray75]
                    }
                    scale 0.5
            }
            /*pigment{
                    gradient y

                    color_map{
        
                      [0.8 color rgb<0.3,0.4,1.2>]
        
                      [0.999 color rgb<1,1,0.9> filter 0.1]
        
                      [0.9995 White*1.2]
        
                    }
                    rotate x*30 
        
                   
            }*/
}

#macro A(dx,dy,dz,deg,ofst)
    union {
        union{
            box{<-3+ofst*2,4,0.065>,<3-ofst*2,4.3,-0.065>
                pigment{image_map{png "pic2-2.png" map_type 0}}
            }
            box{<3-ofst*2,4,0.065>,<3-ofst*2+.01,4.3,-0.065>}
            
            translate<0,.01,0>
            
        }
        box{<-3.1+ofst*2,4.31,.08>,<3.1-ofst*2,4.37,-.08>}
        union{
            box{<0,0,.08>,<.35,.03,-.08> rotate<0,0,13> translate<-1.79+ofst,4.35,0>}
            box{<0,0,.08>,<.35,.03,-.08> rotate<0,0,-13> translate<-1.79+ofst,4.52,0>}
            box{<0,0,.08>,<.35,.03,-.08> rotate<0,0,13> translate<-1.8+4-ofst,4.35,0>}
            box{<0,0,.08>,<.35,.03,-.08> rotate<0,0,-13> translate<-1.8+4-ofst,4.52,0>}
            box{<0,0,.05>,<.35,.03,-.05> rotate<0,0,13> translate<-2.5+ofst,4.44,0>}
            box{<0,0,.05>,<.35,.03,-.05> rotate<0,0,-13> translate<-2.5+ofst,4.42,0>}
            box{<0,0,.05>,<.35,.03,-.05> rotate<0,0,13> translate<-2.53+4-ofst,4.44,0>}
            box{<0,0,.05>,<.35,.03,-.05> rotate<0,0,-13> translate<-2.53+4-ofst,4.42,0>}
            translate<0,-0.05,0>
        }
        #switch (ofst)
            #range(0.1,1)
                 box{<0,0,.08>,<.35,.03,-.08> rotate<0,0,-13> translate<-1.8+2,4.52-0.05,0>}
                 box{<0,0,.05>,<.35,.03,-.05> rotate<0,0,13> translate<-2.53+2,4.44-0.05,0>}
        #end
        rotate<0,deg,0> translate<dx,dy,dz>
    }
#end

#macro lat(dx,dz)
lathe {
    linear_spline
    8,<0.28,-0.1>,<0.28,0>,<0.27,2>,<0.2,3>,<0.2,5>,<0,5>,<0,-0.1>,<0.25,-0.1>
    translate<dx,0,dz>
}
#end    

union {
    lat(-2,0)
    lat(2,0)
    A(0,0,0,0,0)
    cone{<0,0,0>0.27, <0,0.15,0>0.27 translate<-2,4.8,0>}
    cone{<0,0,0>0.27, <0,0.15,0>0.27 translate<2,4.8,0>}
    
    difference{
        box{<-3,4,0.1>,<3,4.3,-0.1>}
        union{
            box{<0,0,-1>,<1,1,1> rotate<0,0,20> translate<-3.8,3.5,0>}
            box{<0,0,-1>,<1,1,1> rotate<0,0,-20> translate<2.7,3.5,0>}        
            
        }
        translate<0,1,0>    
    }
    difference{
        box{<-3.3,4,0.11>,<3.3,4.18,-0.11>}
        union{
            box{<0,0,-1>,<1,1,1> rotate<0,0,20> translate<-3.8-0.3,3.5,0>}
            box{<0,0,-1>,<1,1,1> rotate<0,0,-20> translate<2.7+0.3,3.5,0>}
            
        }
        translate<0,1.3,0>    
    }
    
    box{<0,0,0>,<.05,.15,.33> rotate<35,0,0> translate<-3.4,5.5,0>}
    box{<0,0,0>,<.05,.15,.33> rotate<35,180,0> translate<-3.4,5.5,0>}
    box{<0,0,0>,<.05,.15,.33> rotate<35,0,0> translate<3.35,5.5,0>}
    box{<0,0,0>,<.05,.15,.33> rotate<35,180,0> translate<3.35,5.5,0>}
    
    # macro hashira(dx,dz)
        union{
            cone {<0,0,0>0.2, <0,2.8,0>0.18}
            box {<-.25,2.7,-.25>,<.25,2.85,.25>}
            box {<-.3,2.82,-.25>,<.3,2.85,.25>}
            translate<dx,0,dz>
        }
    #end
    
    hashira(-2,-1.6)
    hashira(2,-1.6)
    hashira(-2,1.6)
    hashira(2,1.6)
    
    A(-2,-2,0,90,0.4)
    object{A(2,-2,0,90,0.4) no_shadow}
    A(-2,-3.5,0,90,0.4)
    A(2,-3.5,0,90,0.4)
    
    finish{ambient 0.5 diffuse .2 crand .22}
    texture{T_Wood22}
    pigment{image_map{png "pic2-2.png" map_type 0}}

}

#declare N = -3.5;
#while (N<3.5)
    union{
        #switch (N)
            #range(-.7,.7) 
                box{<0,0,0>,<.01,.05,.7> rotate<35,180,0> translate<N,5.5+(cosh(N)-1)/75,0>}
                box{<0,0,0>,<.01,.05,.7> rotate<35,0,0> translate<N,5.5+(cosh(N)-1)/75,0>} 
            #else
                box{<0,0,0>,<.01,.05,.5> rotate<35,180,0> translate<N,5.5+(cosh(N)-1)/75,0>}
                box{<0,0,0>,<.01,.05,.5> rotate<35,0,0> translate<N,5.5+(cosh(N)-1)/75,0>} 
            #end
        texture{T_Stone43}
    }
    #declare N = N+0.005;
#end

#declare N = -3.65;
#while (N<3.65)
    box{<0,0,.08>,<.01,.1,-.08> translate<N,5.5+(cosh(N)-1)/70,0> texture{T_Stone18}}
    box{<0,0,.11>,<.01,.05,-.11> translate<N,5.6+(cosh(N)-1)/70,0> texture{T_Stone18}}
    #declare N = N+0.01;
#end

#macro yane(dx,dz)
union{
    triangle{<-.35,2.85,-.25>, <.35,2.85,-.25>,<0,2.95,0>}
    triangle{<-.35,2.85,-.25>, <-.35,2.85,.25>,<0,2.95,0>}
    triangle{<.35,2.85,.25>, <.35,2.85,-.25>,<0,2.95,0>}
    triangle{<.35,2.85,.25>, <-.35,2.85,.25>,<0,2.95,0>}
    texture{T_Stone43}
    translate<dx,0,dz>
} 
#end

yane(-2,-1.6)
object{yane(2,-1.6) no_shadow}
yane(2,1.6)
yane(-2,1.6)



box {<0,0,0>,<1,1,0> pigment{image_map{png "pic3.png" map_type 0}}scale<6,6> translate<-2.7,0,4.5>}    
 

fog{
    color White
    fog_type 2
    fog_alt 0.1
    fog_offset 0.1
    distance .6
    turbulence z*0.2
    turb_depth 0.2
    rotate<-.6,0,0>
}


#declare r_violet1 = color rgbf<1.0, 0.5, 1.0, 1.0>;
  #declare r_violet2 = color rgbf<1.0, 0.5, 1.0, 0.8>;
  #declare r_indigo  = color rgbf<0.5, 0.5, 1.0, 0.8>;
  #declare r_blue    = color rgbf<0.2, 0.2, 1.0, 0.8>;
  #declare r_cyan    = color rgbf<0.2, 1.0, 1.0, 0.8>;
  #declare r_green   = color rgbf<0.2, 1.0, 0.2, 0.8>;
  #declare r_yellow  = color rgbf<1.0, 1.0, 0.2, 0.8>;
  #declare r_orange  = color rgbf<1.0, 0.5, 0.2, 0.8>;
  #declare r_red1    = color rgbf<1.0, 0.2, 0.2, 0.8>;
  #declare r_red2    = color rgbf<1.0, 0.2, 0.2, 1.0>;
  // create the rainbow
  rainbow {
    angle 54.5
    width 4
    distance 1.0e4
    direction <-.55, -0.1, 1>
    jitter 0.1
    color_map {
      [0.000  color r_violet1 transmit 0.95]
      [0.100  color r_violet2 transmit 0.93]
      [0.214  color r_indigo  transmit 0.91]
      [0.328  color r_blue    transmit 0.89]
      [0.442  color r_cyan    transmit 0.87]
      [0.556  color r_green   transmit 0.89]
      [0.670  color r_yellow  transmit 0.91]
      [0.784  color r_orange  transmit 0.93]
      [0.900  color r_red1    transmit 0.95]
    }
  }

#declare SunPlace=<50000,20000,-10000> ;
  
  light_source {
    SunPlace White*3.5
    looks_like {
        sphere {
            SunPlace,1000*5
            pigment {
                color White
            }
            finish {
                diffuse 1.0
            }
        }
    }
}