
// user_manager_test.dart for testing calculate money

class UserManagement<T extends AdminUser> { // we want that only AdminUser type can access
  final T admin;

  UserManagement(this.admin);
  void sayName(GenericUser user) {
    print(user.name);
  }

  int calculateMoney(List<GenericUser> users) {
    // first type
    // int sum = 0;
    // for (var user in users) {
    //   sum += user.money;
    // }
    int initialValue = admin.role == 1 ? admin.money : 0;
    // this line say that: if an admin will access, give it its admin.money
    // second type
    final sumMoney = users.map((e) => e.money).fold<int>(initialValue, (previousValue, element) => previousValue + element);
    // third type
    final _money = users.fold<int>(initialValue, (previousValue, element) => previousValue + element.money);
    return _money;
  }

  Iterable<VBModel<R>>? showNames<R>(List<GenericUser> users) {
    // we made it iterable instead of List because List derives from Iterable
    if (R == String) {
      final names = users.map((e) => VBModel<R>(e.name.split('').toList().cast<R>()));
      return names;
    }
    return null;
  }
}

class VBModel<T> {
  final String name = 'vb';
  final List<T> items;

  VBModel(this.items);
}

class GenericUser {
  final String name;
  final String id;
  final int money;

  const GenericUser(this.name, this.id, this.money);

  bool findUsername(String name){ // checking if user will enter any nonsense name
    return this.name == name;
  }
}

class AdminUser extends GenericUser { // we want that just AdminUser can access
  final int role;
  const AdminUser(String name, String id, int money, this.role) : super(name, id, money);
}