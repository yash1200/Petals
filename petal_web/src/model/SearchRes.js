export function toSearchRes(json) {
  return JSON.parse(JSON.stringify(json));
}
export function searchResToJson(value) {
  return JSON.stringify(value);
}

export default { toSearchRes, searchResToJson };
