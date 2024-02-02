layout(pixel_center_integer) in vec4 gl_FragCoord;

#request uniform "screen" screen
uniform ivec2 screen;

#request uniform "audio_sz" audio_sz
uniform int audio_sz;

#include ":util/smooth.glsl"
#include "@circle.glsl"
#include ":circle.glsl"

#request uniform "audio_l" audio_l
#request transform audio_l "window"
#request transform audio_l "fft"
#request transform audio_l "gravity"
#request transform audio_l "avg"
uniform sampler1D audio_l;

#request uniform "audio_r" audio_r
#request transform audio_r "window"
#request transform audio_r "fft"
#request transform audio_r "gravity"
#request transform audio_r "avg"
uniform sampler1D audio_r;

out vec4 fragment;

#define TWOPI 6.28318530718
#define PI 3.14159265359

#define LINES_THICKNESS 0.2
#define LINES_COUNT 256
#define SATURATION 0.8
#define HUE_START 0.6
#define HUE_RANGE 0.4

/* This shader is based on radial.glsl, refer to it for more commentary */

float apply_smooth(float theta) {
    float idx = theta + ROTATE;
    float dir = mod(abs(idx), TWOPI);
    if (dir > PI)
        idx = -sign(idx) * (TWOPI - dir);
    if (INVERT > 0)
        idx = -idx;
    
    float pos = abs(idx) / (PI + 0.001F);
    pos *= 0.5;
    #define smooth_f(tex) smooth_audio(tex, audio_sz, pos)
    float v;
    if (idx > 0) v = smooth_f(audio_l);
    else         v = smooth_f(audio_r);
    v *= AMPLIFY;      
    #undef smooth_f
    return v;
}

vec3 hsv2rgb(vec3 c)
{
    vec4 K = vec4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
    vec3 p = abs(fract(c.xxx + K.xyz) * 6.0 - K.www);
    return c.z * mix(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y);
}

float arc(float x)
{
    x *= 2.0;
    x -= 1;
    x *= x;
    return 1.0 - x;
}

void main() {
    fragment = vec4(0, 0, 0, 0);
    float
        dx = gl_FragCoord.x - (screen.x / 2) - 357,
        dy = gl_FragCoord.y + 30 - (screen.y / 2) + 6;
    float theta = atan(dy, dx);
    float d = sqrt((dx * dx) + (dy * dy));
    float adv = (1.0F / d) * (C_LINE * 0.5);
    float
        adj0 = theta + adv,
        adj1 = theta - adv;

    d -= C_RADIUS;
    float normRadius = d / float(C_LINE);

    if (d >= -(float(C_LINE) / 2.0F)) {
        float v = apply_smooth(theta);
        
        adj0 = apply_smooth(adj0) - v;
        adj1 = apply_smooth(adj1) - v;
        
        float
            dmax = max(adj0, adj1),
            dmin = min(adj0, adj1);
        float sd = d;
        d -= v;
        //#if C_FILL > 0
        #define BOUNDS (d < (float(C_LINE) / 2.0F))
        //#else
        //#define BOUNDS (d > -(float(C_LINE) / 2.0F) && d < (float(C_LINE) / 2.0F)) || (d <= dmax && d >= dmin)
        //#endif
        if (BOUNDS)  {
            float nd = d / float(C_LINE) / 2.0F;

            float shift = fract(abs(theta + ROTATE) / 6.28318530718 * 0.25);

            fragment = (OUTLINE);
            //fragment.a *= sd;

            float ndy = dy / screen.y;
            float normColumnAngle = 
                clamp(
                    abs(fract(theta * LINES_COUNT / TWOPI)),
                    0.0,
                    1.0);

            //fragment.rgb *= hsv2rgb(vec3(fract(0.6 + 0.3 * ndy), 0.8, 1.0));
            //fragment.rgb *= hsv2rgb(vec3(fract(HUE_START + HUE_RANGE * ndy), SATURATION, 1.0));
            fragment.rgb *= hsv2rgb(
                vec3(fract(HUE_START + HUE_RANGE * ndy),
                SATURATION,
                1.0));

            float colTrans = arc(normColumnAngle);
            fragment.a = smoothstep(
                1.0 - LINES_THICKNESS,
                1.0,
                colTrans * colTrans);
            if (d < -v)
                fragment.a = d / -v;
        }

    }
    
    //fragment.a = normRadius;
}
