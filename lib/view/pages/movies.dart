import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app_demo/controller/api_provider.dart';
import 'package:movie_app_demo/view/pages/shows_details.dart';
import 'package:provider/provider.dart';

class Movies extends StatefulWidget {
  const Movies({super.key});

  @override
  State<Movies> createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {
  @override
  void initState() {
    // TODO: implement initState
    final provider=Provider.of<MovieProvider>(context,listen: false);
    provider.fetchAllMovies();
    provider.fetchPopular();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
             SliverAppBar(
            actions: [IconButton(onPressed: (){}, icon: Icon(Icons.search))],
            pinned: true,
            floating: true,
            expandedHeight: 220,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network('https://wallpapers.com/images/thumbnail/the-amazing-spider-man-1920-x-1200-gk7cqtyv7fguj5ip.webp',fit: BoxFit.cover,),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [const Color.fromARGB(255, 0, 0, 0),Colors.transparent],begin: Alignment.bottomLeft,end: Alignment.topLeft),
                    ),
                  ),
                   Positioned(                   
                    left: 30,
                    bottom: 50,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Movies',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                        Text('Uncover new worlds and rewatch old favourites')
                      ],
                    )),
                 ],
              ),
            ),
          ),
          SliverToBoxAdapter(
        child: Container(
          padding: EdgeInsets.only(top: 20,bottom: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                      'Most Popular',
                      style: GoogleFonts.merriweather(
                       fontSize: 21,
                       fontWeight: FontWeight.bold,
                       color: Colors.white,
                      ),
                    ),),
                SizedBox(height:10 ,),
                 SizedBox(
                    height: 220,
                    child: Consumer<MovieProvider>(
                      builder: (context, value, child) {
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: value.popular.length,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          itemBuilder: (context, index) {
                            final data = value.popular[index];
                            final imageUrl = data.posterPath.isNotEmpty
                                ? 'https://image.tmdb.org/t/p/w500${data.posterPath}': null;
                            return Container(
                              width: 170,
                              margin: EdgeInsets.only(right: 20),
                              child: Stack(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                        onTap: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>TvShowDetailPage(tvShow: data)));},
                                        child: Container(
                                          width: 180,
                                          height: 220,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(16),
                                            boxShadow: [
                                              BoxShadow(
                                                color: const Color.fromARGB(255, 42, 42, 42),
                                                blurRadius: 20,                                            
                                              ),
                                            ],
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(16),
                                            child: Stack(
                                              children: [                                         
                                                imageUrl != null
                                                    ? Image.network(
                                                        imageUrl,
                                                        width: 180,
                                                        height: 240,
                                                        fit: BoxFit.cover,
                                                      )
                                                    : Container(
                                                      padding: EdgeInsets.all(10),
                                                      child: Center(child: Text('No images'),),
                                                    ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                      begin: Alignment.topCenter,
                                                      end: Alignment.bottomCenter,
                                                      colors: [
                                                          Colors.black,
                                                        Colors.transparent,
                                                      
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                // Count 
                                                Positioned(
                                                  top: 12,
                                                  right: 12,
                                                  child: Container(
                                                    padding: EdgeInsets.symmetric(
                                                      horizontal: 8,
                                                      vertical: 4,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: Colors.black,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            12,
                                                          ),
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                          Icons.visibility,
                                                          color: Colors.white,
                                                          size: 12,
                                                        ),
                                                        SizedBox(width: 4),
                                                        Text(
                                                          '${data.voteCount}',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),                                                             
                                            ])
                                          )),
                                      )
                                    ],
                                  ),
                                ],
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
        SliverToBoxAdapter(
          child:Container(
              padding: EdgeInsets.only(top: 15,bottom: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Trending Movies',
                      style: GoogleFonts.merriweather(
                       fontSize: 21,
                       fontWeight: FontWeight.bold,
                       color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 220,
                    child: Consumer<MovieProvider>(
                      builder: (context, value, child) {
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: value.movies.length,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          itemBuilder: (context, index) {
                            final data = value.movies[index];
                            final imageUrl = data.posterPath.isNotEmpty
                                ? 'https://image.tmdb.org/t/p/w500${data.posterPath}': null;
                            return Container(
                              width: 170,
                              margin: EdgeInsets.only(right: 20),
                              child: Stack(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                        onTap: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>TvShowDetailPage(tvShow: data)));},
                                        child: Container(
                                          width: 180,
                                          height: 220,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(16),
                                            boxShadow: [
                                              BoxShadow(
                                                color: const Color.fromARGB(255, 42, 42, 42),
                                                blurRadius: 20,                                            
                                              ),
                                            ],
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(16),
                                            child: Stack(
                                              children: [                                         
                                                imageUrl != null
                                                    ? Image.network(
                                                        imageUrl,
                                                        width: 180,
                                                        height: 240,
                                                        fit: BoxFit.cover,
                                                      )
                                                    : Container(
                                                      padding: EdgeInsets.all(10),
                                                      child: Center(child: Text('No images'),),
                                                    ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                      begin: Alignment.topCenter,
                                                      end: Alignment.bottomCenter,
                                                      colors: [
                                                          Colors.black,
                                                        Colors.transparent,
                                                      
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                // Count 
                                                Positioned(
                                                  top: 12,
                                                  right: 12,
                                                  child: Container(
                                                    padding: EdgeInsets.symmetric(
                                                      horizontal: 8,
                                                      vertical: 4,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: Colors.black,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            12,
                                                          ),
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                          Icons.visibility,
                                                          color: Colors.white,
                                                          size: 12,
                                                        ),
                                                        SizedBox(width: 4),
                                                        Text(
                                                          '${data.voteCount}',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),                                                             
                                            ])
                                          )),
                                      )
                                    ],
                                  ),
                                ],
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