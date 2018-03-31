// your code, here
var answer = prompt('At what temperature on the cesius scale does water freeze?');
var result = document.getElementById('result');

if (answer === '0') {
  result.innerHTML = "Correct! Water freezes at 0 degrees Celsius.";
}
else {
  result.innerHTML = "Sorry. That is not the correct answer.";
}
