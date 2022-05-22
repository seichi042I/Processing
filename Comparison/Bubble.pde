void Bubble(){
  //bubble
  if (rightA!=0) {
    if (nA==rightA) {
      nA = 0;
      rightA--;
    }
    if (simejiA[nA]<simejiA[nA+1]) {
      int t = simejiA[nA];
      simejiA[nA] = simejiA[nA+1];
      simejiA[nA+1] = t;
    }
    nA++;
  }
  else{
    finishA = true;
  }
}
