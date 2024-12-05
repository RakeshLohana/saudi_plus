import 'package:flutter/material.dart';
import 'package:saudi_plus/core/constants/route_strings.dart';
import 'package:saudi_plus/core/theme/app_color.dart';
import 'package:saudi_plus/l10n/app_local.dart';

class ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top section: Header with a back button and screen title
            _buildTopSection(context),

            const SizedBox(height: 40),

            // Main section: Input form for email/phone and submit button
            _buildMainContent(context),
          ],
        ),
      ),
    );
  }

  /// Builds the top section with a decorative container, back button, and title
  Widget _buildTopSection(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 230,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(90),
          bottomLeft: Radius.circular(90),
        ),
        color: AppColor.bottomLabel, // Custom color from the theme
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30), // Spacing for visual alignment

            GestureDetector(
              onTap: () {
                Navigator.pop(context); // Navigates back to the previous screen
              },
              child: const Icon(
                Icons.arrow_back,
                color: AppColor.black, // Custom black color from the theme
                size: 30, // Icon size
              ),
            ),

            const SizedBox(height: 20), // Spacing between back button and title

            Text(
              AppLocal.loc.forgot_title,
              style: TextStyle(
                fontSize: 22, // Font size for the title
                fontWeight: FontWeight.bold, // Bold styling for emphasis
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the main content: Input field and the submit button
  Widget _buildMainContent(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 20.0), // Padding around the form
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Instruction text to guide the user
          Text(
            AppLocal.loc.forgot_text,
            style: TextStyle(
              fontSize: 16, // Slightly larger text for instructions
              color: Colors.black54, // Gray color for subtle appearance
            ),
          ),

          const SizedBox(height: 20), // Spacing between instruction and label

          // Label for the input field
          Text(
            AppLocal.loc.email_text,
            style: TextStyle(
              fontSize: 14, // Standard text size for field label
              fontWeight:
              FontWeight.w500, // Medium weight for better readability
            ),
          ),

          const SizedBox(height: 10), // Spacing between label and input field

          // Input field for email or mobile number
          TextField(
            keyboardType:
            TextInputType.emailAddress, // Ensures keyboard has "@" key
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 16.0, // Padding inside the input field
                horizontal: 10.0, // Padding to the sides of the text
              ),
              enabledBorder: const UnderlineInputBorder(
                borderSide:
                BorderSide(color: Colors.grey), // Border in idle state
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide:
                BorderSide(color: Color(0xFF00C9A7)), // Border when focused
              ),
              hintText: AppLocal.loc.forgot_text, // Placeholder text
            ),
          ),

          const SizedBox(height: 40), // Spacing before the submit button

          // Submit button
          SizedBox(
            width: double.infinity, // Button stretches across the screen
            child: ElevatedButton(
              onPressed: () {
                // Handle the submission logic here
                Navigator.of(context).pushNamed(RouteStrings.validateOtpScreen);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                const Color(0xFF00C9A7), // Consistent with theme
                padding:
                const EdgeInsets.symmetric(vertical: 16.0), // Button height
                shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(8.0), // Slightly rounded corners
                ),
              ),
              child:  Text(
                AppLocal.loc.otp,
                style: TextStyle(fontSize: 16), // Font size for button text
              ),
            ),
          ),
        ],
      ),
    );
  }
}
