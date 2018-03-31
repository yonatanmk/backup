let inventory = [
  ['LA-LG-STICKER', 300, 'Large Sticker', 'images/la-large-sticker-256px.png', 'Show your Launch pride by plastering your laptop with these beautiful die-cut stickers.'],
  ['LA-SM-STICKER', 200, 'Small Sticker', 'images/la-small-sticker-128px.png', 'It\'s a tiny Launch sticker. How cute!'],
  ['LA-T-SHRIT', 50, 'T-Shirt', 'images/la-t-shirt-200px.png', '100% Cotton. Makes a great gift.']
];

// your code, here
class Product {
  constructor(id, quantity, name, url, description) {
    this.id = id;
    this.quantity = quantity;
    this.name = name;
    this.url = url;
    this.description = description;
  }

  sell () {
    return this.quantity -= 1;
  }

  toHtml () {
    return `<div class="product">\n
    <h1>Product Name: ${this.name}</h1>\n
    <h5>${this.quantity} In Stock</h5>\n
    <img src="${this.url}" alt="Large Launch Academy Sticker" />
    <h3>Description</h3>\n
    <p>${this.description}</p>\n
    </div>\n`;
  }
}

let products = inventory.map(function(item) {
  return new Product(...item);
});

element = document.getElementById('all-products');

products.forEach((product) => {
  element.innerHTML += product.toHtml();
});

//let a = new Product('a', 2, 'b', 'g', 'tntentrn')
