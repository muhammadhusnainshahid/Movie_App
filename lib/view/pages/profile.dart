import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
             background: Stack(
              fit: StackFit.expand,
              children: [
                Image.network('https://pixflow.net/wp-content/uploads/2022/10/Header-2.jpg',fit: BoxFit.cover,),
                Container(
                  decoration: BoxDecoration(
                    gradient:LinearGradient(colors: [const Color.fromARGB(255, 0, 0, 0),Colors.transparent],begin: Alignment.bottomLeft,end: Alignment.topLeft),
                  ),
                ),
               Positioned(
                top: 120,
                left: 28,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('M Husnain Shahid',style: TextStyle(color: Colors.white,fontSize: 19,fontWeight: FontWeight.bold)),
                    Text('Profile details - movie world')
                  ],
                ))
              ],
             ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(padding: EdgeInsets.only(top: 25,left:22,right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('FOLLOWERS'),
                  Text('0')],
                ),
              SizedBox(height: 25,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('RATINGS'),
                  Container(height: 30,width: 40,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(color: const Color.fromARGB(255, 6, 57, 98),borderRadius: BorderRadius.circular(7)),
                  child: Text('view'),)
                ],
              ),
              SizedBox(height: 25,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('SETTINGS'),
                  Icon(Icons.settings,size: 19)
                ],
              ),
              SizedBox(height: 25,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('SHARE'),
                  Icon(Icons.share,size: 19)
                ],
              ),
              SizedBox(height: 25,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('SUBSCRIBE FOR PRIME'),
                  Icon(Icons.add_alert_outlined,size: 19)
                ],
              )
              ],
            ),
            ),
          )
        ],
      ),
    );
  }
}