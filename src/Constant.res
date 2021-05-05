let use = (supplier: unit => 'a): 'a => {
  let ref = React.useRef(None);

  switch (ref.current) {
    | Some(value) => value;
    | None => {
      let value = supplier();
      ref.current = Some(value);
      value;
    }
  };
};
