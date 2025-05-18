import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';

import '../../../core/app_theme/app_sizes.dart';
import '../../books/data/domain/book.dart';
import '../../books/presentation/controllers/book_controller.dart';
import '../../shared/file_provider.dart';
import '../../shared/image_provider.dart';
import '../../shared/validator_provider.dart';


class BookEditForm extends ConsumerStatefulWidget {
  final Book book;
  const BookEditForm({super.key,required this.book});

  @override
  ConsumerState createState() => _BookEditFormState();
}

class _BookEditFormState extends ConsumerState<BookEditForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    ref.listen(bookControllerProvider, (prev, next) {
      next.maybeWhen(
        data: (data) {
          context.pop();
        },
        error:
            (err, st) => ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(err.toString()))),
        orElse: () => null,
      );
    });

    final file = ref.watch(fileControllerProvider);
    final image = ref.watch(imageControllerProvider);
    final bookState = ref.watch(bookControllerProvider);
    final mode = ref.watch(validateModeControllerProvider(id: 3));
    return Scaffold(
      appBar: AppBar(title: const Text('Book Form')),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FormBuilder(
          autovalidateMode: mode,
          key: _formKey,
          child: ListView(
            children: [
              FormBuilderTextField(
                name: 'title',
                initialValue: widget.book.title,
                decoration: InputDecoration(hintText: 'Title'),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
              ),
              AppSizes.gapH16,

              FormBuilderTextField(
                name: 'author',
                initialValue: widget.book.author,
                decoration: InputDecoration(hintText: 'Author'),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
              ),
              AppSizes.gapH16,
              FormBuilderTextField(
                name: 'publisher',
                initialValue: widget.book.publisher,
                decoration: InputDecoration(hintText: 'Publisher'),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
              ),
              AppSizes.gapH16,
              FormBuilderTextField(
                name: 'price',
                initialValue: widget.book.price.toString(),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: 'Price'),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
              ),
              AppSizes.gapH16,
              FormBuilderTextField(
                name: 'description',
                initialValue: widget.book.description,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(hintText: 'description'),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
              ),
              AppSizes.gapH16,
              FormBuilderDropdown(
                name: 'genre',
                initialValue: widget.book.genre,
                hint: Text('Genre'),
                items: [
                  DropdownMenuItem(value: 'Fiction', child: Text('Fiction')),
                  DropdownMenuItem(
                    value: 'Non-Fiction',
                    child: Text('Non-Fiction'),
                  ),
                  DropdownMenuItem(
                    value: 'Biography',
                    child: Text('Biography'),
                  ),
                  DropdownMenuItem(
                    value: 'Self-Help',
                    child: Text('Self-Help'),
                  ),
                  DropdownMenuItem(value: 'Poetry', child: Text('Poetry')),
                  DropdownMenuItem(value: 'History', child: Text('History')),
                ],
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
              ),
              AppSizes.gapH16,
              AppSizes.gapH16,

              InkWell(
                onTap: () {
                  ref.read(imageControllerProvider.notifier).pickImage();
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  height: 100,
                  child:
                  image == null
                      ? CachedNetworkImage(imageUrl: widget.book.image)
                      : Image.file(File(image.path)),
                ),
              ),
              AppSizes.gapH16,
              AppSizes.gapH16,
              InkWell(
                onTap: () {
                  ref.read(fileControllerProvider.notifier).pickFile();
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  height: 50,
                  child: Center(
                    child: Text(file == null ? widget.book.file : file.path),
                  ),
                ),
              ),
              AppSizes.gapH16,
              AppSizes.gapH16,

              ElevatedButton(
                onPressed:
                bookState.isLoading
                    ? null
                    : () {
                  if (_formKey.currentState!.saveAndValidate(
                    focusOnInvalid: false,
                  )) {
                    final map = _formKey.currentState!.value;
                    if (file != null && image != null) {
                      ref
                          .read(bookControllerProvider.notifier)
                          .addBook(
                        file: file,
                        image: image,
                        title: map['title'],
                        genre: map['genre'],
                        price: int.parse(map['price']),
                        publisher: map['publisher'],
                        author: map['author'],
                        description: map['description'],
                      );
                    } else {
                      ScaffoldMessenger.of(
                        context,
                      ).hideCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: Duration(seconds: 1),
                          content: Text(
                            'Please Select an Image And File',
                          ),
                        ),
                      );
                    }
                  } else {
                    ref
                        .read(
                      validateModeControllerProvider(
                        id: 3,
                      ).notifier,
                    )
                        .change();
                  }
                },
                child:
                bookState.isLoading
                    ? Center(child: CircularProgressIndicator())
                    : Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
