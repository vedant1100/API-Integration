import 'dart:convert';
import 'package:apitutorial/models/postsModel.dart';
import 'package:apitutorial/models/userModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../models/productsModel.dart';

class PostsApiController extends ChangeNotifier{
  ProductsModel? productsModel;

  Future<void> getPostApi() async{
    Response response= await http.get(Uri.parse('https://reqres.in/api/unknown'));

    try{
      if(response.statusCode==200){
        var postdata=jsonDecode(response.body);
        productsModel = ProductsModel.fromJson(postdata);
      }
      else{
        productsModel = null;
      }
    }

    catch(e){
      print(e.toString());
      productsModel = null;
    }
  }
}


class productsApiController extends ChangeNotifier{
  Model? model;

  Future<void> getProductApi() async{
    Response response=await http.get(Uri.parse('https://webhook.site/c66bd8fb-ef49-468e-aaa9-9f749785f229'));

    try{
      if(response.statusCode==200){
        var productData=jsonDecode(response.body);
        model=Model.fromJson(productData);
      }
      else{
        model=null;
      }
    }
    catch(e){
      print(e.toString());
      model=null;
    }
  }
}
