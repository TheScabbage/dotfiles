#define HUE_START 0.75
#define HUE_RANGE 0.5

/* Offset (Y) of the visualization */
#define CENTER_OFFSET_Y -5
/* Offset (X) of the visualization */
#define CENTER_OFFSET_X 357
/* center radius (pixels) */
#define C_RADIUS 350
/* center line thickness (pixels) */
/* outline color */
#define OUTLINE #80fbff
#define C_LINE 4
/* Amplify magnitude of the results each bar displays */
#define AMPLIFY 300
/* Angle (in radians) for how much to rotate the visualizer */
#define ROTATE (PI / 2)
/* Whether to switch left/right audio buffers */
#define INVERT 0
/* Whether to fill in the space between the line and inner circle */
#define C_FILL 0
/* Whether to apply a post-processing image smoothing effect
   1 to enable, 0 to disable. Only works with `xroot` transparency,
   and improves performance if disabled. */
#define C_SMOOTH 0

/* Gravity step, overrude frin `smooth_parameters.glsl` */
#request setgravitystep 4.0

/* Smoothing factor, override from `smooth_parameters.glsl` */
#request setsmoothfactor 0.008
