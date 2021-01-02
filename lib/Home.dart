import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final String query = r"""
                    query GetContinent($code : String!){
                      continent(code:$code){
                        name
                        countries{
                          name
                        }
                      }
                    }
                  """;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text("GraphlQL Client"),
          ),
          body: Query(
              options: QueryOptions(
                  // ignore: deprecated_member_use
                  document: query,
                  variables: <String, dynamic>{"code": "AS"}),
              builder: (QueryResult result,
                  {VoidCallback refetch, FetchMore fetchMore}) {
                if (result.hasException) {
                  return Text(result.exception.toString());
                }
                if (result.loading) {
                  return Center(child: CircularProgressIndicator());
                }
                return ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(
                          result.data['continent']['countries'][index]['name']),
                    );
                  },
                  itemCount: result.data['continent']['countries'].length,
                );
              })),
    );
  }
}
