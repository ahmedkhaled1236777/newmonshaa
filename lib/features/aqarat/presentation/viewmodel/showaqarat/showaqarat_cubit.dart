import 'dart:collection';
import 'dart:io';

import 'package:ghhg/core/commn/toast.dart';
import 'package:ghhg/features/aqarat/data/models/showstate/datum.dart';
import 'package:ghhg/features/aqarat/data/repos/showaqar/showaqarrepoimplementation.dart';
import 'package:ghhg/features/auth/login/presentation/views/login.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:printing/printing.dart';

part 'showaqarat_state.dart';

class ShowaqaratCubit extends Cubit<ShowaqaratState> {
  final showaqqarrepoimplementation showaqar;
  double offset = 0.0;
    List<XFile>images=[];
    List sharedimages=[];

  bool search = true;
  List<Datum> data = [];
  Map<String, dynamic>? queryParameters;
  ScrollController scrollController = ScrollController();
  ShowaqaratCubit({required this.showaqar}) : super(ShowaqaratInitial());

  int page = 1;
  bool loading = false;
  getallaqarat({
    required String token,
    required int page,
  }) async {
    emit(Showaqaratloading());
    this.page = 1;
    var result = await showaqar.showaqar(
        token: token, page: page, queryParameters: queryParameters);
    loading = true;
    result.fold((failue) {
      emit(Showaqaratfailure(error_message: failue.error_message));
    }, (success) {
      if (success.data!.links?.next == null) {
        loading = false;
      }
      data.clear();
      data.addAll(success.data!.data!);
      emit(Showaqaratsuccess());
    });
  }

  getamorellaqarat({required String token}) async {
    page++;
    var result = await showaqar.showaqar(
        token: token, page: page, queryParameters: queryParameters);
    loading = true;
    result.fold((failue) {
      emit(Showaqaratfailure(error_message: failue.error_message));
    }, (success) {
      if (success.data!.links?.next == null) {
        loading = false;
      }
      data.addAll(success.data!.data!);
      emit(Showaqaratsuccess());
    });
  }

  deleteaqar({required String token, required int aqarnumber}) async {
    emit(deleteaqarloading());
    var result =
        await showaqar.deleteaqar(token: token, aqarnumber: aqarnumber);
    result.fold((failure) {
      emit(deleteaqarfailure(error_message: failure.error_message));
    }, (success) {
      data.removeWhere((element) => element.id == aqarnumber);
      emit(deleteaqarsuccess(successmessage: success));
    });
  }
  getimages({required List dataimages}){
    images=[];
    int i=0;
    emit(imagesloading());
    try{
   dataimages.forEach((Element) async {
var response =await http.get(Uri.parse(Element));
  final bytes=response.bodyBytes;
                    final temp=await getTemporaryDirectory();
                    final path='${temp.path}/image${i}.jpg';
                   File(path).writeAsBytesSync(bytes);
                   images.add(XFile(path));
                   i++;
        if(dataimages.length==images.length)                    {       
           emit(imagessuccess());}

                                    }) ; 
                                    }
                                    catch(e){
                                      emit(imagesfailure());
                                    }
  }
  getsharedimages({required List dataimages}) async {
    emit(sharedimagesloading());
    try{
         sharedimages =[];
                                             for (var element in dataimages!) {
                                               sharedimages.add( await networkImage(element)
                                             );
                                             }
                                             emit(sharedimagessuccess());
                                              
  }catch(e){
emit(sharedimagesfailure());
  }
}}
