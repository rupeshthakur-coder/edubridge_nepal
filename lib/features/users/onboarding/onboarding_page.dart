import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myapp/features/users/navigation_bar/navigation_bar_pages.dart';

class OnboardingScreen<OnboardingScreenState> extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentPageIndex = 0;
  final PageController _pageController = PageController();

  final List<OnboardingItem> onboardingItems = [
    OnboardingItem(
      title: "Numerous free trial courses",
      description: "Free courses for you to find your way to learning",
      imagePath: "assets/illustration.svg",
    ),
    OnboardingItem(
      title: "Quick and easy learning",
      description:
          "Easy and fast learning at any time to help you improve various skills",
      imagePath: "assets/illustration2.svg",
    ),
    OnboardingItem(
      title: "Create your own study plan",
      description:
          "Study according to the study plan, make study more motivated",
      imagePath: "assets/illustration 03.svg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    _pageController.jumpToPage(onboardingItems.length - 1);
                  },
                  child: Text(
                    'Skip',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ],
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPageIndex = index;
                  });
                },
                children: onboardingItems
                    .map((item) => buildOnboardingPage(context, item))
                    .toList(),
              ),
            ),
            if (_currentPageIndex == onboardingItems.length - 1)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to home page
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NavigationBarPages()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1E2742),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Start your journey with us',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    // OutlinedButton(
                    //   onPressed: () {
                    //     Navigator.pushReplacement(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: (context) => const NavigationBarPages()),
                    //     );
                    //   },
                    //   style: OutlinedButton.styleFrom(
                    //     side: const BorderSide(color: Color(0xFF1E2742)),
                    //     padding: const EdgeInsets.symmetric(
                    //         horizontal: 32, vertical: 16),
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(8),
                    //     ),
                    //   ),
                    //   child: const Text(
                    //     'Log in',
                    //     style:
                    //         TextStyle(fontSize: 16, color: Color(0xFF1E2742)),
                    //   ),
                    // ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget buildOnboardingPage(BuildContext context, OnboardingItem item) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          SvgPicture.asset(
            item.imagePath,
            height: 250,
            fit: BoxFit.cover, // Adjust as needed
          ),
          const SizedBox(height: 20),
          Text(
            item.title,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Theme.of(context).textTheme.headlineSmall?.color,
                ),
          ),
          const SizedBox(height: 10),
          Text(
            item.description,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).textTheme.bodyMedium?.color,
                ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(onboardingItems.length, (index) {
              return Container(
                width: 8.0,
                height: 8.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: index == _currentPageIndex
                      ? const Color(0xFF1E2742)
                      : Colors.grey,
                ),
              );
            }),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class OnboardingItem {
  final String title;
  final String description;
  final String imagePath;

  OnboardingItem({
    required this.title,
    required this.description,
    required this.imagePath,
  });
}
