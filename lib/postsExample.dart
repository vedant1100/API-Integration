/* API is parsed using plugin JsonToDart convertor and model named PostsModel
 is created located in file postsModel.dart.
 File location: C:\Users\Admin\StudioProjects\apitutorial\lib\models\postsModel.dart
*/
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'models/postsModel.dart';

class postsExample extends StatefulWidget {
  const postsExample({super.key});

  @override
  State<postsExample> createState() => _postsExampleState();
}

class _postsExampleState extends State<postsExample> {

  List<PostsModel> postList=[];
  Future<List<PostsModel>> getPostApi() async{
    final response= await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    var data=jsonDecode(response.body.toString());

    if(response.statusCode==200){
      for(Map i in data){
        postList.add(PostsModel.fromJson(i));
      }
    }
    return postList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts Api'),
      ),

      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getPostApi(),
                builder: (context, snapshot){
                  if(!snapshot.hasData){
                    return const Center(
                      child: SizedBox(
                        height: 50, width: 50,
                          child: CircularProgressIndicator()),
                    );
                  }
                  else{
                    return ListView.builder(
                      itemCount: postList.length,
                        itemBuilder: (context,index){
                          return Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(postList[index].title.toString()),
                              ],
                            ),
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
