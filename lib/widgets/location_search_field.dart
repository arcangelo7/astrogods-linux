import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import '../models/location.dart';
import '../services/location_service.dart';
import '../constants/text_styles.dart';

class LocationSearchField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final String? Function(String?)? validator;
  final ValueChanged<PlaceDetails?>? onLocationSelected;
  final String language;

  const LocationSearchField({
    super.key,
    required this.controller,
    required this.labelText,
    this.validator,
    this.onLocationSelected,
    this.language = 'it',
  });

  @override
  State<LocationSearchField> createState() => _LocationSearchFieldState();
}

class _LocationSearchFieldState extends State<LocationSearchField> {
  final LocationService _locationService = LocationService();
  List<PlaceSearchResult> _suggestions = [];
  bool _isSearching = false;
  bool _showSuggestions = false;
  final FocusNode _focusNode = FocusNode();
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_handleFocusChange);
    widget.controller.addListener(_handleTextChange);
  }

  @override
  void dispose() {
    _hideOverlay();
    _locationService.cancelPendingRequests();
    _locationService.dispose();
    widget.controller.removeListener(_handleTextChange);
    _focusNode.removeListener(_handleFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _handleFocusChange() {
    if (_focusNode.hasFocus) {
      _showOverlay();
    } else {
      Future.delayed(const Duration(milliseconds: 200), () {
        if (mounted) {
          _hideOverlay();
        }
      });
    }
  }

  void _handleTextChange() {
    if (!mounted) return;
    
    final text = widget.controller.text;

    if (text.length >= 2) {
      _searchPlaces(text);
    } else {
      if (mounted) {
        setState(() {
          _suggestions = [];
          _showSuggestions = false;
        });
        _updateOverlay();
      }
    }
  }

  Future<void> _searchPlaces(String query) async {
    if (!mounted) return;

    setState(() {
      _isSearching = true;
    });

    try {
      final results = await _locationService.searchPlacesDebounced(
        query,
        language: widget.language,
      );

      if (mounted) {
        setState(() {
          _suggestions = results;
          _showSuggestions = results.isNotEmpty;
          _isSearching = false;
        });
        _updateOverlay();
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _suggestions = [];
          _showSuggestions = false;
          _isSearching = false;
        });
        _updateOverlay();
      }
    }
  }

  Future<void> _selectPlace(PlaceSearchResult place) async {
    _hideOverlay();
    widget.controller.text = place.description;
    _focusNode.unfocus();

    setState(() {
      _showSuggestions = false;
    });

    final details = PlaceDetails(
      placeId: place.placeId,
      name: place.mainText,
      formattedAddress: place.description,
    );

    widget.onLocationSelected?.call(details);
  }

  void _showOverlay() {
    if (_overlayEntry != null) return;

    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
  }

  void _hideOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  void _updateOverlay() {
    if (_overlayEntry != null) {
      _overlayEntry!.markNeedsBuild();
    }
  }

  OverlayEntry _createOverlayEntry() {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;

    return OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0.0, size.height + 4.0),
          child: Material(
            elevation: 8.0,
            borderRadius: BorderRadius.circular(12),
            color: Theme.of(context).colorScheme.surface,
            child: _buildSuggestionsWidget(),
          ),
        ),
      ),
    );
  }

  Widget _buildSuggestionsWidget() {
    if (_isSearching) {
      return Container(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              AppLocalizations.of(context)!.searching,
              style: AppTextStyles.getLocationLoadingStyle(context),
            ),
          ],
        ),
      );
    }

    if (!_showSuggestions || _suggestions.isEmpty) {
      return const SizedBox.shrink();
    }

    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 200),
      child: ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        itemCount: _suggestions.length,
        separatorBuilder: (context, index) => Divider(
          height: 1,
          color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.1),
        ),
        itemBuilder: (context, index) {
          final suggestion = _suggestions[index];
          return ListTile(
            dense: true,
            leading: Icon(
              Icons.location_on_outlined,
              color: Theme.of(context).colorScheme.primary,
              size: 20,
            ),
            title: Text(
              suggestion.mainText,
              style: AppTextStyles.getLocationMainStyle(context),
            ),
            subtitle: suggestion.secondaryText.isNotEmpty
                ? Text(
                    suggestion.secondaryText,
                    style: AppTextStyles.getLocationSecondaryStyle(context),
                  )
                : null,
            onTap: () => _selectPlace(suggestion),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CompositedTransformTarget(
      link: _layerLink,
      child: TextFormField(
        controller: widget.controller,
        focusNode: _focusNode,
        validator: widget.validator,
        style: AppTextStyles.getBodyStyle(context),
        decoration: InputDecoration(
          labelText: widget.labelText,
          labelStyle: AppTextStyles.getFormLabelStyle(context),
          floatingLabelStyle: AppTextStyles.getFormLabelStyle(context),
          suffixIcon: _isSearching
              ? Container(
                  width: 20,
                  height: 20,
                  padding: const EdgeInsets.all(12),
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: theme.colorScheme.primary,
                  ),
                )
              : Icon(
                  Icons.location_on_outlined,
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                  size: 20,
                ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: theme.colorScheme.outline.withValues(alpha: 0.5),
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: theme.colorScheme.primary,
              width: 2,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: theme.colorScheme.error,
              width: 1,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          filled: true,
          fillColor: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
        ),
      ),
    );
  }
}
