import 'package:flutter/material.dart';
import 'package:movie_app_demo/controller/api_provider.dart';
import 'package:provider/provider.dart';


class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            hintText: "Search movies...",
            border: InputBorder.none,
          ),
          onSubmitted: (value) {
            searchProvider.searchMovies(value); 
          },
        ),
      ),
      body: searchProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : searchProvider.searchData.isEmpty
              ? const Center(child: Text("No results"))
              : ListView.builder(
                  itemCount: searchProvider.searchData.length,
                  itemBuilder: (context, index) {
                    final movie = searchProvider.searchData[index];
                    return ListTile(
                      leading: movie.posterPath.isNotEmpty
                          ? Image.network(
                              "https://image.tmdb.org/t/p/w200${movie.posterPath}",
                              width: 70,
                              height: 150,
                              fit: BoxFit.cover,
                            )
                          : const Icon(Icons.movie),
                      title: Text(movie.title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                      subtitle: Text(movie.overview),
               );
           },
        ),
    );
  }
}
