using { cap.store as store} from '../db/schema';

service UserService @(path:'/browse') {

  @readonly entity Albums as SELECT from store.Albums {*,
    artist.name as artist
  } excluding { createdBy, modifiedBy };

  @requires_: 'authenticated-user'
  action submitOrder (album: Albums:ID, quantity: Integer);
}