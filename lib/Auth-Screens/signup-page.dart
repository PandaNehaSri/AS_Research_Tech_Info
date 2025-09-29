import 'package:as_research_techno_information/Auth-Screens/login-page.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
    with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
  bool _rememberMe = false;
  bool _isLoading = false;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late AnimationController _fadeController;
  late AnimationController _slideController;
  late AnimationController _scaleController;
  late AnimationController _buttonController;
  late AnimationController _fieldController;

  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _buttonScaleAnimation;
  late List<Animation<Offset>> _fieldAnimations;
  late List<Animation<double>> _fieldFadeAnimations;

  @override
  void initState() {
    super.initState();

    // Initialize animation controllers with faster durations
    _fadeController = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    );

    _slideController = AnimationController(
      duration: Duration(milliseconds: 900),
      vsync: this,
    );

    _scaleController = AnimationController(
      duration: Duration(milliseconds: 700),
      vsync: this,
    );

    _buttonController = AnimationController(
      duration: Duration(milliseconds: 600),
      vsync: this,
    );

    _fieldController = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );

    // Initialize animations
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 0.2),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _slideController, curve: Curves.easeOutCubic),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.easeOutBack),
    );

    _buttonScaleAnimation = Tween<double>(begin: 0.9, end: 1.0).animate(
      CurvedAnimation(parent: _buttonController, curve: Curves.easeOutBack),
    );

    // Create smoother staggered animations for form fields
    _fieldAnimations = List.generate(4, (index) {
      return Tween<Offset>(begin: Offset(-0.3, 0), end: Offset.zero).animate(
        CurvedAnimation(
          parent: _fieldController,
          curve: Interval(
            index * 0.1,
            0.4 + index * 0.1,
            curve: Curves.easeOutCubic,
          ),
        ),
      );
    });

    _fieldFadeAnimations = List.generate(4, (index) {
      return Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: _fieldController,
          curve: Interval(
            index * 0.08,
            0.35 + index * 0.08,
            curve: Curves.easeOut,
          ),
        ),
      );
    });

    // Start animations with better timing
    _startAnimations();
  }

  void _startAnimations() async {
    // Start scale animation first
    _scaleController.forward();

    // Shorter delays for smoother experience
    await Future.delayed(Duration(milliseconds: 150));
    _fadeController.forward();

    await Future.delayed(Duration(milliseconds: 200));
    _slideController.forward();

    await Future.delayed(Duration(milliseconds: 300));
    _fieldController.forward();

    await Future.delayed(Duration(milliseconds: 500));
    _buttonController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    _scaleController.dispose();
    _buttonController.dispose();
    _fieldController.dispose();
    super.dispose();
  }

  Widget _buildAnimatedTextField({
    required int index,
    required TextEditingController controller,
    required String hintText,
    required IconData prefixIcon,
    Widget? suffixIcon,
    bool obscureText = false,
    TextInputType? keyboardType,
    required String? Function(String?) validator,
  }) {
    return SlideTransition(
      position: _fieldAnimations[index],
      child: FadeTransition(
        opacity: _fieldFadeAnimations[index],
        child: Container(
          margin: EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.white,
                blurRadius: 25,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: TextFormField(
            controller: controller,
            obscureText: obscureText,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey.shade500),
              prefixIcon: Container(
                margin: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.blue.shade400,
                      Colors.lightBlue,
                      Colors.blue.shade300,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(prefixIcon, color: Colors.white, size: 20),
              ),
              suffixIcon: suffixIcon,
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.symmetric(
                vertical: 18,
                horizontal: 20,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.grey.shade200),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.grey.shade200),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.blue, width: 2),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.red.shade300, width: 2),
              ),
            ),
            validator: validator,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFF0F8FF),
              Colors.white,
              Color(0xFFE3F2FD),
              Colors.white,
            ],
            stops: [0.0, 0.3, 0.7, 1.0],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 5),

                  // Enhanced Illustration Image with floating animation
                  ScaleTransition(
                    scale: _scaleAnimation,
                    child: FadeTransition(
                      opacity: _fadeAnimation,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white,
                              blurRadius: 35,
                              offset: Offset(0, 18),
                            ),
                            BoxShadow(
                              color: Colors.white.withOpacity(0.9),
                              blurRadius: 25,
                              offset: Offset(-8, -8),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Image.asset(
                            "assets/singup.jpg",
                            height: 350,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 35),

                  // Animated Register Title with gradient
                  SlideTransition(
                    position: _slideAnimation,
                    child: FadeTransition(
                      opacity: _fadeAnimation,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: ShaderMask(
                          shaderCallback:
                              (bounds) => LinearGradient(
                                colors: [
                                  Colors.blue.shade700,
                                  Colors.blue.shade500,
                                  Colors.lightBlue,
                                ],
                              ).createShader(bounds),
                          child: Text(
                            "Register",
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 8),

                  // Animated Subtitle
                  SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset(0, 0.3),
                      end: Offset.zero,
                    ).animate(
                      CurvedAnimation(
                        parent: _slideController,
                        curve: Interval(0.2, 1.0, curve: Curves.easeOut),
                      ),
                    ),
                    child: FadeTransition(
                      opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
                        CurvedAnimation(
                          parent: _fadeController,
                          curve: Interval(0.3, 1.0, curve: Curves.easeIn),
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Please register to login.",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.blue.shade600,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 25),

                  // Animated Username Field
                  _buildAnimatedTextField(
                    index: 0,
                    controller: _usernameController,
                    hintText: "Username",
                    prefixIcon: Icons.person_outline,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your username";
                      }
                      return null;
                    },
                  ),

                  // Animated Email Field
                  _buildAnimatedTextField(
                    index: 1,
                    controller: _emailController,
                    hintText: "Email",
                    prefixIcon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your email";
                      }
                      if (!RegExp(
                        r"^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$",
                      ).hasMatch(value)) {
                        return "Enter a valid email";
                      }
                      return null;
                    },
                  ),

                  // Animated Mobile Number Field
                  _buildAnimatedTextField(
                    index: 2,
                    controller: _mobileController,
                    hintText: "Mobile Number",
                    prefixIcon: Icons.phone_outlined,
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your mobile number";
                      } else if (value.length < 10) {
                        return "Enter a valid mobile number";
                      }
                      return null;
                    },
                  ),

                  // Animated Password Field with enhanced visibility toggle
                  SlideTransition(
                    position: _fieldAnimations[3],
                    child: FadeTransition(
                      opacity: _fieldFadeAnimations[3],
                      child: Container(
                        margin: EdgeInsets.only(bottom: 20),
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
                          controller: _passwordController,
                          obscureText: _obscurePassword,
                          decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: TextStyle(color: Colors.grey.shade500),
                            prefixIcon: Container(
                              margin: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.blue.shade400,
                                    Colors.lightBlue,
                                    Colors.blue.shade300,
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(
                                Icons.lock_outline,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                            suffixIcon: AnimatedSwitcher(
                              duration: Duration(milliseconds: 300),
                              transitionBuilder: (child, animation) {
                                return RotationTransition(
                                  turns: animation,
                                  child: child,
                                );
                              },
                              child: IconButton(
                                key: ValueKey(_obscurePassword),
                                icon: Icon(
                                  _obscurePassword
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                  color: Colors.blue.shade400,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obscurePassword = !_obscurePassword;
                                  });
                                },
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 18,
                              horizontal: 20,
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
                              return 'Please enter a password';
                            }
                            if (value.length < 8) {
                              return 'Password must be at least 8 characters';
                            }
                            if (!RegExp(r'[A-Z]').hasMatch(value)) {
                              return 'Password must contain at least one uppercase letter';
                            }
                            if (!RegExp(r'[0-9]').hasMatch(value)) {
                              return 'Password must contain at least one number';
                            }
                            if (!RegExp(
                              r'[!@#\$&*~%^(),.?":{}|<>]',
                            ).hasMatch(value)) {
                              return 'Password must contain at least one special character';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 15),

                  // Enhanced Sign Up Button with larger size
                  ScaleTransition(
                    scale: _buttonScaleAnimation,
                    child: Container(
                      width: double.infinity,
                      height: 60, // Increased button height
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
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
                          padding: EdgeInsets.symmetric(
                            vertical: 18,
                          ), // Increased padding
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

                                    // Simulate registration process
                                    await Future.delayed(
                                      Duration(milliseconds: 2000),
                                    );

                                    setState(() {
                                      _isLoading = false;
                                    });

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Row(
                                          children: [
                                            Icon(
                                              Icons.check_circle,
                                              color: Colors.white,
                                            ),
                                            SizedBox(width: 10),
                                            Text("Registration Successful"),
                                          ],
                                        ),
                                        backgroundColor: Colors.green,
                                        behavior: SnackBarBehavior.floating,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                        margin: EdgeInsets.all(20),
                                      ),
                                    );
                                  }
                                },
                        child: Ink(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.blue.shade600,
                                Colors.blue.shade500,
                                Colors.lightBlue,
                                Colors.blue.shade400,
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            child:
                                _isLoading
                                    ? SizedBox(
                                      height:
                                          24, // Slightly larger loading indicator
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
                                        Text(
                                          "Sign Up",
                                          style: TextStyle(
                                            fontSize: 20, // Increased font size
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                            letterSpacing: 0.5,
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Icon(
                                          Icons.person_add_rounded,
                                          color: Colors.white,
                                          size: 22, // Slightly larger icon
                                        ),
                                      ],
                                    ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 30),

                  // Enhanced Sign In Redirect with animations (removed dots)
                  FadeTransition(
                    opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
                      CurvedAnimation(
                        parent: _fadeController,
                        curve: Interval(0.6, 1.0, curve: Curves.easeIn),
                      ),
                    ),
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: Offset(0, 0.2),
                        end: Offset.zero,
                      ).animate(
                        CurvedAnimation(
                          parent: _slideController,
                          curve: Interval(0.5, 1.0, curve: Curves.easeOut),
                        ),
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have account? ",
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 15,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder:
                                        (
                                          context,
                                          animation,
                                          secondaryAnimation,
                                        ) => LoginPage(),
                                    transitionsBuilder: (
                                      context,
                                      animation,
                                      secondaryAnimation,
                                      child,
                                    ) {
                                      return SlideTransition(
                                        position: Tween<Offset>(
                                          begin: Offset(-1.0, 0.0),
                                          end: Offset.zero,
                                        ).animate(
                                          CurvedAnimation(
                                            parent: animation,
                                            curve: Curves.easeOutCubic,
                                          ),
                                        ),
                                        child: child,
                                      );
                                    },
                                    transitionDuration: Duration(
                                      milliseconds: 600,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.blue.shade500,
                                      Colors.lightBlue,
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.blue.withOpacity(0.3),
                                      blurRadius: 10,
                                      offset: Offset(0, 4),
                                    ),
                                  ],
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
                    ),
                  ),

                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
