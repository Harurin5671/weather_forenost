import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:interview_flutter/widgets/widgets.dart';
import 'package:interview_flutter/providers/providers.dart';

class BodyContent extends StatelessWidget {
  const BodyContent({
    super.key,
    required this.idx,
  });

  final int idx;

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ListProvider>();

    return Stack(
      children: [
        if (idx == 2 && chatProvider.list.isNotEmpty)
          const ListContent()
        else
          const NotFoundWidget(),
        if (idx == 2)
          Positioned(
            bottom: 30,
            right: 20,
            child: FloatingActionButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => const CustomDropDownDialog(),
                );
              },
              child: Container(
                height: 56,
                width: 56,
                decoration: BoxDecoration(
                color: const Color(0xff0086FF),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 50,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
