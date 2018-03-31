var counter = 1;

// $('.more-sprouts').on('click', function(event) {
//   event.preventDefault();
//   counter += 1;
//
//   $.ajax({
//     method: "GET",
//     url: '/tweets.json',
//     data: { "page":counter}
//   })
//
//   .done(function(data) {
//     data.forEach(function(tweet){
//       $(".tweets").append(
//         '<li class="tweet">\n' +
//         '<div class="body">' + tweet.text + '</div>\n' +
//         '<div class="user">' + tweet.username + '</div>\n' +
//         '</li>'
//       );
//     });
//   });
//
// });

$(window).scroll(function(event) {
  event.preventDefault();

  if ($(window).scrollTop() + $(window).height() == $(document).height()) {
    counter += 1;
    $.ajax({
      method: "GET",
      url: '/tweets.json',
      data: { "page":counter}
    })

    .done(function(data) {
      data.forEach(function(tweet){
        $(".tweets").append(
          '<li class="tweet">\n' +
          '<div class="body">' + tweet.text + '</div>\n' +
          '<div class="user">' + tweet.username + '</div>\n' +
          '</li>'
        );
      });
    });
  }

});
