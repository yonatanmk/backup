// test the isPangram() function, and print results to the console.
let sentences = [
  { content: 'The quick brown fox jumps over the lazy dog.', pangram: true },
  { content: 'The quick onyx goblin jumps over the lazy dwarf.', pangram: true },
  { content: 'Grumpy wizards make toxic brew for the evil queen and jack.', pangram: true },
  { content: 'Not a pangram', pangram: false },
  { content: '', pangram: false },
];

sentences.forEach((sentence) => {
  let result = isPangram(sentence.content);
  let correct = (result == sentence.pangram);
  console.log(`isPangram gave a ${correct ? '' : 'in'}correct result for: ${sentence.content}`);
});

// define the isPangram() function
function isPangram(sentence) {
  sentence = sentence.toLowerCase();
  let alphabet = [];
  for (let i = 97; i <= 122; i++) {
      alphabet.push(String.fromCharCode(i));
  }
  for (let i = 0; i < alphabet.length; i++) {
    if (!sentence.includes(alphabet[i])) {
      return false;
    }
  }
  return true;
}
