import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget NewsCard(String image , String text){
  return    Container(

    child: Card(
      color: Colors.grey.shade100,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(

              child: Image.network(
                image,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 150,
              ),
            ),
            SizedBox(height: 10),
            Text(text),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   children: [
            //     Column(
            //       children: [
            //         Text("HHHHHHHHHH"),
            //         SizedBox(height: 5),
            //         Text(
            //           showFullText
            //               ? "hdjhfjdhdjhasdjjhdfjhfdjhfdf"
            //               : "hdjhfjdhdjhasdjjhdfjhfdjhfdhjk.",
            //           maxLines: showFullText ? null : 2,
            //         ),
            //       ],
            //     ),
            //     ElevatedButton(
            //
            //       onPressed: () {
            //         setState(() {
            //           showFullText = !showFullText;
            //         });
            //       },
            //
            //       child: Text(
            //         showFullText ? "Lire moins" : "Lire la suite",
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    ),
  );
}