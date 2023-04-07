class LocalUser {
  final String uid;
  final String? displayName;
  final String? email;
  final String? photoUrl;

  LocalUser({
    required this.uid,
    this.displayName,
    this.email,
    this.photoUrl,
  });
}