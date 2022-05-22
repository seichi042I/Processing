class Position {
    int x, y;
    boolean success = false;
    Position(int _x, int _y) {
      x = _x;
      y = _y;
    }

    int x() {
      return x;
    }
    int y() {
      return y;
    }

    void up() {
      success = false;
      if (y<3)return ;
      if (road[x][y-2])return ;
      b.add(new Position(this.x,this.y));
      road[x][y-1] = true;
      road[x][y-2] = true;
      y -= 2;
      success = true;
    }
    void right() {
      success = false;
      if (x>len-3)return ;
      if (road[x+2][y])return ;
      b.add(new Position(this.x,this.y));
      road[x+1][y] = true;
      road[x+2][y] = true;
      x += 2;
      success = true;
    }
    void down() {
      success = false;
      if (y>len-3)return ;
      if (road[x][y+2])return ;
      b.add(new Position(this.x,this.y));
      road[x][y+1] = true;
      road[x][y+2] = true;
      y += 2;
      success = true;
    }
    void left() {
      success = false;
      if (x<3)return ;
      if (road[x-2][y])return ;
      b.add(new Position(this.x,this.y));
      road[x-1][y] = true;
      road[x-2][y] = true;
      x -= 2;
      success = true;
    }
  }
