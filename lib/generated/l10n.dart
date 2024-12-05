// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `My Points`
  String get my_points {
    return Intl.message(
      'My Points',
      name: 'my_points',
      desc: '',
      args: [],
    );
  }

  /// `My Orders`
  String get my_orders {
    return Intl.message(
      'My Orders',
      name: 'my_orders',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `My Addresses`
  String get my_addresses {
    return Intl.message(
      'My Addresses',
      name: 'my_addresses',
      desc: '',
      args: [],
    );
  }

  /// `About Saudi Plus`
  String get about_saudi_plus {
    return Intl.message(
      'About Saudi Plus',
      name: 'about_saudi_plus',
      desc: '',
      args: [],
    );
  }

  /// `Technical Support`
  String get technical_support {
    return Intl.message(
      'Technical Support',
      name: 'technical_support',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get contact_us {
    return Intl.message(
      'Contact Us',
      name: 'contact_us',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get arabic {
    return Intl.message(
      'Arabic',
      name: 'arabic',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Search for offers`
  String get search_for_offers {
    return Intl.message(
      'Search for offers',
      name: 'search_for_offers',
      desc: '',
      args: [],
    );
  }

  /// `Explore Categories`
  String get explore_sections {
    return Intl.message(
      'Explore Categories',
      name: 'explore_sections',
      desc: '',
      args: [],
    );
  }

  /// `Car Services`
  String get car_services {
    return Intl.message(
      'Car Services',
      name: 'car_services',
      desc: '',
      args: [],
    );
  }

  /// `Shopping Stores`
  String get shopping_stores {
    return Intl.message(
      'Shopping Stores',
      name: 'shopping_stores',
      desc: '',
      args: [],
    );
  }

  /// `Health Services`
  String get health_services {
    return Intl.message(
      'Health Services',
      name: 'health_services',
      desc: '',
      args: [],
    );
  }

  /// `Beauty Care`
  String get beauty_care {
    return Intl.message(
      'Beauty Care',
      name: 'beauty_care',
      desc: '',
      args: [],
    );
  }

  /// `Restaurants and Cafes`
  String get restaurants_and_cafes {
    return Intl.message(
      'Restaurants and Cafes',
      name: 'restaurants_and_cafes',
      desc: '',
      args: [],
    );
  }

  /// `Travel and Tourism`
  String get travel_and_tourism {
    return Intl.message(
      'Travel and Tourism',
      name: 'travel_and_tourism',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get categories {
    return Intl.message(
      'Categories',
      name: 'categories',
      desc: '',
      args: [],
    );
  }

  /// `Scan`
  String get scan {
    return Intl.message(
      'Scan',
      name: 'scan',
      desc: '',
      args: [],
    );
  }

  /// `Map`
  String get map {
    return Intl.message(
      'Map',
      name: 'map',
      desc: '',
      args: [],
    );
  }

  /// `Jeddah`
  String get jeddah {
    return Intl.message(
      'Jeddah',
      name: 'jeddah',
      desc: '',
      args: [],
    );
  }

  /// `Select the region`
  String get select_region {
    return Intl.message(
      'Select the region',
      name: 'select_region',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get username {
    return Intl.message(
      'Username',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Hello`
  String get hello {
    return Intl.message(
      'Hello',
      name: 'hello',
      desc: '',
      args: [],
    );
  }

  /// `To help you determine your region and suggest better options for your needs.`
  String get to_determine_region {
    return Intl.message(
      'To help you determine your region and suggest better options for your needs.',
      name: 'to_determine_region',
      desc: '',
      args: [],
    );
  }

  /// `I agree to the Terms of Use and Conditions`
  String get agree_terms {
    return Intl.message(
      'I agree to the Terms of Use and Conditions',
      name: 'agree_terms',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Enable Location`
  String get enable_location {
    return Intl.message(
      'Enable Location',
      name: 'enable_location',
      desc: '',
      args: [],
    );
  }

  /// `Why do we recommend enabling location?`
  String get why_enable_location {
    return Intl.message(
      'Why do we recommend enabling location?',
      name: 'why_enable_location',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `This text is an example of a text that can be replaced.`
  String get sample_text {
    return Intl.message(
      'This text is an example of a text that can be replaced.',
      name: 'sample_text',
      desc: '',
      args: [],
    );
  }

  /// `Riyadh`
  String get region_riyadh {
    return Intl.message(
      'Riyadh',
      name: 'region_riyadh',
      desc: '',
      args: [],
    );
  }

  /// `Dammam`
  String get region_dammam {
    return Intl.message(
      'Dammam',
      name: 'region_dammam',
      desc: '',
      args: [],
    );
  }

  /// `Terms and Conditions`
  String get terms_and_conditions {
    return Intl.message(
      'Terms and Conditions',
      name: 'terms_and_conditions',
      desc: '',
      args: [],
    );
  }

  /// `This text is an example of a text that can be replaced within the same space.`
  String get condition_1 {
    return Intl.message(
      'This text is an example of a text that can be replaced within the same space.',
      name: 'condition_1',
      desc: '',
      args: [],
    );
  }

  /// `This text is an example of a text that can be replaced within the same space.`
  String get condition_2 {
    return Intl.message(
      'This text is an example of a text that can be replaced within the same space.',
      name: 'condition_2',
      desc: '',
      args: [],
    );
  }

  /// `This text is an example of a text that can be replaced within the same space.`
  String get condition_3 {
    return Intl.message(
      'This text is an example of a text that can be replaced within the same space.',
      name: 'condition_3',
      desc: '',
      args: [],
    );
  }

  /// `This text is an example of a text that can be replaced within the same space.`
  String get condition_4 {
    return Intl.message(
      'This text is an example of a text that can be replaced within the same space.',
      name: 'condition_4',
      desc: '',
      args: [],
    );
  }

  /// `This text is an example of a text that can be replaced within the same space.`
  String get condition_5 {
    return Intl.message(
      'This text is an example of a text that can be replaced within the same space.',
      name: 'condition_5',
      desc: '',
      args: [],
    );
  }

  /// `I agree to the terms of use and conditions`
  String get i_agree_to_terms {
    return Intl.message(
      'I agree to the terms of use and conditions',
      name: 'i_agree_to_terms',
      desc: '',
      args: [],
    );
  }

  /// `This text is an example of a text that can be replaced within the same space. This text has been generated by the Arabic text generator.`
  String get example_text {
    return Intl.message(
      'This text is an example of a text that can be replaced within the same space. This text has been generated by the Arabic text generator.',
      name: 'example_text',
      desc: '',
      args: [],
    );
  }

  /// `Login to\nyour account`
  String get login_text {
    return Intl.message(
      'Login to\nyour account',
      name: 'login_text',
      desc: '',
      args: [],
    );
  }

  /// `Email ID/Phone Number`
  String get email_text {
    return Intl.message(
      'Email ID/Phone Number',
      name: 'email_text',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgot_password {
    return Intl.message(
      'Forgot Password?',
      name: 'forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Login Successful`
  String get login_success {
    return Intl.message(
      'Login Successful',
      name: 'login_success',
      desc: '',
      args: [],
    );
  }

  /// `Create a new account`
  String get register {
    return Intl.message(
      'Create a new account',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Read about`
  String get read_about {
    return Intl.message(
      'Read about',
      name: 'read_about',
      desc: '',
      args: [],
    );
  }

  /// `Also read about`
  String get also_read {
    return Intl.message(
      'Also read about',
      name: 'also_read',
      desc: '',
      args: [],
    );
  }

  /// `User Usage Policy`
  String get usage_policy {
    return Intl.message(
      'User Usage Policy',
      name: 'usage_policy',
      desc: '',
      args: [],
    );
  }

  /// `Register a new account`
  String get register_text {
    return Intl.message(
      'Register a new account',
      name: 'register_text',
      desc: '',
      args: [],
    );
  }

  /// `Individual`
  String get individual {
    return Intl.message(
      'Individual',
      name: 'individual',
      desc: '',
      args: [],
    );
  }

  /// `Business`
  String get business {
    return Intl.message(
      'Business',
      name: 'business',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phone_number {
    return Intl.message(
      'Phone Number',
      name: 'phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Date of Birth`
  String get date_of_birth {
    return Intl.message(
      'Date of Birth',
      name: 'date_of_birth',
      desc: '',
      args: [],
    );
  }

  /// `Select Date`
  String get select_date {
    return Intl.message(
      'Select Date',
      name: 'select_date',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get city {
    return Intl.message(
      'City',
      name: 'city',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get gender {
    return Intl.message(
      'Gender',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get male {
    return Intl.message(
      'Male',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get female {
    return Intl.message(
      'Female',
      name: 'female',
      desc: '',
      args: [],
    );
  }

  /// `Agree to the Terms of Use and Conditions`
  String get agree_term {
    return Intl.message(
      'Agree to the Terms of Use and Conditions',
      name: 'agree_term',
      desc: '',
      args: [],
    );
  }

  /// `Registration Successful`
  String get register_success {
    return Intl.message(
      'Registration Successful',
      name: 'register_success',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register_ {
    return Intl.message(
      'Register',
      name: 'register_',
      desc: '',
      args: [],
    );
  }

  /// `Company Name`
  String get company_name {
    return Intl.message(
      'Company Name',
      name: 'company_name',
      desc: '',
      args: [],
    );
  }

  /// `The technical support department will contact you for more information`
  String get tech_support {
    return Intl.message(
      'The technical support department will contact you for more information',
      name: 'tech_support',
      desc: '',
      args: [],
    );
  }

  /// `You will be provided with account data upon its activation. You can also manage your account through the business sector system portal. For more information about business sector registration, visit our website www.Saudi-plus.com`
  String get company_desc {
    return Intl.message(
      'You will be provided with account data upon its activation. You can also manage your account through the business sector system portal. For more information about business sector registration, visit our website www.Saudi-plus.com',
      name: 'company_desc',
      desc: '',
      args: [],
    );
  }

  /// `Registration Request`
  String get registration_req {
    return Intl.message(
      'Registration Request',
      name: 'registration_req',
      desc: '',
      args: [],
    );
  }

  /// `Did you forget your password?`
  String get forgot_title {
    return Intl.message(
      'Did you forget your password?',
      name: 'forgot_title',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email address or phone number to receive a otp.`
  String get forgot_text {
    return Intl.message(
      'Enter your email address or phone number to receive a otp.',
      name: 'forgot_text',
      desc: '',
      args: [],
    );
  }

  /// `Send a one-time password`
  String get otp {
    return Intl.message(
      'Send a one-time password',
      name: 'otp',
      desc: '',
      args: [],
    );
  }

  /// `Activate the new account`
  String get activate_new_account {
    return Intl.message(
      'Activate the new account',
      name: 'activate_new_account',
      desc: '',
      args: [],
    );
  }

  /// `Enter the received code`
  String get enter_otp {
    return Intl.message(
      'Enter the received code',
      name: 'enter_otp',
      desc: '',
      args: [],
    );
  }

  /// `Enter the code you received on your mobile phone or email address`
  String get otp_text {
    return Intl.message(
      'Enter the code you received on your mobile phone or email address',
      name: 'otp_text',
      desc: '',
      args: [],
    );
  }

  /// `Click to resend`
  String get resend_otp {
    return Intl.message(
      'Click to resend',
      name: 'resend_otp',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
