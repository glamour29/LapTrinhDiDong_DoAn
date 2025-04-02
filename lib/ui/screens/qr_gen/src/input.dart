
part of '../core.dart';

class _Input extends StatelessWidget {
  const _Input({required this.controller, required this.bloc});
  final TextEditingController controller;
  final QrGenBloc bloc;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (text)=> bloc.add(OnChangeTextEvent(text: text)),
      controller: controller,
      minLines: 4,
      maxLines: 4,
      maxLength: 1000,
      style: context.textTheme.bodyMedium,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      cursorColor: Colors.green,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            width: 1.5,
            color: Colors.white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            width: 1.5,
            color: Colors.green,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            width: 1.5,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
