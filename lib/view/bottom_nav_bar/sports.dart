import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../controller/News_controller.dart';
import '../../model/nes_moel.dart';


class Sports extends GetWidget{
  @override
  Widget build(BuildContext context) {

    NewsController controller=Get.put(NewsController());
    return Scaffold(
      appBar: AppBar(title: Text("Explore News Headlines"),),
      body: FutureBuilder(
          future: controller.getData("sports"),
          builder: (context,AsyncSnapshot snapshot)
          {
            Articles data=snapshot.data;
            if(snapshot.hasData)
            {
              return ListView.builder(

                  itemCount: data.articles.length,
                  itemBuilder:(context,int index)
                  {
                    return Card(
                      elevation: 10,
                      shadowColor: Colors.black,
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 200,
                            child: Image.network(
                              data.articles[index].urlToImage.toString(),
                              fit: BoxFit.fill,
                            ),
                          ),
                          Text(
                            data.articles[index].title.toString(),
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            textDirection: TextDirection.rtl,

                          ),
                          Text(
                            data.articles[index].description.toString(),
                            style: TextStyle(
                                fontSize: 15,color: Colors.grey),
                            textDirection: TextDirection.rtl,

                          ),

                        ],
                      ),
                    );
                  } );
            }
            else{
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }

}