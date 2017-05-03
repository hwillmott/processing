PImage img;
float x[];
float y[];
float currentYDelta[];
float maxYDelta[];
float step[];
int count;
float tStartX = 369;
float tStartY = 625;
boolean drawT;
int tongueTimer = 0;
PVector tStart = new PVector(369, 625);
PVector tDest;

void setup()
{
  size(600,800);
  colorMode(HSB, 360, 100,100,100);
  x = new float[300];
  y = new float[300];
  currentYDelta = new float[300];
  maxYDelta= new float[300];
  step = new float[300];
  img = loadImage("python2.png");
  initializePoints();
  for(int i = 0; i < count; i++)
  {
    float startMax = map(y[i], 197, 655, 0, 25);
    maxYDelta[i] = random(startMax, startMax + 5);
    currentYDelta[i] = random(0,maxYDelta[i]);
    float startStep = map(y[i], 197, 655, 0, 0.4);
    step[i] = random(startStep, startStep * 2);
  }
}

void draw()
{
  image(img, 0, 0, 600, 800);
  fill(0);
  noStroke();
  for(int i = 0; i < count; i++)
  {
    float opacity = 100 - currentYDelta[i] / maxYDelta[i] * 100;
   fill(0, opacity);
   ellipse(x[i], y[i] - currentYDelta[i], 2, 2);
   currentYDelta[i] += step[i];
   if (currentYDelta[i] >= maxYDelta[i]) currentYDelta[i] = 0;
  }
  if (drawT) drawTongue();
}

