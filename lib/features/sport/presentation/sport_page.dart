import 'package:flutter/material.dart';
class SportPage extends StatelessWidget { const SportPage({super.key}); @override Widget build(BuildContext context)=>const _PillarPage(title:'Sport'); }
class _PillarPage extends StatelessWidget { const _PillarPage({required this.title}); final String title; @override Widget build(BuildContext context)=>Scaffold(appBar: AppBar(title: Text(title)), body: const Center(child: Text('Empty state + placeholder cards'))); }
