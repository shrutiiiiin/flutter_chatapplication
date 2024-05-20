import 'package:flutter/material.dart';


const TextFieldDecoration = InputDecoration(
  hintText: '',
  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 1),
    borderRadius: BorderRadius.all(Radius.circular(20)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide( color: Colors.white38, width: 2),
    borderRadius: BorderRadius.all(Radius.circular(20)),
  ), // Hint text
);