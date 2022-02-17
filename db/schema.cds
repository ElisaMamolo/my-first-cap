//define domain model
using {managed, cuid} from '@sap/cds/common';
namespace cap.store;

entity Albums: managed {
    key ID: Integer;
    name: String(100);
    artist: Association to Artists;
    price: Integer;
    stock: Integer;
}

entity Artists : managed {
    key ID: Integer;
    name: String(100); 
    albums: Association to many Albums on albums.artist = $self;
}

entity Orders : managed {
    key ID: Integer;
    Items: Composition of many OrderItems on Items.parent = $self;
    total: Integer;
}

entity OrderItems : cuid {
  parent    : Association to Orders;
  album      : Association to Albums;
  amount    : Integer;
  netAmount : Decimal(9,2);
}
