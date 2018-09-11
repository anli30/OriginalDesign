int xx = 770;
float yy = 170;
float a = 757;
float b = 180;
float c = 765;
float d = 170;
float e = 769;
float f = 185;
float g = 780;
float h = 175;
float opacity = 255;

void setup() {
  size(1100, 785);
  background(#FFFFFF);
}

void draw() {
    picture();
    moveV(yy);
    yy = yy + 0.5;
    fill(51,153,255,opacity);
    moveT(a, b, c, d, e, f, g, h);
      //does not go to receptor
      a = a + 0.6;
      b = b + 1.14;
      //goes to middle receptor
      c = c - 0.05;
      d = d + 0.8;
      //goes to the left receptor
      e = e - 0.05;
      f = f + 1.01;
      //goes to the right receptor
      g = g - 0.64;
      h = h + 1.21;
      
      if( yy > 240){
        xx = 770;
        yy = 170;
        a = 757;
        b = 180;
        c = 765;
        d = 170;
        e = 769;
        f = 185;
        g = 780;
        h = 175;
      }
}
//this vesicle will be moving
void moveV(float yy) {
  noStroke();
  fill(#ffffff);
  ellipse(xx, yy, 50, 50);
}

void moveT(float a, float b, float c, float d, float e, float f, float g, float h) {
  //these are the neurotransmitters in the moving vesicle
  ellipse(a, b, 10, 10);
  ellipse(c, d, 10, 10);
  ellipse(e, f, 10, 10);
  ellipse(g, h, 10, 10);
}

//this codes for the whole neuron and synapse picture
void picture() {
  box();
  presynap(775, 130, 300, 150);
  postsynap(775, 430);
  neuron();
  lineA();
}

//this creates the outline for the synapses
void box() {
  fill(#FFFFFF);
  stroke(#000000);
  strokeWeight(2);
  rect(600, 50, 350, 457);
}

//This function creates the synapse and everything else in it
void presynap(int x, int y, int w, int h) {
  //this creates the synapse
  fill(#EBE788);
  noStroke();
  ellipse(x, y, w, h);

  //this creates the vescicles in the synapse
  vesicles(x-90, y-5);
  vesicles(x-20, y-21);
  vesicles(x+70, y-10);
}

//this function creates the vesicles in synapse
void vesicles(int vX, float vY) {
  fill(#ffffff);
  ellipse(vX, vY, 50, 50);
  neuroT(vX, vY);
}

//this function creates the neurotransmitters
void neuroT(int nx, float ny) {
  fill(#3399FF);
  ellipse(nx, ny, 10, 10);
  ellipse(nx-10, ny+10, 10, 10);
  ellipse(nx+10, ny+10, 10, 10);
  ellipse(nx-10, ny-5, 10, 10);
  ellipse(nx+10, ny-13, 10, 10);
}

//this creates the postsynaptic neuron
void postsynap(int px, int py) {
  //this creates the neuron
  fill(#EBE788);
  noStroke();
  ellipse(px, py, 300, 150);

  receptors(px, py);
  receptors(px+72, py-15);
  receptors(px+150, py-5);
}

//this creates the receptors on the postsynaptic neuron
void receptors(int rx, int ry) {
  //the parameters for 
  //receptor to the right
  fill(#FFB76F);
  beginShape();
  vertex(rx-92, ry-75);
  vertex(rx-90, ry-45);
  vertex(rx-75, ry-45);
  vertex(rx-77, ry-78);
  vertex(rx-72, ry-90);
  vertex(rx-98, ry-90);
  endShape(CLOSE);
  fill(#FFFFFF);
  ellipse(rx-85, ry-90, 10, 10);
}

void neuron() {
  //this is the head of the neuron
  fill(#FFFF99);
  ellipse(250, 200, 300, 300);

  //this calls the dendrites function
  createDend();

  //this makes the axon
  noFill();
  stroke(#ffff99);
  strokeWeight(20);
  beginShape();
  curveVertex(250, 290);
  curveVertex(250, 290);
  curveVertex(300, 400);
  curveVertex(245, 500);
  curveVertex(250, 600);
  curveVertex(400, 700);
  curveVertex(400, 700);
  endShape();

  //this calls the myelin sheath
  mSheath(295, 420, 268, 460);
  mSheath(245, 500, 235, 550);
  mSheath(250, 600, 290, 635);
  mSheath(338, 665, 390, 695);

  //this is the nucleus
  noStroke();
  fill(179, 230, 255, 127);
  ellipse(250, 200, 50, 50);

  //this is the terminal/synapse
  neuronS(410, 705, 450, 750, 530, 630, 600, 660);
  neuronS(405, 713, 470, 770, 760, 650, 950, 700);
  neuronS(500, 680, 420, 650, 470, 600, 450, 570);
  neuronS(460, 640, 520, 630, 510, 650, 560, 580);
  neuronS(630, 705, 690, 680, 635, 620, 660, 600);
  neuronS(700, 705, 690, 730, 710, 750, 770, 760);
  neuronS(500, 730, 510, 740, 500, 750, 630, 760);
  neuronS(800, 690, 820, 680, 720, 670, 850, 600);

  //this is the dendrite of another synapse
  noFill();
  stroke(#F2EB53);
  armA(1100, 600, 990, 600, 900, 550, 870, 590);
  armA(1050, 600, 1000, 630, 980, 650, 960, 690);
}

//this function creates the myelin sheath
void mSheath(int mx, int my, int mxx, int myy) {
  stroke(179, 230, 255, 127);
  strokeWeight(32);
  line(mx, my, mxx, myy);
}

//assembles the dendrites
void createDend() {
  createM(100, 160, 150, 200, 100, 240);
  createM(90, 155, 180, 160, 190, 40);
  createM(180, 40, 230, 130, 340, 50);
  createM(325, 60, 300, 150, 420, 160);
  createM(403, 163, 350, 200, 410, 250);
  createM(400, 240, 320, 240, 390, 330);
  createM(450, 312, 300, 280, 295, 350);
  createM(290, 360, 230, 290, 140, 350);
  createM(100, 240, 190, 260, 150, 390);

  arm(50, 50, 90, 100, 60, 150, 115, 165);
  arm(75, 100, 90, 80, 65, 60, 120, 50);
  arm(200, 10, 180, 60, 205, 120, 197, 130);
  arm(335, 10, 342, 50, 291, 100, 296, 120);
  arm(330, 50, 350, 50, 370, 40, 400, 60);
  arm(530, 100, 490, 180, 450, 150, 390, 166);
  arm(410, 160, 470, 80, 430, 75, 470, 60);
  arm(520, 290, 450, 250, 480, 265, 370, 230);
  arm(350, 290, 420, 250, 420, 265, 450, 330);
  arm(400, 380, 350, 300, 390, 315, 330, 275);
  arm(130, 400, 110, 350, 200, 315, 220, 270);
  arm(100, 245, 80, 310, 100, 300, 60, 320);
  arm(20, 300, 40, 210, 80, 275, 140, 220);
}

//this creates part of the dendrites that is connected to the head
void createM(int a, int b, int c, int d, int e, int f) {
  //body of the dendrites

  fill(#ffffff);
  stroke(#ffffff);
  beginShape();
  curveVertex(a, b);
  curveVertex(a, b);
  curveVertex(c, d);
  curveVertex(e, f);
  curveVertex(e, f);
  endShape();
}

//this creates the arms of the dendrites
void arm(int a, int b, int c, int d, int e, int f, int g, int h) {
  stroke(#ffff99);
  strokeWeight(4);
  bezier(a, b, c, d, e, f, g, h);
}

//this creates the terminal of the neuron with the synapses
void neuronS(int a, int b, int c, int d, int e, int f, int g, int h) {
  stroke(#ffff99);
  noFill();
  strokeWeight(6);
  bezier(a, b, c, d, e, f, g, h);

  //this creates the terminal buttons
  fill(#F2EB53);
  noStroke();
  ellipse(g, h, 12, 10);
}

//this creates the dendrites of the other neuron
void armA(int a, int b, int c, int d, int e, int f, int g, int h) {
  noFill();
  stroke(#F2EB53);
  bezier(a, b, c, d, e, f, g, h);
}

//this line is from the diagram to the zoom in
void lineA() {
  //this circles the area
  noFill();
  stroke(1.5);
  strokeWeight(2);
  ellipse(865, 597, 50, 40);

  //this is the line that zooms in
  line(840, 590, 600, 510);
  line(880, 580, 949, 509);
}


