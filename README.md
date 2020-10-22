# RGB2HSV_ObjectiveC
Function to convert RGB to HSV and Vice Versa

# Information
Particularly useful to use in iOS app development where you need a faster
converter (especially in a pixel loop). This conversion is the same like
UIColor class (UIColor getHue) and (UIColor colorFromHue)

# Usage
Copy the function into any .m class and use as below:

RGB TO HSV:
 ```obj-c
// declare hsv variable first.
double hh, ss, vv;
// R,G,B are the rgb values in 0-1 range.
RGB2HSV(R, G, B, &hh, &ss, &vv);

// after this line, hh,ss,vv contains the converted value.
 ```
HSV TO RGB:
```obj-c
// declare RGB variable first.
double newR, newG, newB;
// hh,ss,ll are the hsv values in 0-1 range.
HSV2RGB(&newR, &newG, &newB, hh, ss, ll);

// after this line, newR,G,B contains the converted value.
```


# Miscellaneous
Apple uses "Value" or "Brightness". This is not the same as the usual "Lightness"
in HSL values. If you are looking for RGB2HSL or HSL2RGB, you can go here:
https://github.com/extendi/ColorConverter
