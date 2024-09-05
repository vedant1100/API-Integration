/*
API is parsed from https://app.quicktype.io/ and model named ProductsModel
 is created located in file postsModel.dart.
 This is a complex api with multiple nested arrays and objects.
 API is not accessible directly through link endpoints. I will provide api in json format, copy it and get it
 converted to api link from https://webhook.site/
 File location: C:\Users\Admin\StudioProjects\apitutorial\lib\models\productsModel.dart
 API file location: C:\Users\Admin\StudioProjects\apitutorial\lib\models\API
*/

import 'package:apitutorial/Services/apiController.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/postsModel.dart';

class productsExample extends StatefulWidget {
  const productsExample({super.key});

  @override
  State<productsExample> createState() => _productsExampleState();
}

class _productsExampleState extends State<productsExample> {
  List? productsList = [];

  Future fetchProductApi() async {
    await Provider.of<productsApiController>(context, listen: false)
        .getProductApi();
    var productApi =
        Provider.of<productsApiController>(context, listen: false).model?.data;
    productsList = productApi;
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
              future: fetchProductApi(),
              builder: (context, snapshot) {
                return snapshot.connectionState == ConnectionState.waiting
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Expanded(
                      child: ListView.builder(
                          itemCount: productsList?.length,
                          itemBuilder: (context, index) {
                            final dataObj = productsList?[index];
                            // print('sale title: ${dataObj?.saleTitle}');
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text(
                                  'Sale_title',
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(dataObj.saleTitle ?? ''),
                                Text(dataObj.images?[index].url ?? ''),
                              ],
                            );
                          }),
                    );
              })
        ],
      ),
    );
  }
}
