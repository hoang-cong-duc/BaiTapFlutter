import 'package:flutter/material.dart';
import 'auth_service.dart';
import 'profile_screen.dart';

class Ex11LoginScreen extends StatefulWidget {
  const Ex11LoginScreen({super.key});

  @override
  State<Ex11LoginScreen> createState() => _Ex11LoginScreenState();
}

class _Ex11LoginScreenState extends State<Ex11LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _userCtl = TextEditingController();
  final _passCtl = TextEditingController();

  bool _loading = false;
  bool _obscure = true;

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _loading = true);

    try {
      final token = await AuthService.login(
        _userCtl.text.trim(),
        _passCtl.text,
      );

      final profile = await AuthService.getProfile(token);

      if (!mounted) return;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => Ex11ProfileScreen(token: token, profile: profile),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content:
                Text(e.toString().replaceFirst('Exception: ', ''))),
      );
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Đăng nhập API')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 40),
              const Icon(Icons.lock, size: 90, color: Colors.blue),
              const SizedBox(height: 30),

              // Username
              TextFormField(
                controller: _userCtl,
                decoration: const InputDecoration(
                  labelText: 'Username',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
                validator: (v) =>
                    v == null || v.isEmpty ? 'Nhập username' : null,
              ),
              const SizedBox(height: 16),

              // Password
              TextFormField(
                controller: _passCtl,
                obscureText: _obscure,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: const Icon(Icons.lock),
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                        _obscure ? Icons.visibility_off : Icons.visibility),
                    onPressed: () => setState(() => _obscure = !_obscure),
                  ),
                ),
                validator: (v) =>
                    v == null || v.length < 4 ? 'Mật khẩu quá ngắn' : null,
              ),
              const SizedBox(height: 24),

              // Login Button
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: _loading ? null : _login,
                  child: _loading
                      ? const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                              color: Colors.white, strokeWidth: 2),
                        )
                      : const Text('ĐĂNG NHẬP'),
                ),
              ),
              const SizedBox(height: 12),
             
            ],
          ),
        ),
      ),
    );
  }
}
