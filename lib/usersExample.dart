/*
API is parsed using plugin JsonToDart convertor and model named PostsModel
 is created located in file postsModel.dart.
 File location: C:\Users\Admin\StudioProjects\apitutorial\lib\models\userModel.dart
*/

import 'dart:convert';
import 'package:apitutorial/models/userModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class usersExample extends StatefulWidget {
  const usersExample({super.key});

  @override
  State<usersExample> createState() => _usersExampleState();
}

class _usersExampleState extends State<usersExample> {
  
 List<UserModel> usersList=[];
 Future<List<UserModel>> getUserApi() async{
   final response=await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
   var data=jsonDecode(response.body.toString());

   if(response.statusCode==200){
     for(Map i in data){
       usersList.add(UserModel.fromJson(i));
     }
   }
   return usersList;
 }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Users Api'),
      ),

      body: Column(
        children: [
          FutureBuilder(
              future: getUserApi(),
              builder: (context,snapshot){
                if(!snapshot.hasData){
                  return const Center(
                    child: SizedBox(
                      height: 50, width: 50,
                        child: CircularProgressIndicator()
                    ),
                  );
                }
                else{
                  return Expanded(
                    child: ListView.builder(
                        itemBuilder: (context,index){
                          return Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Name', style: TextStyle(fontSize: 20),),
                                reusableRow(name: usersList[index].name.toString(), email: usersList[index].email.toString()),
                                const Text('Address', style: TextStyle(fontSize: 20),),
                                reusableRow(name: usersList[index].address!.city.toString(), email: usersList[index].address!.geo!.lat.toString()),
                              ],
                            ),
                          );
                        }
                    ),
                  );
                }
              }
          )
        ],
      ),
    );
  }
}

class reusableRow extends StatelessWidget {
  String name;
  String email;
  reusableRow({super.key, required this.name, required this.email});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(name),
        Text(email)
      ],
    );
  }
}
