let use = (dependency: 'b, shouldUpdate: ('b, 'b) => bool): bool => {
  let deps = React.useRef(dependency);
  let result = shouldUpdate(deps.current, dependency);

  if (result) {
    deps.current = dependency;
  }

  result;
}
