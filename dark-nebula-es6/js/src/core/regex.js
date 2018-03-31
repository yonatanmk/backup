containsNumber = (string) => {
  // let regex = /regex/;
  // let found = string.match(regex);
  return !!string.match(/\d+/g);
};


containsRepeatingLetter = (string) => {
  string = string.match(/\D+/g).join('');
  return !!string.match(/(.)\1/g);
};

endsWithVowel = (string) => {
  return !!string.toLowerCase().match(/[aeiouy]$/g);
};

captureThreeNumbers = (string) => {
  if (string.match(/\d{3}/g)) {
    return string.match(/\d{3}/g)[0];
  }
  else {
    return false;
  }
};

matchesPattern = (string) => {
  return !!string.match(/^\d{3}-\d{3}-\d{4}$/g);
};

isUSD = (string) => {
  let output = true;
  if (!!string.match(/^(\d{3}|\d{2}|\d)/g)) {
    output = false;
  }
  if (!string.match(/^(\$\d)/g)) {
    output = false;
  }
  if (!string.match(/((\.\d{2})|(,\d{3}))$/g)) {
    output = false;
  }
  if (string.split("").includes(',')) {
    for (let i = 1; i < string.split(/[.,]/g).length - 1; i++ ) {
      if (!string.split(/[.,]/g)[i].match(/\d{3}/g)) {
        output = false;
      }
    }
  }

  return output;
};
