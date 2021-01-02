# flutter_gql_project

A new Flutter project.
GraphQL client

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


<br />


> Type ```flutter run``` in command prompt.

The page loads up which shows the list of countries as per the query.

```
query GetContinent($code : String!){
                      continent(code:$code){
                        name
                        countries{
                          name
                        }
                      }
                    }

```

Change this query to get desired outputs


Link to the graphQL API used : https://countries.trevorblades.com/
