Arwing arwing = new Arwing(new Vector3(1,-1,9));//アーウィン
Cube cube = new Cube(new Vector3(0,10,10),4);//キューブ
Render render = new Render();//描画する処理をまとめたやつ
int t = 0;
int green = 255;
void setup(){
  size(800,800);
  render.AddObject(arwing);//描画するやつにアーウィンを突っ込む
  render.AddObject(cube);//描画するやつにキューブを突っ込む
  cube.RotateY(radians(35));
  
  arwing.RotateX(radians(140));
  arwing.RotateY(radians(-50));
  noStroke();
}

void draw(){
  if(t%5==0)green *= -1;//点滅させる処理
  background(0);
  
  translate(width/2,height/2);
  arwing.RotateX(radians(-1));//アーウィンをY軸で回す。
  arwing.RotateY(radians(1));
  arwing.RotateZ(radians(1));
  //キューブを回す
  cube.RotateX(radians(-5));
  cube.RotateY(radians(-5));
  cube.RotateZ(radians(-5));
  //キューブを円を描くように移動させる。
  cube.pos.x=10*cos(radians(t));
  cube.pos.y=10*sin(radians(t));
  //描画する
  render.Rendering();
  
  t++;
}
