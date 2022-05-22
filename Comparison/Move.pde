void MoveR() {
  if (simejiB[nB]<simejiB[nB+1]) {
    int t = simejiB[nB];
    simejiB[nB] = simejiB[nB+1];
    simejiB[nB+1] = t;
    change = true;
  }
}
void MoveL() {
  if (simejiB[nB]>simejiB[nB-1]) {
    int t = simejiB[nB];
    simejiB[nB] = simejiB[nB-1];
    simejiB[nB-1] = t;
    change = true;
  }
}
