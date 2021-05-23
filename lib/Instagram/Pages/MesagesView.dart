import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ui_arena/Instagram/Pages/ChatView.dart';

class MessagesView extends StatefulWidget {
  @override
  _MessagesViewState createState() => _MessagesViewState();
}

class _MessagesViewState extends State<MessagesView>
    with TickerProviderStateMixin {
  bool isPrimary = true;
  TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              //TOP BAR
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      splashRadius: 24,
                      icon: Icon(Icons.arrow_back),
                      onPressed: () => Navigator.of(context).pop()),
                  Text('Username'),
                  Row(
                    children: [
                      IconButton(
                        splashRadius: 24,
                        icon: Icon(Icons.more_vert),
                        onPressed: () {},
                      ),
                      IconButton(
                          splashRadius: 24,
                          icon: Icon(Icons.fiber_new_outlined),
                          onPressed: () {}),
                    ],
                  )
                ],
              ),

              //SEARCH BAR
              TextFormField(),

              //TAB BAR VIEW MESSAGES
              TabBar(
                labelStyle: TextStyle(fontSize: 18),
                labelPadding: EdgeInsets.symmetric(vertical: 12),
                tabs: [
                  Text(
                    'Primary',
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    'General',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
                controller: _tabController,
                onTap: (value) {
                  switch (value) {
                    case 0:
                      setState(() {
                        isPrimary = true;
                      });
                      break;
                    case 1:
                      setState(() {
                        isPrimary = false;
                      });
                      break;
                    default:
                      break;
                  }
                },
              ),

              isPrimary
                  ? StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('users')
                          .where('uid',
                              isNotEqualTo:
                                  FirebaseAuth.instance.currentUser.uid)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final listOfUsers = snapshot.data.docs;
                          return Expanded(
                            child: ListView.builder(
                              itemCount: listOfUsers.length,
                              itemBuilder: (context, index) {
                                // print(listOfUsers[index].data());
                                return InkWell(
                                  onTap: () {
                                    print('TAPPPEEDDDD');
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) =>
                                          ChatView(user: listOfUsers[index]),
                                    ));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 16, horizontal: 4),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: CircleAvatar(
                                            backgroundImage: NetworkImage(
                                                'https://images.pexels.com/photos/4993102/pexels-photo-4993102.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
                                          ),
                                        ),
                                        Expanded(
                                            child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(listOfUsers[index]['email']),
                                            Text('Message'),
                                          ],
                                        )),
                                        Icon(Icons.camera_alt)
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        }
                        return Container();
                      })
                  : Container(
                      height: 50,
                      width: 50,
                      color: Colors.cyan,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
