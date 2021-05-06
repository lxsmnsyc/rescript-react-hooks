let use = (supplier: unit => 'a): 'a => {
  LazyRef.use(supplier).current;
};
