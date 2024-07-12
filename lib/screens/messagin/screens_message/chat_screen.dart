import 'package:another_final_kids_app/screens/chatterbox/call.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore =FirebaseFirestore.instance;
late User signedInUser;
class ChatScreen extends StatefulWidget {
  static const String screenRoute = 'chat_screen';
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}
class _ChatScreenState extends State<ChatScreen> {
  final messageTextController= TextEditingController();
  final _auth = FirebaseAuth.instance;
  String? messageText;
  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }
  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        signedInUser = user;
        print(signedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor:Color(0xFFDFDFDF),
        title: Row(
          children: [
            Image.asset('lib/assets/user.png', height: 40),

          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => MyCall(callID: "1")));
            },
            icon: Icon(Icons.call, color: Color(0xFF6898A2)),
          ),
          IconButton(
            onPressed: () {

            },
            icon: Icon(Icons.menu, color: Color(0xFF6898A2)),
          ),
        ],
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pushNamed('HomePage');
          },
          icon: Icon(Icons.arrow_back_ios, color: Color(0xFF6898A2),),
        )
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MessageStreamBuilder(),
            Container(

              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.grey[200]!,
                    width: 1,
                  ),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  )
                ]
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                      controller: messageTextController,
                      onChanged: (value) {

                        messageText= value;
                      },
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: Color(0xB3306471)),
                        // filled: true,
                        // fillColor: Colors.grey[200],
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        hintText: 'Type here...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      messageTextController.clear();
                      _firestore.collection('messages').add({
                        'text': messageText,
                        'sender': signedInUser.email,
                        'time': FieldValue.serverTimestamp(),
                      });
                    },
                    icon: Icon(Icons.send, color: Color(0xFF306471),),

                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class MessageStreamBuilder extends StatelessWidget {
  const MessageStreamBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return  StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('messages').orderBy('time').snapshots(),
        builder: (context, snapshot){

          List<MessageLine> messageWidgets=[];
          if(!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.blue,
              ),
            );
          }
          final messages=snapshot.data!.docs.reversed;
          for(var message in messages){
            final messageText=message.get('text');
            final messageSender= message.get('sender');
            final currentUser=signedInUser.email;

            if(currentUser == messageSender){

            }
            final messageWidget=MessageLine(isMe:currentUser==messageSender ,
              sender: messageSender,text: messageText,);
            messageWidgets.add(messageWidget);

          }

          return Expanded(
            child: ListView(
              reverse: true,
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
              children: messageWidgets,
            ),
          );

        });
  }
}



 class MessageLine extends StatelessWidget {
   const MessageLine({ this.text,this.sender,  super.key, required this.isMe});

   final String? sender;
   final String? text;
   final bool isMe;
 
   @override
   Widget build(BuildContext context) {
     return Padding(
       padding: EdgeInsets.all(10.0),
       child: Column(
         crossAxisAlignment:isMe? CrossAxisAlignment.end: CrossAxisAlignment.start,
         children: [
           Text('$sender', style: TextStyle(
             fontSize: 1, color: Colors.transparent
           ),),
           Material(
             elevation: 5,
             borderRadius: isMe? BorderRadius.only(
               topLeft: Radius.circular(30),
               bottomLeft: Radius.circular(30),
               bottomRight: Radius.circular(30),

             ):BorderRadius.only(
               topRight: Radius.circular(30),
               bottomLeft: Radius.circular(30),
               bottomRight: Radius.circular(30),

             ),
             color:isMe? Color(0xFF6898A2) : Colors.white,
             child: Padding(
               padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
               child: Text('$text',style:
               TextStyle(fontSize: 15, color:isMe?  Colors.white: Color(0xFF6898A2)),

               ),
             ),
           ),
         ],
       ),
     );
   }
 }
 