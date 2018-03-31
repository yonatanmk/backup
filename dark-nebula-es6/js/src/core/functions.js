isPrime = (num) => {
  for (i = 2; i < Math.sqrt(num); i++) {
    if (num % i === 0) {
      return false;
    }
  }
  return true;
};

arraySum = (array) => {
  return array.reduce(function(a, b){
    return a + b;
  });
};

fizzBuzz = (num) => {
  // write a function that receives a number as its argument;
  // if the number is divisible by 3, the function should return 'fizz';
  // if the number is divisible by 5, the function should return 'buzz';
  // if the number is divisible by 3 and 5, the function should return
  // 'fizzbuzz';
  //
  // otherwise the function should return the number, or false if no number
  // was provided or the value provided is not a number
  let output = '';
  if (typeof(num) !== 'number') {
    return num;
  }
  if (num % 3 === 0) {
    output += 'fizz';
  }
  if (num % 5 === 0) {
    output += 'buzz';
  }
  if (output.length > 0) {
    return output;
  }
  else {
    return num;
  }

};
