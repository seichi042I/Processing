void Shaker(){
  //shaker
  if (!finishB) {
    if ((rightB-leftB)%2==(num+1)%2) {
      if (nB<rightB) {
        MoveR();
        nB++;
      }
      else if(change){
        rightB--;
        MoveL();
        nB--;
        change = false;
      }
      else{
        finishB = true;
      }
    }
    else{
      if (nB>leftB) {
        MoveL();
        nB--;
      }
      else if(change){
        leftB++;
        MoveR();
        nB++;
        change = false;
      }
      else{
        finishB = true;
      }
    }
  }
}
