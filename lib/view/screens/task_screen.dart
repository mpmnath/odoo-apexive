import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odoo_apexive/bloc/new_timer/new_timer_bloc.dart';
import 'package:odoo_apexive/bloc/timer/timer_bloc.dart';
import 'package:odoo_apexive/models/timer_model.dart';
import 'package:odoo_apexive/theme/palette.dart';
import 'package:odoo_apexive/view/widgets/details/details_description_card.dart';
import 'package:odoo_apexive/view/widgets/details/details_project_card.dart';
import 'package:odoo_apexive/view/widgets/timer/timesheet_timer_card.dart';

class TaskScreen extends StatefulWidget {
  final int index;
  const TaskScreen({
    super.key,
    required this.index,
  });

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 16.0,
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: Text(
          context.read<NewTimerBloc>().state.timers[widget.index].task.name,
          style: theme.textTheme.headlineSmall,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 16.0,
            ),
            child: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {},
            ),
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        height: size.height,
        decoration: const BoxDecoration(
          gradient: ColorPalette.lightSurface,
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                TabBar(
                  controller: _tabController,
                  dividerColor: theme.colorScheme.onSurface,
                  labelColor: theme.colorScheme.onSurface,
                  labelStyle: theme.textTheme.labelLarge,
                  tabs: const [
                    Tab(
                      text: 'Timesheets',
                    ),
                    Tab(
                      text: 'Details',
                    ),
                  ],
                ),
                Flexible(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      Column(
                        children: [
                          TimesheetTimerCard(
                            index: widget.index,
                          ),
                        ],
                      ),
                      const Column(
                        children: [
                          DetailsProjectCard(),
                          DetailsDescriptionCard(
                            description:
                                'Sync with Client, communicate, work on the new design with designer, new tasks preparation call with the front end',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
