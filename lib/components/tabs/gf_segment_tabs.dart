import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:ui_kit/colors/gf_color.dart';
import 'package:ui_kit/components/tabs/gf_tabBarView.dart';


class GFSegmentTabs extends StatefulWidget {
  GFSegmentTabs({
    Key key,
    this.initialIndex = 0,
    @required this.length,
    this.height,
    this.width,
    this.border,
    this.borderRadius,
    this.tabBarColor,
    this.indicatorColor,
    this.indicatorWeight = 2.0,
    this.indicatorPadding = EdgeInsets.zero,
    this.indicator,
    this.indicatorSize,
    this.labelColor,
    this.labelStyle,
    this.labelPadding,
    this.unselectedLabelColor,
    this.unselectedLabelStyle,
    this.tabBarView,
    this.tabs,
    this.tabController
  }):
        assert(length != null && length >= 0),
        assert(initialIndex != null && initialIndex >= 0 && (length == 0 || initialIndex < length));

  /// The initial index of the selected tab. Defaults to zero.
  final int initialIndex;

  /// The total number of tabs. Typically greater than one. Must match [TabBar.tabs]'s and
  /// [TabBarView.children]'s length.
  final int length;

  /// Sets [GFSegmentTabs] height
  final double height;

  /// Sets [TabBar] color using material color [Color]
  final Color tabBarColor;

  /// The color of the line that appears below the selected tab.
  ///
  /// If this parameter is null, then the value of the Theme's indicatorColor
  /// property is used.
  ///
  /// If [indicator] is specified, this property is ignored.
  final Color indicatorColor;

  /// The thickness of the line that appears below the selected tab.
  ///
  /// The value of this parameter must be greater than zero and its default
  /// value is 2.0.
  ///
  /// If [indicator] is specified, this property is ignored.
  final double indicatorWeight;

  /// The horizontal padding for the line that appears below the selected tab.
  ///
  /// For [isScrollable] tab bars, specifying [kTabLabelPadding] will align
  /// the indicator with the tab's text for [Tab] widgets and all but the
  /// shortest [Tab.text] values.
  ///
  /// The [EdgeInsets.top] and [EdgeInsets.bottom] values of the
  /// [indicatorPadding] are ignored.
  ///
  /// The default value of [indicatorPadding] is [EdgeInsets.zero].
  ///
  /// If [indicator] is specified, this property is ignored.
  final EdgeInsetsGeometry indicatorPadding;

  /// Defines the appearance of the selected tab indicator.
  ///
  /// If [indicator] is specified, the [indicatorColor], [indicatorWeight],
  /// and [indicatorPadding] properties are ignored.
  ///
  /// The default, underline-style, selected tab indicator can be defined with
  /// [UnderlineTabIndicator].
  ///
  /// The indicator's size is based on the tab's bounds. If [indicatorSize]
  /// is [TabBarIndicatorSize.tab] the tab's bounds are as wide as the space
  /// occupied by the tab in the tab bar. If [indicatorSize] is
  /// [TabBarIndicatorSize.label], then the tab's bounds are only as wide as
  /// the tab widget itself.
  final Decoration indicator;

  /// Defines how the selected tab indicator's size is computed.
  ///
  /// The size of the selected tab indicator is defined relative to the
  /// tab's overall bounds if [indicatorSize] is [TabBarIndicatorSize.tab]
  /// (the default) or relative to the bounds of the tab's widget if
  /// [indicatorSize] is [TabBarIndicatorSize.label].
  ///
  /// The selected tab's location appearance can be refined further with
  /// the [indicatorColor], [indicatorWeight], [indicatorPadding], and
  /// [indicator] properties.
  final TabBarIndicatorSize indicatorSize;

  /// The color of selected tab labels.
  ///
  /// Unselected tab labels are rendered with the same color rendered at 70%
  /// opacity unless [unselectedLabelColor] is non-null.
  ///
  /// If this parameter is null, then the color of the [ThemeData.primaryTextTheme]'s
  /// body2 text color is used.
  final Color labelColor;

  /// The color of unselected tab labels.
  ///
  /// If this property is null, unselected tab labels are rendered with the
  /// [labelColor] with 70% opacity.
  final Color unselectedLabelColor;

  /// The text style of the selected tab labels.
  ///
  /// If [unselectedLabelStyle] is null, then this text style will be used for
  /// both selected and unselected label styles.
  ///
  /// If this property is null, then the text style of the
  /// [ThemeData.primaryTextTheme]'s body2 definition is used.
  final TextStyle labelStyle;

  /// The padding added to each of the tab labels.
  ///
  /// If this property is null, then kTabLabelPadding is used.
  final EdgeInsetsGeometry labelPadding;

  /// The text style of the unselected tab labels
  ///
  /// If this property is null, then the [labelStyle] value is used. If [labelStyle]
  /// is null, then the text style of the [ThemeData.primaryTextTheme]'s
  /// body2 definition is used.
  final TextStyle unselectedLabelStyle;

  /// One widget per tab.
  /// Its length must match the length of the [GFSegmentTabs.tabs]
  /// list, as well as the [controller]'s [GFSegmentTabs.length].
  final GFTabBarView tabBarView;

  /// Typically a list of two or more [Tab] widgets.
  ///
  /// The length of this list must match the [controller]'s [TabController.length]
  /// and the length of the [TabBarView.children] list.
  final List<Widget> tabs;

  final Border border;
  final BorderRadius borderRadius;
  final TabController tabController;
  final double width;

  @override
  _GFSegmentTabsState createState() => _GFSegmentTabsState();
}

class _GFSegmentTabsState extends State<GFSegmentTabs> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height == null ? 28.0 : widget.height,
      width: widget.width == null ? 240.0 : widget.width,
      decoration: BoxDecoration(
        border: widget.border == null ? Border.all(color: getGFColor(GFColor.primary), width:1.0) : widget.border,
        borderRadius: widget.borderRadius == null ? BorderRadius.circular(2.0) : widget.borderRadius,
      ),
      child: DefaultTabController(
        initialIndex: widget.initialIndex,
        length: widget.length,
        child: Material(
          borderRadius: widget.borderRadius == null ? BorderRadius.circular(2.0) : widget.borderRadius,
          type: MaterialType.button,
          color: widget.tabBarColor ?? Colors.transparent,
          child: TabBar(
            controller: widget.tabController,
            labelColor: widget.labelColor ?? getGFColor(GFColor.white),
            unselectedLabelColor: widget.unselectedLabelColor ?? getGFColor(GFColor.primary),
            labelStyle: widget.labelStyle ?? TextStyle(fontSize: 12.0),
            unselectedLabelStyle: widget.unselectedLabelStyle ?? TextStyle(fontSize: 12.0),
            indicatorColor: widget.indicatorColor == null ? getGFColor(GFColor.primary) : widget.indicatorColor,
            indicatorSize: widget.indicatorSize,
            indicator: widget.indicator == null ?
              BoxDecoration(
                color: widget.indicatorColor == null ? getGFColor(GFColor.primary) : widget.indicatorColor,
                border: Border.all(color: widget.indicatorColor == null ? Colors.transparent : widget.indicatorColor, width: 2.0),
                borderRadius: widget.borderRadius == null ? BorderRadius.circular(0.0) : widget.borderRadius,
              ) : widget.indicator,
            indicatorPadding: widget.indicatorPadding,
            indicatorWeight: widget.indicatorWeight,
            tabs: widget.tabs,
          ),
        ),
      ),
    );
  }
}
















