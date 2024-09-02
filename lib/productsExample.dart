/*
API is parsed from https://app.quicktype.io/ and model named ProductsModel
 is created located in file postsModel.dart.
 This is a complex api with multiple nested arrays and objects.
 API is not accessible directly through link endpoints. I will provide api in json format, copy it and get it
 converted to api link from https://webhook.site/
 File location: C:\Users\Admin\StudioProjects\apitutorial\lib\models\productsModel.dart
 API file location: C:\Users\Admin\StudioProjects\apitutorial\lib\models\API
*/

import 'dart:convert';

import 'package:apitutorial/models/productsModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class productsExample extends StatefulWidget {
  const productsExample({super.key});

  @override
  State<productsExample> createState() => _productsExampleState();
}

class _productsExampleState extends State<productsExample> {
  ProductsModel? productsList;

  Future getProductApi() async {
    final response = await http.get(
        Uri.parse('https://webhook.site/c66bd8fb-ef49-468e-aaa9-9f749785f229'));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      productsList = ProductsModel.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Products API'),
      ),
      body: Column(
        children: [
          FutureBuilder(
              future: getProductApi(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: SizedBox(
                        height: 50,
                        width: 50,
                        child: CircularProgressIndicator()),
                  );
                } else {
                  return Expanded(
                      child: ListView.builder(
                          itemCount: productsList?.data?.length,
                          itemBuilder: (context, index) {
                            final dataObj = productsList?.data?[index];
                            // print('sale title: ${dataObj?.saleTitle}');
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Sale_title',
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(dataObj?.saleTitle ?? ''),
                                Text(dataObj?.images?[index].url??''),
                              ],
                            );
                          }));
                }
              })
        ],
      ),
    );
  }
}
