import 'package:flutter/material.dart';

typedef OnSelectedItem<OpsiDropDown> = void Function(OpsiDropDown item);

class DropDownWidget extends StatefulWidget {
  final String? initial;
  final List<OpsiDropDown> opsi;
  final Widget? prefix;
  final String hint;
  final OnSelectedItem<OpsiDropDown>? onSelectedItem;
  final FormFieldValidator<String>? validator;

  const DropDownWidget({
    required this.opsi,
    this.initial,
    this.validator,
    Key? key,
    @required this.onSelectedItem,
    this.prefix, this.hint = "Pilih Opsi"
  }) : super(key: key);

  @override
  _DropDownWidget createState() => _DropDownWidget();
}

class _DropDownWidget extends State<DropDownWidget> {

  List<DropdownMenuItem<String>>? _dropDownOpsi;
  String? _dropOpsi;

  _getListOpsi() async {

    if(widget.initial != null && widget.initial != 'null' && widget.initial!.isNotEmpty){
      _dropOpsi = widget.initial;
    }

    setState(() {
      _dropDownOpsi =  getDropDownOpsiItems();
    });
  }
  List<DropdownMenuItem<String>> getDropDownOpsiItems() {
    List<DropdownMenuItem<String>> items = [];
    for (int i = 0; i < widget.opsi.length; i++) {
      items.add(DropdownMenuItem(value: widget.opsi[i].id.toString(),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 1, top: 2),
            child: Text('${widget.opsi[i].name}'),
          )));
    }



    return items;
  }
  void _selectedOpsi(String selected) {
    if (selected != null || selected != '') {
      setState(() {
        var selectedOpsi = OpsiDropDown(
            id: selected,
            name: widget.opsi.where((element) => element.id == selected).first.name
        );
        _dropOpsi = selected;
        widget.onSelectedItem!(selectedOpsi);
      });
    }
  }

  @override
  void initState() {
    _getListOpsi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButtonFormField<String>(
        isExpanded: true,
        value: _dropOpsi,
        items: _dropDownOpsi,
        validator: widget.validator,
        onChanged: (val){
          _selectedOpsi(val!);
        },
        decoration: InputDecoration(
          // border: InputBorder.none,
          prefixIcon: widget.prefix,
          contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).primaryColor),
              borderRadius: const BorderRadius.all(Radius.circular(10))
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          hintText: widget.hint,
        ),
        hint: Text(widget.hint),

      ),
    );
  }

}

class OpsiDropDown {
  String? id;
  String? name;

  OpsiDropDown({this.id, this.name});
}