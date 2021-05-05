let use = (supplier: () => 'a): React.ref<'a> => {
  Constant.use((): React.ref<'a> => {
    current: supplier()
  });
}