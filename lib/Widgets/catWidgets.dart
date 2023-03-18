import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget CatWedth()
{
  return Container(
    height: double.infinity, // change this value to adjust the height of the last Card
    child:   Padding(
      padding: const EdgeInsets.all(8.0),
      child: Expanded(
        child: ClipRRect(

          borderRadius: BorderRadius.circular(10),
          child: Stack(
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.grey[300],
                ),
              ),
              Image.asset(
                'images/item.jpg',
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
                errorBuilder: (context, error, stackTrace) =>
                    Center(child: Icon(Icons.error)),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  alignment: AlignmentDirectional.center,
                  width: double.infinity,
                  height: 36,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      'Category',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget CatNormal()
{
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5),
    child: Expanded(
      child: ClipRRect(

        borderRadius: BorderRadius.circular(10),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.grey[300],
            ),
            Image.asset(
              'images/item.jpg',
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
              errorBuilder: (context, error, stackTrace) =>
                  Center(child: Icon(Icons.error)),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                alignment: AlignmentDirectional.center,
                width: 200,
                height: 36,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    'Category',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}