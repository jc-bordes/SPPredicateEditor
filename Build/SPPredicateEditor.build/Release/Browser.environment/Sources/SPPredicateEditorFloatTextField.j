@STATIC;1.0;I;20;AppKit/CPTextField.jt;2015;
objj_executeFile("AppKit/CPTextField.j",NO);
var _1=objj_allocateClassPair(CPTextField,"SPPredicateEditorUnsignedFloatTextField"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("keyDown:"),function(_3,_4,_5){
with(_3){
if(objj_msgSend(_3,"isCharacterValid:",objj_msgSend(_5,"characters"))){
objj_msgSendSuper({receiver:_3,super_class:objj_getClass("SPPredicateEditorUnsignedFloatTextField").super_class},"keyDown:",_5);
return;
}
objj_msgSend(objj_msgSend(objj_msgSend(_3,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",NO);
}
}),new objj_method(sel_getUid("isCharacterValid:"),function(_6,_7,_8){
with(_6){
var _9=_8.charCodeAt(0);
var _a=objj_msgSend(_6,"selectedRange");
if(_9==46){
var _b=objj_msgSend(_6,"stringValue");
if(_b.length&&_b.indexOf(".")>=0){
return NO;
}
return YES;
}
if(_9==27||_9==13||_9==8||_9==127||_9>63232||(_9>=48&&_9<=57)){
return YES;
}
return NO;
}
})]);
var _1=objj_allocateClassPair(CPTextField,"SPPredicateEditorFloatTextField"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("keyDown:"),function(_c,_d,_e){
with(_c){
if(objj_msgSend(_c,"isCharacterValid:",objj_msgSend(_e,"characters"))){
objj_msgSendSuper({receiver:_c,super_class:objj_getClass("SPPredicateEditorFloatTextField").super_class},"keyDown:",_e);
return;
}
objj_msgSend(objj_msgSend(objj_msgSend(_c,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",NO);
}
}),new objj_method(sel_getUid("isCharacterValid:"),function(_f,_10,str){
with(_f){
var _11=str.charCodeAt(0);
var _12=objj_msgSend(_f,"selectedRange");
if(_11==46){
var _13=objj_msgSend(_f,"stringValue");
if(_13.length){
if(_13.indexOf(".")>=0){
return NO;
}
if(_12.location>0){
return YES;
}
var _14=objj_msgSend(_13,"characterAtIndex:",0);
if(_14=="-"||_14=="+"){
return NO;
}
return YES;
}
return YES;
}
if(_12.location==0&&(_11==43||_11==45)){
return YES;
}
if(_11==27||_11==13||_11==8||_11>63232||_11==127||(_11>=48&&_11<=57)){
return YES;
}
return NO;
}
})]);
