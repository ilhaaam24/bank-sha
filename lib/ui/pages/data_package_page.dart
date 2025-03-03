import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/blocs/data_plan/data_plan_bloc.dart';
import 'package:bank_sha/models/data_Plan_model.dart';
import 'package:bank_sha/models/data_plan_form_model.dart';
import 'package:bank_sha/models/operator_card_model.dart';
import 'package:bank_sha/shared/shared_methods.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widget/buttons.dart';
import 'package:bank_sha/ui/widget/forms.dart';
import 'package:bank_sha/ui/widget/paket_data_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataPackagePage extends StatefulWidget {
  final OperatorCardModel operatorCardModel;
  const DataPackagePage({super.key, required this.operatorCardModel});

  @override
  State<DataPackagePage> createState() => _DataPackagePageState();
}

class _DataPackagePageState extends State<DataPackagePage> {
  final phoneController = TextEditingController(text: '');
  DataPlanModel? selectedDataPlan;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DataPlanBloc(),
      child: BlocConsumer<DataPlanBloc, DataPlanState>(
        listener: (context, state) {
          if (state is DataPlanFailed) {
            showCustomSnackbar(context, state.e);
          }

          if (state is DataPlanSuccess) {
            context
                .read<AuthBloc>()
                .add(AuthUpdateBalance(selectedDataPlan!.price! * -1));

            Navigator.pushNamedAndRemoveUntil(
              context,
              '/data-success',
              (route) => false,
            );
          }
        },
        builder: (context, state) {
          if (state is DataPlanLoading) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          return Scaffold(
            appBar: AppBar(
              title: const Text('Paket Data'),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ListView(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Phone Number',
                        style: blackTextStyle.copyWith(
                            fontWeight: semiBold, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      CustomFormField(
                        title: '+628',
                        isShowTitle: false,
                        controller: phoneController,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Select Package',
                        style: blackTextStyle.copyWith(
                            fontWeight: semiBold, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Wrap(
                            direction: Axis.horizontal,
                            alignment: WrapAlignment.spaceBetween,
                            runSpacing: 20,
                            children: widget.operatorCardModel.dataPlans!
                                .map((dataplan) => GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedDataPlan = dataplan;
                                      });
                                    },
                                    child: PaketDataItem(
                                      dataPlan: dataplan,
                                      isSelected:
                                          selectedDataPlan?.id == dataplan.id,
                                    )))
                                .toList()),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 200,
                  ),
                ],
              ),
            ),
            floatingActionButton:
                (selectedDataPlan != null && phoneController.text.isNotEmpty)
                    ? Container(
                        margin: const EdgeInsets.all(24),
                        child: CustomFilledButton(
                          title: 'Continue',
                          onPressed: () async {
                            if (await Navigator.pushNamed(context, '/pin') ==
                                true) {
                              final authstate = context.read<AuthBloc>().state;
                              String pin = '';
                              if (authstate is AuthSuccess) {
                                pin = authstate.user.pin!;
                              }

                              context
                                  .read<DataPlanBloc>()
                                  .add(DataPlanPost(DataPlanFormModel(
                                    dataPlanId: selectedDataPlan!.id,
                                    phoneNumber: phoneController.text,
                                    pin: pin,
                                  )));
                            }
                          },
                        ),
                      )
                    : Container(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
        },
      ),
    );
  }
}
