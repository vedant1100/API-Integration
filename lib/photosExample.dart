/*
 Unlike earlier model of photosExample, here a custom made model is created
 inside this file named photos which uses specific tags of the api.
*/

import'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class photosExample extends StatefulWidget {
  const photosExample({super.key});

  @override
  State<photosExample> createState() => _photosExampleState();
}

class _photosExampleState extends State<photosExample> {

  List<photos> photosList=[];
  Future<List<photos>> getPhotoApi() async{
    final response= await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    var data=jsonDecode(response.body.toString());

    if(response.statusCode==200){
      for(Map i in data){
        photos Photo = photos(
            title: i['title'],
            url: i['url'],
            thumbnailUrl: i['thumbnailUrl']);
        photosList.add(Photo);
      }
    }
    return photosList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Photos API'),
      ),

      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getPhotoApi(),
                builder: (context,AsyncSnapshot<List<photos>>snapshot){
                  if(!snapshot.hasData){
                    return  const Center(
                        child: SizedBox(
                          height: 50, width: 50,
                            child: CircularProgressIndicator()
                        )
                    );
                  }
                  else{
                    return ListView.builder(
                        itemCount: photosList.length,
                        itemBuilder: (context,index){
                          return  ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(snapshot.data![index].url.toString()),
                            ),
                            title: const Text('Title: '),
                            subtitle: Text(snapshot.data![index].title.toString()),
                          );
                        }
                    );
                  }

                }
            ),
          )
        ],
      ),
    );
  }
}

// Custom made model
class photos{
  String title;
  String url;
  String thumbnailUrl;

  photos({required this.title, required this.url, required this.thumbnailUrl,});
}
