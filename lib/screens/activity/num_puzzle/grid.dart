import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class grid extends StatelessWidget {
  grid(this.number, this.onClick, {super.key});
  var number=[];
Function onClick;

  @override
  Widget build(BuildContext context) {
    // height:MediaQuery.of(context).size.height*0.10 ,
    // width: MediaQuery.of(context).size.width*0.5,
    return Container(
      height:MediaQuery.of(context).size.height/2,
      width: MediaQuery.of(context).size.width*0.8,
      child: GridView.builder(
        itemCount: number.length,
          gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:  3 ),
          itemBuilder: (context, index){
          return number[index]!=0?
        GestureDetector(
          onTap: (){
            onClick(index);
          },
          child: Card(
            color: Color(0xFF579D9A),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)
            ),
            elevation: 10,
            child: Container(
              decoration: BoxDecoration(
                color:Color(0xFF579D9A),
                borderRadius: BorderRadius.circular(8)
              ),
              height: 100,
              width: 100,
              child: Center(
                child: FittedBox(
                  child: Text(number[index].toString(),
                  style:GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold
                  ) ,
                  ),
                ),
              ),
            ),

          ),
        )
              : SizedBox.shrink();
          }),
    );

  }
}
