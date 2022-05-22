void SetWeight(){
  for (int i = 0; i<nodenum; i++) {
    boolean r[] = {false,false,false,false,false,false,false,false};
    route[i] = r;
    int edge[] = {int(random(1,20)),
                  int(random(1,20)),
                  int(random(1,20)),
                  int(random(1,20)),
                  int(random(1,20)), 
                  int(random(1,20)),
                  int(random(1,20)),
                  int(random(1,20))};
    sides[i]=edge;
    if (i/Length==0) {
      sides[i][5] = 0;
      sides[i][6] = 0;
      sides[i][7] = 0;
    }

    if (i/Length==(Length-1)) {
      sides[i][1] = 0;
      sides[i][2] = 0;
      sides[i][3] = 0;
    }

    if (i%Length==0) {
      sides[i][3] = 0;
      sides[i][4] = 0;
      sides[i][5] = 0;
    }
    if (i%Length==(Length-1)) {
      sides[i][0] = 0;
      sides[i][1] = 0;
      sides[i][7] = 0;
    }
    for(int j = 4;j<8;j++){
      if(sides[i][j]!=0){
        if(j==4)sides[i][4]=sides[i-1][0];
        if(j==5)sides[i][5]=sides[i-Length-1][1];
        if(j==6)sides[i][6]=sides[i-Length][2];
        if(j==7)sides[i][7]=sides[i-Length+1][3];
      }
    }
    int ran = int(random(0, 8));
    while (sides[i][ran]==0) {
      ran = int(random(0, 8));
    }
  }
}

void SetPosition(){
  for (int i = 0; i<Length; i++) {
    for (int j = 0; j<Length; j++) {
      nd[Length*j+i] = new Node(i*d+r, j*d+r);
    }
  }
}

void drop() {
  if (dropnum>sidesnum)dropnum = sidesnum;
  int ranA = int(random(0, nodenum));
  int ranB = int(random(0, 8));
  for (int i = 0; i<dropnum; i++) {
    while (sides[ranA][ranB]==0||ranA==0) {
      ranA = int(random(0, nodenum));
      ranB = int(random(0, 8));
    }
    switch(ranB) {
    case 0:
      sides[ranA][0] = 0;
      sides[ranA+1][4] = 0;
      break;
    case 1:
      sides[ranA][1] = 0;
      sides[ranA+Length+1][5] = 0;
      break;
    case 2:
      sides[ranA][2] = 0;
      sides[ranA+Length][6] = 0;
      break;
    case 3:
      sides[ranA][3] = 0;
      sides[ranA+Length-1][7] = 0;
      break;
    case 4:
      sides[ranA][4] = 0;
      sides[ranA-1][0] = 0;
      break;
    case 5:
      sides[ranA][5] = 0;
      sides[ranA-Length-1][1] = 0;
      break;
    case 6:
      sides[ranA][6] = 0;
      sides[ranA-Length][2] = 0;
      break;
    case 7:
      sides[ranA][7] = 0;
      sides[ranA-Length+1][3] = 0;
      break;
    }
  }
}
