int len = 61;//21×21

boolean[][] road = new boolean[len][len];
Position p;
ArrayList<Position> b = new ArrayList<Position>();
float bs = 1100/len;
int s = int(bs*len);
void settings(){
  size(s,s);
}
void setup() {
  for (int i = 0; i<len; i++) {
    for (int j = 0; j<len; j++) {
      road[i][j] = false;
    }
  }
  p = new Position(OddIntRandom(0, len), OddIntRandom(0, len));
  road[p.x][p.y] = true;
  frameRate(90);
}

void draw() {
  background(0);
  do {

    dig();

    if (!p.success&&b.size() == 1) {
      noLoop();
      noStroke();
      for (int i = 0; i<len; i++) {
        for (int j = 0; j<len; j++) {
          fill(200,160,80);
          if (!road[i][j])rect(i*bs, j*bs, bs, bs);
          fill(255);
        }
      }
      println(bs);
      break;
    }
  } while (!p.success);
  for (int i = 0; i<len; i++) {
    for (int j = 0; j<len; j++) {
      if (road[i][j])rect(i*bs, j*bs, bs, bs);
    }
  }
  fill(255, 100, 100);
  textSize(bs/2);
  for (int i = 0; i<b.size(); i++) {
    text(i, bs*b.get(i).x+bs/3, bs*b.get(i).y+bs/2);
  }
  fill(255);
}
