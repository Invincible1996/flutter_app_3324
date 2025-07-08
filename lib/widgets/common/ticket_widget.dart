import 'package:flutter/material.dart';

class TicketWidget extends StatelessWidget {
  final Widget child;
  final Color color;
  final double height;
  final double? width;
  final EdgeInsetsGeometry padding;
  final double cutoutPosition;
  final bool hasBorder;
  final Color borderColor;
  final double borderWidth;
  final bool hasShadow;

  const TicketWidget({
    super.key,
    required this.child,
    this.color = const Color(
      0xFFEBF3FF,
    ), // A light blue color like in the image
    this.height = 200,
    this.width,
    this.padding = const EdgeInsets.all(24.0),
    this.cutoutPosition = 80.0,
    this.hasBorder = false,
    this.borderColor = Colors.grey,
    this.borderWidth = 1.0,
    this.hasShadow = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: CustomPaint(
        painter: _TicketPainter(
          color: color,
          cutoutPosition: cutoutPosition,
          hasBorder: hasBorder,
          borderColor: borderColor,
          borderWidth: borderWidth,
          hasShadow: hasShadow,
        ),
        child: Padding(padding: padding, child: child),
      ),
    );
  }
}

class _TicketPainter extends CustomPainter {
  final Color color;
  final double cutoutPosition;
  final bool hasBorder;
  final Color borderColor;
  final double borderWidth;
  final bool hasShadow;

  _TicketPainter({
    required this.color,
    required this.cutoutPosition,
    required this.hasBorder,
    required this.borderColor,
    required this.borderWidth,
    required this.hasShadow,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final path = _getPath(size);

    if (hasShadow) {
      final shadowPaint = Paint()
        ..color = Colors.black.withOpacity(0.1)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10);
      canvas.drawPath(path, shadowPaint);
    }

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    canvas.drawPath(path, paint);

    if (hasBorder) {
      final borderPaint = Paint()
        ..color = borderColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = borderWidth;
      canvas.drawPath(path, borderPaint);
    }
  }

  Path _getPath(Size size) {
    final path = Path();
    const cornerRadius = 20.0;
    const cutoutRadius = 8.0;
    final cutoutPositionX = cutoutPosition;

    // Start from top-left corner after the radius
    path.moveTo(cornerRadius, 0);

    // Top edge before cutout
    path.lineTo(cutoutPositionX - cutoutRadius, 0);
    // Top cutout
    path.arcToPoint(
      Offset(cutoutPositionX + cutoutRadius, 0),
      radius: const Radius.circular(cutoutRadius),
      clockwise: false,
    );
    // Top edge after cutout
    path.lineTo(size.width - cornerRadius, 0);

    // Top-right corner
    path.arcToPoint(
      Offset(size.width, cornerRadius),
      radius: const Radius.circular(cornerRadius),
      clockwise: true,
    );

    // Right edge
    path.lineTo(size.width, size.height - cornerRadius);

    // Bottom-right corner
    path.arcToPoint(
      Offset(size.width - cornerRadius, size.height),
      radius: const Radius.circular(cornerRadius),
      clockwise: true,
    );

    // Bottom edge before cutout
    path.lineTo(cutoutPositionX + cutoutRadius, size.height);
    // Bottom cutout
    path.arcToPoint(
      Offset(cutoutPositionX - cutoutRadius, size.height),
      radius: const Radius.circular(cutoutRadius),
      clockwise: false,
    );
    // Bottom edge after cutout
    path.lineTo(cornerRadius, size.height);

    // Bottom-left corner
    path.arcToPoint(
      Offset(0, size.height - cornerRadius),
      radius: const Radius.circular(cornerRadius),
      clockwise: true,
    );

    // Left edge
    path.lineTo(0, cornerRadius);

    // Top-left corner
    path.arcToPoint(
      const Offset(cornerRadius, 0),
      radius: const Radius.circular(cornerRadius),
      clockwise: true,
    );

    path.close();
    return path;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate is! _TicketPainter ||
        oldDelegate.color != color ||
        oldDelegate.cutoutPosition != cutoutPosition ||
        oldDelegate.hasBorder != hasBorder ||
        oldDelegate.borderColor != borderColor ||
        oldDelegate.borderWidth != borderWidth ||
        oldDelegate.hasShadow != hasShadow;
  }
}
