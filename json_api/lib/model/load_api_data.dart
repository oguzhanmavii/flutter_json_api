class loadApiData {
  late final String username;
  late final String email;

  loadApiData(
      {required this.username,
      required this.email}); // yapıcı method constructor ile methodumuzu yapılandırıyoruz
  factory loadApiData.fromJson(Map<String, dynamic> json) {
    return loadApiData(username: json["username"], email: json["email"]);
  }
}
