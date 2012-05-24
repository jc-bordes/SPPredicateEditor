@STATIC;1.0;I;21;Foundation/CPObject.jI;15;AppKit/CPView.jI;19;AppKit/CPMenuItem.jt;4028;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("AppKit/CPView.j",NO);
objj_executeFile("AppKit/CPMenuItem.j",NO);
var _1=objj_allocateClassPair(CPObject,"SPRuleEditorCriterion"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_items"),new objj_ivar("_displayValue"),new objj_ivar("_currentIndex"),new objj_ivar("_hidden")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("items"),function(_3,_4){
with(_3){
return _items;
}
}),new objj_method(sel_getUid("setItems:"),function(_5,_6,_7){
with(_5){
_items=_7;
}
}),new objj_method(sel_getUid("displayValue"),function(_8,_9){
with(_8){
return _displayValue;
}
}),new objj_method(sel_getUid("setDisplayValue:"),function(_a,_b,_c){
with(_a){
_displayValue=_c;
}
}),new objj_method(sel_getUid("currentIndex"),function(_d,_e){
with(_d){
return _currentIndex;
}
}),new objj_method(sel_getUid("setCurrentIndex:"),function(_f,_10,_11){
with(_f){
_currentIndex=_11;
}
}),new objj_method(sel_getUid("hidden"),function(_12,_13){
with(_12){
return _hidden;
}
}),new objj_method(sel_getUid("setHidden:"),function(_14,_15,_16){
with(_14){
_hidden=_16;
}
}),new objj_method(sel_getUid("init"),function(_17,_18){
with(_17){
_17=objj_msgSendSuper({receiver:_17,super_class:objj_getClass("SPRuleEditorCriterion").super_class},"init");
if(!_17){
return nil;
}
_items=nil;
_displayValue=nil;
_currentIndex=-1;
_hidden=NO;
return _17;
}
}),new objj_method(sel_getUid("initWithItems:displayValue:"),function(_19,_1a,_1b,_1c){
with(_19){
_19=objj_msgSendSuper({receiver:_19,super_class:objj_getClass("SPRuleEditorCriterion").super_class},"init");
if(!_19){
return nil;
}
_items=_1b;
_displayValue=_1c;
_currentIndex=objj_msgSend(_19,"isEmpty")?-1:0;
return _19;
}
}),new objj_method(sel_getUid("currentItem"),function(_1d,_1e){
with(_1d){
if(_currentIndex==-1){
return nil;
}
var _1f=_items?objj_msgSend(_items,"count"):0;
if(!_1f||_currentIndex>=_1f){
return nil;
}
return objj_msgSend(_items,"objectAtIndex:",_currentIndex);
}
}),new objj_method(sel_getUid("isEmpty"),function(_20,_21){
with(_20){
return !_items||objj_msgSend(_items,"count")==0;
}
}),new objj_method(sel_getUid("isStandaloneView"),function(_22,_23){
with(_22){
return _items&&objj_msgSend(_items,"count")==1&&!(objj_msgSend(_items[0],"isKindOfClass:",CPMenuItem));
}
}),new objj_method(sel_getUid("isValid"),function(_24,_25){
with(_24){
if(objj_msgSend(_24,"isEmpty")){
return NO;
}
if(objj_msgSend(_24,"isStandaloneView")){
return YES;
}
var _26;
var _27=objj_msgSend(_items,"count");
for(var i=0;i<_27;i++){
_26=_items[i];
if(!(objj_msgSend(_26,"isKindOfClass:",CPMenuItem)||objj_msgSend(_26,"isKindOfClass:",CPString))){
return NO;
}
}
return YES;
}
}),new objj_method(sel_getUid("isMenu"),function(_28,_29){
with(_28){
return !objj_msgSend(_28,"isStandaloneView")&&objj_msgSend(_28,"isValid");
}
}),new objj_method(sel_getUid("standaloneView"),function(_2a,_2b){
with(_2a){
if(!objj_msgSend(_2a,"isStandaloneView")){
return nil;
}
return _items[0];
}
})]);
var _2c="items";
var _2d="displayValue";
var _2e="currentIndex";
var _2f="hidden";
var _1=objj_getClass("SPRuleEditorCriterion");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"SPRuleEditorCriterion\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_30,_31,_32){
with(_30){
_30=objj_msgSendSuper({receiver:_30,super_class:objj_getClass("SPRuleEditorCriterion").super_class},"init");
if(!_30){
return nil;
}
_items=objj_msgSend(_32,"decodeObjectForKey:",_2c);
_displayValue=objj_msgSend(_32,"decodeObjectForKey:",_2d);
_currentIndex=objj_msgSend(_32,"decodeIntForKey:",_2e);
_hidden=objj_msgSend(_32,"decodeBoolForKey:",_2f);
return _30;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_33,_34,_35){
with(_33){
objj_msgSend(_35,"encodeObject:forKey:",_items,_2c);
objj_msgSend(_35,"encodeObject:forKey:",_displayValue,_2d);
objj_msgSend(_35,"encodeInt:forKey:",_currentIndex,_2e);
objj_msgSend(_35,"encodeBool:forKey:",_hidden,_2f);
}
})]);
