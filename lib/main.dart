import 'package:flutter/material.dart';
import 'data/article.dart';
import 'package:url_launcher/url_launcher.dart';
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


  Widget getItem(Article article){
    return Card(
      child: Padding (
        padding: EdgeInsets.all(8.0),
        child: InkWell(
          splashColor: Colors.green,
          child: ExpansionTile(
            title: new Text(article.headline, style: TextStyle(color: Colors.green),),
            children: getAllComment(article),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: new Center(
        child: new RefreshIndicator(
          onRefresh: (){
            articleList.removeAt(0);
            Scaffold.of(context).showSnackBar(new SnackBar(content: new Text("Refresh")));
            return;
          },
          child: new ListView(
            children: articleList.map(getItem).toList(),
          ),
        ),
      )
    );
  }

  _launchUrl(String url) async {
    if(await canLaunch(url)){
      await launch(url);
    }else{
      throw "COuld not Launch Url";
    }
  }

  getAllComment(Article article) {
    return article.comments.map((commentList)=>Text(commentList)).toList();
  }
}
