import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../AppLocalizations.dart';
import '../../../bloc/them/ThemeCubit.dart';
import '../../../common_button/HomeButton.dart';
import '../../../common_button/HomeText.dart';
import '../../../common_button/LocalizationKeys.dart';
class HomeBody extends StatelessWidget {
  const HomeBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawerEnableOpenDragGesture: true,
      appBar: AppBar(
        title:const HomeText(),
      ),
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height:20),
          Text(
            AppLocalizations(context.read<LanguageCubit>().state.locale)
                .translate(LocalizationKeys.sHeader),
            style: const TextStyle(
                color:Colors.black87,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height:20),
          HomeButton(
            onPressed: () {
              context.read<ThemeCubit>().toggleTheme();
            },
            buttonText: LocalizationKeys.toggleTheme,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              BlocProvider.of<LanguageCubit>(context).switchToEnglish();
            },
            child: const Text('Switch to English'),
          ),
          ElevatedButton(
            onPressed: () {
              BlocProvider.of<LanguageCubit>(context).switchToHindi();
            },
            child: const Text('Switch to Hindi'),
          ),
          ElevatedButton(
            onPressed: () {
              BlocProvider.of<LanguageCubit>(context).switchToGerman();
            },
            child: const Text('Switch to German'),
          ),
          HomeButton(
            onPressed: () {
              context.read<LanguageCubit>().toggleLanguage();
            },
            buttonText: LocalizationKeys.toggleLanguage,
          ),
          ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount:2,itemBuilder: (context, index) {

            return  const ListTile(
              title: Text("Hi"),
            );
          }),
        ],
      ),
    );
  }
}