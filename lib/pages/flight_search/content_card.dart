import 'package:animations/pages/flight_search/multicity_input.dart';
import 'package:animations/pages/flight_search/price_tab.dart';
import 'package:flutter/material.dart';

class ContentCard extends StatelessWidget {
  const ContentCard({
    @required this.showInput,
    @required this.onCompleted,
  });

  final bool showInput;
  final void Function() onCompleted;

  static const _tabs = <Tab>[
    Tab(text: 'Flight'),
    Tab(text: 'Train'),
    Tab(text: 'Bus'),
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
                children: _tabs.map((_) => _buildTabContent()).toList(),
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

  Widget _buildTabContent() {
    return AnimatedSwitcher(
      child: SizedBox.expand(
        child: showInput
            ? SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: const MulticityInput(),
              )
            : PriceTab(onCompleted: onCompleted),
      ),
      duration: const Duration(milliseconds: 200),
    );
  }
}
