const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#fdfbfb", /* black   */
  [1] = "#EFB2B9", /* red     */
  [2] = "#B0B6CF", /* green   */
  [3] = "#D1B9C7", /* yellow  */
  [4] = "#F1BCC2", /* blue    */
  [5] = "#BBC3DB", /* magenta */
  [6] = "#AFD5F8", /* cyan    */
  [7] = "#413E5F", /* white   */

  /* 8 bright colors */
  [8]  = "#928a8c",  /* black   */
  [9]  = "#EFB2B9",  /* red     */
  [10] = "#B0B6CF", /* green   */
  [11] = "#D1B9C7", /* yellow  */
  [12] = "#F1BCC2", /* blue    */
  [13] = "#BBC3DB", /* magenta */
  [14] = "#AFD5F8", /* cyan    */
  [15] = "#413E5F", /* white   */

  /* special colors */
  [256] = "#fdfbfb", /* background */
  [257] = "#413E5F", /* foreground */
  [258] = "#413E5F",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
