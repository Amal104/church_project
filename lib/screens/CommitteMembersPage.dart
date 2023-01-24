import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../provider/CommitteeMemberProvider.dart';
import '../values/values.dart';

class CommitteeMemberPage extends StatefulWidget {
  const CommitteeMemberPage({super.key});

  @override
  State<CommitteeMemberPage> createState() => _CommitteeMemberPageState();
}

class _CommitteeMemberPageState extends State<CommitteeMemberPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<CommitteeMemberProvider>(context, listen: false)
          .getAllTodos();
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverPadding(
              padding: EdgeInsets.only(
                left: width / 25,
                bottom: height * 0.01,
                top: height * 0.01,
              ),
              sliver: const SliverToBoxAdapter(
                child: FaIcon(
                  FontAwesomeIcons.chevronLeft,
                  color: AppColor.grey400,
                ),
              ),
            ),
            SliverPadding(
              padding:
                  EdgeInsets.only(left: width / 25, bottom: height * 0.025),
              sliver: SliverToBoxAdapter(
                child: Text(
                  "Committee\nMembers",
                  style: GoogleFonts.inter(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: AppColor.grey600,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
            ),
            Consumer<CommitteeMemberProvider>(builder: (context, value, child) {
              if (value.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              final todos = value.todos;
              return SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    mainAxisSpacing: 1.0,
                    crossAxisSpacing: 1.0),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final todo = todos[index];
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColor.lightGreyShade,
                            ),
                          ),
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                            child: CachedNetworkImage(
                              imageUrl:
                                  "https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=388&q=80",
                              height: 150,
                              width: width,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(todo.name),
                        ],
                      ),
                    );
                  },
                  childCount: todos.length,
                ),
              );
            }),
            const SliverPadding(
              padding: EdgeInsets.only(bottom: 80.0),
            )
          ],
        ),
      ),
    );
  }
}
