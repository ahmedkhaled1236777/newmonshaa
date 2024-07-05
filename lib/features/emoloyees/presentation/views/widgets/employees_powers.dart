import 'package:ghhg/features/emoloyees/presentation/viewmodel/addemployee/addemployee_cubit.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmployessPowers extends StatefulWidget {
  const EmployessPowers({super.key});

  @override
  State<EmployessPowers> createState() => EmployessPowersState();
}

class EmployessPowersState extends State<EmployessPowers> {
  final List<String> items = [
    'العقارات',
    'الاراضي',
    'المستاجرين',
    'عقود الايجار',
    'سندات القبض',
    'سندات الصرف',
    'المصروفات',
    'الموظفين',
    'الدعم الفني',
    "الايرادات",
    "العملاء",
    "عموله الموظفين",
    "العقود المنتهيه",
    "الارباح",
    "اخفاء ارقام هواتف الملاك من الوحدات العقاريه",
     "اخفاء ارقام هواتف العملاء",
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddemployeeCubit, AddemployeeState>(
        builder: (context, state) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              isExpanded: true,
              hint: Text(
                'الشاشة',
                style: TextStyle(
                  fontSize: 12.5,
                  color: Theme.of(context).hintColor,
                ),
              ),
              items: items.map((item) {
                return DropdownMenuItem(
                  value: item,
                  //disable default onTap to avoid closing menu when selecting an item
                  enabled: false,
                  child: StatefulBuilder(
                    builder: (context, menuSetState) {
                      final isSelected =
                          BlocProvider.of<AddemployeeCubit>(context)
                              .selecteditems
                              .contains(item);
                      return InkWell(
                        onTap: () {
                          isSelected
                              ? {
                                  item == "العقارات"
                                      ? {
                                          BlocProvider.of<AddemployeeCubit>(
                                                  context)
                                              .selecteditems
                                              .remove("عقارات البيع"),
                                          BlocProvider.of<AddemployeeCubit>(
                                                  context)
                                              .selecteditems
                                              .remove(item),
                                          BlocProvider.of<AddemployeeCubit>(
                                                  context)
                                              .selecteditems
                                              .remove("عقارات الايجار")
                                        }
                                      : BlocProvider.of<AddemployeeCubit>(
                                              context)
                                          .selecteditems
                                          .remove(item)
                                }
                              : BlocProvider.of<AddemployeeCubit>(context)
                                  .selecteditems
                                  .add(item);
                          //This rebuilds the StatefulWidget to update the button's text
                          setState(() {});
                          //This rebuilds the dropdownMenu Widget to update the check mark
                          menuSetState(() {});
                        },
                        child: Container(
                          height: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 14.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                              if (isSelected)
                                const Icon(Icons.check_box_outlined)
                              else
                                const Icon(Icons.check_box_outline_blank),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              }).toList(),
              //Use last selected item as the current value so if we've limited menu height, it scroll to last item.
              value: BlocProvider.of<AddemployeeCubit>(context)
                      .selecteditems
                      .isEmpty
                  ? null
                  : BlocProvider.of<AddemployeeCubit>(context)
                      .selecteditems
                      .last,
              onChanged: (value) {},
              selectedItemBuilder: (context) {
                return items.map(
                  (item) {
                    return Container(
                      alignment: AlignmentDirectional.center,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          BlocProvider.of<AddemployeeCubit>(context)
                              .selecteditems
                              .join(' - '),
                          style: const TextStyle(
                            fontSize: 13,
                            overflow: TextOverflow.ellipsis,
                          ),
                          maxLines: 1,
                        ),
                      ),
                    );
                  },
                ).toList();
              },
              buttonStyleData: const ButtonStyleData(
                padding: EdgeInsets.only(left: 0, right: 0),
                height: 40,
                width: 140,
              ),
              menuItemStyleData: const MenuItemStyleData(
                height: 40,
                padding: EdgeInsets.zero,
              ),
            ),
          ),
        ),
      );
    });
  }
}
