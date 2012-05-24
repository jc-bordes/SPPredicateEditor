@STATIC;1.0;I;20;AppKit/CPTextField.jt;2192;objj_executeFile("AppKit/CPTextField.j", NO);
{var the_class = objj_allocateClassPair(CPTextField, "SPPredicateEditorUnsignedIntegerTextField"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("keyDown:"), function $SPPredicateEditorUnsignedIntegerTextField__keyDown_(self, _cmd, anEvent)
{ with(self)
{
 if(objj_msgSend(self, "isCharacterValid:", objj_msgSend(anEvent, "characters")))
 {
  objj_msgSendSuper({ receiver:self, super_class:objj_getClass("SPPredicateEditorUnsignedIntegerTextField").super_class }, "keyDown:", anEvent);
  return;
 }
 objj_msgSend(objj_msgSend(objj_msgSend(self, "window"), "platformWindow"), "_propagateCurrentDOMEvent:", NO);
}
},["void","CPEvent"]), new objj_method(sel_getUid("isCharacterValid:"), function $SPPredicateEditorUnsignedIntegerTextField__isCharacterValid_(self, _cmd, str)
{ with(self)
{
 var code=str.charCodeAt(0);
 if(code==0x1B||code==0xD||code==0x8||code==0x7F||code>0xF700||(code>=0x30&&code<=0x39))
  return YES;
 return NO;
}
},["BOOL","CPString"])]);
}
{var the_class = objj_allocateClassPair(CPTextField, "SPPredicateEditorIntegerTextField"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("keyDown:"), function $SPPredicateEditorIntegerTextField__keyDown_(self, _cmd, anEvent)
{ with(self)
{
 if(objj_msgSend(self, "isCharacterValid:", objj_msgSend(anEvent, "characters")))
 {
  objj_msgSendSuper({ receiver:self, super_class:objj_getClass("SPPredicateEditorIntegerTextField").super_class }, "keyDown:", anEvent);
  return;
 }
 objj_msgSend(objj_msgSend(objj_msgSend(self, "window"), "platformWindow"), "_propagateCurrentDOMEvent:", NO);
}
},["void","CPEvent"]), new objj_method(sel_getUid("isCharacterValid:"), function $SPPredicateEditorIntegerTextField__isCharacterValid_(self, _cmd, str)
{ with(self)
{
 var code=str.charCodeAt(0);
 var range=objj_msgSend(self, "selectedRange");
 if(range.location==0&&(code==0x2B||code==0x2D))
  return YES;
 if(code==0x1B||code==0xD||code==0x8||code>0xF700||code==0x7F||(code>=0x30&&code<=0x39))
  return YES;
 return NO;
}
},["BOOL","CPString"])]);
}

