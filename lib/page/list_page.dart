import 'package:flutter/material.dart';
//https://pusher.com/tutorials/flutter-listviews
class ListPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text('Type of List'),
      ),
      body: ListLayout(),
    );
  }


}

class ListLayout extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return _myLongList(context);

  }

  Widget _myListView(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          title: Text('Sun'),
        ),
        ListTile(
          title: Text('Moon'),
        ),
        ListTile(
          title: Text('Star'),
        ),
      ],
    );
  }

  /*
  * With divider
  * */
  Widget _myListDivider(BuildContext context){
    return ListView(
      children: ListTile.divideTiles(
          context: context,
          tiles: [
            ListTile(
              title: Text('Sun'),
            ),
            ListTile(
              title: Text('Moon'),
            ),
            ListTile(
              title: Text('Star'),
            ),
          ]
      ).toList(),
    );
  }

  /* List with Builder for more data*/
  Widget _myLongList(BuildContext context){
    // backing data
    final europeanCountries = ['Albania', 'Andorra', 'Armenia', 'Austria',
      'Azerbaijan', 'Belarus', 'Belgium', 'Bosnia and Herzegovina', 'Bulgaria',
      'Croatia', 'Cyprus', 'Czech Republic', 'Denmark', 'Estonia', 'Finland',
      'France', 'Georgia', 'Germany', 'Greece', 'Hungary', 'Iceland', 'Ireland',
      'Italy', 'Kazakhstan', 'Kosovo', 'Latvia', 'Liechtenstein', 'Lithuania',
      'Luxembourg', 'Macedonia', 'Malta', 'Moldova', 'Monaco', 'Montenegro',
      'Netherlands', 'Norway', 'Poland', 'Portugal', 'Romania', 'Russia',
      'San Marino', 'Serbia', 'Slovakia', 'Slovenia', 'Spain', 'Sweden',
      'Switzerland', 'Turkey', 'Ukraine', 'United Kingdom', 'Vatican City'];


//    return ListView.builder(
////      itemCount: europeanCountries.length,
//      itemBuilder: (context,index){
//        return ListTile(
//          title: Text(europeanCountries[index]),
//        );
//      },
//    );

/*
* Horizontal
* */
    return ListView.builder(
//      itemCount: europeanCountries.length,
       scrollDirection: Axis.horizontal,
      itemBuilder: (context,index){
        return Container(
        margin: const EdgeInsets.symmetric(horizontal: 1.0),
        color: Colors.blue,
        child: Text(europeanCountries[index]),
      );

      },
    );

    /*
    * separated
    * */
//    return ListView.separated(
//      itemCount: europeanCountries.length,
//      itemBuilder: (context,index){
//        return ListTile(
//          title: Text(europeanCountries[index]),
//        );
//      },
//      separatorBuilder: (context,index){
//        return Divider();
//      },
//    );
  }
}