import 'package:flutter_test/flutter_test.dart';
import 'package:learning/303/generic_learn.dart';

void main() {
  setUp(() {});
  test('User calculate ', () {
    final users = [
      const GenericUser('vb', '11', 10),
      const GenericUser('vb', '11', 10),
      const GenericUser('vb', '11', 20),
    ];
    // we gave it AdminUser type if we do not then it will crash
    final userManagement = UserManagement(const AdminUser('admin', '1', 15, 1));
    final result = userManagement.calculateMoney(users);

    final respnse = userManagement.showNames<String>(users);

    expect(result, 55);
  });
}