import 'dart:async'; 
import 'package:flutter/material.dart';
import 'package:ui/core/animations.dart';
import 'package:ui/widgets/box_events.dart';
import 'package:ui/widgets/box_upcoming_events.dart';
import 'package:ui/widgets/search_textfield.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late PageController _pageController;
  late Timer _timer;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8);
    _startCarousel();
  }

  void _startCarousel() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_currentIndex < 3) {
        _currentIndex++;
      } else {
        _currentIndex = 0; 
      }
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                height: MediaQuery.of(context).size.height * .4,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.purple.shade100.withOpacity(.3),
                      Colors.purple.shade100.withOpacity(0.02),
                    ],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const FadeAnimation(
                                  intervalEnd: .65,
                                  child: Text("New York",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600)),
                                ),
                                FadeAnimation(
                                  intervalEnd: .64,
                                  child: Transform.rotate(
                                    angle: -67.5,
                                    child: const Icon(
                                      Icons.arrow_forward_ios,
                                      size: 20,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const FadeAnimation(
                                intervalEnd: .65,
                                child: Text("within 20 miles"))
                          ],
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage("assets/profile.jpeg"))),
                        )
                      ],
                    ),
                    const SizedBox(height: 15),
                    const FadeAnimation(
                      intervalEnd: .7,
                      child: Text("Hello,Simone",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 40)),
                    ),
                    Expanded(
                      child: FadeAnimation(
                        intervalEnd: .85,
                        child: Text(
                          "There are 25 new events in your area.",
                          style: TextStyle(
                              color: Colors.purple.withOpacity(.3),
                              fontWeight: FontWeight.w600,
                              fontSize: 40),
                        ),
                      ),
                    ),
                    const SearchComponent(),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "You might like",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
                    ),
                    Text("See All",
                        style: TextStyle(
                            color: Colors.purple.shade100,
                            decoration: TextDecoration.underline,
                            fontSize: 15))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: SizedBox(
                  height: 300,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 300,
                        margin: const EdgeInsets.only(right: 15),
                        child: const BoxEvent(),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Upcoming events",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
                    ),
                    Text("See All",
                        style: TextStyle(
                            color: Colors.purple.shade100,
                            decoration: TextDecoration.underline,
                            fontSize: 15))
                  ],
                ),
              ),
              const SizedBox(height: 15),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: VerticalStepperWithImage(),
              ),
              const SizedBox(height: 30,)
            ],
          ),
        ),
      ),
    );
  }
}
