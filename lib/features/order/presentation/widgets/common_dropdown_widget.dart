import 'package:bardix/core/app_constants/app_repo_assets.dart';
import 'package:bardix/core/theme/app_repo_text_style.dart';
import 'package:bardix/core/utils/size_utils.dart';
import 'package:bardix/core/widgets/common_image_widget.dart';
import 'package:bardix/core/widgets/common_text.dart';
import 'package:flutter/material.dart';

class CommonDropdownWidget<T> extends StatefulWidget {
  final T? value;
  final List<T> items;
  final String hintText;
  final String prefixImage;
  final ValueChanged<T?>? onChanged;
  final bool isExpanded;

  const CommonDropdownWidget({
    super.key,
    required this.value,
    required this.items,
    required this.hintText,
    required this.prefixImage,
    required this.onChanged,
    this.isExpanded = true,
  });

  @override
  State<CommonDropdownWidget<T>> createState() =>
      _CommonDropdownWidgetState<T>();
}

class _CommonDropdownWidgetState<T> extends State<CommonDropdownWidget<T>>
    with SingleTickerProviderStateMixin {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  bool _isDropdownOpen = false;
  T? _selectedValue;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.value;
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleDropdown() =>
      _isDropdownOpen ? _closeDropdown() : _openDropdown();

  void _openDropdown() {
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
    _animationController.forward();
    setState(() => _isDropdownOpen = true);
  }

  void _closeDropdown() => _animationController.reverse().then((_) {
      _overlayEntry?.remove();
      _overlayEntry = null;
      setState(() => _isDropdownOpen = false);
    });

  void _onItemSelected(T item) {
    setState(() {
      _selectedValue = item;
    });
    widget.onChanged?.call(item);
    _closeDropdown();
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;
    var position = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder:
          (context) => GestureDetector(
            onTap: _closeDropdown,
            behavior: HitTestBehavior.translucent,
            child: Stack(
              children: [
                Positioned(
                  width: size.width,
                  left: position.dx,
                  top: position.dy + size.height + 4.convertPxToDp(),
                  child: Material(
                    elevation: 8,
                    borderRadius: BorderRadius.circular(12.convertPxToDp()),
                    color: Theme.of(context).cardColor,
                    child: FadeTransition(
                      opacity: _animationController,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: 220.convertPxToDp(),
                        ),
                        child: ListView.separated(
                          padding: EdgeInsets.zero,
                          itemCount: widget.items.length,
                          shrinkWrap: true,
                          separatorBuilder:
                              (_, __) => Divider(
                                height: 1,
                                color: Theme.of(context).dividerColor,
                              ),
                          itemBuilder: (context, index) {
                            final item = widget.items[index];
                            bool isSelected = item == _selectedValue;
                            return InkWell(
                              onTap: () => _onItemSelected(item),
                              splashColor: Theme.of(context).highlightColor,
                              hoverColor: Theme.of(context).hoverColor,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 14.convertPxToDp(),
                                  horizontal: 12.convertPxToDp(),
                                ),
                                decoration: BoxDecoration(
                                  color:
                                      isSelected
                                          ? Theme.of(context).highlightColor
                                              .withValues(alpha: 0.1)
                                          : Colors.transparent,
                                  borderRadius: BorderRadius.vertical(
                                    top:
                                        index == 0
                                            ? Radius.circular(
                                              12.convertPxToDp(),
                                            )
                                            : Radius.zero,
                                    bottom:
                                        index == widget.items.length - 1
                                            ? Radius.circular(
                                              12.convertPxToDp(),
                                            )
                                            : Radius.zero,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: CommonText(
                                        text: item.toString(),
                                        textStyle: AppRepoTextStyle()
                                            .textStyleLabelLarge(context),
                                      ),
                                    ),
                                    if (isSelected)
                                      Icon(
                                        Icons.check,
                                        color: Theme.of(context).primaryColor,
                                        size: 20.convertPxToDp(),
                                      ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) => CompositedTransformTarget(
    link: _layerLink,
    child: GestureDetector(
      onTap: _toggleDropdown,
      child: InputDecorator(
        decoration: InputDecoration(
          filled: true,
          fillColor: Theme.of(context).scaffoldBackgroundColor,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 14.convertPxToDp(),
            vertical: 16.convertPxToDp(),
          ),
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.convertPxToDp()),
            child: CommonSVGImageProvider(
              imagePath: widget.prefixImage,
              width: 24.convertPxToDp(),
              height: 24.convertPxToDp(),
              colorFilter:
                  _selectedValue == null
                      ? ColorFilter.mode(
                        Theme.of(context).hintColor,
                        BlendMode.srcIn,
                      )
                      : null,
            ),
          ),
          suffixIcon: RotationTransition(
            turns: Tween(begin: 0.0, end: 0.5).animate(_animationController),
            child: CommonSVGImageProvider(
              imagePath: AppRepoAssets().dropdownArrowImage,
              width: 24.convertPxToDp(),
              boxFit: BoxFit.scaleDown,
            ),
          ),
          hintText: widget.hintText,
          hintStyle: AppRepoTextStyle().textStyleLabelLarge(context),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.convertPxToDp()),
            borderSide: BorderSide(color: Theme.of(context).dividerColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.convertPxToDp()),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 2.convertPxToDp(),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.convertPxToDp()),
            borderSide: BorderSide(color: Theme.of(context).dividerColor),
          ),
        ),
        child: CommonText(
          text: _selectedValue?.toString() ?? widget.hintText,
          textStyle: AppRepoTextStyle().textStyleLabelLarge(context),
        ),
      ),
    ),
  );
}
