import 'package:flutter/material.dart';
import 'package:flutter_gridview_project/detay_sayfa.dart';
import 'package:flutter_gridview_project/filmler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.deepPurple,
      ),
      home: Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  Future<List<Filmler>> filmleriGetir() async{

    var filmlerListesi = <Filmler>[];

    var f1 = Filmler(film_id: 1, film_adi: "Anadoluda", film_resim_adi: "anadoluda.png", film_fiyat: 15.99);
    var f2 = Filmler(film_id: 2, film_adi: "Django", film_resim_adi: "django.png", film_fiyat: 15.99);
    var f3 = Filmler(film_id: 3, film_adi: "Inception", film_resim_adi: "inception.png", film_fiyat: 15.99);
    var f4 = Filmler(film_id: 4, film_adi: "Interstellar", film_resim_adi: "interstellar.png", film_fiyat: 15.99);
    var f5 = Filmler(film_id: 5, film_adi: "The Hateful Eight", film_resim_adi: "thehatefuleight.png", film_fiyat: 15.99);
    var f6 = Filmler(film_id: 6, film_adi: "The Pianist", film_resim_adi: "thepianist.png", film_fiyat: 15.99);

    filmlerListesi.add(f1);
    filmlerListesi.add(f2);
    filmlerListesi.add(f3);
    filmlerListesi.add(f4);
    filmlerListesi.add(f5);
    filmlerListesi.add(f6);

    return filmlerListesi;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filmer"),
      ),
      body: FutureBuilder<List<Filmler>>(
        future: filmleriGetir(),
        builder: (context, snapshot){
          if(snapshot.hasData){

            var filmlerListesi = snapshot.data;

            return GridView.builder(
              itemCount: filmlerListesi!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3.5, //genişlik/yükseklik
              ),
              itemBuilder: (context, indeks){

                var film = filmlerListesi[indeks];

                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetaySayfa(film: film)));
                  },
                  child: Card(
                    child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("resimler/${film.film_resim_adi}"),
                        ),
                        Text(film.film_adi, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                        Text("${film.film_fiyat} ₺", style: TextStyle(fontSize: 16),),
                      ],
                    ),
                  ),
                );
              },
            );
          }else{
            return Center();
          }
        },
      ),
    );
  }
}
