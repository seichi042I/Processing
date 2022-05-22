class Render {
  ArrayList<Arwing> arwing = new ArrayList<Arwing>();
  ArrayList<Cube> cube = new ArrayList<Cube>();

  Render() {
  }

  void Rendering() {
    for (int i = 0; i<arwing.size(); i++) {
      arwingRender(arwing.get(i));
    }
    for (int i = 0; i<cube.size(); i++) {
      CubeRender(cube.get(i));
    }
  }

  void AddObject(Arwing a) {
    arwing.add(a);
  }

  void AddObject(Cube c) {
    cube.add(c);
  }

  void arwingRender(Arwing arwing) {
    for (int i = 0; i<arwing.facenum; i++) {
      Vector3 ray = V3Add(arwing.face(arwing.Z[i], 0), arwing.pos);//視点から頂点のベクトル
      float abs = sqrt(sq(ray.x)+sq(ray.y)+sq(ray.z));
      ray = new Vector3(ray.x/abs, ray.y/abs, ray.z/abs);//正規化
      float dot = V3Dot(ray, arwing.normal[arwing.Z[i]]);//法線との内積

      if (dot<0) ArwingProspectivProjection(i, dot, arwing);//透視投影
    }

    fill(255);
  }

  void CubeRender(Cube cube) {
    for (int i = 0; i<6; i++) {
      Vector3 ray = V3Add(cube.face(i, 0), cube.pos);//視点から頂点のベクトル
      float abs = sqrt(sq(ray.x)+sq(ray.y)+sq(ray.z));
      ray = new Vector3(ray.x/abs, ray.y/abs, ray.z/abs);//正規化
      float dot = V3Dot(ray, cube.normal[i]);//法線との内積
      
      if (dot<0)CubePPrj(i, cube,dot);
    }
  }



  void ArwingColor(int i, float dot, Arwing arwing) {
    fill(255*-dot+50);
    if (arwing.Z[i]==9)fill(255, green, 0);
    if (arwing.Z[i]>=13&&arwing.Z[i]<=18)fill(50*-dot, 100*-dot, 200*-dot);
    if (arwing.Z[i]>=20&&arwing.Z[i]<=25)fill(50*-dot, 100*-dot, 200*-dot);
  }

  void ArwingProspectivProjection(int i, float dot, Arwing arwing) {
    beginShape();
    ArwingColor(i, dot, arwing);
    for (int j = 0; j<3; j++) {
      //透視投影
      float X = arwing.face(arwing.Z[i], j).x+arwing.pos.x;
      float Y = arwing.face(arwing.Z[i], j).y+arwing.pos.y;
      float Z = arwing.face(arwing.Z[i], j).z+arwing.pos.z;
      if (Z<0)Z = 1;
      vertex(1/Z*X*width/2, 1/Z*-Y*height/2);
    }
    endShape(CLOSE);
  }





  void CubeColor(int i,float dot) {
    println(dot);
    if (i==0)fill(255*-dot,255*-dot,255*-dot);
    if (i==1)fill(255*-dot, 127*-dot, 0);
    if (i==2)fill(255*-dot, 0, 0);
    if (i==3)fill(255*-dot, 255*-dot, 0);
    if (i==4)fill(0, 0, 255*-dot);
    if (i==5)fill(0, 255*-dot, 0);
  }

  void CubePPrj(int i, Cube cube,float dot) {
    CubeColor(i,dot);
    beginShape();
    for (int j = 0; j<4; j++) {
      float X = cube.face(i, j).x+cube.pos.x;
      float Y = cube.face(i, j).y+cube.pos.y;
      float Z = cube.face(i, j).z+cube.pos.z;
      if (Z<0)Z = 1;
      vertex(1/Z*X*width/2, 1/Z*Y*height/2);
    }
    endShape(CLOSE);
  }
}
