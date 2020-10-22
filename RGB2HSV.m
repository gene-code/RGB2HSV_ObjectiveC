//
//  RGB2HSV.m

//  Created by Emir on 22/10/2020.
//  Copyright © 2020 GeneCode. All rights reserved.
//

#import <Foundation/Foundation.h>


static void RGB2HSV (double r, double g, double b,  double *h,  double *s,  double *v)
{
    
    double      min, max, delta;
    
    min = r < g ? r : g;
    min = min  < b ? min  : b;
    
    max = r > g ? r : g;
    max = max  > b ? max  : b;
    
    *v = max;
    delta = max - min;
    if (delta < 0.00001)
    {
        *s = 0;
        *h = 0;
        return;
    }
    if( max > 0.0 ) {
        *s = (delta / max);
    } else {
        *s = 0.0;
        *h = NAN;
        return;
    }
    if( r >= max )
        *h = ( g - b ) / delta;
    else
        if( g >= max )
            *h = 2.0 + ( b - r ) / delta;
        else
            *h = 4.0 + ( r - g ) / delta;
    
    *h *= 60.0;
    
    if( *h < 0.0 )
        *h += 360.0;
}


static void  HSV2RGB(double *r, double *g, double *b, double h, double s, double v)
{
    double      hh, p, q, t, ff;
    long        i;
    
    
    if(s <= 0.0) {       // < is bogus, just shuts up warnings
        *r = v;
        *g = v;
        *b = v;
        return;
    }
    hh = h;
    if(hh >= 360.0) hh = 0.0;
    hh /= 60.0;
    i = (long)hh;
    ff = hh - i;
    p = v * (1.0 - s);
    q = v * (1.0 - (s * ff));
    t = v * (1.0 - (s * (1.0 - ff)));
    
    switch(i) {
        case 0:
            *r = v;
            *g = t;
            *b = p;
            break;
        case 1:
            *r = q;
            *g = v;
            *b = p;
            break;
        case 2:
            *r = p;
            *g = v;
            *b = t;
            break;
            
        case 3:
            *r = p;
            *g = q;
            *b = v;
            break;
        case 4:
            *r = t;
            *g = p;
            *b = v;
            break;
        case 5:
        default:
            *r = v;
            *g = p;
            *b = q;
            break;
    }
}
