import 'package:flutter/material.dart';
import 'package:flutter_gridview_project/filmler.dart';

class DetaySayfa extends StatefulWidget {

  Filmler film;
  DetaySayfa({required this.film});

  @override
  State<DetaySayfa> createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.film.film_adi}"),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("resimler/${widget.film.film_resim_adi}"),
            Text("${widget.film.film_fiyat} ₺", style: TextStyle(fontSize: 48.0, color: Colors.blue),),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red
                  ),
                  onPressed: (){
                    print("${widget.film.film_adi} kiralandı");
                  },
                  child: Text("KİRALA", style: TextStyle(color: Colors.white),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
