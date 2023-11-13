import 'package:another_final_kids_app/cards/home_page_card.dart';
import 'package:another_final_kids_app/screens/activity/dragDrop.dart';
import 'package:another_final_kids_app/screens/activity/some_widget/education_activity.dart';
import 'package:another_final_kids_app/screens/activity/some_widget/sorting_and_drag.dart';
import 'package:another_final_kids_app/tile/my_list_tile.dart';
import 'package:flutter/material.dart';

class CategoryActivity extends StatefulWidget {
  const CategoryActivity({super.key});

  @override
  State<CategoryActivity> createState() => _CategoryActivityState();
}

class _CategoryActivityState extends State<CategoryActivity> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Color(0xFF143233),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading:  IconButton(onPressed: (){
            Navigator.of(context).pushNamed("HomePage");
          },
            icon:Icon(Icons.arrow_back_ios),color: Colors.grey,),
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Padding(padding: EdgeInsets.symmetric(horizontal:10 ),
                ),
                SizedBox(height: 5,),
                TabBar(
                  isScrollable: true,
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(color: Colors.white70, width: 2.0),
                  ),

                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                  ),
                  labelPadding: EdgeInsets.symmetric(horizontal: 20),
                  tabs: [
                    Tab(text:"Select and Drop",),
                    Tab(text:"Education",),
                    Tab(text:"Express Your Feelings",),

                  ],

                ),
                SizedBox(height: 40,),

                Flexible(
                    flex: 1,
                    child: TabBarView(
                      children: [
                        SortAndDrag(),
                        EducationActivity(),
                        Container(color: Colors.white,),
                      ],
                    )),
              ],
            ),
          ),
        ),
    );
  }
}

