import 'package:flutter/material.dart';

class ForgetPasswordBtnWidget extends StatelessWidget {
  const ForgetPasswordBtnWidget({

    required this.btnIcon,
    required this.subTitle,
    required this.title,
    required  this.onTap,
    super.key,
  });
  final IconData btnIcon;
  final String title, subTitle;
  final VoidCallback onTap;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.grey.shade200,
        ),
        child: Row(
          children: [
            Icon(btnIcon, size: 60.0,),
            SizedBox(width:10.0 ,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.subtitle1,),
                Text(subTitle, style: Theme.of(context).textTheme.bodyMedium,)
              ],
            )
          ],
        ),
      ),
    );
  }
}