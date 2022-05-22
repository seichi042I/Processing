void SortView() {
  if (Split[0]==Split[1]) {//区切りがなくなれば終了
    finishC = true;
  } else if (simejiC[leftC]>Height) {//基準値より小さいものが見つかるまで左から右にずらす。(1)
    leftC++;
  } else if (simejiC[rightC]<Height) {//基準値より大きいものが見つかるまで右から左にずらす。(2)
    rightC--;
  } else if (rightC!=leftC) {//(3)
    //左からの探索と右からの探索が衝突するまで(1)~(3)を繰り返す。
    int t = simejiC[leftC];         
    simejiC[leftC] = simejiC[rightC];
    simejiC[rightC] = t;
    
    if (leftC==idx)idx=rightC;
    else if (rightC==idx)idx=leftC;
    
  } else if (Split[0]!=leftC) {//右端でなければ
    //左からの探索と右からの探索が衝突したとき、もう入れ替えるものがないから
    //右側に区切りをつけて次の範囲を探索する。
    Split[++lastsplit] = leftC;
    rightC = Split[0];
    idx = int(random(leftC+1,rightC));
    Height = simejiC[idx];
  } else {//右端なので区切りはつけず範囲を一つ前の範囲の左側にする。
    Split[0] = leftC-1;
    rightC = Split[0];
    leftC = Split[lastsplit];
    if (rightC==Split[lastsplit])leftC = Split[--lastsplit];
    idx = int(random(leftC+1,rightC));
    Height = simejiC[idx];
  }
}
