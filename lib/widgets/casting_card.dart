import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peliculasapp_fabiana/models/credits_response.dart';
import 'package:peliculasapp_fabiana/provides/movies_provides.dart';
import 'package:provider/provider.dart';
class CastingCards extends StatelessWidget {
   final int movieId;

  const CastingCards(this.movieId);
  @override
  Widget build(BuildContext context) {
    final moviesProvider =
     Provider.of<MovieProviders>(context, listen: false);
      return FutureBuilder(
        future: moviesProvider.getMovieCast(movieId),
        builder: ( _, AsyncSnapshot<List<Cast>> snapshot){
           if(!snapshot.hasData){
             return Container(
               constraints: BoxConstraints(maxWidth:150),
               height: 180,
               child: CupertinoActivityIndicator(),
             );
           } 


           final List<Cast> cast = snapshot.data!;

           return Container(
            margin: EdgeInsets.only(bottom: 30),
            width: double.infinity,
            height: 180,
            // color: Colors.red,
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: ( _ , int index)=> _CastCard(cast[index])),
            );
        },

      );
           
  }
}

class _CastCard extends StatelessWidget {
  final Cast actor;

  const _CastCard(this.actor);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: 110,
      height: 100,
      //color: Colors.blueGrey,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
              placeholder: AssetImage(
                'assets/no-image.jpg'
              ),
              image: NetworkImage(actor.fullProfilePath),
              height: 140,
              width: 100,
              fit: BoxFit.cover,
              ),
          ),
          SizedBox(height: 5,),
          Text(actor.name, 
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          )
        ],
        ),
    );
  }
}