import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../l10n/app_localizations.dart';
import '../models/birth_chart.dart';
import '../models/location.dart';
import '../widgets/mystical_text_field.dart';
import '../widgets/date_picker_field.dart';
import '../widgets/time_picker_field.dart';
import '../widgets/location_search_field.dart';
import '../widgets/unknown_time_checkbox.dart';

class BirthChartFormWidget extends StatefulWidget {
  final BirthChart? initialBirthChart;
  final VoidCallback? onChanged;
  final bool isEditMode;

  const BirthChartFormWidget({
    super.key,
    this.initialBirthChart,
    this.onChanged,
    this.isEditMode = false,
  });

  @override
  State<BirthChartFormWidget> createState() => BirthChartFormWidgetState();
}

// Make the state class public so parent widgets can access the data
class BirthChartFormWidgetState extends State<BirthChartFormWidget> {
  late final TextEditingController _givenNameController;
  late final TextEditingController _familyNameController;
  late final TextEditingController _placeController;
  late final TextEditingController _dateController;
  late final TextEditingController _timeController;

  late DateTime _selectedDate;
  late TimeOfDay? _selectedTime;
  late bool _unknownTime;
  PlaceDetails? _selectedLocation;

  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeControllers();
  }

  void _initializeControllers() {
    final birthChart = widget.initialBirthChart;

    _givenNameController = TextEditingController(
      text: birthChart?.givenName ?? '',
    );
    _familyNameController = TextEditingController(
      text: birthChart?.familyName ?? '',
    );
    _placeController = TextEditingController(
      text: birthChart?.place ?? '',
    );

    _selectedDate = birthChart?.date ?? DateTime.now();
    _unknownTime = birthChart?.unknownTime ?? false;

    if (!_unknownTime && birthChart != null) {
      _selectedTime = TimeOfDay.fromDateTime(birthChart.date);
      _timeController = TextEditingController();
    } else {
      _selectedTime = null;
      _timeController = TextEditingController();
    }

    _dateController = TextEditingController();

    _givenNameController.addListener(_onFieldChanged);
    _familyNameController.addListener(_onFieldChanged);
    _placeController.addListener(_onFieldChanged);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInitialized) {
      _updateControllersWithContext();
      _isInitialized = true;
    }
  }

  void _updateControllersWithContext() {
    _dateController.text = DateFormat.yMMMd(Localizations.localeOf(context).toString()).format(_selectedDate);

    if (_selectedTime != null) {
      _timeController.text = _selectedTime!.format(context);
    }
  }

  void _onFieldChanged() {
    widget.onChanged?.call();
  }

  @override
  void dispose() {
    _givenNameController.dispose();
    _familyNameController.dispose();
    _placeController.dispose();
    _dateController.dispose();
    _timeController.dispose();
    super.dispose();
  }

  void _onDateSelected(DateTime date) {
    setState(() {
      _selectedDate = DateTime(
        date.year,
        date.month,
        date.day,
        _selectedTime?.hour ?? 12,
        _selectedTime?.minute ?? 0,
      );
      _dateController.text = DateFormat.yMMMd(Localizations.localeOf(context).toString()).format(_selectedDate);
    });
    _onFieldChanged();
  }

  void _onTimeSelected(TimeOfDay time) {
    setState(() {
      _selectedTime = time;
      _selectedDate = DateTime(
        _selectedDate.year,
        _selectedDate.month,
        _selectedDate.day,
        time.hour,
        time.minute,
      );
      _timeController.text = time.format(context);
    });
    _onFieldChanged();
  }

  void _onLocationSelected(PlaceDetails? location) {
    setState(() {
      _selectedLocation = location;
    });
    _onFieldChanged();
  }

  void _onUnknownTimeChanged(bool value) {
    setState(() {
      _unknownTime = value;
      if (value) {
        _selectedTime = null;
        _timeController.clear();
      }
    });
    _onFieldChanged();
  }

  String? _validateGivenName(String? value) {
    final l10n = AppLocalizations.of(context)!;
    if (value == null || value.trim().isEmpty) {
      return l10n.givenNameRequired;
    }
    return null;
  }

  String? _validateFamilyName(String? value) {
    final l10n = AppLocalizations.of(context)!;
    if (value == null || value.trim().isEmpty) {
      return l10n.familyNameRequired;
    }
    return null;
  }

  String? _validatePlace(String? value) {
    final l10n = AppLocalizations.of(context)!;
    if (widget.isEditMode) {
      if (_selectedLocation == null && (value == null || value.trim().isEmpty)) {
        return l10n.pleaseSelectBirthPlace;
      }
    } else {
      if (_selectedLocation == null) {
        return l10n.pleaseSelectBirthPlace;
      }
    }
    return null;
  }

  String? _validateLocationSelected() {
    final l10n = AppLocalizations.of(context)!;
    if (widget.isEditMode) {
      if (_selectedLocation == null && _placeController.text.trim().isEmpty) {
        return l10n.pleaseSelectBirthPlace;
      }
    } else {
      if (_selectedLocation == null) {
        return l10n.pleaseSelectBirthPlace;
      }
    }
    return null;
  }

  String? _validateDate(String? value) {
    final l10n = AppLocalizations.of(context)!;
    if (value == null || value.trim().isEmpty) {
      return l10n.pleaseFillAllFields;
    }
    return null;
  }

  String? _validateTime(String? value) {
    final l10n = AppLocalizations.of(context)!;
    if (!_unknownTime && _selectedTime == null) {
      return l10n.birthTimeRequired;
    }
    return null;
  }

  String get givenName => _givenNameController.text.trim();
  String get familyName => _familyNameController.text.trim();
  String get place => _placeController.text.trim();
  DateTime get selectedDate => _selectedDate;
  TimeOfDay? get selectedTime => _selectedTime;
  bool get unknownTime => _unknownTime;
  PlaceDetails? get selectedLocation => _selectedLocation;

  bool isValid() {
    return _validateGivenName(givenName) == null &&
           _validateFamilyName(familyName) == null &&
           _validateLocationSelected() == null &&
           _validateDate(_dateController.text) == null &&
           _validateTime(null) == null;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MysticalTextField(
          controller: _givenNameController,
          labelText: l10n.firstName,
          validator: _validateGivenName,
          keyboardType: TextInputType.name,
        ),
        const SizedBox(height: 16),
        MysticalTextField(
          controller: _familyNameController,
          labelText: l10n.lastName,
          validator: _validateFamilyName,
          keyboardType: TextInputType.name,
        ),
        const SizedBox(height: 16),
        MysticalDatePickerField(
          controller: _dateController,
          selectedDate: _selectedDate,
          labelText: l10n.birthDate,
          onDateSelected: _onDateSelected,
          validator: _validateDate,
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        ),
        const SizedBox(height: 16),
        MysticalTimePickerField(
          controller: _timeController,
          selectedTime: _selectedTime,
          labelText: l10n.birthTime,
          onTimeSelected: _onTimeSelected,
          enabled: !_unknownTime,
          validator: _validateTime,
        ),
        const SizedBox(height: 16),
        UnknownTimeCheckbox(
          value: _unknownTime,
          onChanged: _onUnknownTimeChanged,
        ),
        const SizedBox(height: 16),
        LocationSearchField(
          controller: _placeController,
          labelText: l10n.birthPlace,
          onLocationSelected: _onLocationSelected,
          validator: _validatePlace,
        ),
      ],
    );
  }
}