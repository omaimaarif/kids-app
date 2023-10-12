import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  final String ImageIconPath;
  final String tileName;
  final String subtile;
  const MyListTile({super.key,
  required this.ImageIconPath,
    required this.subtile,
  required this.tileName});

  @override
  Widget build(BuildContext context) {
    return
      Container(
               height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey[100]
              ),
             padding: EdgeInsets.all(12),
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image(image: AssetImage(ImageIconPath),height: 50,
                      ),
                     // SizedBox(width: 30,),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(tileName, style: TextStyle(fontWeight: FontWeight.bold,
                             fontSize: 20),),
                          SizedBox(height: 5,),
                          Text(subtile, style: TextStyle(
                              fontSize: 17),),
                        ],
                      ),
                     // SizedBox(width: 55,),
                      IconButton(onPressed: (){},
                          icon: Icon(Icons.arrow_forward_ios))
                    ],
                  ),

              ),




    );
  }
}
