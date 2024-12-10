part of 'change_thime_cubit.dart';

sealed class ChangeThimeState {
  Icon icon = const Icon(Icons.dark_mode);
}

final class DarkThimeState extends ChangeThimeState {
  @override
  Icon get icon => const Icon(Icons.light_mode);
}

final class LightThimeState extends ChangeThimeState {
    @override
  Icon get icon => const Icon(Icons.dark_mode);
}
