import 'package:flutter/material.dart';
import 'package:peliculasapp_fabiana/models/movie.dart';
import 'package:peliculasapp_fabiana/widgets/casting_card.dart';
class DetallesScreens extends StatelessWidget {
  const DetallesScreens({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;
    return Scaffold(
      
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(movie),
          SliverList(
            delegate: SliverChildListDelegate([
         _PosterAndTitle(movie),
         _Overview(movie),
         _Overview(movie),
         _Overview(movie),
         _Overview(movie),
         _Overview(movie),
         CastingCards(movie.id)
          ])
          )
        ],
      ),
    );
  }
}
class _CustomAppBar extends StatelessWidget {
  //
  final Movie movie;

  const _CustomAppBar(this.movie);

  //
  
  @override

  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.only(bottom: 10, right: 10, left: 10), 
          color: Colors.black12,
          child: Text(movie.title,
          style: TextStyle(fontSize: 16), textAlign: TextAlign.center,
          ),
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage(movie.fullBackdropPath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
class  _PosterAndTitle extends StatelessWidget {
  final   Movie movie;

  const _PosterAndTitle(this.movie);
  @override
  
  Widget build(BuildContext context) {
    final TextTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top:20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
               placeholder: AssetImage('assets/loading.gif'),
                image: NetworkImage(movie.fullPosterImg),
                height: 150,
            ),
          ),
          SizedBox(width: 20,),
          ConstrainedBox(
            constraints : BoxConstraints(maxWidth: size.width - 190),
            child: Column(
              children: [
                Text(movie.title,style: TextTheme.headline5,
                 overflow: TextOverflow.ellipsis, maxLines: 2,
                ),
                Text(movie.originalTitle, style: TextTheme.subtitle1,
                overflow: TextOverflow.ellipsis,),
                Row(
                  children: [
                    Icon(Icons.star_outline, size: 15, color: Colors.grey),
                    SizedBox(width: 5,),
                    Text('${movie.voteAverage}', style: Theme.of(context).textTheme.caption,)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
class _Overview extends StatelessWidget {

  final Movie movie;

    const _Overview(this.movie);
  

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
      child: Text(movie.overview),
    );
  }
}
