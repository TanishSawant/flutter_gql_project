import 'package:flutter/material.dart';
import 'package:flutter_gql_project/Home.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final HttpLink httplink = HttpLink(uri: "https://countries.trevorblades.com/");
    final ValueNotifier<GraphQLClient> _client = ValueNotifier<GraphQLClient> (
      GraphQLClient(
        link: httplink,
        cache: OptimisticCache(dataIdFromObject: typenameDataIdFromObject)
      )
    );
    return GraphQLProvider(
      child: Home(),
      client: _client
    );
  }
}

