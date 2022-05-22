//ユーザ定義~~~~~~~~~~~~~~~~~~~~|
int Length = 5;//一辺の長さ
int prim = 0;//開始点
int dropnum = 40;//線を消す個数
//______________________________|
//何かキーを押すと1ステップ実行
//押しっぱなしで連続
//各ノードをクリックするとそこから開始点までの最短経路を表示

int nodenum = Length*Length;
int sidesnum = 0;

int len;
int weight = 90/Length;

int node[] = new int[nodenum];
int sides[][] = new int[nodenum][8];
boolean route[][] = new boolean[nodenum][8];

int indx[] = {1,Length+1,Length,Length-1,-1,-Length-1,-Length,-Length+1};

Node nd[] = new Node[nodenum];
float r;
float d;
void setup() {
  size(800, 800);
  int ad = -2;
  for (int i = 0; i<Length-1; i++) {
    ad+=8;
    sidesnum += ad;
  }

  r = 300/(Length*2);
  d = (height-r-r)/(Length-1);
  len = int(d/2);

  SetWeight();
  SetPosition();
  drop();
  textAlign(CENTER);
  frameRate(60);
  nd[num].weight = 0;
}

void draw() {
  
  DRAW();
  
  if(rtidx!=prim&&finish)SetRoute();
}

void mousePressed(){
  int a = int(int((mouseY+d/2)/d)*Length+(mouseX+d/2)/d);
  rtidx = a;
  for(int i = 0;i<nodenum;i++){
    boolean ar[] = {false,false,false,false,false,false,false,false};
    route[i] = ar;
  }
}

void keyPressed(){
  if(!finish){
  Research();
  SetNum();
  }
  
}

void DRAW(){
  background(100);
  for (int i = 0; i<nodenum; i++) {
    fill(255);
    strokeWeight(weight);
    if (sides[i][0]>0) {
      if(route[i][0])stroke(255,0,0);
      line(nd[i].x, nd[i].y, nd[i].x+len, nd[i].y);
      text(sides[i][0], nd[i].x+len/2, nd[i].y);
      stroke(0);
    }
    if (sides[i][1]>0) {
      if(route[i][1])stroke(255,0,0);
      line(nd[i].x, nd[i].y, nd[i].x+len, nd[i].y+len);
      text(sides[i][1], nd[i].x+len/2, nd[i].y+len/2);
      stroke(0);
    }
    if (sides[i][2]>0) {
      if(route[i][2])stroke(255,0,0);
      line(nd[i].x, nd[i].y, nd[i].x, nd[i].y+len);
      text(sides[i][2], nd[i].x, nd[i].y+len/2);
      stroke(0);
    }
    if (sides[i][3]>0){
      if(route[i][3])stroke(255,0,0);
      line(nd[i].x, nd[i].y, nd[i].x-len, nd[i].y+len);
      text(sides[i][3], nd[i].x-len/2, nd[i].y+len/2);
      stroke(0);
    }
    if (sides[i][4]>0) {
      if(route[i][4])stroke(255,0,0);
      line(nd[i].x, nd[i].y, nd[i].x-len, nd[i].y);
      text(sides[i][4], nd[i].x-len/2, nd[i].y);
      stroke(0);
    }
    if (sides[i][5]>0) {
      if(route[i][5])stroke(255,0,0);
      line(nd[i].x, nd[i].y, nd[i].x-len, nd[i].y-len);
      text(sides[i][5], nd[i].x-len/2, nd[i].y-len/2);
      stroke(0);
    }
    if (sides[i][6]>0) {
      if(route[i][6])stroke(255,0,0);
      line(nd[i].x, nd[i].y, nd[i].x, nd[i].y-len);
      text(sides[i][6], nd[i].x, nd[i].y-len/2);
      stroke(0);
    }
    if (sides[i][7]>0) {
      if(route[i][7])stroke(255,0,0);
      line(nd[i].x, nd[i].y, nd[i].x+len, nd[i].y-len);
      text(sides[i][7], nd[i].x+len/2, nd[i].y-len/2);
      stroke(0);
    }
    
    if(i==num)stroke(255,0,0);
    
    strokeWeight(3);
    fill(255);
    if(nd[i].RF)fill(0,255,0);
    if(i==prim)fill(0,0,255);
    ellipse(nd[i].x, nd[i].y, r*2, r*2);
    fill(0);
    text(nd[i].weight, nd[i].x, nd[i].y);
    stroke(0);
  }
}
