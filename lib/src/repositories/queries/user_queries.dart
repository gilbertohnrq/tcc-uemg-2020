class UserQueries {
  static const String USER_BY_EMAIL = '''
  query getUsers(\$email: String) {
  users(where: {email: {_eq: \$email}}) {
    created_at
    email
    name
    profilePhoto
    uid
    updated_at
    uid
  }
}
''';

  static const String ADD_USER = '''

mutation addUser(\$email: String, \$name: String, \$profilePhoto: String , \$uid: String) {
  insert_users_one(object: {email: \$email, name: \$name, profilePhoto: \$profilePhoto, uid: \$uid, }) {
    email
    name
    profilePhoto
    uid
  }
}
''';
}
