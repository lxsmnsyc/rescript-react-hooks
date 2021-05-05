let use = (dependency: 'b, shouldUpdate: ('b, 'b) => bool): int => {
  let value = React.useRef(0);
  let dependencyChanged = DependencyChanged.use(dependency, shouldUpdate);

  if (dependencyChanged) {
    value.current = value.current + 1;
  }

  value.current;
}
