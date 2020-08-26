import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_github/flutter_github.dart';
import 'package:url_launcher/url_launcher.dart';

class FollowersData extends StatefulWidget {
  List followersData;
  String name;

  FollowersData({Key key, @required this.followersData,this.name}) : super(key: key);

  @override
  _FollowersDataState createState() => _FollowersDataState();
}

class _FollowersDataState extends State<FollowersData> {
  List followersData;
  String name;

  @override
  void initState() {
    setState(() {
      followersData = widget.followersData;
      name=widget.name;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: followersData == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            shadowColor: Colors.grey,

            child: Container(

              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: <Widget>[


                  ClipRRect(
                    borderRadius: BorderRadius.circular(80),
                    child: Image.network(
                      followersData[index]['avatar_url'],
                      width: 130,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 0),
                    child: Column(

                      children: <Widget>[
                        Text(
                          followersData[index]['login'],
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 22),
                        ),
                        GestureDetector(
                          onTap: () {
                            launch(followersData[index]
                            ['html_url']);
                          },
                          child: Text(
                            "Check Profile",
                            textAlign: TextAlign.start,
                            style:
                            TextStyle(color: Colors.blue),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
        itemCount: followersData == null ? 0 : followersData.length,
      ),
    );
  }
}
