import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/utils/size_config.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

class CustomerSupportScreen extends StatelessWidget {
  const CustomerSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: SizeConfig.w(12)),
          child: GestureDetector(
            onTap: () => context.pop(),
            child: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            // Chat list
            ListView(
              padding: EdgeInsets.only(
                top: SizeConfig.h(20),
                bottom: SizeConfig.h(120),
                left: SizeConfig.w(19),
                right: SizeConfig.w(19),
              ),
              children: [
                _buildMessage(text: 'Hi, how can I help you?', isSender: false),
                SizedBox(height: SizeConfig.h(20)),
                _buildMessage(text: 'Hello, I ordered two fried chicken burgers. can I know how much time it will get to arrive?', isSender: true),
                SizedBox(height: SizeConfig.h(20)),
                _buildMessage(text: 'Ok, please let me check!', isSender: false),
                SizedBox(height: SizeConfig.h(20)),
                _buildMessage(text: 'Sure...', isSender: true),
                SizedBox(height: SizeConfig.h(20)),
                _buildMessage(text: 'It’ll get 25 minutes to arrive to your address', isSender: false),
                SizedBox(height: SizeConfig.h(40)),
                Center(
                  child: Text(
                    '26 minutes ago',
                    style: AppTextStyles.robotoText.copyWith(
                      color: const Color(0xFFDBDADA),
                      fontWeight: FontWeight.w600,
                      fontSize: SizeConfig.w(14),
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.h(40)),
                _buildMessage(text: 'Ok, thanks you for your support', isSender: true),
              ],
            ),

            // Bottom Input
            Positioned(
              bottom: SizeConfig.h(35),
              left: SizeConfig.w(26),
              right: SizeConfig.w(26),
              child: Container(
                height: SizeConfig.h(70),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(SizeConfig.w(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.18),
                      blurRadius: 26,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    SizedBox(width: SizeConfig.w(27)),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Type here...',
                          hintStyle: AppTextStyles.robotoText.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: SizeConfig.w(18),
                            color: const Color(0xFFDBDADA),
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Container(
                      width: SizeConfig.w(70),
                      height: SizeConfig.h(70),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(SizeConfig.w(20)),
                      ),
                      child: Center(
                        child: Icon(Icons.send, color: AppColors.white, size: SizeConfig.w(24)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessage({required String text, required bool isSender}) {
    return Row(
      mainAxisAlignment: isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!isSender) ...[
          Container(
            width: SizeConfig.w(50),
            height: SizeConfig.w(50),
            decoration: const BoxDecoration(
              color: Color(0xFFF3F4F6),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.person, color: AppColors.textPrimary, size: SizeConfig.w(24)),
          ),
          SizedBox(width: SizeConfig.w(14)),
        ],
        
        Flexible(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(23), vertical: SizeConfig.h(15)),
            decoration: BoxDecoration(
              color: isSender ? AppColors.primary : const Color(0xFFF3F4F6),
              borderRadius: BorderRadius.circular(SizeConfig.w(20)),
              boxShadow: isSender ? [
                BoxShadow(color: Colors.black.withOpacity(0.18), blurRadius: 15, offset: const Offset(0, 7)),
              ] : null,
            ),
            child: Text(
              text,
              style: AppTextStyles.robotoText.copyWith(
                color: isSender ? AppColors.white : AppColors.textPrimary,
                fontWeight: FontWeight.w500,
                fontSize: SizeConfig.w(18),
                height: 1.35,
              ),
            ),
          ),
        ),

        if (isSender) ...[
          SizedBox(width: SizeConfig.w(14)),
          Container(
            width: SizeConfig.w(50),
            height: SizeConfig.w(50),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: const DecorationImage(
                image: NetworkImage('https://placehold.co/50x50/png'),
                fit: BoxFit.cover,
              ),
              border: Border.all(color: Colors.transparent),
            ),
          ),
        ],
      ],
    );
  }
}
