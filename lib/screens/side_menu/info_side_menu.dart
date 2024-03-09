import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String titleInfo;
  final String subTitleInfo;
  const InfoCard({
    super.key,
    required this.titleInfo,
    required this.subTitleInfo
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.white24,
        child: Image(image:  AssetImage("lib/assets/user.png"),)
      ),
      title: Text(titleInfo, style: TextStyle(color: Colors.white),),
      subtitle: Text(subTitleInfo,style: TextStyle(color: Colors.white),),

    );
  }
}
