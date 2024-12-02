import 'package:flame/components.dart';
import 'package:flame/layout.dart';
import 'package:flutter/material.dart';

class HudComponent extends PositionComponent {
  @override
  Future<void> onLoad() async {
    super.onLoad();

    // Cria o componente de texto alinhado
    final alignComponent = AlignComponent(
      child: TextComponent(
        text: 'Hello',
        textRenderer: TextPaint(
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
      alignment: Anchor.centerLeft, // Alinhamento do texto
    );

    add(alignComponent);
  }
}
