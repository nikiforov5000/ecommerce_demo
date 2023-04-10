class LocalUser {
  final String uid;
  final String email;
  final String? displayName;
  final String? photoUrl;

  LocalUser({
    required this.uid,
    required this.email,
    this.displayName,
    this.photoUrl,
  });
}