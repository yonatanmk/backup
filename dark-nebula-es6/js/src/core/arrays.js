removeWithoutCopy = (arr, item) => {
  // for (let i = 0; i < arr.length; i++) {
  //   arr = arr.filter(function(x){
  //     return arr.filter(function(y){return y === x}).length === 1;
  //   });
  // }
  // return arr;
  while (arr.indexOf(item) > -1) {
    arr.splice(arr.indexOf(item), 1);
  }
  return arr;
};

append = (arr, item) => {
  arr.push(item);
  return arr;
};

truncate = (arr) => {
  return arr.slice(0, arr.length-1);
};

prepend = (arr, item) => {
  arr.unshift(item);
  return arr;
};

curtail = (arr) => {
  return arr.slice(1);
};

concat = (arr1, arr2) => {
  return arr1.concat(arr2);
};

insert = (arr, item, index) => {
  arr.splice(index, 0, item);
  return arr;
};

count = (arr, item) => {
  let count = 0;
  for (let x of arr) {
    if (x === item) {
      count += 1;
    }
  }
  return count;
};

duplicates = (arr) => {
  let output = [];
  for (let item of arr) {
    if (arr.filter(function(x){
      return x === item;
    }).length > 1) {
      if (!output.includes(item)) {
        output.push(item);
      }
    }
  }
  return output;
};

square = (arr) => {
  return arr.map(function(item){
    return item **2;
  });
};

findAllOccurrences = (arr, item) => {
  let output = [];
  for (let i = 0; i < arr.length; i++) {
    if (arr[i] === item) {
      output.push(i);
    }
  }
  return output;
};
