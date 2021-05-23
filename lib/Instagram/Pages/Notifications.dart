import 'package:flutter/material.dart';

class NotificationBody extends StatelessWidget {
  const NotificationBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        // color: Colors.purple,
        child: CircleAvatar(
          backgroundImage: NetworkImage(
              "https://images.pexels.com/photos/1720593/pexels-photo-1720593.jpeg?auto=compress&cs=tinysrgb&h=650&w=940"),
        ),
      ),
      title: Container(
          // height: 150,
          // color: Colors.amber,
          child: Text('You have received a notification from Isabella')),
      subtitle: Container(
        // color: Colors.cyan,
        child: Text("Timestamp : 00:88:22"),
      ),
      trailing: Container(
        // height: 120,
        // alignment: Alignment.topCenter,
        // color: Colors.red,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              child: Text('Follow'),
              // autofocus: true,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationHeader extends StatelessWidget {
  final String title;
  const NotificationHeader({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
    );
  }
}

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  Map<String, List<dynamic>> notifications = {
    "Today": List.generate(2, (index) => NotificationBody()),
    "This Week": List.generate(5, (index) => NotificationBody()),
    "This Month": List.generate(20, (index) => NotificationBody())
  };

  List notficationsList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: 24),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: Row(
                  children: [
                    Text(
                      'Activity',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  itemCount: 30,
                  itemBuilder: (context, index) {
                    notifications.forEach((key, value) {
                      notficationsList.add(NotificationHeader(title: key));
                      notficationsList.addAll(value);
                    });
                    return notficationsList[index];
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
