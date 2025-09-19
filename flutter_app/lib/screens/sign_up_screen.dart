import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isTermsAccepted = false;
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 60),
                
                // Title and Subtitle
                Text(
                  l10n.joinNutrioToday,
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontSize: 28,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  l10n.createAccountSubtitle,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: Colors.grey[600],
                    height: 1.5,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 40),
                
                // Email Field
                _buildTextField(
                  controller: _emailController,
                  label: l10n.emailLabel,
                  placeholder: l10n.emailPlaceholder,
                  icon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                  validator: _validateEmail,
                ),
                const SizedBox(height: 20),
                
                // Password Field
                _buildTextField(
                  controller: _passwordController,
                  label: l10n.passwordLabel,
                  placeholder: l10n.passwordPlaceholder,
                  icon: Icons.lock_outline,
                  isPassword: true,
                  validator: _validatePassword,
                ),
                const SizedBox(height: 24),
                
                // Terms & Conditions Checkbox
                _buildTermsCheckbox(l10n),
                const SizedBox(height: 32),
                
                // Sign Up Button
                _buildSignUpButton(l10n),
                const SizedBox(height: 24),
                
                // Sign In Link
                _buildSignInLink(l10n),
                const SizedBox(height: 32),
                
                // Divider with "Or sign up with"
                _buildDividerWithText(l10n),
                const SizedBox(height: 24),
                
                // Social Sign Up Buttons
                _buildSocialSignUpButtons(),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String placeholder,
    required IconData icon,
    bool isPassword = false,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          key: Key('${label.toLowerCase().replaceAll(' ', '_')}_field'),
          controller: controller,
          obscureText: isPassword && !_isPasswordVisible,
          keyboardType: keyboardType,
          validator: validator,
          decoration: InputDecoration(
            hintText: placeholder,
            hintStyle: TextStyle(
              color: Colors.grey[400],
              fontSize: 16,
            ),
            prefixIcon: Icon(
              icon,
              color: Colors.grey[400],
              size: 20,
            ),
            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: Colors.grey[400],
                      size: 20,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  )
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFF4CAF50), width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTermsCheckbox(AppLocalizations l10n) {
    return Row(
      children: [
        Semantics(
          label: 'Terms and conditions checkbox',
          child: SizedBox(
            width: 24,
            height: 24,
            child: Checkbox(
              value: _isTermsAccepted,
              onChanged: (value) {
                setState(() {
                  _isTermsAccepted = value ?? false;
                });
              },
              activeColor: const Color(0xFF4CAF50),
              checkColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                _isTermsAccepted = !_isTermsAccepted;
              });
            },
            child: Text(
              l10n.termsAndConditions,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSignUpButton(AppLocalizations l10n) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: _isTermsAccepted ? _handleSignUp : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF4CAF50),
          disabledBackgroundColor: Colors.grey[300],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
        ),
        child: Text(
          l10n.signUpButton,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildSignInLink(AppLocalizations l10n) {
    return Center(
      child: GestureDetector(
        onTap: _handleSignInTap,
        child: Text(
          l10n.signInLink,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF4CAF50),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildDividerWithText(AppLocalizations l10n) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: Colors.grey[300],
            thickness: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            l10n.orSignUpWith,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
        ),
        Expanded(
          child: Divider(
            color: Colors.grey[300],
            thickness: 1,
          ),
        ),
      ],
    );
  }

  Widget _buildSocialSignUpButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildSocialButton(
          icon: Icons.g_mobiledata,
          onTap: () => _handleSocialSignUp('Google'),
        ),
        _buildSocialButton(
          icon: Icons.apple,
          onTap: () => _handleSocialSignUp('Apple'),
        ),
        _buildSocialButton(
          icon: Icons.facebook,
          onTap: () => _handleSocialSignUp('Facebook'),
        ),
        _buildSocialButton(
          icon: Icons.close, // Using close icon as placeholder for X
          onTap: () => _handleSocialSignUp('X'),
        ),
      ],
    );
  }

  Widget _buildSocialButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    String provider = '';
    if (icon == Icons.g_mobiledata) provider = 'Google';
    else if (icon == Icons.apple) provider = 'Apple';
    else if (icon == Icons.facebook) provider = 'Facebook';
    else if (icon == Icons.close) provider = 'X';

    return Semantics(
      label: 'Sign up with $provider',
      button: true,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          child: Icon(
            icon,
            size: 24,
            color: Colors.grey[700],
          ),
        ),
      ),
    );
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  void _handleSignUp() {
    if (_formKey.currentState!.validate()) {
      // Handle sign up logic
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Sign up functionality would be implemented here'),
          backgroundColor: Color(0xFF4CAF50),
        ),
      );
    }
  }

  void _handleSignInTap() {
    // Handle navigation to sign in screen
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Navigate to sign in screen'),
      ),
    );
  }

  void _handleSocialSignUp(String provider) {
    // Handle social sign up
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Sign up with $provider'),
      ),
    );
  }
}