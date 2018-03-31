$('#get-dish').on('click', function(event) {
// request a new dish and alert the user
  event.preventDefault();

  $.ajax({
    method: "GET",
    url: '/dishes/random.json'
    // data: {'page': }
  })

  .done(function(newDish) {
    alert("Your random dish is: " + newDish.dish);
  });

});
