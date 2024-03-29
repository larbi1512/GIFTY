import 'package:flutter/material.dart';
import 'package:gifty/config/colors.config.dart';

class TagsInput extends StatefulWidget {
  @override
  _TagsInputState createState() => _TagsInputState();
}

class _TagsInputState extends State<TagsInput> {
  final TextEditingController _controller = TextEditingController();
  List<String> _tags = [];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Wrap(
            spacing: 8.0,
            runSpacing: 4.0,
            children: _tags.map((tag) {
              return Chip(
                label: Text(tag),
                onDeleted: () {
                  _removeTag(tag);
                },
              );
            }).toList(),
          ),
          SizedBox(height: 10),
          TextField(
            controller: _controller,
            onSubmitted: (value) {
              _addTag(value);
            },
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.tag,
                color: AppColor.main,
              ),
              hintText: 'Add tags',
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: AppColor.main),
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
            ),
          ),
        ],
      ),
    );
  }

  void _addTag(String tag) {
    if (tag.isNotEmpty && !_tags.contains(tag)) {
      setState(() {
        _tags.add(tag);
        _controller.clear();
      });
    }
  }

  void _removeTag(String tag) {
    setState(() {
      _tags.remove(tag);
    });
  }
}
