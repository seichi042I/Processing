int OddIntRandom(int min, int max) {
  int num = int(random(min, max));
  while (num%2 == 0) {
    num = int(random(min, max));
  }
  return num;
}

void way(int n) {
  switch(n) {
  case 0:
    p.up();
    if (!p.success)p.right();
    if (!p.success)p.down();
    if (!p.success)p.left();
    break;
  case 1:
    p.right();
    if (!p.success)p.down();
    if (!p.success)p.left();
    if (!p.success)p.up();
    break;
  case 2:
    p.down();
    if (!p.success)p.left();
    if (!p.success)p.up();
    if (!p.success)p.right();
    break;
  case 3:
    p.left();
    if (!p.success)p.up();
    if (!p.success)p.right();
    if (!p.success)p.down();
    break;
  }
}

void dig() {

  way(int(random(0, 3.9)));

  if (!p.success) {
    if (b.size()!=1) {
      b.remove(b.size()-1);
      p.x = b.get(b.size()-1).x;
      p.y = b.get(b.size()-1).y;
    }
    println(b.size());
  }
}
