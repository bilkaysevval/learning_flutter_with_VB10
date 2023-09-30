import 'package:flutter_test/flutter_test.dart';
import 'package:learning/303/generic_learn.dart';
import 'package:learning/product/custom_widgets/card/high_card.dart';
import 'package:collection/collection.dart';

void main() {
  setUp(() {});
  // TODO first testing process
  test('List best of', () {
    List<GenericUser> users = [ // we can add or remove item from list even if it is final
      const GenericUser('vb1', '11', 5),
      const GenericUser('vb2', '11', 10),
      const GenericUser('vb3', '11', 20)
    ];

    List<HighCard> highCards = users.map((e) { // we can get this list by making users map
      return HighCard(items: e.name.split('').toList());
    }).toList();

    try {// made try catch because we search singleWhere but we have more than one 'vb'. so we have to catch exceptions
      final response = users.singleWhere( // singleWhere for searching specific elements
            (element) => element.findUsername('x'),
        orElse: () {
          return const GenericUser('name', 'id', 15);
        },
      );

      print(response.name);
    } catch (e) {
      print(e);
    }

    print('${users.where((element) => element.money > 500)}');  // WHERE

    users.addAll([const GenericUser('name', 'id', 5)]);  // ADD ALL
    users.lastWhere((element) => element.id == '5');    // LAST WHERE....

    users.take(5);
    users.remove(const GenericUser('vb1', '11', 5));
    users.removeAt(2);
    users.removeWhere((element) => element.id == 11);

    users.indexOf(const GenericUser('vb1', '11', 5));
    final result = users.indexWhere((element) => element.id == '11');
    if (result >= 0) {
      users[result] = const GenericUser('a', 'b', 15);
    }

    users.expand((element) => [const GenericUser('a', '1 ', 15)]);
    // users.map((e) => e.money).where((element) => element > 5);
  });
// TODO second testing process
  test('List best of with collection', () {
    List<GenericUser> users = [
      const GenericUser('vb1', '11', 5),
      const GenericUser('vb2', '11', 10),
      const GenericUser('vb3', '11', 20)
    ];

    final response = users.singleWhereOrNull(
          (element) => element.findUsername('x'),
    );

    users.lastWhereOrNull((element) => element.id == '5');

    users.lastOrNull;
    users.forEachIndexed((index, element) {});
    users.sample(3);
    print(users.first == const GenericUser('vb1', '11', 5));
    print(users.contains(const GenericUser('vb1', '11', 5)));

    users.any((element) => element.money > 5);

    print(response);
  });
}