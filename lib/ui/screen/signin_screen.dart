import 'package:flutter/material.dart';
import '../../../core/routes.dart';
import '../../../core/theme.dart';
import 'package:wondertall/ui/widgets/primary_button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final email = TextEditingController();
  final pass = TextEditingController();
  bool remember = false;
  bool obscured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
          children: [
            // Branding (sebagai pengganti logo + latar gradien)
            Container(
              height: 120,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.gradientStart, AppColors.gradientEnd],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              child: const Center(
                child: Text(
                  'WonderTrail',
                  style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w800),
                ),
              ),
            ),
            const SizedBox(height: 26),
            const Center(
              child: Text('Sign in', style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700)),
            ),
            const SizedBox(height: 6),
            const Center(
              child: Text(
                'Enter your Account details to process',
                style: TextStyle(color: AppColors.textSecondary),
              ),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: email,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(labelText: 'Email', hintText: 'user@example.com'),
            ),
            const SizedBox(height: 14),
            TextField(
              controller: pass,
              obscureText: obscured,
              decoration: InputDecoration(
                labelText: 'Password',
                suffixIcon: IconButton(
                  icon: Icon(obscured ? Icons.visibility_off_outlined : Icons.visibility_outlined),
                  onPressed: () => setState(() => obscured = !obscured),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Checkbox(
                  value: remember,
                  onChanged: (v) => setState(() => remember = v ?? false),
                  visualDensity: VisualDensity.compact,
                ),
                const Text('Remember me'),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  child: const Text('Forgot Password ?'),
                )
              ],
            ),
            const SizedBox(height: 6),
            PrimaryButton(
              label: 'Sign in',
              onPressed: () => Navigator.pushReplacementNamed(context, AppRoutes.home),
            ),
            const SizedBox(height: 18),
            Row(
              children: const [
                Expanded(child: Divider()),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('Or'),
                ),
                Expanded(child: Divider()),
              ],
            ),
            const SizedBox(height: 18),
            _social('Continue with Google', Icons.g_mobiledata),
            const SizedBox(height: 12),
            _social('Continue with Facebook', Icons.facebook),
            const SizedBox(height: 12),
            _social('Continue with SMS', Icons.sms_outlined),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account? "),
                TextButton(onPressed: () {}, child: const Text('Sign Up')),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _social(String label, IconData icon) {
    return OutlinedButton.icon(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Color(0xFFE5E7EB)),
        minimumSize: const Size.fromHeight(54),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
      onPressed: () {},
      icon: Icon(icon, color: AppColors.primary),
      label: Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
    );
  }
}