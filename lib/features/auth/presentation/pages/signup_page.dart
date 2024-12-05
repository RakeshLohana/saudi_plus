import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saudi_plus/core/constants/route_strings.dart';
import 'package:saudi_plus/core/theme/app_color.dart';
import 'package:saudi_plus/features/auth/domain/data/models/RegisterModel.dart';
import 'package:saudi_plus/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:saudi_plus/features/auth/presentation/bloc/auth_event.dart';
import 'package:saudi_plus/features/auth/presentation/bloc/auth_state.dart';
import 'package:saudi_plus/features/auth/presentation/widgets/custombutton.dart';
import 'package:saudi_plus/features/auth/presentation/widgets/touchabletext.dart';
import 'package:saudi_plus/l10n/app_local.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  // Controllers for Business Form
  final TextEditingController _businessNameController = TextEditingController();
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _businessPhoneController = TextEditingController();
  final TextEditingController _businessEmailController = TextEditingController();

  @override
  void dispose() {
    // Dispose controllers when the widget is removed from the tree
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _businessNameController.dispose();
    _companyNameController.dispose();
    _businessPhoneController.dispose();
    _businessEmailController.dispose();
    super.dispose();
  }

  bool isIndividualSelected = true;
  String? _selectedGender;
  String? _selectedCity;
  bool _isChecked = false;
  DateTime? _selectedDate;

  void _showDatePicker() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    AppLocal.init(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Green Header with AppBar
            Container(
              width: double.infinity,
              height: 230,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(90),
                  bottomLeft: Radius.circular(90),
                ),
                color: AppColor.bottomLabel,
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        color: AppColor.black,
                        size: 30,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      AppLocal.loc.register_text,
                      style:
                      const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Content Section
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(26.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Toggle Buttons
                      Row(
                        children: [
                          _buildToggleButton(AppLocal.loc.individual, isIndividualSelected,
                                  () {
                                setState(() {
                                  isIndividualSelected = true;
                                });
                              }),
                          const SizedBox(width: 10),
                          _buildToggleButton(AppLocal.loc.business, !isIndividualSelected,
                                  () {
                                setState(() {
                                  isIndividualSelected = false;
                                });
                              }),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // Forms
                      isIndividualSelected
                          ? _buildIndividualForm()
                          : _buildBusinessForm(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleButton(String label, bool isSelected, VoidCallback onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? Colors.purple : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIndividualForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTextField(AppLocal.loc.name, _nameController),
        _buildTextField(AppLocal.loc.username, _usernameController),
        _buildTextField(AppLocal.loc.phone_number, _phoneController),
        _buildTextField(AppLocal.loc.email, _emailController),
        _buildTextField(AppLocal.loc.password, _passwordController, obscureText: true),
        _buildTextField(AppLocal.loc.my_addresses, _addressController, ),
        const SizedBox(height: 10),

        // Date of Birth (Full-Width Input)
        Text(AppLocal.loc.date_of_birth),
        const SizedBox(height: 5),
        GestureDetector(
          onTap: _showDatePicker,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.black, width: 2),
              ),
            ),
            child: Text(
              _selectedDate == null
                  ? AppLocal.loc.select_date
                  : "${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}",
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ),
        const SizedBox(height: 10),

        // City Selection
        Text(AppLocal.loc.city),
        const SizedBox(height: 5),
        DropdownButtonFormField<String>(
          value: _selectedCity,
          items: ["City 1", "City 2", "City 3"]
              .map((city) => DropdownMenuItem<String>(
            value: city,
            child: Text(city),
          ))
              .toList(),
          onChanged: (value) {
            setState(() {
              _selectedCity = value;
            });
          },
          decoration: const InputDecoration(
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 2),
            ),
          ),
        ),
        const SizedBox(height: 10),

        // Gender Selection
        Text(AppLocal.loc.gender),
        const SizedBox(height: 5),
        Row(
          children: [AppLocal.loc.male, AppLocal.loc.female].map((gender) {
            return Expanded(
              child: Row(
                children: [
                  Radio<String>(
                    value: gender,
                    groupValue: _selectedGender,
                    onChanged: (value) {
                      setState(() {
                        _selectedGender = value;
                      });
                    },
                  ),
                  Text(gender),
                ],
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 10),

        // Terms and Conditions
        Row(
          children: [
            Checkbox(
              value: _isChecked,
              onChanged: (value) {
                setState(() {
                  _isChecked = value ?? false;
                });
              },
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  // Handle T&C Click
                },
                child: TouchableText(
                  text: AppLocal.loc.agree_term,
                  textColor: AppColor.appPrimaryColor,
                  onTap: () {},
                  underlineColor: AppColor.appPrimaryColor,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),

        // Register Button
        BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is RegisterSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(AppLocal.loc.register_success)),
              );
              // Navigate to another page if needed
              Navigator.of(context).pop();
            } else if (state is RegisterFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            }
          },
          builder: (context, state) {
            if (state is RegisterLoading) {
              return Center(
                  child: const CircularProgressIndicator());
            }
            return Center(
              child: CustomButton(
                text: AppLocal.loc.register_,
                color: AppColor.bottomLabel,
                radius: 10,
                fontSize: 20,
                padding: EdgeInsets.symmetric(
                    horizontal: 70, vertical: 10),
                onPressed: () {

                  final authBloc = BlocProvider.of<AuthBloc>(context);
                  if (authBloc == null) {
                    print("AuthBloc is not available in the widget tree");
                    return;
                  }
                  RegisterModel register=new RegisterModel(
                    displayName: _nameController.text,
                    phoneNumber: _phoneController.text,
                    email: _emailController.text,
                    password: _passwordController.text,
                    address: _addressController.text ,
                    cityId: 0,
                    dateOfBirth: _selectedDate?.toUtc().toString(),
                    deviceToken:"1234" ,
                    gender: _selectedGender==AppLocal.loc.male?0:1,
                    username:_usernameController.text ,

                  );
                  authBloc.add(RegisterButtonPressed(register: register));

                },
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildBusinessForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTextField(AppLocal.loc.name, _businessNameController),
        _buildTextField(AppLocal.loc.company_name, _companyNameController),
        _buildTextField(AppLocal.loc.phone_number, _businessPhoneController),
        _buildTextField(AppLocal.loc.email, _businessEmailController),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: const Color(0xFFFCEBED),
              borderRadius: BorderRadius.circular(10)),
          child: Text(
              AppLocal.loc.tech_support),
        ),
        const SizedBox(height: 20),
        Text(AppLocal.loc.company_desc),
        const SizedBox(height: 40),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              // Implement check logic
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF00C9A7), // Match button color
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: Text(
              AppLocal.loc.registration_req,
              style: TextStyle(fontSize: 16.sp),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTextField(String label,TextEditingController controller, {bool obscureText = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextField(
        controller:controller ,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.black),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2),
          ),
        ),
      ),
    );
  }
}
