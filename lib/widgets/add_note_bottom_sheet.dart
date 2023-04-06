import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:note_app/cubits/add_note_cubit/add_note_state.dart';
import 'package:note_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:note_app/widgets/add_note_form.dart';

class AddNoteBottomSheet extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit,AddNoteState>(
        listener: (context , state)
        {
           if(state is AddNoteFailure)
             {

             }
           if(state is AddNoteSuccess)
             {
               BlocProvider.of<NotesCubit>(context).fetchAllNotes();
               Navigator.pop(context);
             }
        },
        builder: (context , state)
        {
          return AbsorbPointer(
            absorbing: state is AddNoteLoading ? true : false,
            child:  Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16.0,
                bottom:  MediaQuery.of(context).viewInsets.bottom,
              ),
              child: SingleChildScrollView(
                  child: AddNoteForm(),
              ),
            ),
          );
        },
      ),
    );
  }
}
