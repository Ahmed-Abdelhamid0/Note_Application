import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/constants/constants.dart';
import 'package:note_app/cubits/add_note_cubit/add_note_state.dart';
import 'package:note_app/models/note_model.dart';

class AddNoteCubit extends Cubit <AddNoteState>
{
AddNoteCubit() : super (AddNoteInitial());
 Color color =  Color(0xFFED254E);
addNote(NoteModel note) async
  {
    note.color = color.value;
    emit(AddNoteLoading());
    try {
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      await  notesBox.add(note);
      emit(AddNoteSuccess());
    } catch (error) {
      emit(AddNoteFailure(error.toString()));

    }
  }
}

