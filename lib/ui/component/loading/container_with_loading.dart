import 'package:glassbalconyanalysis/ui/component/loading/loading.dart';
import 'package:glassbalconyanalysis/ui/loading_state_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ContainerWithLoading extends HookConsumerWidget {
  const ContainerWithLoading({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final state = ref.watch(loadingStateProvider);
    return Stack(children: [
      child,
      state.isLoading ? const Loading() : const SizedBox(),
    ]);
  }
}
