import 'package:flutter/foundation.dart';

class StripeConfig {
  static const String _testPublishableKey =
      'pk_test_51NNfmTHA5ahPu1rlyZUaTZSvHlMpLCuolPcNLTMStzyvpnBZXPmjxMlDAH2LaXssJHHcSTF4GrVjA9B1gzQCXUBx00shQypag7';

  static const String _livePublishableKey =
      'pk_live_51NNfmTHA5ahPu1rliKpsbK1mFNpXFefwuP6N48FhHXYAqYgc3CvEBDrNDuBumAF1TSOll4JJk1hPkd0ipMMcCUqX00WJZK06QG';

  static const Map<String, String> _testPriceIds = {
    'premium_monthly': 'price_1OG6oeHA5ahPu1rlAwmHJ5zO',
    'premium_semestral': 'price_1OG5tsHA5ahPu1rlZtgR1sCS',
    'premium_annual': 'price_1SQALJHA5ahPu1rl7kUo9oiy',
    'standard_monthly': 'price_1OG5sBHA5ahPu1rl37Fdo3Lj',
    'standard_semestral': 'price_1OG5vVHA5ahPu1rlbSJynu8G',
    'standard_annual': 'price_1OG5xbHA5ahPu1rlnmH2oTY8',
  };

  static const Map<String, String> _livePriceIds = {
    'premium_monthly': 'price_1OG5oBHA5ahPu1rlkyg1ePfd',
    'premium_semestral': 'price_1OG5tsHA5ahPu1rlZtgR1sCS',
    'premium_annual': 'price_1OG5wnHA5ahPu1rlK1ynEhDR',
    'standard_monthly': 'price_1OG5sBHA5ahPu1rl37Fdo3Lj',
    'standard_semestral': 'price_1OG5vVHA5ahPu1rlbSJynu8G',
    'standard_annual': 'price_1OG5xbHA5ahPu1rlnmH2oTY8',
  };

  static bool get _isTestMode => kDebugMode;

  static String get publishableKey =>
      _isTestMode ? _testPublishableKey : _livePublishableKey;

  static Map<String, String> get priceIds =>
      _isTestMode ? _testPriceIds : _livePriceIds;

  static String get premiumMonthly => priceIds['premium_monthly']!;
  static String get premiumSemestral => priceIds['premium_semestral']!;
  static String get premiumAnnual => priceIds['premium_annual']!;
  static String get standardMonthly => priceIds['standard_monthly']!;
  static String get standardSemestral => priceIds['standard_semestral']!;
  static String get standardAnnual => priceIds['standard_annual']!;
}
