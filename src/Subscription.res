
type t<'a> = {
  read: unit => 'a,
  subscribe: (unit => unit) => option<unit => unit>,
  shouldUpdate: ('a, 'a) => bool,
};

type internal<'a> = {
  read: unit => 'a,
  subscribe: (unit => unit) => option<unit => unit>,
  shouldUpdate: ('a, 'a) => bool,
  value: 'a,
};

let use = ({ read, subscribe, shouldUpdate }: t<'a>): 'a => {
  let (state, setState) = React.useState(() => {
    read,
    subscribe,
    shouldUpdate,
    value: read()
  });

  let value = ref(state.value);

  if (
    state.read != read
    || state.subscribe != subscribe
    || state.shouldUpdate != shouldUpdate
  ) {
    value.contents = read();

    setState(_ => {
      read,
      subscribe,
      shouldUpdate,
      value: value.contents,
    });
  }

  React.useEffect3(() => {
    let mounted = ref(true);

    let readCurrent = () => {
      if (mounted.contents) {
        let nextValue = read();

        setState((prev) => {
          if (
            prev.read == read
            && prev.subscribe == subscribe
            && prev.shouldUpdate == shouldUpdate
            && shouldUpdate(prev.value, nextValue)
          ) {
            {
                ...prev,
                value: nextValue,
            }
          } else {
            prev;
          }
        });
      }
    };

    let unsubscribe = subscribe(readCurrent);

    readCurrent();

    Some(() => {
      mounted.contents = false;

      switch (unsubscribe) {
        | Some(unsub) => unsub();
        | None => ();
      }
    });
  }, (read, subscribe, shouldUpdate));

  value.contents;
};
