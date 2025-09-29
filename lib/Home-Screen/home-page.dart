import 'package:as_research_techno_information/Services-Screen/Bank_Nifty_Bank_Nifty_optional_calls.dart';
import 'package:as_research_techno_information/Services-Screen/Currency_Calls.dart';
import 'package:as_research_techno_information/Services-Screen/Delivery_Cash_Calls_page.dart';
import 'package:as_research_techno_information/Services-Screen/Intraday_cash_call_page.dart';
import 'package:as_research_techno_information/Services-Screen/MCX_Calls.dart';
import 'package:as_research_techno_information/Services-Screen/Nifty+bank_Nifty_Optional_Calls.dart';
import 'package:as_research_techno_information/Services-Screen/Nifty_Bank_page.dart';
import 'package:as_research_techno_information/Services-Screen/Nifty_Nifty_Optional_Calls.dart';
import 'package:as_research_techno_information/Services-Screen/Positional_MCX_Calls.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  String _searchQuery = "";

  // Using assets images instead of Icons
  final List<Map<String, dynamic>> features = [
    {
      "image": "assets/call.png",
      "label": "Delivery Cash Calls",
      "page": DeliveryCashCallsPage(),
    },
    {
      "image": "assets/Intraday Cash Calls.png",
      "label": "Intraday Cash Calls",
      "page": IntradayCashCallsPage(),
    },
    {
      "image": "assets/NIFTY.png",
      "label": "NIFTY + BANK NIFTY",
      "page": NiftyBankNiftyPage(),
    },
    {
      "image": "assets/NIFTYOPTIONCALLS.png",
      "label": "NIFTY + NIFTY OPTION CALLS",
      "page": NiftyOptionalCallsPage(),
    },
    {
      "image": "assets/BankNaftyOption.png",
      "label": "Bank Nifty + Bank Nifty Option Calls",
      "page": BankNiftyOptionalCallsPage(),
    },
    {
      "image": "assets/NiftyandBankNiftyOption.png",
      "label": "Nifty + Bank Nifty Option Calls",
      "page": NiftyBankNiftyOptionCallsPage(),
    },
    {"image": "assets/calls.png", "label": "MCX calls", "page": MCXCallsPage()},
    {
      "image": "assets/PositionalMCXCalls.png",
      "label": "Positional MCX Calls",
      "page": PositionalMcxCallsPage(),
    },
    {
      "image": "assets/Currency Calls.png",
      "label": "Currency Calls",
      "page": CurrencyCallsPage(),
    },
  ];

  // Youtube Controller
  late YoutubePlayerController _youtubeController;

  @override
  void initState() {
    super.initState();

    // ✅ Use a valid YouTube video URL
    final videoUrl = "https://www.youtube.com/watch?v=Otf7hfGXE2c";
    final videoId = YoutubePlayer.convertUrlToId(videoUrl);

    _youtubeController = YoutubePlayerController(
      initialVideoId: videoId ?? "dQw4w9WgXcQ", // fallback video
      flags: const YoutubePlayerFlags(autoPlay: false, mute: false),
    );
  }

  @override
  void dispose() {
    _youtubeController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    if (index == 1) {
      _navigateWithSlide(context, "Booking History");
    } else if (index == 2) {
      _navigateWithSlide(context, "Market Overview");
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  void _navigateWithSlide(BuildContext context, String title) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder:
            (context, animation, secondaryAnimation) =>
                SimplePage(title: title),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          final tween = Tween(begin: begin, end: end);
          final offsetAnimation = animation.drive(tween);
          return SlideTransition(position: offsetAnimation, child: child);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final filteredFeatures =
        features
            .where(
              (item) =>
                  item["label"].toString().toLowerCase().contains(_searchQuery),
            )
            .toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Your All-in-one Market Research App"),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.account_circle,
              color: Colors.blue,
              size: 30,
            ),
            onPressed: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text("Profile Clicked")));
            },
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _drawerItem(Icons.privacy_tip, "Privacy Policy"),
                  _drawerItem(Icons.article, "Disclaimer"),
                  _drawerItem(Icons.support_agent, "Grievance Redressal"),
                  _drawerItem(Icons.star, "Investor Charter"),
                  _drawerItem(Icons.description, "Terms and Conditions"),
                  _drawerItem(Icons.work, "Careers"),
                  _drawerItem(Icons.info, "About"),
                  _drawerItem(Icons.newspaper, "News"),
                  _drawerItem(Icons.contact_mail, "Contact Us"),
                ],
              ),
            ),
            const Divider(),
            // WILL BE ADDED IN THE LAST
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _socialIcon(
                    'Facebook',
                    Icons.facebook,
                    "https://www.facebook.com",
                  ),
                  _socialIcon(
                    'whatApp',
                    Icons.phone,
                    "https://wa.me/911234567890",
                  ),
                  _socialIcon(
                    'Instagram',
                    Icons.camera_alt,
                    "https://www.instagram.com",
                  ),
                  _socialIcon(
                    'Youtube',
                    Icons.video_library,
                    "https://www.youtube.com",
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
      body:
          _selectedIndex == 0
              ? SingleChildScrollView(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      onChanged: (value) {
                        setState(() {
                          _searchQuery = value.toLowerCase();
                        });
                      },
                      decoration: InputDecoration(
                        hintText: "Search here...",
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Explore Market",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    GridView.builder(
                      itemCount: filteredFeatures.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 1,
                          ),
                      itemBuilder: (context, index) {
                        final item = filteredFeatures[index];
                        return Card(
                          color: Colors.white,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => item["page"]),
                              );
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  item["image"],
                                  height: 40,
                                  width: 40,
                                  fit: BoxFit.contain,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  item["label"],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Watch Market Insights",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    YoutubePlayer(
                      controller: _youtubeController,
                      showVideoProgressIndicator: true,
                      progressColors: const ProgressBarColors(
                        playedColor: Colors.blue,
                        handleColor: Colors.blueAccent,
                      ),
                    ),
                  ],
                ),
              )
              : _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: "Booking History",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart),
            label: "Market Overview",
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _drawerItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(title),
      onTap: () {
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => SimplePage(title: title)),
        );
      },
    );
  }

  // SHOULD BE ADD WITH THE LAST THIS IS FOR THE SOCIAL MEDIA LINKS URL LAUNCHING
  Widget _socialIcon(String label, IconData icon, String url) {
    return InkWell(
      onTap: () async {
        if (await canLaunchUrl(Uri.parse(url))) {
          await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
        }
      },
      child: Icon(icon, color: Colors.blue, size: 30),
    );
  }

  final List<Widget> _pages = [
    const SizedBox(), // Home handled separately
    const Center(child: Text("Booking History Page")),
    const Center(child: Text("Market Overview Page")),
  ];
}

/// ----------------------
/// Separate Pages Section
/// ----------------------

/// Reusable page builder
Widget _buildServicePage(String title) {
  return Scaffold(
    appBar: AppBar(title: Text(title)),
    body: Center(
      child: Text(
        "$title Page",
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    ),
  );
}

/// Drawer & Navigation Pages
class SimplePage extends StatelessWidget {
  final String title;
  const SimplePage({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Text(
          "$title Page",
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
