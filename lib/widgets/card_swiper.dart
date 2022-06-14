import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:peliculasapp_fabiana/models/movie.dart';

class CardSwiper extends StatelessWidget {
  
  //crear variable para estirar las imagenes
  final List<Movie> movies;

  const CardSwiper({Key? key,
  required this.movies}) : super(key: key);

  
  //const CardSwiper({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.5,
      //colorR
      child: Swiper(
        itemCount: movies.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.5,
        itemHeight: size.height * 0.4,
        itemBuilder: ( _ , int index){
          
            final movie= movies[index];
            print(movie.fullPosterImg);

          return GestureDetector(
            onTap: () => Navigator.pushNamed(context,'detalles', arguments: movie),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
              placeholder: AssetImage(
                'assets/no-image.jpg'
              ),
              image: NetworkImage(movie.fullPosterImg),
              ),
            ),
          );
        }
      ),  
    );
  }
}