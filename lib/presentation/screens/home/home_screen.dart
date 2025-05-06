import 'package:ecommerce_with_bloc/core/widgets/cut_rectangle_clipper.dart';
import 'package:ecommerce_with_bloc/core/widgets/cut_rectangle_shape.dart';
import 'package:ecommerce_with_bloc/core/widgets/decorated_scaffold.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg
  @override
  Widget build(BuildContext context) {
    return DecoratedScaffold(
      body: GridView.builder(
        padding: EdgeInsets.all(20),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 240,
            mainAxisSpacing: 5,
            crossAxisSpacing: 10),
        itemCount: 10,
        itemBuilder: (context, index) {
          return CustomPaint(
            painter: CutRectangleShape(index % 2 != 0),
            child: SizedBox(
              height: double.maxFinite,
              width: double.maxFinite,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ClipPath(
                      clipper: CutRectangleClipper(index % 2 != 0),
                      child: Image.network(
                        "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
                        height: 120,
                        width: double.maxFinite,
                        fit: BoxFit.fitHeight,
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
