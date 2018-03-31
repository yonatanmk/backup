ready().then(() => {
  return fetch('/images/logo.png');
})
  .then(response => {
    console.log(response);
    return response.blob();
  })
  .then(body => {
    console.log(body);
    let objectURL = URL.createObjectURL(body);
    console.log(objectURL);
    let image = document.createElement('img');
    image.src = objectURL;
    console.log(image);
    document.getElementById('main').append(image);
  });
