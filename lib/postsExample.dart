/* API is parsed using plugin JsonToDart convertor and model named PostsModel
 is created located in file postsModel.dart.
 File location: C:\Users\Admin\StudioProjects\apitutorial\lib\models\postsModel.dart
*/
import 'dart:convert';
import 'package:apitutorial/Services/apiController.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'models/postsModel.dart';

class PostsExample extends StatefulWidget {
  const PostsExample({super.key});

  @override
  State<PostsExample> createState() => _PostsExampleState();
}

class _PostsExampleState extends State<PostsExample> {
  List<Datum>? dataList = [];

  Future<void> fetchPostsApi() async {
    await Provider.of<PostsApiController>(context, listen: false).getPostApi();
    var postApi = Provider.of<PostsApiController>(context, listen: false).productsModel?.data;
    dataList = postApi;
    // print("List : $dataList");
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
                future: fetchPostsApi(),
                builder: (context, snapshot) {
                  return snapshot.connectionState == ConnectionState.waiting
                      ? const Center(
                          child: CircularProgressIndicator(),
                        ) :
                      ListView.builder(
                          itemCount: dataList?.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Name', style: TextStyle(fontSize: 20),),
                                  Text("${dataList?[index].name}"),
                                  const Text('Color', style: TextStyle(fontSize: 20),),
                                  Text('${dataList?[index].color}')
                                ],
                              ),
                            );
                          });
                }
                ),
          )
        ],
      ),
    );
  }
}
