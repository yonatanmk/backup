//Exceeds Expectation Part 1 Code Here
fetch('/groceries.json')
  .then(response => {
    if (response.ok) {
      return response;
    } else {
      let errorMessage = `${response.status} (${response.statusText})`,
          error = new Error(errorMessage);
      throw(error);
    }
  })
  .then(response => response.json())
  .then(body => {
    //console.log(body);
    let groceryList = new GroceryList('Wegmans', '2016/12/09');
    for (let item of body.groceries) {
      groceryList.addItem(new GroceryItem(item.name, item.quantity));
    }
    //console.log(groceryList);
    document.getElementById('main').innerHTML = groceryList.toHTML();
  })
  .catch(error => console.error(`Error in fetch: ${error.message}`));

$(document).ready(() => {
  $('input[type=submit]').click(function(action){
    action.preventDefault();

    // let data = {
    //   book: {
    //     name: 'Harry Potter'
    //   }
    // };
    // let jsonStringData = JSON.stringify(data);
    //
    // fetch('/groceries.json', {
    //   method: 'post',
    //   body: jsonStringData
    //   })
    //   .then(response => {
    //     if (response.ok) {
    //       return response;
    //     } else {
    //       let errorMessage = `${response.status} (${response.statusText})`,
    //           error = new Error(errorMessage);
    //       throw(error);
    //     }
    //   })
    //   .then(response => response.text())
    //   .then(body => {
    //     console.log(body);
    //     let bodyParsed = JSON.parse(body);
    //     console.log(bodyParsed);
    //   })
    //   .catch(error => console.error(`Error in fetch: ${error.message}`));
    let item = {
      grocery: {
        name: $('#grocery_name').val(),
        quantity: $('#grocery_quantity').val()
      }
    };
    $('#grocery_name').val('');
    $('#grocery_quantity').val('');
    console.log(item);
    itemJSON = JSON.stringify(item);
    console.log(itemJSON);
    fetch('/groceries.json', {
      method: 'post',
      body: itemJSON
      })
      .then(response => {
        if (response.ok) {
          return response;
        } else {
          let errorMessage = `${response.status} (${response.statusText})`,
            error = new Error(errorMessage);
          throw(error);
        }
      })
      .then(response => response.text())
      .then(body => {
        console.log(body);
        let bodyParsed = JSON.parse(body);
        console.log(bodyParsed);
        let itemObject = new GroceryItem(item.grocery.name, item.grocery.quantity);
        console.log(itemObject);
        console.log(itemObject.toString());
        $('#groceryList').append(`<li>${itemObject.toString()}</li>`);
      })
      // .then(() => {
      //   fetch('/groceries.json')
      //     .then(response => {
      //       if (response.ok) {
      //         return response;
      //       } else {
      //         let errorMessage = `${response.status} (${response.statusText})`,
      //             error = new Error(errorMessage);
      //         throw(error);
      //       }
      //     })
      //     .then(response => response.json())
      //     .then(body => {
      //       let item = body.groceries[body.groceries.length - 1];
      //       let itemObject = new GroceryItem(item.name, item.quantity);
      //       document.getElementById('groceryList').innerHTML += `<li>${itemObject.toString()}</li>\n`;
      //     })
      //     .catch(error => console.error(`Error in fetch: ${error.message}`));
      // })
      .catch(error => console.error(`Error in fetch: ${error.message}`));
  });
});
