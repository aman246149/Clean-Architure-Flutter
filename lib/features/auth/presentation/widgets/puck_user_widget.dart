import "package:flutter/material.dart";

import "../../../../core/presentation/widgets/border_textfield.dart";
import "../../../../core/presentation/widgets/custom_container.dart";
import "../../../../core/presentation/widgets/custom_text.dart";


class UserTextField extends StatefulWidget {
  const UserTextField({
    super.key,
    required this.userController,
    required this.updateState,
  });
  final TextEditingController userController;
  final Function() updateState;
  @override
  State<UserTextField> createState() => _UserTextFieldState();
}

class _UserTextFieldState extends State<UserTextField> {
  OverlayEntry? entry;
  final layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  final FocusNode _focusNode = FocusNode();
  GlobalKey globalKey = GlobalKey();
  List<String> searchElemnts = [];
  List<String> suggestons = [
    "USA",
    "UK",
    "Uganda",
    "Uruguay",
    "United Arab Emirates"
  ];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      globalKey;
    });
  }

  void hideOverLay() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  startOverLay() {
    OverlayState? overlayState = Overlay.of(context);

    _overlayEntry = _createOverlay();
    overlayState.insert(_overlayEntry!);
  }

  OverlayEntry _createOverlay() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;

    Future<AlertDialog> alert(String value) async => await showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(content: Text('Funcionou, selecionado: $value')));

    var size = renderBox.size;
    return OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        child: CompositedTransformFollower(
          link: layerLink,
          showWhenUnlinked: false,
          offset: Offset(0.0, size.height),
          child: TextFieldTapRegion(
            child: Material(
              color: const Color(0xff191B1C),
              child: LimitedBox(
                maxHeight: searchElemnts.isEmpty ? 0 : 200,
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: searchElemnts.length,
                  separatorBuilder: (context, index) => const Divider(
                    color: Colors.white,
                  ),
                  itemBuilder: (context, index) {
                    return DecoratedContainer(
                      onTap: () {
                        setState(() {
                          widget.userController.text = suggestons[index];
                          searchElemnts = [];

                          hideOverLay();
                        });
                      },
                      width: double.infinity,
                      margin: EdgeInsets.zero,
                      borderRadius: 0,
                      borderWidth: 0,
                      borderColor: const Color(0xff191B1C),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      containerColor: const Color(0xff191B1C),
                      child: TextWidget(
                        text: suggestons[index],
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // if (_overlayEntry != null) {
    //   _overlayEntry!.remove();
    // }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: layerLink,
      child: DecoratedContainer(
        width: double.infinity,
        margin: EdgeInsets.zero,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        borderColor: const Color(0xffFFEC43),
        borderWidth: 1,
        containerColor: const Color(0xff191B1C),
        child: BorderedTextFormField(
          controller: widget.userController,
          focusNode: _focusNode,
          hintText: "PickUserName",
          onChange: (value) {
            print(searchElemnts.toString());
            searchElemnts = suggestons.where((element) {
              String smallcase = element.toLowerCase();
              return smallcase.contains(value.toString().toLowerCase());
            }).toList();
            if (value.toString().isEmpty) {
              searchElemnts = [];
            }
            startOverLay();
            widget.updateState();
          },
        ),
      ),
    );
  }
}
