@STATIC;1.0;I;17;AppKit/CPButton.jt;2054;
objj_executeFile("AppKit/CPButton.j",NO);
var _1;
var _2;
var _3="progid:DXImageTransform.Microsoft.gradient(startColorstr='#fcfcfc', endColorstr='#dfdfdf')";
var _4=objj_allocateClassPair(CPButton,"SPRuleEditorActionButton"),_5=_4.isa;
class_addIvars(_4,[new objj_ivar("radius")]);
objj_registerClassPair(_4);
class_addMethods(_4,[new objj_method(sel_getUid("initWithFrame:"),function(_6,_7,_8){
with(_6){
_6=objj_msgSendSuper({receiver:_6,super_class:objj_getClass("SPRuleEditorActionButton").super_class},"initWithFrame:",_8);
if(_6){
objj_msgSend(_6,"setFont:",objj_msgSend(CPFont,"boldFontWithName:size:","Apple Symbol",12));
objj_msgSend(_6,"setTextColor:",objj_msgSend(CPColor,"colorWithWhite:alpha:",150/255,1));
objj_msgSend(_6,"setAlignment:",CPCenterTextAlignment);
objj_msgSend(_6,"setAutoresizingMask:",CPViewMinXMargin);
objj_msgSend(_6,"setImagePosition:",CPImageOnly);
objj_msgSend(_6,"setBordered:",NO);
var _9=_DOMElement.style;
_9.border="1px solid rgb(189, 189, 189)";
_9.filter=_3;
}
return _6;
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_a,_b){
with(_a){
radius=FLOOR(CGRectGetHeight(objj_msgSend(_a,"bounds"))/2);
var _c=_DOMElement.style,_d=radius+"px";
_c.borderRadius=_d;
_c.backgroundImage=(objj_msgSend(_a,"isHighlighted"))?_2:_1;
objj_msgSendSuper({receiver:_a,super_class:objj_getClass("SPRuleEditorActionButton").super_class},"layoutSubviews");
}
}),new objj_method(sel_getUid("acceptsFirstResponder"),function(_e,_f){
with(_e){
return NO;
}
})]);
class_addMethods(_5,[new objj_method(sel_getUid("initialize"),function(_10,_11){
with(_10){
if(CPBrowserIsEngine(CPWebKitBrowserEngine)){
_1="-webkit-gradient(linear, left top, left bottom, from(rgb(252, 252, 252)), to(rgb(223, 223, 223)))";
_2="-webkit-gradient(linear, left top, left bottom, from(rgb(223, 223, 223)), to(rgb(252, 252, 252)))";
}else{
if(CPBrowserIsEngine(CPGeckoBrowserEngine)){
_1="-moz-linear-gradient(top,  rgb(252, 252, 252),  rgb(223, 223, 223))";
_2="-moz-linear-gradient(top,  rgb(223, 223, 223),  rgb(252, 252, 252))";
}
}
}
})]);
