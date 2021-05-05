let use = (supplier: 'input => 'output, dependency: 'b, shouldUpdate: ('b, 'b) => bool): ('input => 'output) => {
  let value = React.useRef(supplier);
  let deps = React.useRef(dependency);

  if (shouldUpdate(deps.current, dependency)) {
    value.current = supplier;
    deps.current = dependency;
  }

  value.current;
}
