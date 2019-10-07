import 'package:flutter/material.dart';
import 'package:marvel_app/models/items.dart';
import 'package:marvel_app/models/list_label.dart';
import 'package:marvel_app/models/results.dart';
import 'package:marvel_app/modules/detail_module.dart';
import 'package:marvel_app/screens/detail/detail_bloc.dart';
import 'package:marvel_app/widgets/title_listtile.dart';

// ignore: must_be_immutable
class CharacterItemsList extends StatelessWidget {
  Results character;
  Function function;
  CharacterItemsList(this.character, {this.function});

  @override
  Widget build(BuildContext context) {

    List<Items> items = List<Items>();
    items.addAll(character.comics.items);
    items.addAll(character.series.items);
    items.addAll(character.stories.items);
    items.addAll(character.events.items);

    ListLabel firstLabel = ListLabel(0, 'Comics');
    ListLabel secondLabel = ListLabel(character.comics.items.length, 'Series');
    ListLabel thirdLabel = ListLabel(character.series.items.length, 'Stories');
    ListLabel fourthLabel = ListLabel(character.stories.items.length, 'Events');

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {

        if(index == firstLabel.index) {
          return CustomListTile(
            items: items[index],
            label: firstLabel.label,
            function: () => func(items[index].resourceURI),
          );
        }

        if(index == secondLabel.index) {
          return CustomListTile(
            items: items[index],
            label: secondLabel.label,
            function: () => func(items[index].resourceURI),
          );
        }

        if (index == thirdLabel.index) {
          return CustomListTile(
            items: items[index],
            label: thirdLabel.label,
            function: () => func(items[index].resourceURI),
          );
        }

        if (index == fourthLabel.index) {
          return CustomListTile(
            items: items[index],
            label: fourthLabel.label,
            function: () => func(items[index].resourceURI),
          );
        }

        return ListTile(
          title: Text(
            items[index].name,
          ),
          subtitle: Text(
            items[index].resourceURI,
            style: TextStyle(
                decorationStyle: TextDecorationStyle.solid
            ),
          ),
          onTap: () => func(items[index].resourceURI),
        );
      },
    );
  }

  func(url) {
    DetailModule.to.bloc<DetailBloc>().toNextPage(url);
  }

}
