import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:motivoapp/quotes_model.dart';
import 'package:flutter/services.dart' as rootbundle;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ReadJsonData(),
        builder: (context, data) {
          if (data.hasError) {
            return Center(child: Text("${data.error}"));
          } else if (data.hasData) {
            var items = data.data as List<Quotes>;
            return ListView.builder(
                itemCount: items == null ? 0 : items.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: Text(items[index].text.toString()),
                          ),
                          Container(
                            child: Text(items[index].author.toString()),
                          )
                        ],
                      ),
                    ),
                  );
                });
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Future<List<Quotes>> ReadJsonData() async {
    final jsondata =
        await rootbundle.rootBundle.loadString('assets/quotes.json');
    final list = json.decode(jsondata) as List<dynamic>;
    return list.map((e) => Quotes.fromJson(e)).toList();
  }
}
