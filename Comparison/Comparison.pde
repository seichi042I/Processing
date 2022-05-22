int num = 100;//並べ替える個数




int[] simejiA = new int[num];
int[] simejiB = new int[num];
int[] simejiC = new int[num];
int nA = 0;
int rightA = num-1;
boolean finishA = false;


int nB = 0;
int rightB = num-1;
int leftB = 0;
boolean change = false;
boolean finishB = false;


int rightC;
int leftC;
int[] Split = new int[num];
int Height;
int idx = num/2;
int lastsplit = 1;
boolean finishC = false;


int nD = 0;
int rightD = num-1;
boolean finishD = false;
void setup() {
  size(1000, 1000);
  for (int i = 1; i<num+1; i++) {
    simejiA[i-1] = (height/2/num)*i; 
    simejiB[i-1] = (height/2/num)*i; 
    simejiC[i-1] = (height/2/num)*i;
  }
  for (int i = 0; i<num*2; i++) {
    int a = int(random(0, num));
    int b = int(random(0, num));
    int t = simejiA[a];
    simejiA[a] = simejiA[b];
    simejiA[b] = t;
    t = simejiB[a];
    simejiB[a] = simejiB[b];
    simejiB[b] = t;
    t = simejiC[a];
    simejiC[a] = simejiC[b];
    simejiC[b] = t;
  }
  
  idx = num/2;
  Split[0] = num-1;
  Split[1] = 0;
  rightC = Split[0];
  leftC = Split[1];
  Height = height/4;
  frameRate(60);
  noStroke();
}

void draw() {

  background(0);
  for (int i = 0; i<num; i++) {
    if (i == nA)fill(255, 20, 20);
    if(finishA)fill(255,255,0);
    rect(width/2*i/num, height/2, width/2/num, -simejiA[i]);
    fill(255);
    if (i == nB)fill(255, 20, 20);
    if(finishB)fill(255,255,0);
    rect(width/2*i/num, height, width/2/num, -simejiB[i]);
    fill(255);
    
    for (int j = 0; j<=lastsplit; j++) {
      if (i == Split[j]) {
        fill(255, 255, 0,200);
        rect((width/2*i/num)+(width/2), height/2, width/2/num, height);
      }
    }
    if(i == rightC)fill(255,50,50);
    if(idx == i)fill(50,255,50);
    if (i == leftC)fill(50, 50, 255);
    if(finishC)fill(255,255,0);
    rect((width/2*i/num)+(width/2), height, width/2/num, -simejiC[i]);
    fill(0,255,0);
    rect(width/2,-Height+height,width,3);
    fill(255);
}

  Bubble();
  
  Shaker();
  //quic
  SortView();
}
