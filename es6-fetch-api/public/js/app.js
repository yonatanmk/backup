fetch('http://localhost:4567/books.json')
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
  .then(response => {
    console.log(response);
  })
  // .then(x => {
  //   console.log(body);
  // })
  .catch(error => console.error(`Error in fetch: ${error.message}`));
