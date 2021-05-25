import 'package:flutter/material.dart';
import '../widgets/drawer_widget.dart';

class Filter extends StatefulWidget {
  static const routeName = '/fitler';

  final Function saveFilter;
  final Map<String, bool> currfilter;

  Filter(this.currfilter, this.saveFilter);

  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currfilter['gluten'];
    _vegetarian = widget.currfilter['vegetarian'];
    _lactoseFree = widget.currfilter['lactose'];
    _vegan = widget.currfilter['vegan'];
    super.initState();
  }

  Widget buildSwitch(
    String text,
    String subtext,
    bool val,
    Function updateVal,
  ) {
    return SwitchListTile(
      title: Text(text),
      value: val,
      subtitle: Text(subtext),
      onChanged: updateVal,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter'),
        actions: [
          IconButton(
            icon: Icon(Icons.done_all),
            onPressed: () {
              final selectedFilter = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegetarian': _vegetarian,
                'vegan': _vegan,
              };
              widget.saveFilter(selectedFilter);
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
        ],
      ),
      drawer: DrawerWidget(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your food selection',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitch(
                  'Gluten-free',
                  'Only include Gluten-free foods',
                  _glutenFree,
                  (newVal) {
                    setState(() {
                      _glutenFree = newVal;
                    });
                  },
                ),
                buildSwitch(
                  'Lactos-free',
                  'Only include Lactos-free foods',
                  _lactoseFree,
                  (newVal) {
                    setState(() {
                      _lactoseFree = newVal;
                    });
                  },
                ),
                buildSwitch(
                  'Vegetarian',
                  'Only include Vegetarian foods',
                  _vegetarian,
                  (newVal) {
                    setState(() {
                      _vegetarian = newVal;
                    });
                  },
                ),
                buildSwitch(
                  'Vegan',
                  'Only include Vegan foods',
                  _vegan,
                  (newVal) {
                    setState(() {
                      _vegan = newVal;
                    });
                    _vegan = newVal;
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
