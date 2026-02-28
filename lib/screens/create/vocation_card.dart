
import 'package:character_game/models/vocation.dart';
import 'package:character_game/shared/styled_text.dart';
import 'package:character_game/theme.dart';
import 'package:flutter/material.dart';

class VocationCard extends StatelessWidget {
  const VocationCard({
    super.key,
    required this.vocation,
    required this.onTap,
    required this.selected
  });

  final Vocation vocation;
  final void Function(Vocation) onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(vocation);
      },
      child: Card(
        color: selected ? AppColor.secondaryColor : Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
      
              //image of vocation
              Image.asset('assets/img/vocations/${vocation.image}',
                width: 80,
                colorBlendMode: BlendMode.color,
                color: !selected ? Colors.black.withOpacity(0.8) : Colors.transparent ,
              ),
              SizedBox(width: 10,),
      
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StyledHeadline(vocation.title),
                    StyledText(vocation.description),
                  ],
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}