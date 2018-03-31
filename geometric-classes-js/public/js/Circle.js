class Circle {
  constructor (radius, x, y) {
    this.radius = radius;
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

  diameter() {
    return this.radius * 2;
  }

  area () {
    return Math.PI * this.radius ** 2;
  }

  perimeter () {
    return 2 * Math.PI * this.radius;
  }
}
