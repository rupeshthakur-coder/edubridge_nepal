import 'package:flutter/material.dart';

class DashboardPage<DashboardPageState> extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard'),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context)
                    .colorScheme
                    .secondary, // Button color from theme
                foregroundColor: Theme.of(context)
                    .colorScheme
                    .onSecondary, // Text color from theme
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                // Navigate to Add Course Page
              },
              child: const Text("Add Course"),
            ),
            const SizedBox(
              width: 16,
            )
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xFF1E2742),
                ),
                child: Text(
                  'Byway LMS',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.dashboard,
                    color: Theme.of(context).iconTheme.color),
                title: Text('Dashboard',
                    style: Theme.of(context).textTheme.bodyMedium),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading:
                    Icon(Icons.book, color: Theme.of(context).iconTheme.color),
                title: Text('Courses',
                    style: Theme.of(context).textTheme.bodyMedium),
                onTap: () {},
              ),
              ListTile(
                leading:
                    Icon(Icons.chat, color: Theme.of(context).iconTheme.color),
                title: Text('Communication',
                    style: Theme.of(context).textTheme.bodyMedium),
                onTap: () {
                  // Navigate to Communication Page
                },
              ),
              ListTile(
                leading: Icon(Icons.attach_money,
                    color: Theme.of(context).iconTheme.color),
                title: Text('Revenue',
                    style: Theme.of(context).textTheme.bodyMedium),
                onTap: () {
                  // Navigate to Revenue Page
                },
              ),
              ListTile(
                leading: Icon(Icons.settings,
                    color: Theme.of(context).iconTheme.color),
                title: Text('Settings',
                    style: Theme.of(context).textTheme.bodyMedium),
                onTap: () {
                  // Navigate to Settings Page
                },
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Life Time Commissions',
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge, // Using theme text style
                ),
                const SizedBox(height: 16),
                GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    _buildInfoCard('Life Time Courses Commission', '\$1K'),
                    _buildInfoCard('Life Time Received Commission', '\$800'),
                    _buildInfoCard('Life Time Pending Commission', '\$200'),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.grey[200],
                  child: const Center(child: Text('Life Time Sales Graph')),
                ),
                const SizedBox(height: 16),
                Text(
                  'Reviews',
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge, // Using theme text style
                ),
                const SizedBox(height: 16),
                GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    _buildReviewCard('Total Reviews', '1000', Colors.blue),
                    _buildReviewCard('1 Star Reviews', '100', Colors.red),
                    _buildReviewCard('2 Star Reviews', '100', Colors.amber),
                    _buildReviewCard('3 Star Reviews', '100', Colors.yellow),
                    _buildReviewCard('4 Star Reviews', '100', Colors.green),
                    _buildReviewCard(
                        '5 Star Reviews', '100', Colors.greenAccent),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  'Courses',
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge, // Using theme text style
                ),
                const SizedBox(height: 16),
                GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    _buildCourseCard(
                        'Beginner’s Guide to Design', '\$50', 13, 254),
                    _buildCourseCard(
                        'Beginner’s Guide to Design', '\$50', 13, 254),
                    _buildCourseCard(
                        'Beginner’s Guide to Design', '\$50', 13, 254),
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          backgroundColor: const Color(0xFF1E2742),
          selectedItemColor:
              Theme.of(context).colorScheme.secondary, // Theme secondary color
          unselectedItemColor: const Color(0xFF1E2742),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Courses',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'Communication',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.attach_money),
              label: 'Revenue',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Setting',
            ),
          ],
        ));
  }

  Widget _buildInfoCard(String title, String amount) {
    return Card(
      elevation: 2,
      color: Theme.of(context).cardTheme.color, // Card color from theme
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // Shape matching theme
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium, // Text style from theme
            ),
            const SizedBox(height: 8),
            Text(
              amount,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge, // Text style from theme
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReviewCard(String title, String count, Color color) {
    return Card(
      elevation: 2,
      color: Theme.of(context).cardTheme.color, // Card color from theme
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // Shape matching theme
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium, // Text style from theme
            ),
            const SizedBox(height: 8),
            Text(
              count,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge
                  ?.copyWith(color: color), // Text style with dynamic color
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCourseCard(
      String title, String price, int lessons, int students) {
    return Card(
      elevation: 2,
      color: Theme.of(context).cardTheme.color, // Card color from theme
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // Shape matching theme
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium, // Text style from theme
            ),
            const SizedBox(height: 8),
            Text(
              price,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge, // Text style from theme
            ),
            const SizedBox(height: 8),
            Text(
              '$lessons Lessons',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium, // Text style from theme
            ),
            const SizedBox(height: 8),
            Text(
              '$students Students',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
