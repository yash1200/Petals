import 'package:flutter/material.dart';
import 'package:petal/models/SearchRes.dart';
import 'package:petal/provider/RecentProvider.dart';
import 'package:http/http.dart' as http;
import 'package:petal/values/strings.dart';
import 'package:provider/provider.dart';

import 'MenuScreen.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController textEditingController = TextEditingController();

  Future<List<Searchres>> search(String q) async {
    if (q == "") return [];
    var response = await http.get(Strings().searchUrl + "/?q=$q");
    return searchresFromJson(response.body);
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RecentProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: textEditingController,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Search',
            suffixIcon: IconButton(
              icon: Icon(Icons.cancel),
              onPressed: () {
                textEditingController.clear();
              },
            ),
          ),
          onChanged: (value) {
            provider.setQ(textEditingController.text);
          },
        ),
      ),
      body: FutureBuilder(
        future: search(provider.q),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              padding: EdgeInsets.only(top: 10),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: (snapshot.data! as List).length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text((snapshot.data! as List)[index].name),
                    onTap: () {
                      print((snapshot.data! as List)[index].id);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return MenuScreen(
                              id: (snapshot.data! as List)[index].id,
                            );
                          },
                        ),
                      );
                    },
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
