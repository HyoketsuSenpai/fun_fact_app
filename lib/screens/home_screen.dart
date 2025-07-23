import 'package:flutter/material.dart';
import 'package:fun_fact_app_flutter/model/fact.dart';
import 'package:fun_fact_app_flutter/repositories/fun_fact_repo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  Fact fact = Fact();
  Set<Fact> seenFacts = <Fact>{};

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    _loadFunFact();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fun Facts'), centerTitle: true),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 200),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset(0.0, 1.0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  );
                },
                child: Text(
                  fact.funFactText,
                  key: ValueKey(fact.funFactText),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            RotationTransition(
              turns: _animationController,

              alignment: Alignment.center,

              child: Semantics(
                enabled: true,
                button: true,
                label: "Reload fun fact button",
                hint: "Get a new fun fact!",
                child: IconButton(
                  onPressed: _loadFunFact,
                  icon: const Icon(Icons.rotate_right_sharp),
                  tooltip: "Get a new fun fact!",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _loadFunFact() async {
    _animationController.repeat();

    try {
      final fact = await FunFactRepository.loadFunFact();
      if (seenFacts.contains(fact)) {
        _loadFunFact();
      }
      setState(() {
        //call this only if you care about only checking that a fact isn't repeated
        //seenFacts.remove(this.fact);
        seenFacts.add(fact);
        this.fact = fact;
      });
      _animationController.stop();
      _animationController.animateTo(1.0);
    } catch (e) {
      _animationController.stop();
      _animationController.animateBack(0.0);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Couldn't load fun fact! Check your network and try again!",
            ),
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
