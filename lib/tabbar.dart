import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:template_getx/app.dart';
import 'package:star_menu/star_menu.dart';
import 'package:template_getx/services/app.dart';

enum TabbarType { home, mine }

class TabbarScaffold extends StatefulWidget {
  const TabbarScaffold({
    super.key,
    required this.body,
    this.type = TabbarType.home,
  });

  final Widget body;
  final TabbarType type;

  @override
  State<TabbarScaffold> createState() => _TabbarScaffoldState();
}

class _TabbarScaffoldState extends State<TabbarScaffold> {
  int _index = -1;
  List<Widget> _children = [];

  final _tabList = [
    {
      'title': '首页',
      'icon': 'home',
      'onTap': (BuildContext context) {
        Get.toNamed(Routes.HOME);
      },
    },
    {
      'title': '我的',
      'icon': 'home',
      'onTap': (BuildContext context) {
        // if (!ref.read(isLoggedProvider)) {
        //   context.push('/login');
        // } else {
        Get.toNamed(Routes.MINE);
        // }
      },
    },
  ];

  @override
  void initState() {
    super.initState();
    _children = List.generate(_tabList.length, (index) => const SizedBox());
    _updateChildren();
    // SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
    //   mobLinkMount();
    // });
  }

  void _updateChildren() {
    if (widget.type.index != _index) {
      _index = widget.type.index;
      _children[_index] = widget.body;
    }
    setState(() {});
  }

  @override
  void didUpdateWidget(covariant TabbarScaffold oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.type != widget.type) {
      _updateChildren();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const _SectorFabButton(),
      body: Column(
        children: [
          Expanded(
            child: IndexedStack(
              index: _index,
              children: _children,
            ),
          ),
          _TabBar(
            index: _index,
            tabList: _tabList,
          ),
        ],
      ),
    );
  }
}

class _SectorFabButton extends StatelessWidget {
  const _SectorFabButton({super.key});

  @override
  Widget build(BuildContext context) {
    return StarMenu(
      items: const [
        Icon(Icons.ac_unit_outlined),
        Icon(Icons.ac_unit_outlined),
        Icon(Icons.ac_unit_outlined),
      ],
      params: StarMenuParameters(
          shape: MenuShape.circle,
          circleShapeParams: const CircleShapeParams(
            radiusX: 85,
            radiusY: 85,
            startAngle: 90,
            endAngle: 170,
          ),
          backgroundParams: BackgroundParams(
            sigmaX: 1,
            sigmaY: 1,
            animatedBlur: true,
            animatedBackgroundColor: true,
            backgroundColor: Colors.black.withOpacity(0.05),
          )),
      onItemTapped: (index, controller) {
        logger.i(index);
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10, bottom: 10),
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.blue[400],
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 5)],
        ),
        child: const Icon(
          Icons.ac_unit_outlined,
          color: Colors.white,
        ),
      ),
    );
  }
}

class _TabBar extends StatelessWidget {
  const _TabBar({
    Key? key,
    required this.index,
    required this.tabList,
  }) : super(key: key);

  final int index;
  final List tabList;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    List<Widget> children = [];

    for (int i = 0; i < tabList.length; i++) {
      children.add(
        Expanded(
          child: GestureDetector(
            onTap: () => (tabList[i]['onTap'] as Function).call(context),
            behavior: HitTestBehavior.opaque,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/ic_${tabList[i]['icon']}_${i == index ? 'slt' : 'nor'}.png',
                  width: 26,
                  height: 26,
                ),
                const SizedBox(height: 3),
                Text(
                  tabList[i]['title'] as String,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: i == index ? colors.primary : colors.text4,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    final right = MediaQuery.of(context).size.width / (tabList.length + 2);

    return _AppEventlistener(
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
        child: Container(
          padding: EdgeInsets.only(right: right),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
              )
            ],
          ),
          child: SafeArea(
            top: false,
            child: Column(
              children: [
                // const ExtensivePlayer(),
                SizedBox(
                  height: 50,
                  child: Row(
                    children: children,
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

class _AppEventlistener extends HookWidget {
  const _AppEventlistener({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      final needLoginSub = AppService.bus.on<AppNeedToLogin>().listen((event) {
        // if (GoRouter.of(context).location != '/login') {
        //   ref.read(authNotifierProvider.notifier).logout();
        //   context
        //     ..go('/')
        //     ..push('/login');
        // }
      });
      return () {
        needLoginSub.cancel();
      };
    });
    return child;
  }
}
