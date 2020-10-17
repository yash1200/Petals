export function toRestaurant(json) {
  return JSON.parse(JSON.stringify(json));
}
export function RestaurantToJson(value) {
  return JSON.stringify(value);
}

export default { toRestaurant, RestaurantToJson };
