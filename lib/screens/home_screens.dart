import 'package:flutter/material.dart';
import 'package:peliculasapp_fabiana/provides/movies_provides.dart';
import 'package:peliculasapp_fabiana/widgets/card_swiper.dart';
import 'package:peliculasapp_fabiana/widgets/movie_slider.dart';
import 'package:provider/provider.dart';

class HomeScreens extends StatelessWidget {
  const HomeScreens({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final movieProviders = Provider.of<MovieProviders>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Peliculas en Cines'),
        elevation: 0,
        actions: [
          IconButton(onPressed: (){},
          icon: Icon(Icons.search_outlined))
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            CardSwiper(movies: movieProviders.ondisplayMovies),
            MovieSlider(
              movies: movieProviders.popularMovie,
              title: 'Populares',
            )
          ],
        ),
      ),
    );
  }
}