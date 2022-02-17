annotate UserService.Albums with @(
  UI: {
    SelectionFields: [ ],
    LineItem: [
      {Value: name, Label: 'Album Name'},
      {Value: artist, Label:'Author'},
      {Value: price, Label: 'Price'},
      {Value: stock, Label:'In Stock'},
    ],
    HeaderInfo: {
        TypeName: 'Album',
        TypeNamePlural: 'Albums',
        Title:  {value: name}
    }
  }
);