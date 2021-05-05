let use = (supplier: unit => 'a, dependency: 'b, shouldUpdate: ('b, 'b) => bool): React.ref<'a> => {
  let value = LazyRef.use(supplier);
  let deps = React.useRef(dependency);

  if (shouldUpdate(deps.current, dependency)) {
    value.current = supplier();
    deps.current = dependency;
  }

  value;
};
