import 'package:flutter/material.dart';
import 'package:search_listview/model/movie_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SearchPage(),
    );
  }
}

class SearchPage extends StatefulWidget {
  //const SearchPage({ Key? key }) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  static List<MovieModel> main_movie_list = [
    MovieModel('fkdsnflflaf', 1965, "", 9.6),
    MovieModel('ahmvl', 2020, "", 7.6),
    MovieModel('k dff', 2010, "", 6.0),
    MovieModel('f ll', 2006, "", 5.9),
    MovieModel('ya llo', 2005, "", 9.0),
    MovieModel('O ppp', 1999, "", 4.0),
    MovieModel('A llol', 1990, "", 8.0),
    MovieModel('Vooo', 1901, "", 3.0),
  ];

  List<MovieModel> display_list = List.from(main_movie_list);

  void updateList(String value) {
    //this is function that will filter our list
    //we will be back to this list after a while
    setState(() {
      display_list = main_movie_list
          .where((element) =>
              element.movie_title.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1f1545),
      appBar: AppBar(
        backgroundColor: Color(0xFF1f1545),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("search for the Movie",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (value) => updateList(value),
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xff302360),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                hintText: "Search",
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.purple.shade800,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
                child: display_list.length == 0
                    ? Center(
                        child: Text(
                        'No result found',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white,fontSize: 22),
                      ))
                    : ListView.builder(
                        itemCount: display_list.length,
                        itemBuilder: (context, index) => ListTile(
                              contentPadding: EdgeInsets.all(8),
                              title: Text(
                                display_list[index].movie_title,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                "${display_list[index].movie_release_year} ",
                                style: TextStyle(
                                  color: Colors.white60,
                                ),
                              ),
                              trailing: Text('${display_list[index].rating}',
                                  style: TextStyle(
                                    color: Colors.amber,
                                  )),
                              leading: Image.network(
                                  display_list[index].movie_poster_url),
                            ))),
          ],
        ),
      ),
    );
  }
}