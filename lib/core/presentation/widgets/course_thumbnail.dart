import 'package:flutter/material.dart';

class CourseThumbnail extends StatelessWidget {
  final String type;
  final Color? color;
  final Color? bgColor;
  final Color? borderColor;
  final String? text;
  final String? subText;
  final IconData? icon;
  final double size;

  const CourseThumbnail({
    super.key,
    required this.type,
    this.color,
    this.bgColor,
    this.borderColor,
    this.text,
    this.subText,
    this.icon,
    this.size = 60,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: bgColor ?? Colors.grey[200],
        borderRadius: BorderRadius.circular(4),
        border: borderColor != null ? Border.all(color: borderColor!) : null,
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          if (type == 'pattern') ...[
             Positioned(top: -10, left: -10, child: Icon(Icons.circle, size: size * 1.3, color: color?.withValues(alpha:0.2))),
             Positioned(bottom: -10, right: -10, child: Icon(Icons.category, size: size * 0.8, color: color?.withValues(alpha:0.3))),
          ],
          if (type == 'curves') ...[
             Positioned(top: 0, left: 0, right:0, bottom:0, child: Icon(Icons.waves, size: size * 1.3, color: color?.withValues(alpha:0.3))),
          ],
          if (type == 'text') ...[
             Center(
               child: RichText(
                 text: TextSpan(
                   children: [
                     TextSpan(text: text, style: TextStyle(fontSize: size * 0.4, fontWeight: FontWeight.bold, color: Colors.black)),
                     if (subText != null) 
                        TextSpan(
                          text: '\n$subText', 
                          style: TextStyle(
                            fontSize: size * 0.4, 
                            fontWeight: FontWeight.bold, 
                            color: Colors.white, 
                            backgroundColor: color
                          )
                        ),
                   ]
                 ),
               ),
             ),
             // Specific fix for "UI UX" graphic to look like design
             if (text == 'ui' && subText == 'UX')
              Stack(
                children: [
                   Container(color: const Color(0xFFFFCC00)),
                   Padding(
                     padding: EdgeInsets.only(left: size * 0.06, top: size * 0.06),
                     child: Text('ui', style: TextStyle(fontSize: size * 0.5, fontWeight: FontWeight.bold, color: Colors.black.withValues(alpha: 0.8), height: 1)),
                   ),
                   Positioned(
                     bottom: -size * 0.08,
                     right: -size * 0.08,
                     child: Container(
                       padding: EdgeInsets.all(size * 0.13),
                       decoration: const BoxDecoration(color: Color(0xFFE65100), shape: BoxShape.circle),
                       child: Text('UX', style: TextStyle(fontSize: size * 0.26, fontWeight: FontWeight.bold, color: Colors.white)),
                     ),
                   )
                ],
              )
          ], 
           if (type == 'icon') ...[
             Center(child: Icon(icon, color: color, size: size * 0.5)),
          ],
          if (type == 'wordcloud') ...[
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(text ?? '', style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: size * 0.16)),
                   Text('Operating', style: TextStyle(color: color?.withValues(alpha:0.6), fontSize: size * 0.13)),
                   Text('Kernel', style: TextStyle(color: color?.withValues(alpha:0.4), fontSize: size * 0.1)),
                ],
              ),
            ),
          ]
        ],
      ),
    );
  }
}
