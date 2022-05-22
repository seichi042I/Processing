int num = prim;
int rtidx = nodenum-1;
boolean finish = false;
void Research() {
  for (int j = 0; j<8; j++) {
    if (sides[num][j]!=0) {
      if (!nd[num+indx[j]].RF){
        if(nd[num+indx[j]].weight>nd[num].weight+sides[num][j])
        nd[num+indx[j]].weight = nd[num].weight+sides[num][j];
      }
    }
  }
  nd[num].RF=true;
}
void SetNum() {
  finish = true;
  int i = 0;
  int next = 0;
  while (nd[i].RF) {
    if (i>=nodenum-1)return;
    next = ++i;
  }
  for (i = 0; i<nodenum; i++) {
    if (!nd[i].RF) {
      if (nd[next].weight>nd[i].weight)next = i;
      finish = false;
    }
  }
  num = next;
}

void SetRoute() {
  boolean isolation = true;
  int i = -1;
  int min = 0;
  println(rtidx);
  while (i<7) {
    if (sides[rtidx][++i]!=0&&nd[rtidx].weight<9999) {
      isolation = false;
      if (nd[rtidx].weight>nd[rtidx+indx[i]].weight)
        if(abs(nd[rtidx].weight-nd[rtidx+indx[i]].weight)==sides[rtidx][i])min = i;
    }
  }
  if(isolation)return;
  route[rtidx][min] = true;
  rtidx += indx[min];
  min = (min+4)%8;
  route[rtidx][min] = true;
}
