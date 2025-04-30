//! Bad class
class User {
  String name;
  String email;
  String password;

  User(this.name, this.email, this.password);

  void sendEmail(String message) {
    // ❌ Bad: Email sending doesn't belong here
  }
}

//? Good class

// class User {
//   String name;
//   String email;

//   User(this.name, this.email);
// }

// class EmailService {
//   void sendEmail(User user, String message) {
//     // Logic for sending email
//   }
// }
//todo In this example, the User class is responsible for user data, while the EmailService class handles email sending.

// Use Constructors Wisely

//? Normal class
// class Product {
//    String id;
//    String name;

//   Product( this.id,  this.name);
// }
//? Good class

class Product {
  String id;
  String name;

  Product({required this.id, required this.name});
}

//? Good class
class BankAccount {
  double _balance = 0.0;

  double get balance => _balance;

  void deposit(double amount) {
    if (amount > 0) _balance += amount;
  }
}

// class User {
//   final String name;

//   User._(this.name);

//   factory User.fromJson(Map<String, dynamic> json) {
//     return User._(json['name']);
//   }
// }

// DEEP NESTING

//? Bad class

void saveUser(User? user) {
  if (user != null) {
    if (user.name == "") {
      if (user.email == "") {
        if (user.password == "") {
          // Save logic here
        }
      }
    }
  }
}

//? Good class
// void saveUser(User? user) {
//   if (user == null) return;
//   if (user.name == "") return;
//   if (user.email == "") return;
//   if (user.password == "") return;

//   // Save logic here
// }

// WIDGETS

//? Bad class
// Widget build(BuildContext context) {
//   return Scaffold(
//     body: Center(
//       child: Column(
//         children: [
//           Container(
//             child: Row(
//               children: [
//                 Text("Hello"),
//                 Icon(Icons.star),
//               ],
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }

//? Good class
// Widget build(BuildContext context) {
//   return Scaffold(
//     body: Center(
//       child: _buildContent(),
//     ),
//   );
// }

// Widget _buildContent() {
//   return Column(
//     children: [
//       _buildGreetingRow(),
//     ],
//   );
// }

// Widget _buildGreetingRow() {
//   return Row(
//     children: [
//       Text("Hello"),
//       Icon(Icons.star),
//     ],
//   );
// }

class Item {
  bool enabled;
  int quantity;
  bool inStock;
  Item(this.enabled, this.quantity, this.inStock);

  List<Item> items = [
    Item(true, 5, true),
    Item(false, 0, false),
    Item(true, 10, true),
    Item(false, 0, false),
  ];

  // bad code
  example() {
    for (var item in items) {
      if (item.enabled) {
        if (item.quantity > 0) {
          if (item.inStock) {
            // Do something
          }
        }
      }
    }
  }

//   // good code
//   example2() {
//     for (var item in items) {
//       if (!_shouldProcess(item)) continue;
//       // Do something
//     }
//   }
// }

// // helper function
// bool _shouldProcess(Item item) {
//   return item.enabled && item.quantity > 0 && item.inStock;
}

// null safety
//? Bad class
class MyUser {
  String? name;
  String? email;
  String? password;

  MyUser(this.name, this.email, this.password);

  String? sendEmail(String message) {
    if (name != null) {
      if (email != null) {
        return email!;
      } else {
        return "Guest";
      }
    }
    return null;

    // No need for unused method
    // String sendEmail2(String message) {
    //   return email ?? "Guest";
    // }
  }
}

// DRY
//? Bad code
// class UserCard extends StatelessWidget {
//   final String name;
//   UserCard(this.name);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Icon(Icons.person),
//         SizedBox(width: 8),
//         Text(name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//       ],
//     );
//   }
// }

// class AdminCard extends StatelessWidget {
//   final String name;
//   AdminCard(this.name);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Icon(Icons.admin_panel_settings),
//         SizedBox(width: 8),
//         Text(name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//       ],
//     );
//   }
// }

//? Good code
// Widget buildUserRow(IconData icon, String name) {
//   return Row(
//     children: [
//       Icon(icon),
//       SizedBox(width: 8),
//       Text(name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//     ],
//   );
// }

// class UserCard extends StatelessWidget {
//   final String name;
//   UserCard(this.name);

//   @override
//   Widget build(BuildContext context) => buildUserRow(Icons.person, name);
// }

// class AdminCard extends StatelessWidget {
//   final String name;
//   AdminCard(this.name);

//   @override
//   Widget build(BuildContext context) =>
//       buildUserRow(Icons.admin_panel_settings, name);
// }

// KISS
//? Bad code
bool isWeekend(DateTime d) => [6, 7].contains(d.weekday);

//? Good code
bool _isWeekend(DateTime d) {
  return d.weekday == DateTime.saturday || d.weekday == DateTime.sunday;
}

// ✅ With YAGNI (only include what you use):

//? Bad code
class UserSettings {
  bool darkMode = false;
  bool notifications = true;
  bool autoBackup = false; // not used anywhere yet
}

// //? Good code
// class UserSettings {
//   bool darkMode = false;
//   bool notifications = true;
//   // Removed autoBackup since it's not used yet
// }
