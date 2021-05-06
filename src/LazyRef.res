let use = (supplier: unit => 'a): React.ref<'a> => {
  let ref = React.useRef(None);

  switch (ref.current) {
    | Some(value) => value;
    | None => {
      let value: React.ref<'a> = {
        current: supplier()
      };
      ref.current = Some(value);
      value;
    }
  };
};
