import 'package:calc_pro/core/extensions/context_extension.dart';
import 'package:calc_pro/core/strings/generated/l10n.dart';
import 'package:calc_pro/ui/routers/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DialogDeleteAllHistory extends StatelessWidget {
  const DialogDeleteAllHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Icon(Icons.delete, color: Colors.red),
            SizedBox(width: 8.w),
            Expanded(
              child: Text(
                S.current.delete_all_history_title,
                style: context.textTheme.titleMedium!.copyWith(height: 1),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        Divider(height: 16.w),
        Text(
          S.current.delete_all_history_content,
          style: context.textTheme.bodySmall,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
                onPressed: () => AppRouter.pop(false),
                child: Text(
                  S.current.cancel,
                  style: context.textTheme.titleSmall?.copyWith(
                    color: Colors.grey,
                  ),
                )),
            TextButton(
                onPressed: () => AppRouter.pop(true),
                child: Text(
                  S.current.delete,
                  style: context.textTheme.titleSmall?.copyWith(
                    color: Colors.red,
                  ),
                ))
          ],
        )
      ],
    );
  }
}
