import 'package:flutter/material.dart';
import 'package:parwis_jkt/Data/data_class_parwis.dart';

class ItemParwis extends StatelessWidget {
  final Pariwisata pariwisata;

  const ItemParwis({Key? key, required this.pariwisata}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blue[200],
      ),
      child: Container(
        height: 140,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: 120,
                height: 140,
                child: Image.asset(
                  pariwisata.imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 12,
                  top: 12,
                  left: 15,
                  right: 20,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pariwisata.nama,
                      style: const TextStyle(
                        fontSize: 18,
                        letterSpacing: 1.5,
                        height: 1.2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      pariwisata.lokasi,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 1.0,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      pariwisata.deskripsi,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        height: 1.4,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
