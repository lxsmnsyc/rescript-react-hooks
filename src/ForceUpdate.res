let use = (): (unit => unit) => {
  let (_, set) = React.useReducer((state, _) => !state, false);

  ConstantCallback.use(() => set());
};
