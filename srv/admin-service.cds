using { cap.store as store } from '../db/schema';

service AdminService @(_requires:'authenticated-user') {
  entity Orders as projection on store.Orders;
  entity Albums as projection on store.Albums;
  entity Artists as projection on store.Artists;
}