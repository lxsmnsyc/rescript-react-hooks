let use = (effect: (unit => option<unit => unit>), dependency: 'b, shouldUpdate: ('b, 'b) => bool): unit => {
  let version = DependencyVersion.use(dependency, shouldUpdate);
  
  React.useEffect1(effect, [version]);
}
