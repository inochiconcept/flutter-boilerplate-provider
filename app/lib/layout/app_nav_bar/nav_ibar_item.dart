import 'package:flutter/material.dart';

class NavBarItem extends StatelessWidget {
  final IconData? icon;
  final String? label;
  final String? link;
  final bool? active;
  final bool? disabled;
  const NavBarItem({
    this.icon,
    this.label,
    this.link,
    this.active,
    this.disabled,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: link != null && active != true && disabled != true
            ? () {
                Navigator.of(context).pushNamed(link!);
              }
            : null,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Opacity(
            opacity: disabled == true ? .5 : 1,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(icon, color: active! ? Colors.red : Colors.green),
                Text(
                  label!,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
