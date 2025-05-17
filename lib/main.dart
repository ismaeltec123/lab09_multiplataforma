import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cartelera de Cine'),
        ),
        body: SafeArea(
          child: MovieGrid(),
        ),
      ),
    );
  }
}

class MovieGrid extends StatelessWidget {
  final List<Movie> movies = [
    Movie(
      title: 'Batman Dark Night',
      genre: 'Acción',
      imageUrl: 'assets/images/batman.jpg',
      isLocal: true,
    ),
    Movie(
      title: 'Hangover',
      genre: 'Comedia',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5vHtcZSHy6KJYvQs7kvV3f_qK5spGDlgfoA&s',
      isLocal: false,
    ),
    Movie(
      title: 'Culpa Mia',
      genre: 'Drama',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhOSt5dXoAS9oz61pdFITZw-7rhNiHmv0byA&s',
      isLocal: false,
    ),
    Movie(
      title: 'El Conjuro',
      genre: 'Horror',
      imageUrl:
          'https://m.media-amazon.com/images/I/71x6gSv5YbL._AC_UF894,1000_QL80_.jpg',
      isLocal: false,
    ),
    Movie(
      title: 'Minecraft',
      genre: 'Animacion',
      imageUrl:
          'https://resizing.flixster.com/lEWPjWj1SBmp-0HWZ9StyooCQ1E=/fit-in/705x460/v2/https://resizing.flixster.com/ViCYuISBvkrLsqD3ePYNSHszhoc=/ems.cHJkLWVtcy1hc3NldHMvbW92aWVzLzc1ZTAwYzViLTIyMzAtNDJmMS04NjNlLTBjMTAyMjkyZDhhYy5qcGc=',
      isLocal: false,
    ),
    Movie(
      title: 'Kung Fu Panda 2',
      genre: 'Animación',
      imageUrl: 'assets/images/Kung_Fu_Panda_2_Poster.jpg',
      isLocal: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(8), 
      itemCount: movies.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.68,
      ),
      itemBuilder: (context, index) {
        return MovieCard(movie: movies[index]);
      },
    );
  }
}

class Movie {
  final String title;
  final String genre;
  final String imageUrl;
  final bool isLocal;

  Movie({
    required this.title,
    required this.genre,
    required this.imageUrl,
    required this.isLocal,
  });
}

class MovieCard extends StatelessWidget {
  final Movie movie;

  MovieCard({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            child: movie.isLocal
                ? Image.asset(
                    movie.imageUrl,
                    fit: BoxFit.cover,
                    height: 160,
                    width: double.infinity,
                  )
                : Image.network(
                    movie.imageUrl,
                    fit: BoxFit.cover,
                    height: 160,
                    width: double.infinity,
                  ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              movie.title,
              style: TextStyle(
                fontFamily: 'BruceForever',
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              movie.genre,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 13,
                color: Colors.grey[600],
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}
