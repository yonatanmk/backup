// your code, here
let lat;
let long;
let url;

let submit = document.getElementById('submit');
submit.addEventListener('click', function(action){
  action.preventDefault();
  lat = document.getElementById('latitude').value;
  long = document.getElementById('longitude').value;
  url = `https://api.darksky.net/forecast/d11fc927eddfbc963ae92f948c52d8d8/${lat},${long}`;
  fetch(url)
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
      //console.log(body);
      let bodyParsed = JSON.parse(body);
      //console.log(bodyParsed);
      $(document).ready(function(){
        $('#output').text(`${bodyParsed.currently.temperature}°F and ${bodyParsed.currently.summary} at ${lat},${long}`);
        let skycons = new Skycons({"color": 'MidnightBlue'});
        console.log(bodyParsed.currently.summary);
        skycons.set("icon1", bodyParsed.currently.icon);
        skycons.play();
      });
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
});

// fetch('https://api.darksky.net/forecast/d11fc927eddfbc963ae92f948c52d8d8/42.3601,-71.0589')
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
//     //console.log(body);
//     let bodyParsed = JSON.parse(body);
//     //console.log(bodyParsed);
//     $(document).ready(function(){
//       $('#main').append(`${bodyParsed.currently.temperature}°F and ${bodyParsed.currently.summary}`);
//       let skycons = new Skycons({"color": 'MidnightBlue'});
//       console.log(bodyParsed.currently.summary);
//       skycons.add("icon1", bodyParsed.currently.icon);
//       skycons.play();
//     });
//   })
//   .catch(error => console.error(`Error in fetch: ${error.message}`));
