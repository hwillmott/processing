ArrayList<Cluster> clusters;
PImage backgroundImg;
PImage foregroundImg;

void setup()
{
    size(1092,800);
    this.clusters = new ArrayList<Cluster>();
    this.initializeClusters();
    frameRate(20);
    backgroundImg = loadImage("leopard3.png");
    foregroundImg = loadImage("leopard5.png");
}

void initializeClusters()
{
    // tail
    this.clusters.add(new Cluster(new PVector(50,559), 4));
    this.clusters.add(new Cluster(new PVector(43,532), 6));
    this.clusters.add(new Cluster(new PVector(67,525), 3));
    this.clusters.add(new Cluster(new PVector(76,540), 4));
    this.clusters.add(new Cluster(new PVector(60,572), 6));
    this.clusters.add(new Cluster(new PVector(89,588), 6));
    this.clusters.add(new Cluster(new PVector(115,587), 4));
    this.clusters.add(new Cluster(new PVector(135,578), 6));
    this.clusters.add(new Cluster(new PVector(163,574), 4));
    this.clusters.add(new Cluster(new PVector(163,551), 6));
    this.clusters.add(new Cluster(new PVector(180,521), 6));
    this.clusters.add(new Cluster(new PVector(189,479), 6));
    this.clusters.add(new Cluster(new PVector(195,445), 6));
    this.clusters.add(new Cluster(new PVector(208,406), 6));
    this.clusters.add(new Cluster(new PVector(218,368), 6));
    this.clusters.add(new Cluster(new PVector(228,334), 7));
    this.clusters.add(new Cluster(new PVector(239,298), 7));
    this.clusters.add(new Cluster(new PVector(256,264), 7));
    this.clusters.add(new Cluster(new PVector(267,233), 6));
    this.clusters.add(new Cluster(new PVector(288,206), 4));
    this.clusters.add(new Cluster(new PVector(259,320), 3));
    this.clusters.add(new Cluster(new PVector(246,352), 4));
    this.clusters.add(new Cluster(new PVector(238,391), 2));
    this.clusters.add(new Cluster(new PVector(222,433), 2));
    this.clusters.add(new Cluster(new PVector(216,469), 1));
    this.clusters.add(new Cluster(new PVector(200,507), 2));
    this.clusters.add(new Cluster(new PVector(113,607), 1));
    this.clusters.add(new Cluster(new PVector(186,549), 1));
    this.clusters.add(new Cluster(new PVector(233,416), 1));
    this.clusters.add(new Cluster(new PVector(298,234), 5));
    this.clusters.add(new Cluster(new PVector(290,263), 3));
    this.clusters.add(new Cluster(new PVector(312,277), 2));
    this.clusters.add(new Cluster(new PVector(134,598), 2));
    this.clusters.add(new Cluster(new PVector(318,296), 1));
    this.clusters.add(new Cluster(new PVector(275,281), 2));
    this.clusters.add(new Cluster(new PVector(85,549), 2));
    // right back leg
    this.clusters.add(new Cluster(new PVector(510,399), 2));
    this.clusters.add(new Cluster(new PVector(503,365), 2));
    this.clusters.add(new Cluster(new PVector(519,374), 1));
    this.clusters.add(new Cluster(new PVector(548,381), 2));
    this.clusters.add(new Cluster(new PVector(535,353), 3));
    this.clusters.add(new Cluster(new PVector(504,336), 4));
    this.clusters.add(new Cluster(new PVector(524,327), 3));
    this.clusters.add(new Cluster(new PVector(555,331), 2));
    this.clusters.add(new Cluster(new PVector(563,359), 1));
    this.clusters.add(new Cluster(new PVector(505,296), 5));
    this.clusters.add(new Cluster(new PVector(535,302), 4));
    this.clusters.add(new Cluster(new PVector(484,269), 5));
    this.clusters.add(new Cluster(new PVector(514,270), 3));
    this.clusters.add(new Cluster(new PVector(539,271), 2));
    this.clusters.add(new Cluster(new PVector(549,290), 1));
    this.clusters.add(new Cluster(new PVector(493,239), 2));
    this.clusters.add(new Cluster(new PVector(526,241), 1));
    this.clusters.add(new Cluster(new PVector(469,217), 4));
    this.clusters.add(new Cluster(new PVector(502,217), 2));
    this.clusters.add(new Cluster(new PVector(472,239), 1));
    // right front leg
    this.clusters.add(new Cluster(new PVector(782,526), 2));
    this.clusters.add(new Cluster(new PVector(771,503), 1));
    this.clusters.add(new Cluster(new PVector(793,505), 2));
    this.clusters.add(new Cluster(new PVector(804,526), 1));
    this.clusters.add(new Cluster(new PVector(822,533), 3));
    this.clusters.add(new Cluster(new PVector(838,535), 1));
    this.clusters.add(new Cluster(new PVector(833,505), 2));
    this.clusters.add(new Cluster(new PVector(783,477), 1));
    this.clusters.add(new Cluster(new PVector(768,451), 2));
    this.clusters.add(new Cluster(new PVector(758,479), 2));
    this.clusters.add(new Cluster(new PVector(761,436), 1));
    this.clusters.add(new Cluster(new PVector(746,450), 1));
    this.clusters.add(new Cluster(new PVector(811,490), 1));
    this.clusters.add(new Cluster(new PVector(799,473), 2));
    this.clusters.add(new Cluster(new PVector(788,447), 3));
    this.clusters.add(new Cluster(new PVector(783,425), 2));
    this.clusters.add(new Cluster(new PVector(828,483), 1));
    this.clusters.add(new Cluster(new PVector(819,453), 2));
    this.clusters.add(new Cluster(new PVector(822,433), 1));
    this.clusters.add(new Cluster(new PVector(806,410), 2));
    this.clusters.add(new Cluster(new PVector(802,425), 1));
    this.clusters.add(new Cluster(new PVector(834,549), 2));
    this.clusters.add(new Cluster(new PVector(827,412), 2));
    this.clusters.add(new Cluster(new PVector(835,388), 1));
    this.clusters.add(new Cluster(new PVector(845,368), 2));
    this.clusters.add(new Cluster(new PVector(743,419), 2));
    this.clusters.add(new Cluster(new PVector(735,401), 1));
    this.clusters.add(new Cluster(new PVector(776,404), 2));
    this.clusters.add(new Cluster(new PVector(774,385), 1));
    this.clusters.add(new Cluster(new PVector(753,406), 3));
    this.clusters.add(new Cluster(new PVector(749,382), 2));
    this.clusters.add(new Cluster(new PVector(750,353), 1));
    this.clusters.add(new Cluster(new PVector(805,388), 3));
    this.clusters.add(new Cluster(new PVector(812,360), 2));
    this.clusters.add(new Cluster(new PVector(783,362), 4));
    this.clusters.add(new Cluster(new PVector(730,366), 3));
    this.clusters.add(new Cluster(new PVector(772,437), 2));
    // center spots on back
    this.clusters.add(new Cluster(new PVector(435,145), 6));
    this.clusters.add(new Cluster(new PVector(463,146), 7));
    this.clusters.add(new Cluster(new PVector(498,151), 6));
    this.clusters.add(new Cluster(new PVector(529,159), 7));
    this.clusters.add(new Cluster(new PVector(556,171), 6));
    this.clusters.add(new Cluster(new PVector(587,179), 6));
    this.clusters.add(new Cluster(new PVector(620,195), 7));
    this.clusters.add(new Cluster(new PVector(654,211), 6));
    this.clusters.add(new Cluster(new PVector(687,215), 7));
    this.clusters.add(new Cluster(new PVector(720,211), 6));
    this.clusters.add(new Cluster(new PVector(455,176), 6));
    this.clusters.add(new Cluster(new PVector(488,180), 6));
    this.clusters.add(new Cluster(new PVector(508,197), 7));
    this.clusters.add(new Cluster(new PVector(532,195), 6));
    this.clusters.add(new Cluster(new PVector(561,209), 6));
    this.clusters.add(new Cluster(new PVector(598,218), 7));
    this.clusters.add(new Cluster(new PVector(628,233), 6));
    this.clusters.add(new Cluster(new PVector(664,240), 6));
    this.clusters.add(new Cluster(new PVector(544,230), 6));
    this.clusters.add(new Cluster(new PVector(567,254), 6));
    this.clusters.add(new Cluster(new PVector(603,252), 7));
    this.clusters.add(new Cluster(new PVector(594,280), 6));
    this.clusters.add(new Cluster(new PVector(636,261), 7));
    this.clusters.add(new Cluster(new PVector(628,296), 6));
    this.clusters.add(new Cluster(new PVector(654,280), 6));
    this.clusters.add(new Cluster(new PVector(686,262), 6));
    this.clusters.add(new Cluster(new PVector(703,238), 7));
    this.clusters.add(new Cluster(new PVector(659,310), 7));
    // belly
    this.clusters.add(new Cluster(new PVector(688,294), 5));
    this.clusters.add(new Cluster(new PVector(572,297), 5));
    this.clusters.add(new Cluster(new PVector(596,316), 5));
    this.clusters.add(new Cluster(new PVector(605,345), 5));
    this.clusters.add(new Cluster(new PVector(607,369), 5));
    this.clusters.add(new Cluster(new PVector(630,332), 5));
    this.clusters.add(new Cluster(new PVector(662,344), 5));
    this.clusters.add(new Cluster(new PVector(637,368), 5));
    this.clusters.add(new Cluster(new PVector(690,370), 5));
    this.clusters.add(new Cluster(new PVector(658,394), 5));
    this.clusters.add(new Cluster(new PVector(626,402), 5));
    this.clusters.add(new Cluster(new PVector(579,342), 3));
    this.clusters.add(new Cluster(new PVector(583,380), 2));
    this.clusters.add(new Cluster(new PVector(611,413), 1));
    this.clusters.add(new Cluster(new PVector(651,428), 3));
    this.clusters.add(new Cluster(new PVector(623,435), 2));
    this.clusters.add(new Cluster(new PVector(686,420), 5));
    this.clusters.add(new Cluster(new PVector(704,399), 3));
    this.clusters.add(new Cluster(new PVector(705,352), 2));
    this.clusters.add(new Cluster(new PVector(689,328), 3));
    this.clusters.add(new Cluster(new PVector(512,246), 2));
    // left front arm
    this.clusters.add(new Cluster(new PVector(905,575), 4));
    this.clusters.add(new Cluster(new PVector(900,547), 2));
    this.clusters.add(new Cluster(new PVector(890,517), 2));
    this.clusters.add(new Cluster(new PVector(910,521), 4));
    this.clusters.add(new Cluster(new PVector(924,496), 2));
    this.clusters.add(new Cluster(new PVector(935,516), 1));
    this.clusters.add(new Cluster(new PVector(928,549), 4));
    this.clusters.add(new Cluster(new PVector(941,540), 2));
    this.clusters.add(new Cluster(new PVector(930,568), 1));
    this.clusters.add(new Cluster(new PVector(911,594), 1));
    // shoulder
    this.clusters.add(new Cluster(new PVector(708,270), 4));
    this.clusters.add(new Cluster(new PVector(727,249), 3));
    this.clusters.add(new Cluster(new PVector(734,233), 2));
    this.clusters.add(new Cluster(new PVector(751,217), 3));
    this.clusters.add(new Cluster(new PVector(770,202), 4));
    this.clusters.add(new Cluster(new PVector(793,207), 2));
    this.clusters.add(new Cluster(new PVector(723,347), 1));
    this.clusters.add(new Cluster(new PVector(729,324), 2));
    this.clusters.add(new Cluster(new PVector(733,299), 1));
    this.clusters.add(new Cluster(new PVector(705,316), 3));
    this.clusters.add(new Cluster(new PVector(748,331), 2));
    this.clusters.add(new Cluster(new PVector(752,304), 2));
    this.clusters.add(new Cluster(new PVector(757,281), 1));
    this.clusters.add(new Cluster(new PVector(736,275), 2));
    this.clusters.add(new Cluster(new PVector(758,254), 2));
    this.clusters.add(new Cluster(new PVector(784,339), 2));
    this.clusters.add(new Cluster(new PVector(787,315), 1));
    this.clusters.add(new Cluster(new PVector(794,297), 2));
    this.clusters.add(new Cluster(new PVector(805,271), 3));
    this.clusters.add(new Cluster(new PVector(819,248), 2));
    this.clusters.add(new Cluster(new PVector(766,340), 1));
    this.clusters.add(new Cluster(new PVector(773,289), 2));
    this.clusters.add(new Cluster(new PVector(786,260), 1));
    this.clusters.add(new Cluster(new PVector(775,234), 2));
    this.clusters.add(new Cluster(new PVector(796,232), 1));
    this.clusters.add(new Cluster(new PVector(814,337), 1));
    this.clusters.add(new Cluster(new PVector(818,317), 2));
    this.clusters.add(new Cluster(new PVector(829,281), 2));
    this.clusters.add(new Cluster(new PVector(843,259), 3));
    this.clusters.add(new Cluster(new PVector(857,349), 1));
    this.clusters.add(new Cluster(new PVector(866,329), 2));
    this.clusters.add(new Cluster(new PVector(874,312), 1));
    this.clusters.add(new Cluster(new PVector(834,346), 1));
    this.clusters.add(new Cluster(new PVector(837,333), 2));
    this.clusters.add(new Cluster(new PVector(845,311), 3));
    this.clusters.add(new Cluster(new PVector(856,290), 2));
    this.clusters.add(new Cluster(new PVector(879,287), 1));
    this.clusters.add(new Cluster(new PVector(754,363), 1));
    this.clusters.add(new Cluster(new PVector(816,209), 1));
    this.clusters.add(new Cluster(new PVector(842,210), 2));
    this.clusters.add(new Cluster(new PVector(831,228), 1));
    this.clusters.add(new Cluster(new PVector(850,237), 2));
    this.clusters.add(new Cluster(new PVector(866,211), 1));
    this.clusters.add(new Cluster(new PVector(865,269), 2));
    this.clusters.add(new Cluster(new PVector(871,245), 1));
    this.clusters.add(new Cluster(new PVector(871,225), 1));
    this.clusters.add(new Cluster(new PVector(793,244), 1));
    this.clusters.add(new Cluster(new PVector(772,318), 1));
}

void keyReleased()
{
    float k = float(key) - 48;
	this.clusters.add(new Cluster(new PVector(mouseX, mouseY), int(k)));
	String s = "this.clusters.add(new Cluster(new PVector(" + mouseX + "," + mouseY + "), " + int(k) + "));";
	println(s);
}

void draw()
{
    tint(255, 60);
 	image(backgroundImg,0,0);

    for (Cluster c : clusters)
    {
    	c.update();
    	c.render();
    }

    noTint();
    image(foregroundImg,0,0);
}