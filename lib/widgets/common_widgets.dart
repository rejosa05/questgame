import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// 🔹 A reusable styled button
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? color;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? Theme.of(context).primaryColor,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

/// 🔹 A reusable card with title & subtitle
class InfoCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData? icon;
  final Widget? leadingIcon; // ✅ this allows custom icon widget
  final VoidCallback onTap;
  final Color? backgroundColor;
  final Color? textColor;
  final double iconSize;
  final Color? borderColor;

  const InfoCard({
    Key? key,
    required this.title,
    required this.subtitle,
    this.icon,
    this.leadingIcon,
    required this.onTap,
    this.backgroundColor,
    this.textColor,
    this.iconSize = 28,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor ?? Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: borderColor ?? Colors.black12,
          width: 7.5,
        ),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        leading: leadingIcon ??
            Icon(
              icon,
              size: iconSize,
              color: textColor ?? Colors.black,
            ),
        title: Text(
          title,
          style: TextStyle(
            fontFamily: 'Merriweather',
            fontWeight: FontWeight.bold,
            color: textColor ?? Colors.black,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            fontFamily: 'Merriweather',
            color: textColor?.withOpacity(0.7) ?? Colors.black87,
          ),
        ),
        trailing: Icon(Icons.arrow_forward_ios, size: 16, color: textColor),
        onTap: onTap,
      ),
    );
  }
}



/// 🔹 A reusable question widget
class QuestionCard extends StatelessWidget {
  final String question;
  final List<Widget> options;

  const QuestionCard({
    Key? key,
    required this.question,
    required this.options,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 20),
            ...options,
          ],
        ),
      ),
    );
  }
}
