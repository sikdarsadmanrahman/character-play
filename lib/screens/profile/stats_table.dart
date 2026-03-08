import 'package:character_game/models/character.dart';
import 'package:character_game/shared/styled_text.dart';
import 'package:character_game/theme.dart';
import 'package:flutter/material.dart';

class StatsTable extends StatefulWidget {
  const StatsTable(
    this.character,
    {super.key}
  );

  final Character character;

  @override
  State<StatsTable> createState() => _StatsTableState();
}

class _StatsTableState extends State<StatsTable> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [

          //available points
          Container(
            color: AppColor.secondaryColor,
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Icon(
                  Icons.star,
                  color: widget.character.points > 0 ? Colors.yellow : Colors.grey,
                ),
                const SizedBox(width: 20),
                const StyledText('Stat points available:'),
                const SizedBox(width: 20),
                StyledHeadline(widget.character.points.toString())
              ],
            ),
          ),

          //stats table
          Table(
            children: widget.character.statsAsFormatedList.map((stat){
              return TableRow(
                decoration: BoxDecoration(color: AppColor.secondaryColor.withOpacity(0.5)),
                children: [
                  //stat title
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: StyledHeadline(stat['title']!),
                    )
                  ),

                  //stat value
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: StyledHeadline(stat['value']!),
                  ),

                  // icon to increase stat
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          widget.character.increaseStat(stat['title']!);
                        });
                      }, 
                      icon: Icon(Icons.arrow_upward, color: AppColor.textColor,),
                    )
                  ),


                  // icon to decrease stat
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          widget.character.decreaseStat(stat['title']!);
                        });
                      }, 
                      icon: Icon(Icons.arrow_downward, color: AppColor.textColor,),
                    )
                  ),
                ],
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}