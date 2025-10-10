
import 'package:flutter/material.dart';
import 'package:movie_app_demo/controller/api_provider.dart';
import 'package:movie_app_demo/model/data_model.dart';
import 'package:movie_app_demo/view/pages/main_navigation.dart';
import 'package:provider/provider.dart';

class TvShowDetailPage extends StatelessWidget {
  final MovieData tvShow;
  const TvShowDetailPage({super.key, required this.tvShow});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainNavigation()));
              },
            ),
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  tvShow.backdropPath.isNotEmpty
                      ? Image.network(
                          'https://image.tmdb.org/t/p/w500${tvShow.backdropPath}',
                          fit: BoxFit.cover,
                        )
                      : Image.network(
                          'https://image.tmdb.org/t/p/w500${tvShow.posterPath}',
                          fit: BoxFit.cover,
                        ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          'https://image.tmdb.org/t/p/w500${tvShow.posterPath}',
                          width: 120,
                          height: 180,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tvShow.name,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(tvShow.isWatched.toString()),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.amber, size: 16),
                                SizedBox(width: 4),
                                Text(
                                  tvShow.voteAverage.toString(),
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Text(
                              '${tvShow.voteCount} votes',
                              style: TextStyle(color:Color.fromARGB(255, 188, 188, 188) ),
                            ),
                            SizedBox(height: 16),
                          IconButton(onPressed: (){
                            final provider=Provider.of<MovieProvider>(context,listen: false);
                            provider.toggleWatchList(tvShow);
                          }, icon: Consumer<MovieProvider>(builder: (context, value, child) {
                             final isWatched=value.watchList.contains(tvShow);
                             return Icon(
                              isWatched ? Icons.bookmark_added : Icons.bookmark_add_outlined,
                              color: isWatched ? Colors.green : Colors.white,
                             );
                          },))
                          ],
                        ),
                      ),
                    ],
                  ), 
                  SizedBox(height: 24),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Description',
                        style: TextStyle(
                          color: Colors.white, 
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        tvShow.overview,
                        style: TextStyle(
                          color: Color.fromARGB(255, 188, 188, 188),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Release Date',
                            style: TextStyle(color: Color.fromARGB(255, 188, 188, 188)),
                          ),
                          Text(
                            tvShow.releaseDate,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Language',
                            style: TextStyle(color: Color.fromARGB(255, 188, 188, 188)),
                          ),
                          Text(
                            tvShow.originalLanguage.toUpperCase(),
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Vote Count',
                            style: TextStyle(color: Color.fromARGB(255, 188, 188, 188)),
                          ),
                          Text(
                            tvShow.voteCount.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                       SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Original name',
                            style: TextStyle(color: Color.fromARGB(255, 188, 188, 188)),
                          ),
                          Text(
                            tvShow.originalName,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Rating',
                            style: TextStyle(color: Color.fromARGB(255, 188, 188, 188)),
                          ),
                          Text(
                            tvShow.voteAverage.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
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