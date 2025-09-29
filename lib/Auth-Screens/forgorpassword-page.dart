import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage>
    with TickerProviderStateMixin {
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  late AnimationController _imageController;
  late AnimationController _textController;
  late AnimationController _fieldController;
  late AnimationController _buttonController;
  late AnimationController _floatingController;
  late AnimationController _pulseController;

  late Animation<double> _imageScaleAnimation;
  late Animation<double> _imageFadeAnimation;
  late Animation<Offset> _titleSlideAnimation;
  late Animation<double> _titleFadeAnimation;
  late Animation<Offset> _subtitleSlideAnimation;
  late Animation<double> _subtitleFadeAnimation;
  late Animation<Offset> _fieldSlideAnimation;
  late Animation<double> _fieldFadeAnimation;
  late Animation<double> _buttonScaleAnimation;
  late Animation<double> _buttonFadeAnimation;
  late Animation<double> _floatingAnimation;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize animation controllers
    _imageController = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );

    _textController = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    );

    _fieldController = AnimationController(
      duration: Duration(milliseconds: 700),
      vsync: this,
    );

    _buttonController = AnimationController(
      duration: Duration(milliseconds: 600),
      vsync: this,
    );

    _floatingController = AnimationController(
      duration: Duration(milliseconds: 4000),
      vsync: this,
    );

    _pulseController = AnimationController(
      duration: Duration(milliseconds: 2000),
      vsync: this,
    );

    // Initialize animations
    _imageScaleAnimation = Tween<double>(begin: 0.7, end: 1.0).animate(
      CurvedAnimation(parent: _imageController, curve: Curves.easeOutBack),
    );

    _imageFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _imageController, curve: Curves.easeInOut),
    );

    _titleSlideAnimation = Tween<Offset>(
      begin: Offset(0, 0.4),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _textController, curve: Curves.easeOutCubic),
    );

    _titleFadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _textController, curve: Curves.easeIn));

    _subtitleSlideAnimation = Tween<Offset>(
      begin: Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _textController,
        curve: Interval(0.3, 1.0, curve: Curves.easeOutCubic),
      ),
    );

    _subtitleFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _textController,
        curve: Interval(0.2, 1.0, curve: Curves.easeIn),
      ),
    );

    _fieldSlideAnimation = Tween<Offset>(
      begin: Offset(-0.3, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _fieldController, curve: Curves.easeOutBack),
    );

    _fieldFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fieldController, curve: Curves.easeInOut),
    );

    _buttonScaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _buttonController, curve: Curves.elasticOut),
    );

    _buttonFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _buttonController, curve: Curves.easeInOut),
    );

    _floatingAnimation = Tween<double>(begin: -8.0, end: 8.0).animate(
      CurvedAnimation(parent: _floatingController, curve: Curves.easeInOut),
    );

    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    // Start animations
    _startAnimations();
  }

  void _startAnimations() async {
    // Start continuous animations
    _floatingController.repeat(reverse: true);
    _pulseController.repeat(reverse: true);

    // Sequential animations
    await Future.delayed(Duration(milliseconds: 200));
    _imageController.forward();

    await Future.delayed(Duration(milliseconds: 400));
    _textController.forward();

    await Future.delayed(Duration(milliseconds: 600));
    _fieldController.forward();

    await Future.delayed(Duration(milliseconds: 800));
    _buttonController.forward();
  }

  @override
  void dispose() {
    _imageController.dispose();
    _textController.dispose();
    _fieldController.dispose();
    _buttonController.dispose();
    _floatingController.dispose();
    _pulseController.dispose();
    _emailController.dispose();
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
            colors: [Colors.white, Color(0xFFF8FBFF), Colors.white],
            stops: [0.0, 0.5, 1.0],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 50),

                    // Back Button
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              blurRadius: 10,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.blue.shade600,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 30),

                    // Enhanced Animated Image with white background integration
                    AnimatedBuilder(
                      animation: _floatingAnimation,
                      builder: (context, child) {
                        return Transform.translate(
                          offset: Offset(0, _floatingAnimation.value),
                          child: ScaleTransition(
                            scale: _imageScaleAnimation,
                            child: FadeTransition(
                              opacity: _imageFadeAnimation,
                              child: AnimatedBuilder(
                                animation: _pulseAnimation,
                                builder: (context, child) {
                                  return Transform.scale(
                                    scale: _pulseAnimation.value,
                                    child: Container(
                                      width: 320,
                                      height: 320,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(25),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.blue.withOpacity(
                                              0.08,
                                            ),
                                            blurRadius: 30,
                                            offset: Offset(0, 15),
                                          ),
                                          BoxShadow(
                                            color: Colors.white.withOpacity(
                                              0.9,
                                            ),
                                            blurRadius: 20,
                                            offset: Offset(-8, -8),
                                          ),
                                        ],
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(25),
                                        child: Image.asset(
                                          "assets/forgor-password-img.jpg",
                                          height: 320,
                                          width: 320,
                                          fit:
                                              BoxFit
                                                  .contain, // Changed to contain to preserve aspect ratio
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        );
                      },
                    ),

                    SizedBox(height: 50),

                    // Animated Title with gradient effect
                    SlideTransition(
                      position: _titleSlideAnimation,
                      child: FadeTransition(
                        opacity: _titleFadeAnimation,
                        child: ShaderMask(
                          shaderCallback:
                              (bounds) => LinearGradient(
                                colors: [
                                  Color(0xFF1976D2),
                                  Color(0xFF42A5F5),
                                  Color(0xFF2196F3),
                                ],
                              ).createShader(bounds),
                          child: Text(
                            "Forgot Password?",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 16),

                    // Animated Subtitle
                    SlideTransition(
                      position: _subtitleSlideAnimation,
                      child: FadeTransition(
                        opacity: _subtitleFadeAnimation,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            "Don't worry! Enter your email address and we'll send you a link to reset your password.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                              height: 1.5,
                              letterSpacing: 0.3,
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 50),

                    // Enhanced Animated Email Field
                    SlideTransition(
                      position: _fieldSlideAnimation,
                      child: FadeTransition(
                        opacity: _fieldFadeAnimation,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blue.withOpacity(0.08),
                                blurRadius: 25,
                                offset: Offset(0, 10),
                              ),
                            ],
                          ),
                          child: TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: 'Email Address',
                              labelStyle: TextStyle(
                                color: Colors.grey.shade600,
                              ),
                              prefixIcon: Container(
                                margin: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.blue.shade400,
                                      Colors.lightBlue,
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(
                                  Icons.email_outlined,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 18,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(
                                  color: Colors.grey.shade200,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(
                                  color: Colors.grey.shade200,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                  width: 2,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(
                                  color: Colors.red.shade300,
                                  width: 2,
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter your email address";
                              }
                              if (!RegExp(
                                r"^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$",
                              ).hasMatch(value)) {
                                return "Enter a valid email address";
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 40),

                    // Enhanced Animated Reset Button
                    ScaleTransition(
                      scale: _buttonScaleAnimation,
                      child: FadeTransition(
                        opacity: _buttonFadeAnimation,
                        child: Container(
                          width: double.infinity,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFF1976D2),
                                Color(0xFF42A5F5),
                                Color(0xFF2196F3),
                              ],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blue.withOpacity(0.4),
                                blurRadius: 25,
                                offset: Offset(0, 12),
                              ),
                              BoxShadow(
                                color: Colors.white.withOpacity(0.8),
                                blurRadius: 15,
                                offset: Offset(-5, -5),
                              ),
                            ],
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            onPressed:
                                _isLoading
                                    ? null
                                    : () async {
                                      if (_formKey.currentState!.validate()) {
                                        setState(() {
                                          _isLoading = true;
                                        });

                                        // Simulate API call
                                        await Future.delayed(
                                          Duration(milliseconds: 2000),
                                        );

                                        setState(() {
                                          _isLoading = false;
                                        });

                                        // Show success message
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          SnackBar(
                                            content: Row(
                                              children: [
                                                Icon(
                                                  Icons.check_circle,
                                                  color: Colors.white,
                                                ),
                                                SizedBox(width: 10),
                                                Expanded(
                                                  child: Text(
                                                    "Password reset link sent to your email!",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            backgroundColor: Colors.green,
                                            behavior: SnackBarBehavior.floating,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            margin: EdgeInsets.all(20),
                                          ),
                                        );
                                      }
                                    },
                            child:
                                _isLoading
                                    ? SizedBox(
                                      height: 24,
                                      width: 24,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                              Colors.white,
                                            ),
                                        strokeWidth: 2.5,
                                      ),
                                    )
                                    : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.lock_reset,
                                          color: Colors.white,
                                          size: 22,
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          "Reset Password",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                            letterSpacing: 0.5,
                                          ),
                                        ),
                                      ],
                                    ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 40),

                    // Animated back to login text
                    FadeTransition(
                      opacity: _buttonFadeAnimation,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Remember your password? ",
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 15,
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.blue.shade500,
                                    Colors.lightBlue,
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
