class GroceryList {
  constructor (title, date) {
    this.title = title;
    this.date = date;
    this.items = [];
  }

  addItem (item) {
    this.items.push(item);
  }

  toHTML () {
    let htmlGroceryList = [];
    htmlGroceryList.push(`<h1>${this.title}</h1>`);
    htmlGroceryList.push(`<h3>${this.date}</h3>`);
    htmlGroceryList.push('<ul id="groceryList">');
    for (let item of this.items) {
      htmlGroceryList.push(`<li>${item.toString()}</li>`);
    }
    htmlGroceryList.push('</ul>');
    return htmlGroceryList.join('\n');
  }
}
