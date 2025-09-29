import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BankNiftyOptionalCallsPage extends StatefulWidget {
  @override
  _BankNiftyOptionalCallsPageState createState() =>
      _BankNiftyOptionalCallsPageState();
}

class _BankNiftyOptionalCallsPageState extends State<BankNiftyOptionalCallsPage>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _cardAnimationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _cardSlideAnimation;
  int _currentCarouselIndex = 0;

  final List<String> carouselImages = [
    'assets/Bank_Nifty_Optional_calls.gif',
    'assets/Bank_Nifty_Optional_calls_1.gif',
  ];

  final List<Map<String, dynamic>> sections = [
    {
      'heading': 'Bank Nifty + Bank Nifty Optionsl Calls',
      'content':
          'Looking for reliable Bank Nifty + Bank Nifty Optionsl Calls? Ensure seamless stock transactions with timely funds for delivery settlements. Stay updated with brokerage updates and avoid penalties by fulfilling cash calls promptly.',
      'icon': Icons.local_shipping_outlined,
      'color': LinearGradient(colors: [Color(0xFF667eea), Color(0xFF764ba2)]),
    },
    {
      'heading': 'What is Bank Nifty + Bank Nifty Optionsl Calls?',
      'content':
          'Bank Nifty + Bank Nifty Optionsl Calls are requests made by brokerage firms to their clients for funds required to settle transactions where actual delivery of shares or securities is involved. When an investor buys shares intending to take delivery, they need to pay the full purchase amount.',
      'icon': Icons.help_outline,
      'color': LinearGradient(colors: [Color(0xFF4facfe), Color(0xFF00f2fe)]),
    },
    {
      'heading': 'Why Choose Us',
      'content':
          'We offer comprehensive Basic and Premium Delivery Cash Call plans with varying call frequency and investment durations to suit your trading needs.',
      'icon': Icons.star_outline,
      'color': LinearGradient(colors: [Color(0xFFa8edea), Color(0xFFfed6e3)]),
      'hasPlans': true,
      'hasGif': true, // ✅ Added key to indicate GIF
    },
    {
      'heading': 'Before You Start Trading',
      'content':
          'Before starting Bank Nifty + Bank Nifty Optionsl Calls trading, understand market fundamentals, stock selection, and timing strategies. Analyze company financials and trends, ensuring sufficient capital for long-term holding.',
      'icon': Icons.lightbulb_outline,
      'color': LinearGradient(colors: [Color(0xFFffecd2), Color(0xFFfcb69f)]),
    },
    {
      'heading': 'Conclusion',
      'content':
          'Bank Nifty + Bank Nifty Optionsl Calls trading requires a clear understanding of market dynamics and disciplined execution. With AS Research Technic, access reliable insights and customized plans to suit your investment goals.',
      'icon': Icons.check_circle_outline,
      'color': LinearGradient(colors: [Color(0xFF8BC34A), Color(0xFF4CAF50)]),
    },
  ];

  final List<Map<String, dynamic>> basicPlan = [
    {'duration': '2 Weeks', 'price': '₹3,000', 'calls': '4-5 monthly'},
    {'duration': '1 Month', 'price': '₹5,000', 'calls': '4-5 monthly'},
    {'duration': '3 Months', 'price': '₹12,000', 'calls': '4-5 monthly'},
    {'duration': '6 Months', 'price': '₹20,000', 'calls': '4-5 monthly'},
  ];

  final List<Map<String, dynamic>> premiumPlan = [
    {'duration': '1 Month', 'price': '₹10,000', 'calls': '6-10 monthly'},
    {'duration': '3 Months', 'price': '₹20,000', 'calls': '6-10 monthly'},
    {'duration': '6 Months', 'price': '₹40,000', 'calls': '6-10 monthly'},
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );

    _cardAnimationController = AnimationController(
      duration: Duration(milliseconds: 1200),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutCubic),
    );

    _cardSlideAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _cardAnimationController,
        curve: Curves.easeOutCubic,
      ),
    );

    _animationController.forward();
    Future.delayed(Duration(milliseconds: 500), () {
      _cardAnimationController.forward();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _cardAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFf8f9fa), Color(0xFFe9ecef)],
          ),
        ),
        child: CustomScrollView(
          slivers: [
            // Custom App Bar
            SliverAppBar(
              expandedHeight: 120.0,
              floating: false,
              pinned: true,
              elevation: 0,
              backgroundColor: Colors.transparent,
              flexibleSpace: FlexibleSpaceBar(
                background: FadeTransition(
                  opacity: _fadeAnimation,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xFF667eea), Color(0xFF764ba2)],
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                      ),
                    ),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 40),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.local_shipping_outlined,
                              size: 30,
                              color: Colors.white,
                            ),
                            SizedBox(height: 8),
                            Text(
                              "Bank Nifty + Bank Nifty Optionsl Calls",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              centerTitle: true,
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),

            // Carousel Section
            SliverToBoxAdapter(
              child: SlideTransition(
                position: _slideAnimation,
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: _buildCarouselSection(),
                ),
              ),
            ),

            // Content Sections
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return AnimatedBuilder(
                    animation: _cardSlideAnimation,
                    builder: (context, child) {
                      final animationValue = Curves.easeOutCubic.transform(
                        (_cardSlideAnimation.value - (index * 0.1)).clamp(
                          0.0,
                          1.0,
                        ),
                      );
                      return Transform.translate(
                        offset: Offset(0, (1 - animationValue) * 50),
                        child: Opacity(
                          opacity: animationValue,
                          child: _buildContentSection(sections[index]),
                        ),
                      );
                    },
                  );
                }, childCount: sections.length),
              ),
            ),

            // Subscribe Button
            SliverToBoxAdapter(child: _buildSubscribeSection()),

            // Bottom spacing
            SliverToBoxAdapter(child: SizedBox(height: 30)),
          ],
        ),
      ),
    );
  }

  Widget _buildCarouselSection() {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 200,
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 16 / 9,
              autoPlayInterval: Duration(seconds: 5),
              onPageChanged: (index, reason) {
                setState(() {
                  _currentCarouselIndex = index;
                });
              },
            ),
            items:
                carouselImages.map((item) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 15,
                          spreadRadius: 2,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        item,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  );
                }).toList(),
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
                carouselImages.asMap().entries.map((entry) {
                  return Container(
                    width: _currentCarouselIndex == entry.key ? 12 : 8,
                    height: 8,
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color:
                          _currentCarouselIndex == entry.key
                              ? Color(0xFF667eea)
                              : Colors.grey[300],
                    ),
                  );
                }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildContentSection(Map<String, dynamic> section) {
    return Container(
      margin: EdgeInsets.only(bottom: 25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 15,
            spreadRadius: 2,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with gradient
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: section['color'],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(section['icon'], color: Colors.white, size: 24),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: Text(
                    section['heading'],
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Content
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  section['content'],
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey[700],
                    height: 1.5,
                  ),
                ),

                // ✅ Show GIF for "Why Choose Us"
                if (section['hasGif'] == true) ...[
                  SizedBox(height: 20),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      'assets/Why_Choose_Bank_Nifty_Calls.gif',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],

                // ✅ Plans section for "Why Choose Us"
                if (section['hasPlans'] == true) ...[
                  SizedBox(height: 25),
                  _buildPlansSection(),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlansSection() {
    return Column(
      children: [
        // Basic Plan
        Container(
          margin: EdgeInsets.only(bottom: 20),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF4facfe), Color(0xFF00f2fe)],
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.star, color: Colors.white, size: 20),
                  SizedBox(width: 8),
                  Text(
                    "Basic Plan",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Text(
                "4-5 monthly stock calls • 1-6 months holding period",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 15),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children:
                    basicPlan
                        .map((plan) => _buildPlanCard(plan, false))
                        .toList(),
              ),
            ],
          ),
        ),

        // Premium Plan
        Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF667eea), Color(0xFF764ba2)],
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.diamond, color: Colors.white, size: 20),
                  SizedBox(width: 8),
                  Text(
                    "Premium Plan",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 8),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      "Popular",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Text(
                "6-10 monthly stock calls • 1-6 months holding period",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 15),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children:
                    premiumPlan
                        .map((plan) => _buildPlanCard(plan, true))
                        .toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPlanCard(Map<String, dynamic> plan, bool isPremium) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            plan['duration'],
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          SizedBox(height: 4),
          Text(
            plan['price'],
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubscribeSection() {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF667eea), Color(0xFF764ba2)],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF667eea).withOpacity(0.3),
            blurRadius: 20,
            spreadRadius: 2,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(Icons.rocket_launch, size: 50, color: Colors.white),
          SizedBox(height: 15),
          Text(
            "Ready to Start Trading?",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8),
          Text(
            "Choose your plan and begin your journey with expert guidance",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white.withOpacity(0.9),
            ),
          ),
          SizedBox(height: 25),
          Container(
            width: double.infinity,
            height: 55,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Color(0xFF667eea),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () {
                _showSubscriptionDialog();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Subscribe Now",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 10),
                  Icon(Icons.arrow_forward, size: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showSubscriptionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            padding: EdgeInsets.all(25),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF4facfe), Color(0xFF00f2fe)],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.check_circle, size: 60, color: Colors.white),
                SizedBox(height: 15),
                Text(
                  "Thank You!",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Your subscription request has been received. Our team will contact you shortly.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
                SizedBox(height: 25),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Color(0xFF4facfe),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    "Close",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
