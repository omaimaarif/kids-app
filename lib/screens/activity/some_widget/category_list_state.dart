import 'package:flutter/material.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  int selectedCategory=0;
  List<String> categories=["Select and Drop","Education","Express Your Feelings"];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20/2),
        height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
          itemBuilder: (context,index)=>
          buildText(index, context) )
    );
  }


  Padding buildText(int index, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GestureDetector(
        onTap: (){
          setState(() {
            selectedCategory=index;
          });
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(categories[index],style:
                  Theme.of(context).textTheme.headline5?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: index== selectedCategory? Color(0xFF12153D): Colors.black.withOpacity(0.4)
                  ),),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20/2),
                height: 6,width: 40,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                color: index== selectedCategory?  Color(0xFFC48E94): Colors.transparent),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
