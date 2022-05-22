static class Vector3{
  float x,y,z;
  Vector3(float _x,float _y,float _z){
    x = _x;
    y = _y;
    z = _z;
  }
  
}
Vector3 V3Add(Vector3 a,Vector3 b){
  float X = a.x+b.x;
  float Y = a.y+b.y;
  float Z = a.z+b.z;
  
  return new Vector3(X,Y,Z);
}

Vector3 V3Sub(Vector3 a,Vector3 b){
  Vector3 result = new Vector3(0,0,0);
    result.x = a.x-b.x;
    result.y = a.y-b.y;
    result.z = a.z-b.z;
    
    return result;
}

float V3Dot(Vector3 a,Vector3 b){
  return a.x*b.x+a.y*b.y+a.z*b.z;
}
