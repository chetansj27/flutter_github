import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_github/flutter_github.dart';
import 'package:flutter_github_example/followers_data.dart';
import 'package:flutter_github_example/repos_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController userNameController = TextEditingController();
  bool pressed = false;
  FlutterGithub _flutterGithub = new FlutterGithub();
  int _publicRepos, _publicGist, _followers, _following;
  String _image, _name, _company, _location, _email, _bio;
  bool _hireAble;
  var _createdAt,
      _updatedAt,
      _followersData,
      _followingData,
      _starredData,
      _subscriptionsData,
      _reposData;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Builder(
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: const Text('Flutter_Github Package Example'),
            ),
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.only(top: 10),
                      child: TextField(
                        controller: userNameController,
                        decoration: InputDecoration(
                            labelText: "Enter Github Username",
                            prefixIcon: Icon(Icons.account_circle),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12))),
                      ),
                    ),
                    RaisedButton.icon(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      color: Colors.blue,
                      textColor: Colors.white,
                      icon: Icon(Icons.search),
                      label: Text(
                        "Search",
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () async {
                        setState(() {
                          _image = null;
                          pressed = true;
                        });
                        showData(userNameController.text);
                      },
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                      ),
                    ),
                    pressed
                        ? _image == null
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : Container(
                                width: MediaQuery.of(context).size.width * 0.95,
                                child: Card(
                                  child: Container(
                                    margin: EdgeInsets.all(15),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(top: 5),
                                        ),
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(80),
                                          child: Image.network(
                                            "$_image",
                                            width: 160,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 2),
                                        ),
                                        Text(
                                          "$_name",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 10),
                                        ),
                                        Text(
                                          "$_bio",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 19,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 10),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            FollowersData(
                                                              followersData:
                                                                  _followersData,
                                                              name:
                                                                  "Followers Data",
                                                            )));
                                              },
                                              child: Column(
                                                children: <Widget>[
                                                  Text(
                                                    "Followers",
                                                    style: TextStyle(
                                                      fontSize: 19,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  Text(
                                                    "$_followers",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  )
                                                ],
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            FollowersData(
                                                              followersData:
                                                                  _followingData,
                                                              name:
                                                                  "Following Data",
                                                            )));
                                              },
                                              child: Column(
                                                children: <Widget>[
                                                  Text(
                                                    "Following",
                                                    style: TextStyle(
                                                      fontSize: 19,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  Text(
                                                    "$_following",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 16,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        ExpansionTile(
                                          title: Text("See More Details"),
                                          children: <Widget>[
                                            Padding(
                                              padding: EdgeInsets.only(top: 10),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Column(
                                                  children: <Widget>[
                                                    Text(
                                                      "CreatedAt",
                                                      style: TextStyle(
                                                        fontSize: 19,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                    Text(
                                                      "$_createdAt",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    )
                                                  ],
                                                ),
                                                Column(
                                                  children: <Widget>[
                                                    Text(
                                                      "UpdatedAt",
                                                      style: TextStyle(
                                                        fontSize: 19,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                    Text(
                                                      "$_updatedAt",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 16,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(top: 10),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                GestureDetector(
                                                  onTap: () {
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                                    ReposData(
                                                                      reposData:
                                                                          _reposData,
                                                                      title:
                                                                          "Repos Data",
                                                                    )));
                                                  },
                                                  child: Column(
                                                    children: <Widget>[
                                                      Text(
                                                        "PublicRepos",
                                                        style: TextStyle(
                                                          fontSize: 19,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                      Text(
                                                        "$_publicRepos",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                GestureDetector(
                                                  child: Column(
                                                    children: <Widget>[
                                                      Text(
                                                        "PublicGist",
                                                        style: TextStyle(
                                                          fontSize: 19,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                      Text(
                                                        "$_publicGist",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 16,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(top: 10),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Column(
                                                  children: <Widget>[
                                                    Text(
                                                      "Company",
                                                      style: TextStyle(
                                                        fontSize: 19,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                    Text(
                                                      "$_company",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    )
                                                  ],
                                                ),
                                                Column(
                                                  children: <Widget>[
                                                    Text(
                                                      "Hireable",
                                                      style: TextStyle(
                                                        fontSize: 19,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                    Text(
                                                      _hireAble == null
                                                          ? "No"
                                                          : "$_hireAble",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 16,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(top: 10),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Column(
                                                  children: <Widget>[
                                                    Text(
                                                      "Email",
                                                      style: TextStyle(
                                                        fontSize: 19,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                    Text(
                                                      "$_email",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    )
                                                  ],
                                                ),
                                                Column(
                                                  children: <Widget>[
                                                    Text(
                                                      "Location",
                                                      style: TextStyle(
                                                        fontSize: 19,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                    Text(
                                                      "$_location",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 16,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(top: 10),
                                            ),
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  RaisedButton(
                                                    onPressed: () {
                                                      Navigator.of(context).push(
                                                          MaterialPageRoute(
                                                              builder:
                                                                  (context) =>
                                                                      ReposData(
                                                                        reposData:
                                                                            _starredData,
                                                                        title:
                                                                            "Starred Repos",
                                                                      )));
                                                    },
                                                    child: Text(
                                                      "Starred Repos",
                                                      style: TextStyle(
                                                          fontSize: 18),
                                                    ),
                                                    shape:
                                                        new RoundedRectangleBorder(
                                                      borderRadius:
                                                          new BorderRadius
                                                              .circular(20.0),
                                                    ),
                                                    color: Colors.blue,
                                                    textColor: Colors.white,
                                                  ),
                                                  RaisedButton(
                                                    onPressed: () {
                                                      Navigator.of(context).push(
                                                          MaterialPageRoute(
                                                              builder:
                                                                  (context) =>
                                                                      ReposData(
                                                                        reposData:
                                                                            _subscriptionsData,
                                                                        title:
                                                                            "Subsciption Data",
                                                                      )));
                                                    },
                                                    child: Text(
                                                      "Subscriptions",
                                                      style: TextStyle(
                                                          fontSize: 18),
                                                    ),
                                                    shape:
                                                        new RoundedRectangleBorder(
                                                      borderRadius:
                                                          new BorderRadius
                                                              .circular(20.0),
                                                    ),
                                                    color: Colors.blue,
                                                    textColor: Colors.white,
                                                  )
                                                ])
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                        : Container()
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  Future showData(String userName) async {
    await _flutterGithub.getUserData(userName);
    setState(() {
      this._starredData = _flutterGithub.starredData;
      this._image = _flutterGithub.image;
      this._name = _flutterGithub.name;
      this._followers = _flutterGithub.followers;
      this._following = _flutterGithub.following;
      this._followersData = _flutterGithub.followersData;
      this._followingData = _flutterGithub.followingData;
      this._bio = _flutterGithub.bio;
      if (_bio == null) {
        _bio = "";
      }
      this._updatedAt = _flutterGithub.updatedAt;
      this._createdAt = _flutterGithub.createdAt;
      this._publicRepos = _flutterGithub.publicRepos;
      this._publicGist = _flutterGithub.publicGists;
      this._company = _flutterGithub.company;
      if (_company == null) {
        _company = "No";
      }
      this._hireAble = _flutterGithub.hireAble;
      this._email = _flutterGithub.email;
      if (_email == null) {
        _email = "Not Available";
      }
      this._location = _flutterGithub.location;
      if (_location == null) {
        _location = "Not Available";
      }
      this._reposData = _flutterGithub.reposData;
      this._subscriptionsData = _flutterGithub.subscriptionsData;
    });
  }
}
