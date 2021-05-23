import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class PostView extends StatelessWidget {
  const PostView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Top Bar
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
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
                        height: 34,
                        width: 34,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        height: 30,
                        width: 30,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text('The username'),
                ],
              ),
              Icon(Icons.more_vert),
            ],
          ),
        ),

        //Picture
        AspectRatio(
          aspectRatio: 1,
          child: Image.network(
            'https://images.pexels.com/photos/236171/pexels-photo-236171.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
            fit: BoxFit.cover,
          ),
        ),

        //Reaction Section
        Container(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 100,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.thumb_up),
                    Icon(Icons.comment_outlined),
                    Icon(Icons.share)
                  ],
                ),
              ),
              Container(
                width: 100,
                alignment: Alignment.center,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ...List.generate(5, (index) => index).map(
                      (e) => Container(
                        margin: EdgeInsets.symmetric(horizontal: 2),
                        height: 4,
                        width: 4,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: e == 0 ? Colors.blue : Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 100,
                alignment: Alignment.centerRight,
                child: Icon(Icons.save_outlined),
              ),
            ],
          ),
        ),

        //LikesCount

        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 12,
          ),
          child: Text('16,800 Likes'),
        ),

        //Username & Description

        Container(
          // color: Colors.amber,
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: RichText(
            textWidthBasis: TextWidthBasis.parent,
            text: TextSpan(
              style: TextStyle(
                color: Colors.black,
                // backgroundColor: Colors.red,
              ),
              children: [
                WidgetSpan(
                  child: GestureDetector(
                    onTap: () => print('tapped'),
                    child: Text(
                      'My_username',
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 15.1),
                    ),
                  ),
                ),
                WidgetSpan(
                  alignment: PlaceholderAlignment.bottom,
                  child: SizedBox(
                    width: 8,
                  ),
                ),
                TextSpan(
                    text:
                        'This is the description of the user that the post belongs to. hashtag. Hashtag. Hashtag.'),
                TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      print('tapped');
                    },
                  text: 'Read More',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: Colors.grey),
                ),
              ],
            ),
          ),
        ),

        //Comments Section

        //Add a Comment
        Container(
            padding: EdgeInsets.symmetric(
              horizontal: 12,
            ),
            child: TextField(
                decoration: InputDecoration(hintText: 'Add a comment'))),

        //Timestamp
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: Text(
            '12:03:11 May 5, 2021',
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        )
      ],
    );
  }
}
