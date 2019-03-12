import 'package:flutter/material.dart';

class MulticityInput extends StatelessWidget {
  const MulticityInput();

  static const double _rightMargin = 64;
  static const double _rowSpace = 8;
  static const rowSpaceBox = SizedBox(height: _rowSpace);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _buildFrom(),
          rowSpaceBox,
          _buildTo1(),
          rowSpaceBox,
          _buildTo2(),
          rowSpaceBox,
          _buildPassengers(),
          rowSpaceBox,
          _buildDateRow(),
        ],
      ),
    );
  }

  Widget _buildFrom() {
    return Padding(
      padding: const EdgeInsets.only(right: _rightMargin),
      child: _buildTextField(
        icon: Icons.flight_takeoff,
        labelText: 'From',
      ),
    );
  }

  Widget _buildTo1() {
    return Padding(
      padding: const EdgeInsets.only(right: _rightMargin),
      child: _buildTextField(
        icon: Icons.flight_land,
        labelText: 'To',
      ),
    );
  }

  Row _buildTo2() {
    return Row(
      children: [
        Expanded(
          child: _buildTextField(
            icon: Icons.flight_land,
            labelText: 'To',
          ),
        ),
        SizedBox(
          width: _rightMargin,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add_circle_outline,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPassengers() {
    return Padding(
      padding: const EdgeInsets.only(right: _rightMargin),
      child: _buildTextField(
        icon: Icons.person,
        labelText: 'Passengers',
      ),
    );
  }

  Row _buildDateRow() {
    return Row(
      children: [
        Expanded(
          child: _buildTextField(
            icon: Icons.date_range,
            labelText: 'Departure',
          ),
        ),
        Expanded(
          child: _buildTextField(
            labelText: 'Arrival',
          ),
        ),
      ],
    );
  }

  TextFormField _buildTextField({
    @required String labelText,
    IconData icon,
  }) {
    return TextFormField(
      decoration: InputDecoration(
        icon: Icon(
          icon,
          color: Colors.red,
        ),
        labelText: labelText,
      ),
    );
  }
}
