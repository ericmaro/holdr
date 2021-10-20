import 'package:card_app/pages/cards_page/widgets/tag.dart';
import 'package:flutter/material.dart';
import 'package:material_tag_editor/tag_editor.dart';

class TagWidget extends StatefulWidget {
  const TagWidget({
    Key? key,
    required this.tags,
    required this.onChanged,
  }) : super(key: key);

  final List<String> tags;
  final Function(List<String>) onChanged;

  @override
  State<TagWidget> createState() => _TagWidgetState();
}

class _TagWidgetState extends State<TagWidget> {
  List<String> diplayTags = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      diplayTags = widget.tags;
    });
  }

  addTag(String value) {
    setState(() {
      diplayTags.add(value);
      widget.onChanged(diplayTags);
    });
  }

  deleteTag(int i) {
    setState(() {
      diplayTags.removeAt(i);
      widget.onChanged(diplayTags);
    });
  }

  @override
  Widget build(BuildContext context) {
    return TagEditor(
      length: diplayTags.length,
      delimiters: [',', ' '],
      hasAddButton: true,
      inputDecoration: InputDecoration(
        fillColor: Colors.white,
        border: InputBorder.none,
        hintText: 'Add tags to this card...',
      ),
      onTagChanged: (val) {
        addTag(val);
      },
      tagBuilder: (context, index) => Tag(
        index: index,
        label: widget.tags[index],
        onDeleted: (i) => deleteTag(i),
      ),
    );
  }
}
