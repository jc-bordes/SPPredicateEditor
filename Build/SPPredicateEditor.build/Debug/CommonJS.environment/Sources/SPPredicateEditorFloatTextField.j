@STATIC;1.0;I;20;AppKit/CPTextField.jt;2687;objj_executeFile("AppKit/CPTextField.j", NO);
{var the_class = objj_allocateClassPair(CPTextField, "SPPredicateEditorUnsignedFloatTextField"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("keyDown:"), function $SPPredicateEditorUnsignedFloatTextField__keyDown_(self, _cmd, anEvent)
{ with(self)
{
 if(objj_msgSend(self, "isCharacterValid:", objj_msgSend(anEvent, "characters")))
 {
  objj_msgSendSuper({ receiver:self, super_class:objj_getClass("SPPredicateEditorUnsignedFloatTextField").super_class }, "keyDown:", anEvent);
  return;
 }
 objj_msgSend(objj_msgSend(objj_msgSend(self, "window"), "platformWindow"), "_propagateCurrentDOMEvent:", NO);
}
},["void","CPEvent"]), new objj_method(sel_getUid("isCharacterValid:"), function $SPPredicateEditorUnsignedFloatTextField__isCharacterValid_(self, _cmd, str)
{ with(self)
{
 var code=str.charCodeAt(0);
 var range=objj_msgSend(self, "selectedRange");
 if(code==0x2E)
 {
  var value=objj_msgSend(self, "stringValue");
  if(value.length&&value.indexOf(".")>=0)
   return NO;
  return YES;
 }
 if(code==0x1B||code==0xD||code==0x8||code==0x7F||code>0xF700||(code>=0x30&&code<=0x39))
  return YES;
 return NO;
}
},["BOOL","CPString"])]);
}
{var the_class = objj_allocateClassPair(CPTextField, "SPPredicateEditorFloatTextField"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("keyDown:"), function $SPPredicateEditorFloatTextField__keyDown_(self, _cmd, anEvent)
{ with(self)
{
 if(objj_msgSend(self, "isCharacterValid:", objj_msgSend(anEvent, "characters")))
 {
  objj_msgSendSuper({ receiver:self, super_class:objj_getClass("SPPredicateEditorFloatTextField").super_class }, "keyDown:", anEvent);
  return;
 }
 objj_msgSend(objj_msgSend(objj_msgSend(self, "window"), "platformWindow"), "_propagateCurrentDOMEvent:", NO);
}
},["void","CPEvent"]), new objj_method(sel_getUid("isCharacterValid:"), function $SPPredicateEditorFloatTextField__isCharacterValid_(self, _cmd, str)
{ with(self)
{
 var code=str.charCodeAt(0);
 var range=objj_msgSend(self, "selectedRange");
 if(code==0x2E)
 {
  var value=objj_msgSend(self, "stringValue");
  if(value.length)
  {
   if(value.indexOf(".")>=0)
    return NO;
   if(range.location>0)
    return YES;
   var firstChar=objj_msgSend(value, "characterAtIndex:", 0);
   if(firstChar=="-"||firstChar=="+")
    return NO;
   return YES;
  }
  return YES;
 }
 if(range.location==0&&(code==0x2B||code==0x2D))
  return YES;
 if(code==0x1B||code==0xD||code==0x8||code>0xF700||code==0x7F||(code>=0x30&&code<=0x39))
  return YES;
 return NO;
}
},["BOOL","CPString"])]);
}

