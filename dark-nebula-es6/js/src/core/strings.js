reduceString = (str, amount) => {
  let output = '';
  str = str.match(/(.)\1+|./g,"-");

  for (let x of str) {
    if (x.length === 1) {
      output += x;
    }
    else {
      output += x[0].repeat(amount);
    }
  }

  return output;
};

reverseString = (str) => {
  let output = "";
  for (let char of str) {
    output = char + output;
  }
  return output;
};
