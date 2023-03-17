// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, unused_local_variable, unnecessary_new, unused_import

import 'package:flutter/material.dart';
import '../../../routers/router.dart';
import '../../widgets/Task/taskwidget.dart';
import '../../screens/Task/task_list.dart';
import 'package:get/get.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

//screen  All task
class TaskManagement extends StatefulWidget {
  @override
  State<TaskManagement> createState() => _TaskManagementState();
}

class _TaskManagementState extends State<TaskManagement>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
    _tabController.animateTo(2);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  SampleItem? selectedMenu;
  int items = 10;

  static const List<Tab> _tabs = [
    const Tab(text: 'All'),
    const Tab(text: 'Not accept'),
    const Tab(text: 'On progress'),
    const Tab(text: 'Pending approval'),
    const Tab(text: 'Done'),
    const Tab(text: 'Tab Six'),
  ];

  static const List<Widget> _views = [
    Center(child: const TaskList()),
    const Center(child: const Text('Content of Tab Two')),
    const Center(child: const Text('Content of Tab Three')),
    const Center(child: const Text('Content of Tab Four')),
    const Center(child: const Text('Content of Tab Five')),
    const Center(child: const Text('Content of Tab Six')),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Tasks Managements",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        // bottom: TabBar(
        //   labelColor: Color.fromRGBO(10, 187, 133, 1),
        //   unselectedLabelColor: Colors.grey,
        //   labelStyle: const TextStyle(fontWeight: FontWeight.bold),
        //   unselectedLabelStyle: const TextStyle(fontStyle: FontStyle.normal),
        //   overlayColor:
        //       MaterialStateColor.resolveWith((Set<MaterialState> states) {
        //     if (states.contains(MaterialState.pressed)) {
        //       return Colors.blue;
        //     }
        //     if (states.contains(MaterialState.focused)) {
        //       return Colors.orange;
        //     } else if (states.contains(MaterialState.hovered)) {
        //       return Colors.pinkAccent;
        //     }

        //     return Colors.transparent;
        //   }),
        //   indicatorWeight: 2,
        //   indicatorColor: Color.fromRGBO(10, 187, 133, 1),
        //   indicatorSize: TabBarIndicatorSize.tab,
        //   indicatorPadding: const EdgeInsets.all(5),
        //   // indicator: BoxDecoration(
        //   //   border: Border.all(color: Colors.red),
        //   //   borderRadius: BorderRadius.circular(10),
        //   //   color: Colors.pinkAccent,
        //   // ),
        //   isScrollable: true,
        //   physics: BouncingScrollPhysics(),
        //   onTap: (int index) {
        //     print('Tab $index is tapped');
        //   },
        //   enableFeedback: true,
        //   // Uncomment the line below and remove DefaultTabController if you want to use a custom TabController
        //   // controller: _tabController,
        //   tabs: _tabs,
        // ),
        leading: IconButton(
          color: Colors.black,
          icon: Icon(Icons.arrow_back_outlined),
          splashColor: Colors.grey,
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          PopupMenuButton<SampleItem>(
            initialValue: selectedMenu,
            icon: Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
            onSelected: (SampleItem item) {
              setState(() {
                selectedMenu = item;
              });
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
              const PopupMenuItem<SampleItem>(
                value: SampleItem.itemOne,
                child: Text('Item 1'),
              ),
              const PopupMenuItem<SampleItem>(
                value: SampleItem.itemTwo,
                child: Text('Item 2'),
              ),
              const PopupMenuItem<SampleItem>(
                value: SampleItem.itemThree,
                child: Text('Item 3'),
              ),
            ],
          )
        ],
        backgroundColor: Colors.white,
        //backgroundColor: Color.fromRGBO(255, 250, 160, 1),
      ),
      body: Container(
        child: DefaultTabController(
            length: 6,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    child: TabBar(
                      labelColor: Color.fromRGBO(10, 187, 133, 1),
                      unselectedLabelColor: Colors.grey,
                      labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                      unselectedLabelStyle:
                          const TextStyle(fontStyle: FontStyle.normal),
                      overlayColor: MaterialStateColor.resolveWith(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.blue;
                        }
                        if (states.contains(MaterialState.focused)) {
                          return Colors.orange;
                        } else if (states.contains(MaterialState.hovered)) {
                          return Colors.pinkAccent;
                        }

                        return Colors.transparent;
                      }),
                      indicatorWeight: 2,
                      indicatorColor: Color.fromRGBO(10, 187, 133, 1),
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorPadding: const EdgeInsets.all(5),
                      // indicator: BoxDecoration(
                      //   border: Border.all(color: Colors.red),
                      //   borderRadius: BorderRadius.circular(10),
                      //   color: Colors.pinkAccent,
                      // ),
                      isScrollable: true,
                      physics: BouncingScrollPhysics(),
                      onTap: (int index) {
                        print('Tab $index is tapped');
                      },
                      enableFeedback: true,
                      // Uncomment the line below and remove DefaultTabController if you want to use a custom TabController
                      // controller: _tabController,
                      tabs: _tabs,
                    ),
                  ),
                  Container(
                    height: 700,
                    child: const TabBarView(
                      physics: BouncingScrollPhysics(),
                      // Uncomment the line below and remove DefaultTabController if you want to use a custom TabController
                      // controller: _tabController,
                      children: _views,
                    ),
                  )
                ])),
      ),
      // const TabBarView(
      //   physics: BouncingScrollPhysics(),
      //   // Uncomment the line below and remove DefaultTabController if you want to use a custom TabController
      //   // controller: _tabController,
      //   children: _views,
      // ),
    ));
  }
}
