let use = (supplier: unit => 'a, dependency: 'b, shouldUpdate: ('b, 'b) => bool): React.ref<'a> => {
  let value = LazyRef.use(supplier);
  let dependencyChanged = DependencyChanged.use(dependency, shouldUpdate);

  if (dependencyChanged) {
    value.current = supplier();
  }

  value;
};
