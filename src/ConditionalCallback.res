let use = (supplier: 'input => 'output, dependency: 'b, shouldUpdate: ('b, 'b) => bool): ('input => 'output) => {
  let value = React.useRef(supplier);
  let dependencyChanged = DependencyChanged.use(dependency, shouldUpdate);

  if (dependencyChanged) {
    value.current = supplier;
  }

  value.current;
}
