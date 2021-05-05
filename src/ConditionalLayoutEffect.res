let use = (effect: (unit => option<unit => unit>), dependency: 'b, shouldUpdate: ('b, 'b) => bool): unit => {
  let version = DependencyVersion.use(dependency, shouldUpdate);
  
  React.useLayoutEffect1(effect, [version]);
}
