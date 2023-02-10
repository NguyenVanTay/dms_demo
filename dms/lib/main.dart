import 'package:dms/Views/screens/Project/project.dart';
import 'package:dms/Views/screens/Task/all_tasks.dart';
import 'package:dms/Views/screens/Task/create_task.dart';
import 'package:dms/Views/screens/homepage.dart';
import 'package:dms/Views/screens/login.dart';
import 'package:dms/network/network_request.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'Views/screens/GanttChart/gantt_chart.dart';
import 'controllers/providers/event_provider.dart';

//DateTime get _now => DateTime.now();

void main(List<String> args) {
  intialData();
  runApp(const MyApp());
}

Future<void> intialData() async {
  await Networking.getInstance().getAllStatus();
  await Networking.getInstance().getAllType();
  await Networking.getInstance().getAllUser();
  await Networking.getInstance().getAllProject();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => EventProvider())],
      child: GetMaterialApp(
        initialRoute: '/',
        getPages: [
          GetPage(name: '/', page: () => HomePage()),
          GetPage(name: '/alltask', page: () => AllTasks()),
          GetPage(name: '/project', page: () => const Project()),
        ],
        scrollBehavior: MyCustomScrollBehavior(),
        debugShowCheckedModeBanner: false,
        home: const Login(),
      ),
    );
  }
}

// // ignore_for_file: prefer_const_constructors_in_immutables, library_private_types_in_public_api

// import 'package:dms/models/usermodel.dart';
// import 'package:flutter/material.dart';
// import 'package:multi_select_flutter/multi_select_flutter.dart';

// import 'models/util_storage.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Multi Select',
//       theme: ThemeData(
//         primarySwatch: Colors.purple,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: MyHomePage(title: 'Flutter Multi Select'),
//     );
//   }
// }

// class Animal {
//   final int id;
//   final String name;

//   Animal({
//     required this.id,
//     required this.name,
//   });
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key, required this.title}) : super(key: key);
//   final String title;
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   late List<UserModel> tasks = UtilStorage.users;

//   static final List<Animal> _animals = [
//     Animal(id: 1, name: "Lion"),
//     Animal(id: 2, name: "Flamingo"),
//     Animal(id: 3, name: "Hippo"),
//     Animal(id: 4, name: "Horse"),
//     Animal(id: 5, name: "Tiger"),
//     Animal(id: 6, name: "Penguin"),
//     Animal(id: 7, name: "Spider"),
//     Animal(id: 8, name: "Snake"),
//     Animal(id: 9, name: "Bear"),
//     Animal(id: 10, name: "Beaver"),
//     Animal(id: 11, name: "Cat"),
//     Animal(id: 12, name: "Fish"),
//     Animal(id: 13, name: "Rabbit"),
//     Animal(id: 14, name: "Mouse"),
//     Animal(id: 15, name: "Dog"),
//     Animal(id: 16, name: "Zebra"),
//     Animal(id: 17, name: "Cow"),
//     Animal(id: 18, name: "Frog"),
//     Animal(id: 19, name: "Blue Jay"),
//     Animal(id: 20, name: "Moose"),
//     Animal(id: 21, name: "Gecko"),
//     Animal(id: 22, name: "Kangaroo"),
//     Animal(id: 23, name: "Shark"),
//     Animal(id: 24, name: "Crocodile"),
//     Animal(id: 25, name: "Owl"),
//     Animal(id: 26, name: "Dragonfly"),
//     Animal(id: 27, name: "Dolphin"),
//   ];
//   final _items = _animals
//       .map((animal) => MultiSelectItem<Animal>(animal, animal.name))
//       .toList();

//   //List<Animal> _selectedAnimals = [];
//   //List<Animal> _selectedAnimals2 = [];
//   List<Animal> _selectedAnimals3 = [];
//   List<Animal> _selectedAnimals4 = [];
//   List<Animal> _selectedAnimals5 = [];
//   final _multiSelectKey = GlobalKey<FormFieldState>();

//   @override
//   void initState() {
//     _selectedAnimals3 = _animals;
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           alignment: Alignment.center,
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             children: <Widget>[
//               const SizedBox(height: 40),
//               MultiSelectDialogField(
//                 onConfirm: (val) {
//                   _selectedAnimals5 = val;
//                 },
//                 dialogWidth: MediaQuery.of(context).size.width * 0.7,
//                 items: _items,
//                 //initialValue:
//                 //  _selectedAnimals5, // setting the value of this in initState() to pre-select values.
//               ),
//               MultiSelectBottomSheetField<Animal>(
//                 key: _multiSelectKey,
//                 initialChildSize: 0.7,
//                 maxChildSize: 0.95,
//                 title: const Text("Animals"),
//                 buttonText: const Text("Favorite Animals"),
//                 items: _items,
//                 searchable: true,
//                 validator: (values) {
//                   if (values == null || values.isEmpty) {
//                     return "Required";
//                   }
//                   List<String> names = values.map((e) => e.name).toList();
//                   if (names.contains("Frog")) {
//                     return "Frogs are weird!";
//                   }
//                   return null;
//                 },
//                 onConfirm: (listAnimnal) {
//                   setState(() {
//                     _selectedAnimals3 = listAnimnal;
//                   });
//                    _multiSelectKey.currentState?.validate();
//                 },
//                 chipDisplay: MultiSelectChipDisplay(
//                   onTap: (item) {
//                     setState(() {
//                       _selectedAnimals3.remove(item);
//                     });
//                     _multiSelectKey.currentState?.validate();
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