void drawTongue()
{
  noFill();
  stroke(#c764ce);
  strokeWeight(1);
  curve(tStart.x, tStart.y, tStart.x, tStart.y, tStart.x + 80, tStart.y, tDest.x, tDest.y); 
  if (tongueTimer-- <= 0)drawT = false;
}

void mousePressed()
{
  drawT = true;
  tongueTimer = 3;
  tDest = new PVector(random(80, 100),random(-50, 50));
}

void initializePoints()
{
  count = 0;
  x[count] = 304;
y[count] = 628;
count++;
x[count] = 313;
y[count] = 627;
count++;
  x[count] = 359;
y[count] = 625;
count++;
x[count] = 364;
y[count] = 625;
count++;
x[count] = 369;
y[count] = 622;
count++;
  x[count] = 385;
y[count] = 263;
count++;
x[count] = 391;
y[count] = 268;
count++;
x[count] = 408;
y[count] = 285;
count++;
x[count] = 406;
y[count] = 290;
count++;
x[count] = 414;
y[count] = 293;
count++;
x[count] = 414;
y[count] = 288;
count++;
x[count] = 326;
y[count] = 217;
count++;
x[count] = 341;
y[count] = 224;
count++;
x[count] = 350;
y[count] = 230;
count++;
x[count] = 368;
y[count] = 245;
count++;
x[count] = 372;
y[count] = 251;
count++;
  x[count] = 322;
y[count] = 228;
count++;
x[count] = 322;
y[count] = 224;
count++;
x[count] = 326;
y[count] = 223;
count++;
x[count] = 336;
y[count] = 236;
count++;
x[count] = 336;
y[count] = 232;
count++;
x[count] = 341;
y[count] = 232;
count++;
x[count] = 343;
y[count] = 235;
count++;
x[count] = 340;
y[count] = 236;
count++;
x[count] = 355;
y[count] = 250;
count++;
x[count] = 356;
y[count] = 243;
count++;
x[count] = 362;
y[count] = 245;
count++;
x[count] = 364;
y[count] = 251;
count++;
x[count] = 367;
y[count] = 253;
count++;
x[count] = 362;
y[count] = 256;
count++;
x[count] = 382;
y[count] = 272;
count++;
x[count] = 381;
y[count] = 267;
count++;
x[count] = 386;
y[count] = 269;
count++;
x[count] = 386;
y[count] = 276;
count++;
x[count] = 392;
y[count] = 282;
count++;
x[count] = 391;
y[count] = 275;
count++;
  x[count] = 226;
y[count] = 289;
count++;
x[count] = 228;
y[count] = 281;
count++;
x[count] = 233;
y[count] = 278;
count++;
x[count] = 232;
y[count] = 275;
count++;
x[count] = 237;
y[count] = 274;
count++;
x[count] = 239;
y[count] = 270;
count++;
x[count] = 241;
y[count] = 266;
count++;
x[count] = 244;
y[count] = 262;
count++;
x[count] = 242;
y[count] = 257;
count++;
x[count] = 245;
y[count] = 253;
count++;
x[count] = 250;
y[count] = 253;
count++;
x[count] = 248;
y[count] = 248;
count++;
x[count] = 253;
y[count] = 250;
count++;
x[count] = 253;
y[count] = 241;
count++;
x[count] = 259;
y[count] = 239;
count++;
x[count] = 255;
y[count] = 232;
count++;
x[count] = 259;
y[count] = 230;
count++;
x[count] = 264;
y[count] = 227;
count++;
x[count] = 267;
y[count] = 224;
count++;
  x[count] = 226;
y[count] = 394;
count++;
x[count] = 222;
y[count] = 389;
count++;
x[count] = 220;
y[count] = 384;
count++;
x[count] = 216;
y[count] = 382;
count++;
x[count] = 213;
y[count] = 378;
count++;
x[count] = 210;
y[count] = 377;
count++;
x[count] = 208;
y[count] = 372;
count++;
x[count] = 202;
y[count] = 369;
count++;
x[count] = 199;
y[count] = 364;
count++;
x[count] = 197;
y[count] = 364;
count++;
x[count] = 189;
y[count] = 358;
count++;
x[count] = 185;
y[count] = 354;
count++;
x[count] = 182;
y[count] = 352;
count++;
  x[count] = 272;
y[count] = 457;
count++;
x[count] = 274;
y[count] = 452;
count++;
x[count] = 272;
y[count] = 447;
count++;
x[count] = 267;
y[count] = 434;
count++;
x[count] = 264;
y[count] = 425;
count++;
x[count] = 264;
y[count] = 421;
count++;
x[count] = 260;
y[count] = 421;
count++;
x[count] = 257;
y[count] = 419;
count++;
x[count] = 261;
y[count] = 417;
count++;
x[count] = 250;
y[count] = 413;
count++;
x[count] = 246;
y[count] = 410;
count++;
x[count] = 246;
y[count] = 405;
count++;
x[count] = 241;
y[count] = 405;
count++;
x[count] = 240;
y[count] = 400;
count++;
x[count] = 237;
y[count] = 401;
count++;
  x[count] = 325;
y[count] = 437;
count++;
x[count] = 326;
y[count] = 444;
count++;
  x[count] = 312;
y[count] = 498;
count++;
x[count] = 316;
y[count] = 486;
count++;
x[count] = 317;
y[count] = 477;
count++;
x[count] = 320;
y[count] = 472;
count++;
x[count] = 321;
y[count] = 476;
count++;
x[count] = 326;
y[count] = 465;
count++;
x[count] = 328;
y[count] = 460;
count++;
x[count] = 322;
y[count] = 452;
count++;
x[count] = 322;
y[count] = 441;
count++;
x[count] = 324;
y[count] = 445;
count++;
  x[count] = 296;
y[count] = 511;
count++;
  x[count] = 276;
y[count] = 522;
count++;
x[count] = 282;
y[count] = 520;
count++;
x[count] = 285;
y[count] = 514;
count++;
x[count] = 289;
y[count] = 514;
count++;
x[count] = 291;
y[count] = 509;
count++;
x[count] = 293;
y[count] = 504;
count++;
x[count] = 301;
y[count] = 504;
count++;
  x[count] = 235;
y[count] = 525;
count++;
x[count] = 240;
y[count] = 525;
count++;
  x[count] = 147;
y[count] = 546;
count++;
x[count] = 151;
y[count] = 540;
count++;
x[count] = 157;
y[count] = 536;
count++;
x[count] = 161;
y[count] = 528;
count++;
x[count] = 164;
y[count] = 531;
count++;
x[count] = 170;
y[count] = 532;
count++;
x[count] = 179;
y[count] = 532;
count++;
x[count] = 183;
y[count] = 528;
count++;
x[count] = 186;
y[count] = 528;
count++;
x[count] = 188;
y[count] = 524;
count++;
x[count] = 192;
y[count] = 528;
count++;
x[count] = 198;
y[count] = 528;
count++;
x[count] = 203;
y[count] = 522;
count++;
x[count] = 207;
y[count] = 525;
count++;
x[count] = 211;
y[count] = 523;
count++;
x[count] = 219;
y[count] = 530;
count++;
x[count] = 225;
y[count] = 530;
count++;
x[count] = 233;
y[count] = 530;
count++;
x[count] = 239;
y[count] = 528;
count++;
x[count] = 240;
y[count] = 530;
count++;
x[count] = 245;
y[count] = 530;
count++;
  x[count] = 101;
y[count] = 512;
count++;
x[count] = 105;
y[count] = 509;
count++;
x[count] = 104;
y[count] = 504;
count++;
x[count] = 109;
y[count] = 503;
count++;
x[count] = 106;
y[count] = 498;
count++;
x[count] = 112;
y[count] = 496;
count++;
x[count] = 109;
y[count] = 493;
count++;
x[count] = 113;
y[count] = 490;
count++;
x[count] = 119;
y[count] = 486;
count++;
  x[count] = 99;
y[count] = 562;
count++;
x[count] = 98;
y[count] = 555;
count++;
x[count] = 101;
y[count] = 551;
count++;
x[count] = 96;
y[count] = 548;
count++;
x[count] = 99;
y[count] = 541;
count++;
x[count] = 96;
y[count] = 538;
count++;
x[count] = 99;
y[count] = 534;
count++;
x[count] = 96;
y[count] = 532;
count++;
x[count] = 94;
y[count] = 523;
count++;
x[count] = 97;
y[count] = 514;
count++;
  x[count] = 108;
y[count] = 573;
count++;
x[count] = 112;
y[count] = 579;
count++;
x[count] = 118;
y[count] = 589;
count++;
x[count] = 195;
y[count] = 608;
count++;
x[count] = 201;
y[count] = 605;
count++;
x[count] = 208;
y[count] = 599;
count++;
x[count] = 231;
y[count] = 595;
count++;
x[count] = 235;
y[count] = 590;
count++;
  x[count] = 246;
y[count] = 581;
count++;
x[count] = 241;
y[count] = 587;
count++;
x[count] = 235;
y[count] = 593;
count++;
x[count] = 229;
y[count] = 597;
count++;
x[count] = 224;
y[count] = 599;
count++;
x[count] = 214;
y[count] = 603;
count++;
x[count] = 207;
y[count] = 605;
count++;
x[count] = 200;
y[count] = 609;
count++;
x[count] = 196;
y[count] = 610;
count++;
x[count] = 184;
y[count] = 612;
count++;
x[count] = 173;
y[count] = 614;
count++;
x[count] = 165;
y[count] = 612;
count++;
x[count] = 160;
y[count] = 610;
count++;
x[count] = 154;
y[count] = 609;
count++;
x[count] = 145;
y[count] = 606;
count++;
x[count] = 141;
y[count] = 603;
count++;
x[count] = 138;
y[count] = 602;
count++;
x[count] = 125;
y[count] = 597;
count++;
x[count] = 120;
y[count] = 591;
count++;
x[count] = 117;
y[count] = 587;
count++;
x[count] = 114;
y[count] = 583;
count++;
x[count] = 110;
y[count] = 577;
count++;
x[count] = 107;
y[count] = 574;
count++;
x[count] = 104;
y[count] = 570;
count++;
  x[count] = 293;
y[count] = 634;
count++;
x[count] = 301;
y[count] = 632;
count++;
x[count] = 309;
y[count] = 631;
count++;
x[count] = 315;
y[count] = 629;
count++;
x[count] = 324;
y[count] = 628;
count++;
x[count] = 331;
y[count] = 628;
count++;
x[count] = 343;
y[count] = 630;
count++;
x[count] = 349;
y[count] = 629;
count++;
 x[count] = 289;
y[count] = 629;
count++;
x[count] = 283;
y[count] = 625;
count++;
x[count] = 274;
y[count] = 625;
count++;
x[count] = 267;
y[count] = 622;
count++;
x[count] = 269;
y[count] = 617;
count++;
x[count] = 261;
y[count] = 619;
count++;
x[count] = 258;
y[count] = 614;
count++;
x[count] = 263;
y[count] = 615;
count++;
x[count] = 266;
y[count] = 611;
count++;
x[count] = 261;
y[count] = 610;
count++;
x[count] = 256;
y[count] = 607;
count++;
x[count] = 254;
y[count] = 607;
count++;
x[count] = 251;
y[count] = 605;
count++;
x[count] = 249;
y[count] = 599;
count++;
x[count] = 249;
y[count] = 594;
count++;

x[count] = 358;
y[count] = 631;
count++;
x[count] = 363;
y[count] = 630;
count++;
x[count] = 366;
y[count] = 625;
count++;
}