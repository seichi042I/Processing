class Arwing{
  int facenum = 34;//面の数
  int vnum = 23;//頂点の数
  Vector3 v[] = new Vector3[vnum];
  Vector3 pos;
  Vector3 normal[] = new Vector3[facenum];
  
  int Z[] = new int[facenum];
  Arwing(Vector3 _pos){
    pos = _pos;
    //頂点の定義
    //本体
    v[0] = new Vector3(0,0.25,7.5);
    v[1] = new Vector3(-0.3,0.75,1);
    v[2] = new Vector3(0.3,0.75,1);
    v[3] = new Vector3(-0.3,1.5,-1.5);
    v[4] = new Vector3(0.3,1.5,-1.5);
    v[5] = new Vector3(0,1,-2.5);
    v[6] = new Vector3(-1.5,0,-1.5);
    v[7] = new Vector3(1.5,0,-1.5);
    v[8] = new Vector3(0,-0.7,1.5);
    //左の青いやつ
    v[9] = new Vector3(-2,-0.7,2);
    v[10] = new Vector3(-2,1,-1);
    v[11] = new Vector3(-3,2,-4);
    v[12] = new Vector3(-2.5,0,-1.5);
    //右青いやつ
    v[13] = new Vector3(2,-0.7,2);
    v[14] = new Vector3(2,1,-1);
    v[15] = new Vector3(3,2,-4);
    v[16] = new Vector3(2.5,0,-1.5);
    //左翼
    v[17] = new Vector3(-3,0,-1.5);
    v[18] = new Vector3(-5,-1.5,-8);
    v[19] = new Vector3(-2.9,-0.5,-2);
    //右翼
    v[20] = new Vector3(3,0,-1.5);
    v[21] = new Vector3(5,-1.5,-8);
    v[22] = new Vector3(2.9,-0.5,-2);
    //法線の計算と面の表示順番の計算
    Zsort();
  }
  
  void RotateX(float theata){
    //線形変換
    float sin = sin(theata);
    float cos = cos(theata);
    
    for(int i = 0;i<vnum;i++){
      float nextz = cos*v[i].z-sin*v[i].y;
      float nexty = sin*v[i].z+cos*v[i].y;
      
      v[i].z = nextz;
      v[i].y = nexty;
    }
    //法線の計算と面の表示順番の計算
    Zsort();
    
  }
  
  void RotateY(float theata){
    //線形変換
    float sin = sin(theata);
    float cos = cos(theata);
    
    for(int i = 0;i<vnum;i++){
      float nextx = cos*v[i].x-sin*v[i].z;
      float nextz = sin*v[i].x+cos*v[i].z;
      
      v[i].x = nextx;
      v[i].z= nextz;
    }
    //法線の計算と面の表示順番の計算
    Zsort();
  }
  
  void RotateZ(float theata){
    //線形変換
    float sin = sin(theata);
    float cos = cos(theata);
    
    for(int i = 0;i<vnum;i++){
      float nextx = cos*v[i].x-sin*v[i].y;
      float nexty = sin*v[i].x+cos*v[i].y;
      
      v[i].x = nextx;
      v[i].y = nexty;
    }
    
    Zsort();
  }
  
  void Zsort(){//法線の計算と面の表示順番の計算
    Vector3 G[] = new Vector3[facenum];
    //法線の計算
    for(int i = 0;i<facenum;i++){
      Vector3 a = V3Sub(this.face(i,1),this.face(i,0));
      Vector3 b = V3Sub(this.face(i,2),this.face(i,0));
      normal[i] = new Vector3(a.y*b.z-a.z*b.y,a.z*b.x-a.x*b.z,a.x*b.y-a.y*b.x);
      float abs = sqrt(sq(normal[i].x)+sq(normal[i].y)+sq(normal[i].z));
      normal[i] = new Vector3(normal[i].x/abs,normal[i].y/abs,normal[i].z/abs);
      //三角形の重心
      Vector3 g = new Vector3((face(i,0).x+face(i,1).x+face(i,2).x)/3,
                              (face(i,0).y+face(i,1).y+face(i,2).y)/3,
                              (face(i,0).z+face(i,1).z+face(i,2).z)/3);
      G[i] = g;
    }
    
    int maxnum = 0;//最大値を入れる変数(Ｚ座標が最も大きいもの)
    for(int i = 0;i<facenum;i++){
      for(int j = 1;j<facenum;j++){
        if(G[maxnum].z<G[j].z)maxnum = j;
      }
      //Ｚ座標が大きいもの(奥にある)の順に格納する
      Z[i] = maxnum;
      G[maxnum].z = -10;//格納済みであることの目印
      maxnum = 0;//初期化
    }
  }
  
  Vector3 face(int f,int n){
    if(f==0&&n==0)return v[0];
    if(f==0&&n==1)return v[2];
    if(f==0&&n==2)return v[1];
    
    if(f==1&&n==0)return v[1];
    if(f==1&&n==1)return v[2];
    if(f==1&&n==2)return v[3];
    
    if(f==2&&n==0)return v[3];
    if(f==2&&n==1)return v[4];
    if(f==2&&n==2)return v[5];
    
    if(f==3&&n==0)return v[0];
    if(f==3&&n==1)return v[1];
    if(f==3&&n==2)return v[6];
    
    if(f==4&&n==0)return v[0];
    if(f==4&&n==1)return v[7];
    if(f==4&&n==2)return v[2];
    
    if(f==5&&n==0)return v[6];
    if(f==5&&n==1)return v[1];
    if(f==5&&n==2)return v[3];
    
    if(f==6&&n==0)return v[2];
    if(f==6&&n==1)return v[7];
    if(f==6&&n==2)return v[4];
    
    if(f==7&&n==0)return v[6];
    if(f==7&&n==1)return v[3];
    if(f==7&&n==2)return v[5];
    
    if(f==8&&n==0)return v[4];
    if(f==8&&n==1)return v[7];
    if(f==8&&n==2)return v[5];
    
    if(f==9&&n==0)return v[5];
    if(f==9&&n==1)return v[7];
    if(f==9&&n==2)return v[6];
    
    if(f==10&&n==0)return v[8];
    if(f==10&&n==1)return v[6];
    if(f==10&&n==2)return v[7];
    
    if(f==11&&n==0)return v[6];
    if(f==11&&n==1)return v[8];
    if(f==11&&n==2)return v[0];
    
    if(f==12&&n==0)return v[8];
    if(f==12&&n==1)return v[7];
    if(f==12&&n==2)return v[0];
    
    
    //左青いやつ
    if(f==13&&n==0)return v[9];
    if(f==13&&n==1)return v[6];
    if(f==13&&n==2)return v[10];
    
    if(f==14&&n==0)return v[10];
    if(f==14&&n==1)return v[6];
    if(f==14&&n==2)return v[11];
    
    if(f==15&&n==0)return v[9];
    if(f==15&&n==1)return v[10];
    if(f==15&&n==2)return v[11];
    
    if(f==16&&n==0)return v[9];
    if(f==16&&n==1)return v[12];
    if(f==16&&n==2)return v[6];
    
    if(f==17&&n==0)return v[6];
    if(f==17&&n==1)return v[12];
    if(f==17&&n==2)return v[11];
    
    if(f==18&&n==0)return v[9];
    if(f==18&&n==1)return v[11];
    if(f==18&&n==2)return v[12];
    
    if(f==19&&n==0)return v[2];
    if(f==19&&n==1)return v[4];
    if(f==19&&n==2)return v[3];
    
    //右青いやつ
    if(f==20&&n==0)return v[13];
    if(f==20&&n==1)return v[14];
    if(f==20&&n==2)return v[7];
    
    if(f==21&&n==0)return v[14];
    if(f==21&&n==1)return v[15];
    if(f==21&&n==2)return v[7];
    
    if(f==22&&n==0)return v[13];
    if(f==22&&n==1)return v[15];
    if(f==22&&n==2)return v[14];
    
    if(f==23&&n==0)return v[13];
    if(f==23&&n==1)return v[7];
    if(f==23&&n==2)return v[16];
    
    if(f==24&&n==0)return v[16];
    if(f==24&&n==1)return v[7];
    if(f==24&&n==2)return v[15];
    
    if(f==25&&n==0)return v[13];
    if(f==25&&n==1)return v[16];
    if(f==25&&n==2)return v[15];
    
    //左翼
    if(f==26&&n==0)return v[17];
    if(f==26&&n==1)return v[6];
    if(f==26&&n==2)return v[18];
    
    if(f==27&&n==0)return v[6];
    if(f==27&&n==1)return v[17];
    if(f==27&&n==2)return v[19];
    
    if(f==28&&n==0)return v[17];
    if(f==28&&n==1)return v[18];
    if(f==28&&n==2)return v[19];
    
    if(f==29&&n==0)return v[18];
    if(f==29&&n==1)return v[6];
    if(f==29&&n==2)return v[19];
    
    //右翼
    if(f==30&&n==0)return v[7];
    if(f==30&&n==1)return v[20];
    if(f==30&&n==2)return v[21];
    
    if(f==31&&n==0)return v[7];
    if(f==31&&n==1)return v[22];
    if(f==31&&n==2)return v[20];
    
    if(f==32&&n==0)return v[7];
    if(f==32&&n==1)return v[21];
    if(f==32&&n==2)return v[22];
    
    if(f==33&&n==0)return v[20];
    if(f==33&&n==1)return v[22];
    if(f==33&&n==2)return v[21];
    return new Vector3(0,0,0);
  }
}
