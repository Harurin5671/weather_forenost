import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:interview_flutter/widgets/widgets.dart';
import 'package:interview_flutter/providers/providers.dart';

class ListContent extends StatelessWidget {
  const ListContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ListProvider>();

    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      itemCount: chatProvider.list.length,
      itemBuilder: (BuildContext context, int index) {
        return CustomListTile(itemList: chatProvider.list[index]);
      },
      separatorBuilder: (_, __) => const SizedBox(height: 20),
    );
  }
}
