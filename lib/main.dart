import 'package:flutter/material.dart';
import 'package:showlist/image_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('TEST BUSAN TEAM'),
          actions: [
            GestureDetector(
                onTap: () {
                  showSearch(
                      context: context,
                      delegate: CustomSearch(),
                  );
                },
                child: Icon(Icons.search)
            )
          ],
        ),
        body: Column(
          children: [
            Container(
                height: 250,
                margin: EdgeInsets.only(top: 30),
                child: MainVisual()
            ),
            Container(
              height: 50,
              margin: EdgeInsets.only(top: 30),
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TabVisual(),
            ),
          ],
        ),
      ),
    );
  }
}



class CustomSearch extends SearchDelegate {
  List<String> allData = [
    'Bayabas',
    'Orot',
    'Neurocircuit',
  ];


  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear)
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back)
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in allData) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];

          return ListTile(
            title: Text(result),
          );
        },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in allData) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];

        return ListTile(
          title: Text(result),
        );
      },
    );
  }

}





class MainVisual extends StatelessWidget {

  List img = [
    'images/hand.png',
    'images/print.png',
    'images/glass.png',
    'images/life.png'
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: img.length,
        itemBuilder: (context, index) {
          return Container(
            width: 200,
            height: 200,
            margin: EdgeInsets.only(right: 15),
            color: Colors.grey.shade100,
            child: Image.asset(img[index]),
          );
        },
    );
  }
}



class TabVisual extends StatelessWidget {
  TabVisual({Key? key}) : super(key: key);

  final List<String> img = [
    '# 3D Glass Art',
    '# Hand Drawing Art',
    '# Life Art Work',
    '# Art Work Print'
  ];

  final List<String> name = [
    'glass.png',
    'hand.png',
    'life.png',
    'print.png'
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => Container(width: 15,),
        itemCount: img.length,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              color: Color(0xffcdd7da),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => ImagePage(route: 'images/${name[index]}'),)
                  );
                },
                child: Center(
                  child: Text('${img[index]}'),
                ),
              ),
            ),
          );
        },
    );
  }
}




