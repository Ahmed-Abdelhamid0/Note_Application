import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/custom_app_bar.dart';
import 'package:note_app/widgets/custom_text_field.dart';
import 'package:note_app/widgets/edit_note_colors_list_view.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});


  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {

   String? title;
   String? content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 25.0,
      ),
      child: Column(
        children:
        [
          SizedBox(height: 40.0,),
          CustomAppBar(
            onPressed: ()
            {
                 widget.note.title = title ?? widget.note.title;
                 widget.note.subTitle = content ?? widget.note.subTitle;
                 widget.note.save();
                 BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                 Navigator.pop(context);
            },
            title: 'Edit Note',
            icon: Icons.check,
          ),
          SizedBox(height: 25.0,),
          CustomTextFormField(
             onChanged: (value)
             {
               title=value;
             },
              hint: widget.note.title,
          ),
          SizedBox(height: 15.0,),
          CustomTextFormField(
            onChanged: (value)
            {
              content = value;
            },
            hint: widget.note.subTitle,
            maxLines: 4,
          ),
          SizedBox(height: 15.0,),
          EditNoteColorsList(
            note: widget.note,
          ),


        ],
      ),
    );
  }
}

