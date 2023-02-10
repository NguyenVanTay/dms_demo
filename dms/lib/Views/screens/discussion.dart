// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_unnecessary_containers, sort_child_properties_last

import 'package:comment_tree/comment_tree.dart';
import 'package:flutter/material.dart';


enum SampleItem { itemOne, itemTwo, itemThree }

SampleItem? selectedMenu;

class Discussion extends StatefulWidget {
  const Discussion({super.key});

  @override
  State<Discussion> createState() => _DiscussionState();
}

class _DiscussionState extends State<Discussion> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Discussion",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          leading: IconButton(
            color: Colors.black,
            icon: Icon(Icons.arrow_back_outlined),
            splashColor: Colors.grey,
            onPressed: () {},
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
              itemBuilder: (BuildContext context) =>
                  <PopupMenuEntry<SampleItem>>[
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
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20, left: 10, right: 300),
                  height: 35,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromRGBO(255, 124, 124, 0.3)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Due Soon",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(214, 70, 70, 1)),
                        )
                      ]),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    "Develop a detailed plan for the program",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),

                    //textScaleFactor: 0.6,
                  ),
                ),
                Container(
                  child: CommentTreeWidget<Comment, Comment>(
                    Comment(
                        avatar: 'null',
                        userName: 'null',
                        content:
                            'felangel made felangel/cubit_and_beyond public '),
                    [
                      Comment(
                          avatar: 'null',
                          userName: 'null',
                          content:
                              'A Dart template generator which helps teams'),
                      Comment(
                          avatar: 'null',
                          userName: 'null',
                          content:
                              'A Dart template generator which helps teams generator which helps teams generator which helps teams'),
                      Comment(
                          avatar: 'null',
                          userName: 'null',
                          content:
                              'A Dart template generator which helps teams'),
                      Comment(
                          avatar: 'null',
                          userName: 'null',
                          content:
                              'A Dart template generator which helps teams generator which helps teams '),
                    ],
                    treeThemeData: TreeThemeData(
                        lineColor: Colors.green[500]!, lineWidth: 2),
                    avatarRoot: (context, data) => PreferredSize(
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.grey,
                        backgroundImage: AssetImage('images/dog.jpg'),
                      ),
                      preferredSize: Size.fromRadius(18),
                    ),
                    avatarChild: (context, data) => PreferredSize(
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.grey,
                        backgroundImage: AssetImage('images/dog.jpg'),
                      ),
                      preferredSize: Size.fromRadius(12),
                    ),
                    contentChild: (context, data) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 8),
                            decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(12)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Nguyen Ngoc Yen',
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption
                                      ?.copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  '${data.content}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption
                                      ?.copyWith(
                                          fontWeight: FontWeight.w300,
                                          color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          DefaultTextStyle(
                            style: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.bold),
                            child: Padding(
                              padding: EdgeInsets.only(top: 4),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "12 Likes",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.redo_outlined,
                                          color: Colors.grey,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "Reply",
                                          style: TextStyle(color: Colors.grey),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 100,
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.thumb_up_outlined,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      );
                    },
                    contentRoot: (context, data) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 8),
                            decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(12)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Luong Duy Liem',
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  '${data.content}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .copyWith(
                                          fontWeight: FontWeight.w300,
                                          color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          DefaultTextStyle(
                            style: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.bold),
                            child: Padding(
                              padding: EdgeInsets.only(top: 4),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "12 Likes",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.redo_outlined,
                                          color: Colors.grey,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "Reply",
                                          style: TextStyle(color: Colors.grey),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 100,
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.thumb_up_outlined,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    //controller: nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Text',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(216, 216, 216, 1),
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.format_bold),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.format_italic),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.format_underline_outlined),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.attachment),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.mood_outlined),
                              ),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Text(
                                "Send",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
