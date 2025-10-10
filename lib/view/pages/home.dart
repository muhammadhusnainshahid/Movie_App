import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app_demo/constants/images.dart';
import 'package:movie_app_demo/controller/api_provider.dart';
import 'package:movie_app_demo/view/pages/search_page.dart';
import 'package:movie_app_demo/view/pages/shows_details.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

//   @override
// void initState() {
//   super.initState();
//   final provider = Provider.of<MovieProvider>(context, listen: false);
//   provider.fetchAllMovies();
// }
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            actions: [
              IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchPage()));}, icon: Icon(Icons.search,color: Colors.white,size: 24,))
            ],
            floating: true,
            expandedHeight: 180,
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
                    left: 30,
                    bottom: 50,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Hello, Husnain',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                        RichText(text: TextSpan(
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),
                          children: [
                            TextSpan(text:'Welcome ',style: GoogleFonts.bigShouldersInlineText(fontSize: 19,fontWeight: FontWeight.bold,color: Colors.white)),
                            TextSpan(text: 'to movie world',style:GoogleFonts.bigShouldersInlineDisplay(fontSize: 20,fontWeight: FontWeight.bold,color: const Color.fromARGB(255, 167, 215, 254))),                          
                            ],
                        )),
                      ],
                    ))
                  ],
                ),
             ),
          ),
          SliverToBoxAdapter(
            child: Padding(padding: EdgeInsets.symmetric(vertical: 20),
            child: CarouselSlider(
            items:ImageList.carousImage.map((item)=>ClipRRect(borderRadius: BorderRadius.circular(15),
            child:Image.network(item,fit: BoxFit.cover,width: double.infinity,) ,)).toList() , 
            options: CarouselOptions(
              height: 170,
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 0.80,
              autoPlayInterval: Duration(seconds: 3),
            )),),
           ),
        
        //  SliverToBoxAdapter(
        //   child: SizedBox(
        //     height: 220,
        //     child:Consumer<MovieProvider>(
        //       builder:(context, value, child) {
                 
        //          if(value.movies.isEmpty){
        //           return Center(
        //             child: Text('No movies found'),
        //           );
        //          }
        //         return ListView.builder(
        //           scrollDirection: Axis.horizontal,
        //           itemCount: 10,
        //           itemBuilder: (context, index) {
        //             final data=value.movies[index];
        //             return Container(
        //               width: 220,
        //               margin: EdgeInsets.symmetric(horizontal: 8),
        //               child: Column(
        //                 children: [
        //                   data.posterPath.isNotEmpty? Image.network('https://image.tmdb.org/t/p/w500${data.posterPath}',width: 100,height: 150,fit: BoxFit.cover,):
        //                    Container(
        //                    width: 100,
        //                    height: 150,
        //                    color: Colors.grey,
        //                    child: Icon(Icons.movie, color: Colors.white),
        //                 ),
        //                   Text(data.title,style: TextStyle(color: Colors.white,),
        //                   overflow: TextOverflow.ellipsis,
        //                   textAlign: TextAlign.center,)
        //                 ],
        //               ),
        //             );
        //           },);
        //       },
        //       ) ,
        //   ),
        //  )
        SliverToBoxAdapter(
  child: Container(
    padding: EdgeInsets.symmetric(vertical: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Recommended Movies',
            style: GoogleFonts.merriweather(
              color: Colors.white,
              fontSize: 22,
             
            ),
          ),
        ),
        SizedBox(height: 20),
        SizedBox(
          height: 240,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: ImageList.recommentationImg.length,
            padding: EdgeInsets.symmetric(horizontal: 20),
            itemBuilder: (context, index) {
              final movie = ImageList.recommentationImg[index];
              return Container(
                width: 150,
                margin: EdgeInsets.only(right: 15),
                child: Column(
                  children: [
                    Container(
                      width: 150,
                      height: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          movie['image']!,
                          width: 150,
                          height: 180,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      movie['title']!,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    ),
  ),
),
        SliverToBoxAdapter(
  child: Padding(
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Watchlist',
          style: GoogleFonts.merriweather(color: Colors.white, fontSize: 22),
        ),
        SizedBox(height: 12),
        SizedBox(
          height: 220,
          child: Consumer<MovieProvider>(
            builder: (context, provider, child) {
              if (provider.watchList.isEmpty) {
                return Center(
                  child: Text('No movies in Watchlist',
                      style: TextStyle(color: Colors.white70)),
                );
              }
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: provider.watchList.length,
                itemBuilder: (context, index) {
                  final movie = provider.watchList[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => TvShowDetailPage(tvShow: movie),
                        ),
                      );
                    },
                    child: Container(
                      width: 140,
                      margin: EdgeInsets.only(right: 12),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                              width: 140,
                              height: 180,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            movie.name,
                            style: TextStyle(color: Colors.white),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    ),
  ),
),

        ],
      ),
    );
  }
}