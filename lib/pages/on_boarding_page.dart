import 'package:day_3_app/animations/fade_animation.dart';
import 'package:day_3_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animaton;

  bool _textVisible = true;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 100,
      ),
    );

    _animaton = Tween<double>(
      begin: 1.0,
      end: 25.0,
    ).animate(_animationController);
    super.initState();
  }

  void _onTap() {
    setState(() {
      _textVisible = false;
    });
    _animationController.forward().then(
          (f) => Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.fade,
                child: HomePage(),
              )),
        );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/starter-image.jpg'),
              fit: BoxFit.cover),
        ),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(.9),
                Colors.black.withOpacity(.5),
                Colors.black.withOpacity(.2),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadeAnimation(
                  1,
                  Text(
                    'Taking Order For Faster Delivery',
                    style: TextStyle(
                      fontSize: 28.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                FadeAnimation(
                  1.5,
                  Text(
                    'See resturants nearly by \nadding your location',
                    style: TextStyle(color: Colors.white, fontSize: 16.sp),
                  ),
                ),
                SizedBox(
                  height: 17.5.h,
                ),
                FadeAnimation(
                    1.7,
                    ScaleTransition(
                      scale: _animaton,
                      child: Container(
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(13)),
                              gradient: LinearGradient(colors: [
                                Colors.yellow,
                                Colors.orange,
                              ])),
                          child: AnimatedOpacity(
                            opacity: _textVisible ? 1.0 : 0.0,
                            duration: const Duration(milliseconds: 50),
                            child: MaterialButton(
                              minWidth: double.infinity,
                              child: const Text(
                                'Start',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              onPressed: () => _onTap(),
                            ),
                          )),
                    )),
                SizedBox(
                  height: 2.5.h,
                ),
                FadeAnimation(
                  1.9,
                  Center(
                    child: AnimatedOpacity(
                      opacity: _textVisible ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 50),
                      child: Text(
                        'Now Deliver To Your Door 24/7',
                        style:
                            TextStyle(color: Colors.white70, fontSize: 16.sp),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
