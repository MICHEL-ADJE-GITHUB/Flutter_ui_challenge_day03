import 'package:day_3_app/animations/fade_animation.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey[100],
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_bag,
              color: Colors.grey[800],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeAnimation(
                2,
                Text(
                  'Food Delivery',
                  style:
                      TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              SizedBox(
                height: 5.h,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    FadeAnimation(
                      1,
                      MakeCategory(isActive: true, title: "Pizza"),
                    ),
                    FadeAnimation(
                      1.3,
                      MakeCategory(isActive: false, title: "Burger"),
                    ),
                    FadeAnimation(
                      1.4,
                      MakeCategory(isActive: false, title: "Kebab"),
                    ),
                    FadeAnimation(
                      1.5,
                      MakeCategory(isActive: false, title: "Salad"),
                    ),
                    FadeAnimation(
                      1.6,
                      MakeCategory(isActive: false, title: "Desert"),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              FadeAnimation(
                2,
                Text(
                  'Free Delivery',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    FadeAnimation(
                      2,
                      MakeItem(
                        imagePath: 'assets/images/one.jpg',
                        price: 15.00,
                        title: 'Vegetarian pizza',
                      ),
                    ),
                    FadeAnimation(
                      2,
                      MakeItem(
                        imagePath: 'assets/images/two.jpg',
                        price: 15.00,
                        title: 'Vegetarian pizza',
                      ),
                    ),
                    FadeAnimation(
                      2,
                      MakeItem(
                        imagePath: 'assets/images/three.jpg',
                        price: 15.00,
                        title: 'Vegetarian pizza',
                      ),
                    ),
                    FadeAnimation(
                      2,
                      MakeItem(
                        imagePath: 'assets/images/one.jpg',
                        price: 15.00,
                        title: 'Vegetarian pizza',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget MakeCategory({required bool isActive, required String title}) {
    return AspectRatio(
      aspectRatio: isActive ? 3 : 2.0 / 1,
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: isActive ? Colors.yellow[700] : Colors.white,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: isActive ? Colors.white : Colors.grey[500],
              fontWeight: isActive ? FontWeight.bold : FontWeight.w100,
            ),
          ),
        ),
      ),
    );
  }

  Widget MakeItem(
      {required imagePath, required double price, required String title}) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Container(
        width: 85.w,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              stops: const [.2, .9],
              colors: [
                Colors.black.withOpacity(.9),
                Colors.black.withOpacity(.3),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Align(
                  alignment: Alignment.topRight,
                  child: Icon(
                    Icons.favorite,
                    color: Colors.white,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '\$ $price',
                      style: TextStyle(
                        fontSize: 25.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
