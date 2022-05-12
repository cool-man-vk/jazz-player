import 'package:flutter/material.dart';
import '../widgets/music_lists.dart';
import '../widgets/app_drawer.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title:const Text('JazzPlayer'),
        title: Row(
          children: const [Icon(Icons.music_note), Text('Jazz Player')],
        ),
        actions: [
          IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: MySearchDelegate(),
                );
              })
        ],
        // title: Row(
        //   children : const [
        //     Icon(Icons.music_note),
        //     Text('Jazz Player')
        //     ],
        // ),
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: SizedBox(height: 800, child: MusicLists()),
      ),
    );
  }
}


class  MySearchDelegate extends SearchDelegate{
  List<String> searchResults = [
  ];
  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        icon:const Icon(Icons.arrow_back),
        onPressed: () => close(context, null),
      );

  @override
  List<Widget>? buildActions(BuildContext context) => [
    IconButton(
      icon: const Icon(Icons.clear),
      onPressed: () {
        if (query.isEmpty){
          close(context, null);
        } else{
          query = '';
        }
      },
    ) 
  ];


  // List<Widget>?buildActions(BuildContext context) => Container();
  @override
  Widget buildResults(BuildContext context) => Center(
    child: Text(
      query == MusicLists.musicDataDetails[index] ,
    style: const TextStyle(fontSize: 64),),
    );
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = searchResults.where((searchResult)
    {
      final result = searchResult.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();

    return ListView.builder(
      itemCount:suggestions.length,
      itemBuilder:(context, index) {
        final suggestion = suggestions[index];

        return ListTile(
          title:Text(suggestion),
          onTap:(){
            query = suggestion;
            showResults(context);
          },
        );
      }
    );
  }
}
