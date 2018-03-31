let ready = () => {
  return new Promise((resolve, reject) => {
    document.addEventListener('readystatechange', () => {
      if (document.readyState !== 'loading') {
        resolve("pass");
      }
    });
  });
};
