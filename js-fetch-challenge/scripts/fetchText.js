ready().then(() => {
  let pages = document.getElementsByClassName('page');
  let output = document.getElementById('main');
  for (let page of pages) {
    page.addEventListener('click', function(action){
      action.preventDefault();
      let path = this.getAttribute('href');
      console.log(path);
      fetch(path)
      .then(response => {
        return response.text();
      })
      .then(body => {
        console.log(body);
        output.innerHTML = body;
      });
    });
  }
});
