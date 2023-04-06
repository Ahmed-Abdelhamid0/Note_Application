
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/constants/constants.dart';
import 'package:note_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:note_app/cubits/add_note_cubit/add_note_state.dart';

class ColorItem extends StatelessWidget {

  const ColorItem({super.key, required this.isActive, required this.color});
  final bool isActive;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return  isActive
        ? CircleAvatar(
          radius: 25.0,
          backgroundColor: Colors.white,
          child: CircleAvatar(
           radius: 23.0,
           backgroundColor: color,
    ),
        )
        : CircleAvatar(
      radius: 25.0,
      backgroundColor: color,
    );
  }
}





class ColorsListView extends StatefulWidget {
  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {

  int currentIndex = 0 ;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25*2,
      child: ListView.builder(
        itemCount: kColors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,index)
        {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: GestureDetector(
              onTap: ()
              {
                currentIndex = index;
                BlocProvider.of<AddNoteCubit>(context).color= kColors[index];
                setState(() {

                });
              },
              child: ColorItem(
                color: kColors[index],
                isActive: currentIndex == index,
              ),
            ),
          );

        },
      ),
    );
  }
}