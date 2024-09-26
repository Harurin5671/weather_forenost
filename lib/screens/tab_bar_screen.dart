import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:interview_flutter/widgets/widgets.dart';
import 'package:interview_flutter/providers/providers.dart';

class TabBarCustom extends StatefulWidget {
  const TabBarCustom({
    super.key,
  });

  @override
  State<TabBarCustom> createState() => _TabBarCustomState();
}

class _TabBarCustomState extends State<TabBarCustom>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ListProvider>();
    return Column(
      children: [
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: const [
              BodyContent(idx: 1),
              BodyContent(idx: 2),
              BodyContent(idx: 3),
            ],
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                  height: 1,
                  color: const Color(0xff5E5D5D),
                ),
            TabBar(
              controller: _tabController,
              labelColor: Colors.blue,
              indicatorColor: Colors.transparent,
              tabs: [
                Tab(
                  icon: Image.asset(
                    'assets/images/tabs/home.png',
                    color: chatProvider.index == 0
                        ? const Color(0xff0086FF)
                        : const Color(0xff5E5D5D),
                  ),
                ),
                Tab(
                  icon: Image.asset(
                    'assets/images/tabs/location_on.png',
                    color: chatProvider.index == 1
                        ? const Color(0xff0086FF)
                        : const Color(0xff5E5D5D),
                  ),
                ),
                Tab(
                  icon: Image.asset(
                    'assets/images/tabs/person.png',
                    color: chatProvider.index == 2
                        ? const Color(0xff0086FF)
                        : const Color(0xff5E5D5D),
                  ),
                ),
              ],
              onTap: (value) => {
                chatProvider.updateIndex(value),
              },
            ),
          ],
        ),
      ],
    );
  }
}
