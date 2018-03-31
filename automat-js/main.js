var dishes = [
'Chicken Pot Pie',
'Baked Beans',
'Macaroni and Cheese',
'Burgundy Sauce with Beef and Noodles',
'Creamed Spinach',
'Pumpkin Pie',
'Strawberry Shortcake' ];

var main = document.getElementById('main');

/*  //Part 1 answer
dishes.forEach (function (dish) {
  main.innerHTML += `<div class='food-item'>${dish}</div>`;
});
*/

dishes.forEach (function (dish) {
  var foodItemDiv = document.createElement('div');
  foodItemDiv.className = 'food-item';
  foodItemDiv.innerHTML = dish;
  // foodItemDiv.addEventListener('click',function(){
  //   foodItemDiv.className += ' hidden';
  // });
  main.appendChild(foodItemDiv);
});

var foodItemDivList = document.getElementsByClassName('food-item');

foodItemDivList.forEach(function (foodItemDiv) {
  foodItemDiv.addEventListener('click',function(){
    foodItemDiv.className += ' hidden';
  });
});
