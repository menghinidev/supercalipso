import 'package:flutter/material.dart';
import 'package:supercalipso/data/model/user/user.dart';
import 'package:supercalipso/presenter/pages/profile/components/profile_avatar.dart';
import 'package:supercalipso/presenter/theme/colors.dart';
import 'package:supercalipso/presenter/theme/dimensions.dart';

class UserAssigneeAvatar extends StatelessWidget {
  final bool isSelected;
  final User user;
  final Function(String id)? onSelected;

  const UserAssigneeAvatar({super.key, required this.user, this.onSelected, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Dimensions.allSPadding,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: isSelected ? AppColors.blue : Colors.transparent),
      ),
      child: GestureDetector(
        onTap: onSelected != null ? () => onSelected!(user.uid) : null,
        child: ProfileAvatar(imageURL: user.imageURL),
      ),
    );
  }
}
