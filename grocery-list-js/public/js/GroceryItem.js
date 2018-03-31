class GroceryItem {
  constructor (name, quantity) {
    this.name = name;
    this.quantity = quantity||1;
  }

  toString () {
    //console.log(`(${this.quantity}) ${this.name}`);
    return `(${this.quantity}) ${this.name}`;
  }
}
