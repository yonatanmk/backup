// your code, here
class Rectangle {
  constructor(width, height) {
    this.width = width;
    if (height === undefined) {
      this.height = width;
    }
    else {
      this.height = height;
    }
  }

  area() {
    return this.height * this.width;
  }
}
