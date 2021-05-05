let use = (callback: 'input => 'output): ('input => 'output) => {
  Constant.use(() => callback);
};
