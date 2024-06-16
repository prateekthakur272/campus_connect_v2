import 'package:flutter/material.dart';
import 'package:triton_extensions/triton_extensions.dart';

class ErrorMessage extends StatelessWidget {
  final String? errorMessage;
  const ErrorMessage({super.key, this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: 8.padding,
      decoration: BoxDecoration(
        border: Border.all(color: context.colorScheme.error, width: 2),
        borderRadius: BorderRadius.circular(4),
        color: context.colorScheme.error.withOpacity(0.1)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error, color: context.colorScheme.error,),
          8.space,
          Text(
            errorMessage ?? 'Some error occurred',
            style: context.textTheme.titleMedium!
                .copyWith(color: context.colorScheme.error),
          ),
        ],
      ),
    );
  }
}
