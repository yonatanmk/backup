var tasks = [
'Write some JavaScript',
'Submit System Check',
'Take a Break',
'Be Awesome',
"Keep Doing What You're Doing" ];

var list = document.getElementById("todo-list");

tasks.forEach(function(item){
  var itemDiv = document.createElement('li');
  itemDiv.innerHTML = item;
  itemDiv.addEventListener('click', function (event) {
    list.removeChild(this);
  });
  list.appendChild(itemDiv);
});

var inputTodoItem = document.getElementById('new-todo-item');
inputTodoItem.addEventListener('keyup', function (event) {
  if (event.keyCode == 13) {
    event.preventDefault();
    var itemDiv = document.createElement('li');
    itemDiv.innerHTML = this.value;
    itemDiv.addEventListener('click', function (event) {
      list.removeChild(this);
    });
    list.appendChild(itemDiv);
    inputTodoItem.value = '';
  }
});
