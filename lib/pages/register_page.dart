import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      extendBody: true,
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 250,
            flexibleSpace: Stack(
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  bottom: 40,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Let's Get Started",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          "App Name",
                          style: Theme.of(context)
                              .textTheme
                              .headline1
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 12,
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  child: Container(
                    height: 28,
                    decoration: BoxDecoration(
                        color: Theme.of(context).backgroundColor,
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(50),
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.white.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 4)
                        ]),
                  ),
                  bottom: -1,
                  left: 0,
                  right: 0,
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0).copyWith(top: 0),
              child: Padding(
                padding: const EdgeInsets.all(8.0).copyWith(top: 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0)
                          .copyWith(top: 2, bottom: 16),
                      child: Text(
                        "Sign-up",
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    InputBoxWidget(context,
                        labelText: "Full Name",
                        editController:
                            TextEditingController(text: "Samual Krutz")),
                    InputBoxWidget(context,
                        labelText: "Email",
                        editController:
                            TextEditingController(text: "hello@syigen.com")),
                    CoreInputBoxWidget(context,
                        labelText: "Password",
                        inputWidget: TextField(
                          obscureText: true,
                          controller: TextEditingController(text: "asdasdas"),
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  onPressed: () => {},
                                  icon: const Icon(
                                      Icons.visibility_off_outlined))),
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(fontWeight: FontWeight.w300),
                        ))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget InputBoxWidget(BuildContext context,
      {required String labelText,
      required TextEditingController editController}) {
    return CoreInputBoxWidget(context,
        labelText: labelText,
        inputWidget: TextField(
          controller: editController,
          style: Theme.of(context)
              .textTheme
              .bodyText1
              ?.copyWith(fontWeight: FontWeight.w300),
        ));
  }
}

Widget CoreInputBoxWidget(BuildContext context,
    {required String labelText, required Widget inputWidget}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: Theme.of(context)
              .textTheme
              .bodyText1
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        inputWidget
      ],
    ),
  );
}
