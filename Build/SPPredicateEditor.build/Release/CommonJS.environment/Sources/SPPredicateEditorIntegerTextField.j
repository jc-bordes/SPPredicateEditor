@STATIC;1.0;I;20;AppKit/CPTextField.jt;1611;
objj_executeFile("AppKit/CPTextField.j",NO);
var _1=objj_allocateClassPair(CPTextField,"SPPredicateEditorUnsignedIntegerTextField"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("keyDown:"),function(_3,_4,_5){
with(_3){
if(objj_msgSend(_3,"isCharacterValid:",objj_msgSend(_5,"characters"))){
objj_msgSendSuper({receiver:_3,super_class:objj_getClass("SPPredicateEditorUnsignedIntegerTextField").super_class},"keyDown:",_5);
return;
}
objj_msgSend(objj_msgSend(objj_msgSend(_3,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",NO);
}
}),new objj_method(sel_getUid("isCharacterValid:"),function(_6,_7,_8){
with(_6){
var _9=_8.charCodeAt(0);
if(_9==27||_9==13||_9==8||_9==127||_9>63232||(_9>=48&&_9<=57)){
return YES;
}
return NO;
}
})]);
var _1=objj_allocateClassPair(CPTextField,"SPPredicateEditorIntegerTextField"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("keyDown:"),function(_a,_b,_c){
with(_a){
if(objj_msgSend(_a,"isCharacterValid:",objj_msgSend(_c,"characters"))){
objj_msgSendSuper({receiver:_a,super_class:objj_getClass("SPPredicateEditorIntegerTextField").super_class},"keyDown:",_c);
return;
}
objj_msgSend(objj_msgSend(objj_msgSend(_a,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",NO);
}
}),new objj_method(sel_getUid("isCharacterValid:"),function(_d,_e,_f){
with(_d){
var _10=_f.charCodeAt(0);
var _11=objj_msgSend(_d,"selectedRange");
if(_11.location==0&&(_10==43||_10==45)){
return YES;
}
if(_10==27||_10==13||_10==8||_10>63232||_10==127||(_10>=48&&_10<=57)){
return YES;
}
return NO;
}
})]);
