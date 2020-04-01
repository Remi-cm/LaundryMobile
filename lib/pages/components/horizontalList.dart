
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:laundrymobile/pages/components/clothe.dart';

class HorizontalList extends StatefulWidget {
  @override
  _HorizontalListState createState() => _HorizontalListState();
}

class _HorizontalListState extends State<HorizontalList> {

  var book_list = [
     { "id": 1, "price": 2500, "vendor": "Remi", "title": "Polo", "author": "Remi Doragone", "link": "assets/images/laundryPnng2.png", "edition": "Editions CLE 1998", "description": "This book is not only a best seller but it is also very cheap, so i dont see why you wouldn't buy it dude" },
     { "id": 2, "price": 2500, "vendor": "Joseph", "title": "Polo", "author": "J.k. Simmons", "link": "assets/images/laundryPnng2.png", "edition": "Editions Afrique noir 1990", "description": "This book is not only a best seller but it is also very cheap, so i dont see why you wouldn't buy it dude" },
     { "id": 3, "price": 2500, "vendor": "Joseph", "title": "Polo", "author": "Josiane Madarame", "link": "assets/images/laundryPnng2.png", "edition": "Editions Bamboutos 2001", "description": "This book is not only a best seller but it is also very cheap, so i dont see why you wouldn't buy it dude" },
     { "id": 4, "price": 2500, "vendor": "Joseph", "title": "Polo", "author": "Stephen Kings", "link": "assets/images/laundryPnng2.png", "edition": "Editions Miracle 1961", "description": "This book is not only a best seller but it is also very cheap, so i dont see why you wouldn't buy it dude" },
     { "id": 5, "price": 2500, "vendor": "Joseph", "title": "Polo", "author": "Kelly Rowland", "link": "assets/images/laundryPnng2.png", "edition": "Editions Mamba noir 2005", "description": "This book is not only a best seller but it is also very cheap, so i dont see why you wouldn't buy it dude" },
     { "id": 6, "price": 2500, "vendor": "Joseph", "title": "Polo", "author": "Engelbert Mveng", "link": "assets/images/laundryPnng2.png", "edition": "Editions Nwaar Meilleur 2009", "description": "This book is not only a best seller but it is also very cheap, so i dont see why you wouldn't buy it dude" },
     { "id": 7, "price": 2500, "vendor": "Joseph", "title": "Polo", "author": "Ebenezer Njoh Mouelle", "link": "assets/images/laundryPnng2.png", "edition": "Editions CLE 1998", "description": "This book is not only a best seller but it is also very cheap, so i dont see why you wouldn't buy it dude" },
     { "id": 8, "price": 2500, "vendor": "Joseph", "title": "Polo", "author": "Camara Laye", "link": "assets/images/laundryPnng2.png", "edition": "Editions SaalVie 1993", "description": "This book is not only a best seller but it is also very cheap, so i dont see why you wouldn't buy it dude" },
     { "id": 9, "price": 2500, "vendor": "Joseph", "title": "Polo", "author": "Francois Nkeme", "link": "assets/images/laundryPnng2.png", "edition": "Editions Maahlox 1991", "description": "This book is not only a best seller but it is also very cheap, so i dont see why you wouldn't buy it dude" },
     { "id": 10, "price": 2500, "vendor": "Joseph", "title": "Polo", "author": "Arafat Yorobo", "link": "assets/images/laundryPnng2.png", "edition": "Editions CLE 1998", "description": "This book is not only a best seller but it is also very cheap, so i dont see why you wouldn't buy it dude" }
  ];

  @override
  Widget build(BuildContext context) {

    final hv = MediaQuery.of(context).size.width/100;

    return Container(
      height: hv*50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: book_list.length,
        itemBuilder: (BuildContext context, int index){
          return InkWell(onTap: (){}, child: Clothe(book_list[index]['title'], book_list[index]['price'], book_list[index]['vendor'], book_list[index]['link']));
        },
      ),
    );
  }
}