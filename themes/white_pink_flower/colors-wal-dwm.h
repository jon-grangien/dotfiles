static const char norm_fg[] = "#413E5F";
static const char norm_bg[] = "#fdfbfb";
static const char norm_border[] = "#928a8c";

static const char sel_fg[] = "#413E5F";
static const char sel_bg[] = "#B0B6CF";
static const char sel_border[] = "#413E5F";

static const char urg_fg[] = "#413E5F";
static const char urg_bg[] = "#EFB2B9";
static const char urg_border[] = "#EFB2B9";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
