import 'package:flutter/material.dart';
import 'package:parwis_jkt/Data/data_class_parwis.dart';

class DetailPage extends StatelessWidget {
  final Pariwisata pariwisata;
  const DetailPage({Key? key, required this.pariwisata}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pariwisata.nama),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Description : ${pariwisata.deskripsi}',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
