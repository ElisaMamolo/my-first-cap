//define domain model
using {managed} from '@sap/cds/common';
namespace cap.store;

entity Albums: managed {
    key ID: Integer;
    name: String(100);
    artist: Association to one Artists;
    price: Integer;
    stock: Integer;
}

entity Artists : managed {
    key ID: Integer;
    name: String(100); 
    albums: Association to many Albums;
}

entity Orders : managed {
    key ID: Integer;
    total: Integer;
}
