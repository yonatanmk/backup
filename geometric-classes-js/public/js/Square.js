class Square {
  constructor (side, x, y) {
    this.side = side;
    if (x) {
      this.x = x;
    }
    else {
      this.x = 0;
    }
    if (y) {
      this.y = y;
    }
    else {
      this.y = 0;
    }
  }

  area () {
    return this.side ** 2;
  }

  perimeter () {
    return 4 * this.side;
  }

  contains_point (x, y) {
    if (this.contains_x(x) && this.contains_y(y)) {
      return true;
    }
    else {
      return false;
    }
  }

  contains_x (x) {
    if (x > (this.x - this.side / 2) && x < this.x + this.side / 2) {
      return true;
    }
    else {
      return false;
    }
  }

  contains_y (y) {
    if (y > (this.y - this.side / 2) && x < (this.x + this.side / 2)) {
      return true;
    }
    else {
      return false;
    }
  }
}
