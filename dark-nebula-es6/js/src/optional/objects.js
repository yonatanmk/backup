alterContext = (fn, obj) => {
  // Optional Challenge
};

alterObjects = (constructor, greeting) => {
  // Optional Challenge
};

iterate = (obj) => {
  // Optional Challenge
  let output = [];
  for (let key in obj) {
    output.push(`${key}: ` + obj[key]);
  }

  output.pop();
  return output;
};
