import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/utils/app_router.dart';
import '../../../core/utils/size_config.dart';

class CustomerSupportScreen extends StatelessWidget {
  const CustomerSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    final messages = [
      _ChatMsg(isUser: false, text: 'Hi, how can I help you?'),
      _ChatMsg(isUser: true, text: 'Hello, I ordered two fried chicken burgers. can I know how much time it will get to arrive?'),
      _ChatMsg(isUser: false, text: 'Ok, please let me check!'),
      _ChatMsg(isUser: true, text: 'Sure...'),
      _ChatMsg(isUser: false, text: "It'll get 25 minutes to arrive to your address"),
      _ChatMsg(isUser: true, text: 'Ok, thanks you for your support'),
    ];

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Top bar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(13), vertical: SizeConfig.h(8)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (context.canPop()) {
                        context.pop();
                        return;
                      }
                      context.go(AppRouter.homePath);
                    },
                    child: Icon(Icons.arrow_back, size: SizeConfig.w(28), color: AppColors.textPrimary),
                  ),
                  Icon(Icons.menu, size: SizeConfig.w(20), color: AppColors.textPrimary),
                ],
              ),
            ),
            SizedBox(height: SizeConfig.h(10)),
            // Chat messages
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(19)),
                itemCount: messages.length,
                itemBuilder: (_, i) {
                  final msg = messages[i];
                  // Timestamp after 5th message
                  if (i == 4) {
                    return Column(children: [
                      _buildMessage(msg),
                      SizedBox(height: SizeConfig.h(8)),
                      Text('26 minutes ago', style: AppTextStyles.robotoRegular.copyWith(fontSize: SizeConfig.w(14), color: AppColors.textSecondary)),
                      SizedBox(height: SizeConfig.h(16)),
                    ]);
                  }
                  return Padding(
                    padding: EdgeInsets.only(bottom: SizeConfig.h(20)),
                    child: _buildMessage(msg),
                  );
                },
              ),
            ),
            // Input bar
            Container(
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(7), vertical: SizeConfig.h(10)),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: SizeConfig.h(70),
                      decoration: BoxDecoration(
                        color: AppColors.background,
                        borderRadius: BorderRadius.circular(SizeConfig.w(20)),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(20)),
                      alignment: Alignment.centerLeft,
                      child: TextField(
                        style: AppTextStyles.robotoRegular.copyWith(fontSize: SizeConfig.w(16)),
                        decoration: InputDecoration(
                          hintText: 'Type here...',
                          hintStyle: AppTextStyles.robotoRegular.copyWith(fontSize: SizeConfig.w(16), color: AppColors.textSecondary),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: SizeConfig.w(8)),
                  Container(
                    width: SizeConfig.w(70),
                    height: SizeConfig.h(70),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(SizeConfig.w(20)),
                    ),
                    child: Icon(Icons.send, color: AppColors.white, size: SizeConfig.w(24)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessage(_ChatMsg msg) {
    if (msg.isUser) {
      // User message — right side, red bubble
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Container(
              padding: EdgeInsets.all(SizeConfig.w(15)),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(SizeConfig.w(20)),
              ),
              child: Text(msg.text,
                style: AppTextStyles.robotoRegular.copyWith(fontSize: SizeConfig.w(16), color: AppColors.white, height: 1.4)),
            ),
          ),
          SizedBox(width: SizeConfig.w(8)),
          CircleAvatar(
            radius: SizeConfig.w(25),
            backgroundColor: AppColors.background,
            child: ClipOval(
              child: Image.asset('assets/images/profile_avatar.png',
                width: SizeConfig.w(50), height: SizeConfig.w(50), fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const Icon(Icons.person)),
            ),
          ),
        ],
      );
    } else {
      // Support message — left side, grey bubble
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: SizeConfig.w(25),
            backgroundColor: AppColors.textPrimary,
            child: Icon(Icons.person_outline, color: AppColors.white, size: SizeConfig.w(24)),
          ),
          SizedBox(width: SizeConfig.w(8)),
          Flexible(
            child: Container(
              padding: EdgeInsets.all(SizeConfig.w(15)),
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(SizeConfig.w(20)),
              ),
              child: Text(msg.text,
                style: AppTextStyles.robotoRegular.copyWith(fontSize: SizeConfig.w(16), height: 1.4)),
            ),
          ),
        ],
      );
    }
  }
}

class _ChatMsg {
  final bool isUser;
  final String text;
  const _ChatMsg({required this.isUser, required this.text});
}
