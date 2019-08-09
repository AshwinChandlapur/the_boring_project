import 'dart:async';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'bluetooth/bluetooth.dart';
import 'data/article.dart';
import 'package:the_boring_project/Page2.dart';

import 'login/login.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Article> articleList = articles;
  GlobalKey<RefreshIndicatorState> _refreshIndicator =
      GlobalKey<RefreshIndicatorState>();
  int _currentIndex = 0;
  PageController pageController =
      PageController(initialPage: 0, keepPage: true);
  GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  Widget getItem(Article article) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: InkWell(
          splashColor: Colors.green,
          child: ExpansionTile(
            title: new Text(
              article.headline,
              style: TextStyle(color: Colors.green),
            ),
            children: getAllComment(article),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Container(
        decoration: BoxDecoration(
            color: Colors.green, backgroundBlendMode: BlendMode.colorBurn),
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.all(0),
            children: <Widget>[
              GestureDetector(
                  onDoubleTap: () {
                    _scaffoldState.currentState.showSnackBar(
                        SnackBar(content: Text("Double Tap SuitCase")));
                  },
                  child: DrawerHeader(child: Icon(Icons.work))),
              ListTile(
                title: Text("Item 1"),
                subtitle: Text("Go Home"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Item 1"),
                subtitle: Text("Go Home"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Item 1"),
                subtitle: Text("Go Home"),
                onTap: () {},
              )
            ],
          ),
        ),
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: _handleTapChange,
        children: <Widget>[
          new Center(
            child: new RefreshIndicator(
              key: _refreshIndicator,
              onRefresh: _handleRefresh,
              child: new ListView(
                children: articleList.map(getItem).toList(),
              ),
            ),
          ),
          WeatherPage(),
          Login(),
          Bluetooth(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _handleTapChange,
        items: getButtonItems(),
        backgroundColor: Colors.green,
        elevation: 8.0,
      ),
    );
  }

  List<BottomNavigationBarItem> getButtonItems() {
    List<BottomNavigationBarItem> items = List<BottomNavigationBarItem>();
    items.add(BottomNavigationBarItem(
        icon: Icon(
          Icons.launch,
          color: Colors.deepOrange,
        ),
        title: Text(
          "Title",
          style: TextStyle(color: Colors.deepOrange),
        )));
    items.add(BottomNavigationBarItem(
        icon: Icon(
          Icons.list,
          color: Colors.deepOrange,
        ),
        title: Text(
          "Flutter",
          style: TextStyle(color: Colors.deepOrange),
        )));
    items.add(BottomNavigationBarItem(
        icon: Icon(
          Icons.settings,
          color: Colors.deepOrange,
        ),
        title: Text(
          "Awesome",
          style: TextStyle(color: Colors.deepOrange),
        )));
    items.add(BottomNavigationBarItem(
        icon: Icon(
          Icons.work,
          color: Colors.deepOrange,
        ),
        title: Text(
          "2020",
          style: TextStyle(color: Colors.deepOrange),
        )));

    return items;
  }

  _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Could not Launch Url";
    }
  }

  getAllComment(Article article) {
    return article.comments.map((commentList) {
      return Container(
        decoration: BoxDecoration(color: Colors.grey),
        child: Text(commentList),
      );
    }).toList();
  }

  Future<Null> _handleRefresh() async {
    await setState(() {
      articleList.removeLast();
    });

    return null;
  }

  void _handleTapChange(int value) {
    setState(() {
      _currentIndex = value;
      pageController.animateToPage(value,
          duration: Duration(milliseconds: 50), curve: Curves.easeOutQuad);
    });
  }
}
