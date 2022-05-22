class Cube{
  Vector3 pos;
  Vector3 v[] = new Vector3[8];
  Vector3 f[];
  Vector3 normal[] = new Vector3[6];
  float size;
  Cube(Vector3 _pos,float _size){
    pos = _pos;
    size = _size;
    //頂点の定義
    v[0] = new Vector3(-size/2,+size/2,-size/2);
    v[1] = new Vector3(+size/2,+size/2,-size/2);
    v[2] = new Vector3(+size/2,-size/2,-size/2);
    v[3] = new Vector3(-size/2,-size/2,-size/2);
    v[4] = new Vector3(-size/2,-size/2,+size/2);
    v[5] = new Vector3(-size/2,+size/2,+size/2);
    v[6] = new Vector3(+size/2,+size/2,+size/2);
    v[7] = new Vector3(+size/2,-size/2,+size/2);
    //法線の計算
    Normal();
  }
  
  void RotateX(float theata){
    //線形変換
    float sin = sin(theata);
    float cos = cos(theata);
    
    for(int i = 0;i<8;i++){
      float nextz = cos*v[i].z-sin*v[i].y;
      float nexty = sin*v[i].z+cos*v[i].y;
      
      v[i].z = nextz;
      v[i].y = nexty;
    }
    //法線の計算
    Normal();
  }
  
  void RotateY(float theata){
    //線形変換
    float sin = sin(theata);
    float cos = cos(theata);
    
    for(int i = 0;i<8;i++){
      float nextx = cos*v[i].x-sin*v[i].z;
      float nextz = sin*v[i].x+cos*v[i].z;
      
      v[i].x = nextx;
      v[i].z = nextz;
    }
    //法線の計算
    Normal();
  }
  
  void RotateZ(float theata){
    //線形変換
    float sin = sin(theata);
    float cos = cos(theata);
    
    for(int i = 0;i<8;i++){
      float nextx = cos*v[i].x-sin*v[i].y;
      float nexty = sin*v[i].x+cos*v[i].y;
      
      v[i].x = nextx;
      v[i].y = nexty;
    }
    //法線の計算
    Normal();
  }
  
  void Normal(){//法線の計算
    for(int i = 0;i<6;i++){
      //面のベクトル
      Vector3 a = V3Sub(this.face(i,1),this.face(i,0));
      Vector3 b = V3Sub(this.face(i,2),this.face(i,0));
      //外積の計算
      normal[i] = new Vector3(a.y*b.z-a.z*b.y,a.z*b.x-a.x*b.z,a.x*b.y-a.y*b.x);
      //正規化
      float abs = sqrt(sq(normal[i].x)+sq(normal[i].y)+sq(normal[i].z));
      normal[i] = new Vector3(normal[i].x/abs,normal[i].y/abs,normal[i].z/abs);
    }
  }
  
  
  Vector3 face(int f, int n) {
    //前面
    if (f==0&&n==0)return v[0];
    if (f==0&&n==1)return v[1];
    if (f==0&&n==2)return v[2];
    if (f==0&&n==3)return v[3];
    //左側面
    if (f==1&&n==0)return v[5];
    if (f==1&&n==1)return v[0];
    if (f==1&&n==2)return v[3];
    if (f==1&&n==3)return v[4];
    //背面
    if (f==2&&n==0)return v[6];
    if (f==2&&n==1)return v[5];
    if (f==2&&n==2)return v[4];
    if (f==2&&n==3)return v[7];
    //右側面
    if (f==3&&n==0)return v[1];
    if (f==3&&n==1)return v[6];
    if (f==3&&n==2)return v[7];
    if (f==3&&n==3)return v[2];
    //上面
    if (f==4&&n==0)return v[5];
    if (f==4&&n==1)return v[6];
    if (f==4&&n==2)return v[1];
    if (f==4&&n==3)return v[0];
    //底面
    if (f==5&&n==0)return v[3];
    if (f==5&&n==1)return v[2];
    if (f==5&&n==2)return v[7];
    if (f==5&&n==3)return v[4];

    return new Vector3(0, 0, 0);
  }
}
