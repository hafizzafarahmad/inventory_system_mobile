class SendUserParams {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String phone;
  final String idRole;

  SendUserParams(
      {required this.firstName, required this.lastName, required this.email, required this.password, required this.phone,
        required this.idRole});
}