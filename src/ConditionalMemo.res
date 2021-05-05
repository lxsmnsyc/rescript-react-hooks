let use = (supplier: unit => 'a, dependency: 'b, shouldUpdate: ('b, 'b) => bool): 'a => {
  let value = FreshLazyRef.use(supplier, dependency, shouldUpdate);

  value.current;
}
