import 'package:flutter/material.dart';
import 'package:ui_arena/Instagram/Pages/MesagesView.dart';
import 'package:ui_arena/Instagram/Widgets/postView.dart';

class FeedView extends StatefulWidget {
  @override
  _FeedViewState createState() => _FeedViewState();
}

class _FeedViewState extends State<FeedView> {
  // bool hideFeed = false;
  double top = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //APP BAR
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              // color: Colors.amber,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 100,
                    alignment: Alignment.centerLeft,
                    child: Icon(
                      Icons.add_box_outlined,
                      size: 30,
                      color: Colors.black.withAlpha(180),
                    ),
                  ),
                  Image.network(
                    "https://cdn.iconscout.com/icon/free/png-64/instagram-61-189771.png",
                    height: 60,
                    width: 100,
                  ),

                  //DIRECT MESSAGE BUTTON
                  Container(
                    alignment: Alignment.centerRight,
                    width: 100,
                    child: InkWell(
                      // borderRadius: BorderRadius.circular(15),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MessagesView(),
                        ));
                      },
                      child: Stack(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 6),
                            child: Icon(
                              Icons.send_outlined,
                              size: 30,
                              color: Colors.black.withAlpha(180),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            top: top,
                            child: Container(
                              padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                  color: Colors.red, shape: BoxShape.circle),
                              child: Text("9"),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //STORIES
            Container(
              // color: Colors.deepPurple,
              height: 108,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                scrollDirection: Axis.horizontal,
                itemCount: 15,
                itemBuilder: (context, index) {
                  if (index == 0)
                    return Container(
                      padding: EdgeInsets.only(right: 6),
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                    color: Colors.blue, shape: BoxShape.circle),
                              ),
                              Positioned(
                                right: 0,
                                bottom: 0,
                                child: Container(
                                  width: 24,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      shape: BoxShape.circle),
                                  child: Icon(Icons.add),
                                ),
                              ),
                            ],
                          ),
                          Text('YourStory'),
                        ],
                      ),
                    );
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(width: 1),
                                // color: Colors.blue,
                                shape: BoxShape.circle,
                              ),
                              height: 68,
                              width: 68,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                              height: 60,
                              width: 60,
                            ),
                          ],
                        ),
                        Text('Their Story'),
                      ],
                    ),
                  );
                },
              ),
            ),

            //BODY
            Expanded(
              child: Container(
                // color: Colors.red,
                child: ListView.builder(
                  // itemExtent: 20,
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return PostView();
                  },
                ),
              ),
            ),

            //BOTTOM NAVBAR
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              // alignment: Alignment.topCenter,
              height: 60,
              // width: 100,
              // color: Colors.amber,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(
                    Icons.home_filled,
                    size: 30,
                  ),
                  Icon(Icons.search, size: 30),
                  Icon(Icons.video_collection_outlined, size: 30),
                  Icon(Icons.thumb_up_alt_outlined, size: 30),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    height: 30,
                    width: 30,
                  ),
                  // Container(
                  //   color: Colors.black,
                  //   height: 40,
                  //   width: 40,
                  // ),
                  // Container(
                  //   color: Colors.teal,
                  //   height: 40,
                  //   width: 40,
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
