@STATIC;1.0;I;21;Foundation/CPObject.jI;15;AppKit/CPView.jI;19;AppKit/CPMenuItem.jt;5486;objj_executeFile("Foundation/CPObject.j", NO);
objj_executeFile("AppKit/CPView.j", NO);
objj_executeFile("AppKit/CPMenuItem.j", NO);
{var the_class = objj_allocateClassPair(CPObject, "SPRuleEditorCriterion"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_items"), new objj_ivar("_displayValue"), new objj_ivar("_currentIndex"), new objj_ivar("_hidden")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("items"), function $SPRuleEditorCriterion__items(self, _cmd)
{ with(self)
{
return _items;
}
},["id"]),
new objj_method(sel_getUid("setItems:"), function $SPRuleEditorCriterion__setItems_(self, _cmd, newValue)
{ with(self)
{
_items = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("displayValue"), function $SPRuleEditorCriterion__displayValue(self, _cmd)
{ with(self)
{
return _displayValue;
}
},["id"]),
new objj_method(sel_getUid("setDisplayValue:"), function $SPRuleEditorCriterion__setDisplayValue_(self, _cmd, newValue)
{ with(self)
{
_displayValue = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("currentIndex"), function $SPRuleEditorCriterion__currentIndex(self, _cmd)
{ with(self)
{
return _currentIndex;
}
},["id"]),
new objj_method(sel_getUid("setCurrentIndex:"), function $SPRuleEditorCriterion__setCurrentIndex_(self, _cmd, newValue)
{ with(self)
{
_currentIndex = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("hidden"), function $SPRuleEditorCriterion__hidden(self, _cmd)
{ with(self)
{
return _hidden;
}
},["id"]),
new objj_method(sel_getUid("setHidden:"), function $SPRuleEditorCriterion__setHidden_(self, _cmd, newValue)
{ with(self)
{
_hidden = newValue;
}
},["void","id"]), new objj_method(sel_getUid("init"), function $SPRuleEditorCriterion__init(self, _cmd)
{ with(self)
{
 self=objj_msgSendSuper({ receiver:self, super_class:objj_getClass("SPRuleEditorCriterion").super_class }, "init");
 if(!self)
  return nil;
 _items=nil;
 _displayValue=nil;
 _currentIndex=-1;
 _hidden=NO;
 return self;
}
},["id"]), new objj_method(sel_getUid("initWithItems:displayValue:"), function $SPRuleEditorCriterion__initWithItems_displayValue_(self, _cmd, items, value)
{ with(self)
{
 self=objj_msgSendSuper({ receiver:self, super_class:objj_getClass("SPRuleEditorCriterion").super_class }, "init");
 if(!self)
  return nil;
 _items=items;
 _displayValue=value;
 _currentIndex=objj_msgSend(self, "isEmpty")?-1:0;
 return self;
}
},["id","CPArray","id"]), new objj_method(sel_getUid("currentItem"), function $SPRuleEditorCriterion__currentItem(self, _cmd)
{ with(self)
{
 if(_currentIndex==-1)
  return nil;
 var count=_items?objj_msgSend(_items, "count"):0;
 if(!count||_currentIndex>=count)
  return nil;
 return objj_msgSend(_items, "objectAtIndex:", _currentIndex);
}
},["id"]), new objj_method(sel_getUid("isEmpty"), function $SPRuleEditorCriterion__isEmpty(self, _cmd)
{ with(self)
{
 return !_items||objj_msgSend(_items, "count")==0;
}
},["BOOL"]), new objj_method(sel_getUid("isStandaloneView"), function $SPRuleEditorCriterion__isStandaloneView(self, _cmd)
{ with(self)
{
 return _items&&objj_msgSend(_items, "count")==1&&!(objj_msgSend(_items[0], "isKindOfClass:", CPMenuItem));
}
},["BOOL"]), new objj_method(sel_getUid("isValid"), function $SPRuleEditorCriterion__isValid(self, _cmd)
{ with(self)
{
 if(objj_msgSend(self, "isEmpty"))
  return NO;
 if(objj_msgSend(self, "isStandaloneView"))
  return YES;
 var item;
 var count=objj_msgSend(_items, "count");
 for(var i=0;i<count;i++)
 {
  item=_items[i];
  if(!(objj_msgSend(item, "isKindOfClass:", CPMenuItem)||objj_msgSend(item, "isKindOfClass:", CPString)))
   return NO;
 }
 return YES;
}
},["BOOL"]), new objj_method(sel_getUid("isMenu"), function $SPRuleEditorCriterion__isMenu(self, _cmd)
{ with(self)
{
 return !objj_msgSend(self, "isStandaloneView")&&objj_msgSend(self, "isValid");
}
},["BOOL"]), new objj_method(sel_getUid("standaloneView"), function $SPRuleEditorCriterion__standaloneView(self, _cmd)
{ with(self)
{
 if(!objj_msgSend(self, "isStandaloneView"))
  return nil;
 return _items[0];
}
},["CPView"])]);
}
var ItemsKey="items";
var DisplayValueKey="displayValue";
var CurrentIndexKey="currentIndex";
var HiddenKey="hidden";
{
var the_class = objj_getClass("SPRuleEditorCriterion")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"SPRuleEditorCriterion\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $SPRuleEditorCriterion__initWithCoder_(self, _cmd, coder)
{ with(self)
{
    self=objj_msgSendSuper({ receiver:self, super_class:objj_getClass("SPRuleEditorCriterion").super_class }, "init");
    if(!self)
     return nil;
    _items=objj_msgSend(coder, "decodeObjectForKey:", ItemsKey);
    _displayValue=objj_msgSend(coder, "decodeObjectForKey:", DisplayValueKey);
    _currentIndex=objj_msgSend(coder, "decodeIntForKey:", CurrentIndexKey);
    _hidden=objj_msgSend(coder, "decodeBoolForKey:", HiddenKey);
    return self;
}
},["id","id"]), new objj_method(sel_getUid("encodeWithCoder:"), function $SPRuleEditorCriterion__encodeWithCoder_(self, _cmd, coder)
{ with(self)
{
    objj_msgSend(coder, "encodeObject:forKey:", _items, ItemsKey);
    objj_msgSend(coder, "encodeObject:forKey:", _displayValue, DisplayValueKey);
    objj_msgSend(coder, "encodeInt:forKey:", _currentIndex, CurrentIndexKey);
    objj_msgSend(coder, "encodeBool:forKey:", _hidden, HiddenKey);
}
},["void","id"])]);
}

