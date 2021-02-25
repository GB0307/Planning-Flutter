const Map<String, String> REPLACERS = {
  '@': ',,__,,',
  '.': ',,,,',
};

String emailToKey(String email) {
  String key = email;
  REPLACERS.forEach((from, to) {
    key = key.replaceAll(from, to);
  });
  return key;
}

String keyToEmail(String key) {
  String email = key;
  REPLACERS.forEach((to, from) {
    email = email.replaceAll(from, to);
  });
  return email;
}
