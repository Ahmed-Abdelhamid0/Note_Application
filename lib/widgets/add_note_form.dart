
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:note_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:note_app/cubits/add_note_cubit/add_note_state.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/colors_list_view.dart';
import 'package:note_app/widgets/custom_buttom.dart';
import 'package:note_app/widgets/custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  String? title;
  String? subTitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: Column(
        children:
        [
          SizedBox(height: 32.0,),
          CustomTextFormField(
            onSaved: (value)
            {
              title = value;
            },
            hint: 'Title',
          ),
          SizedBox(height: 15.0,),
          CustomTextFormField(
            onSaved: (value)
            {
              subTitle=value;
            },
            hint: 'Content',
            maxLines: 5,
          ),
          SizedBox(height: 15.0,),
          ColorsListView(),
          SizedBox(height: 15.0,),
          BlocBuilder<AddNoteCubit , AddNoteState>(
            builder: (context , state)
            {
              return  buildCustomButton(state, context);
            },
          ),
          SizedBox(height: 16.0,),
        ],
      ),
    );
  }

  CustomButton buildCustomButton(AddNoteState state, BuildContext context) {
    return CustomButton(
              isLoading: state is AddNoteLoading ? true : false,
              onTap: ()
              {
                if(formKey.currentState!.validate())
                {
                  formKey.currentState!.save();
                  var currentDate = DateTime.now();
                  var formattedCurrentDate =
                  DateFormat('dd/MM/yyyy').format(currentDate);
                  var noteModel = NoteModel(
                    title: title!,
                    subTitle: subTitle!,
                    date:formattedCurrentDate ,
                    color:Colors.blue.value ,
                  );
                  BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);

                }else
                {
                  autoValidateMode = AutovalidateMode.always;
                  setState(() {

                  });
                }
              },
            );
  }
}

