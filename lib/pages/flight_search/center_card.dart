import 'package:flutter/material.dart';

class ContentCard extends StatelessWidget {
  final _tabs = <Tab>[
    const Tab(text: 'Flight'),
    const Tab(text: 'Train'),
    const Tab(text: 'Bus'),
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(8),
      child: DefaultTabController(
        length: _tabs.length,
        child: Column(
          children: [
            _buildTabBar(),
            Expanded(
              child: TabBarView(
                children: _tabs.map((_) => _buildContentContainer()).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabBar({bool showFirstOption}) {
    return Stack(
      children: [
        Positioned.fill(
          top: null,
          child: Container(
            height: 2,
            color: const Color(0xFFEEEEEE),
          ),
        ),
        TabBar(
          tabs: _tabs,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
        ),
      ],
    );
  }

  Widget _buildContentContainer() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child: IntrinsicHeight(
              child: _buildMulticityTab(),
            ),
          ),
        );
      },
    );
  }

  Widget _buildMulticityTab() {
    return Column(
      children: [
        const Text('Inputs'), //TODO: Add MultiCity input
        const Expanded(child: SizedBox()),
      ],
    );
  }
}
