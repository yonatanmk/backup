let reverseString = (word) => {
  let result = '';
  for (let char of word) {
    result = char + result;
  }
  return result;
};

// Test the reverseString function, and print results to the console.
let words = ['racecar', 'Andy', 'boolean', 'redrum'];
let reversedWords = ['racecar', 'ydnA', 'naeloob', 'murder'];

for (let [i, word] of words.entries()) {
  let reversedWord = reverseString(word);
  let result = (reversedWord == reversedWords[i]);

  let outputString = `The reverse of ${word} is: ${reversedWord}.\n${result}\n\n`;

  console.log(outputString);
}
