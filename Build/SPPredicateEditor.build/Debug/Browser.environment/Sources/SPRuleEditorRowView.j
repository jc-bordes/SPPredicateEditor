@STATIC;1.0;I;21;Foundation/CPObject.jI;15;AppKit/CPView.jI;17;AppKit/CPButton.jI;20;AppKit/CPTextField.jI;15;AppKit/CPMenu.jI;22;AppKit/CPPopUpButton.jI;17;AppKit/CPButton.ji;23;SPRuleEditorCriterion.ji;25;SPRuleEditorPopUpButton.ji;26;SPRuleEditorActionButton.jt;41537;objj_executeFile("Foundation/CPObject.j", NO);
objj_executeFile("AppKit/CPView.j", NO);
objj_executeFile("AppKit/CPButton.j", NO);
objj_executeFile("AppKit/CPTextField.j", NO);
objj_executeFile("AppKit/CPMenu.j", NO);
objj_executeFile("AppKit/CPPopUpButton.j", NO);
objj_executeFile("AppKit/CPButton.j", NO);
objj_executeFile("SPRuleEditorCriterion.j", YES);
objj_executeFile("SPRuleEditorPopUpButton.j", YES);
objj_executeFile("SPRuleEditorActionButton.j", YES);
var GRADIENT_NORMAL;
var GRADIENT_HIGHLIGHTED;
IE_FILTER = "progid:DXImageTransform.Microsoft.gradient(startColorstr='#fcfcfc', endColorstr='#dfdfdf')";
SPRuleEditorRowViewRightMargin=10;
SPRuleEditorRowViewLeftMargin=10;
SPRuleEditorRowViewVerticalMargin=4;
SPRuleEditorRowViewButtonHeight=14;
SPRuleEditorRowViewButtonSpacing=6;
SPRuleEditorRowViewCriterionHeight=18;
SPRuleEditorRowViewPopUpHeight=14;
SPRuleEditorRowViewCriterionSpacing=10;
SPRuleEditorRowViewDragIndicatorHeight=3;
SPRuleEditorViewAltKeyDown = "SPRuleEditorViewAltKeyDown";
SPRuleEditorViewAltKeyUp = "SPRuleEditorViewAltKeyUp";
{var the_class = objj_allocateClassPair(CPView, "SPRuleEditorRowView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_contentView"), new objj_ivar("_subrowsView"), new objj_ivar("_delegate"), new objj_ivar("_item"), new objj_ivar("_selected"), new objj_ivar("_nestingMode"), new objj_ivar("_addButton"), new objj_ivar("_removeButton"), new objj_ivar("_editable"), new objj_ivar("_rowHeight"), new objj_ivar("_showDragIndicator"), new objj_ivar("_alternateAddButtonImage"), new objj_ivar("_notificationCenter"), new objj_ivar("nil"), new objj_ivar("_frozenActions"), new objj_ivar("_updating")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("contentView"), function $SPRuleEditorRowView__contentView(self, _cmd)
{ with(self)
{
return _contentView;
}
},["id"]),
new objj_method(sel_getUid("subrowsView"), function $SPRuleEditorRowView__subrowsView(self, _cmd)
{ with(self)
{
return _subrowsView;
}
},["id"]),
new objj_method(sel_getUid("delegate"), function $SPRuleEditorRowView__delegate(self, _cmd)
{ with(self)
{
return _delegate;
}
},["id"]),
new objj_method(sel_getUid("setDelegate:"), function $SPRuleEditorRowView__setDelegate_(self, _cmd, newValue)
{ with(self)
{
_delegate = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("item"), function $SPRuleEditorRowView__item(self, _cmd)
{ with(self)
{
return _item;
}
},["id"]),
new objj_method(sel_getUid("setItem:"), function $SPRuleEditorRowView__setItem_(self, _cmd, newValue)
{ with(self)
{
_item = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("selected"), function $SPRuleEditorRowView__selected(self, _cmd)
{ with(self)
{
return _selected;
}
},["id"]),
new objj_method(sel_getUid("setSelected:"), function $SPRuleEditorRowView__setSelected_(self, _cmd, newValue)
{ with(self)
{
_selected = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("nestingMode"), function $SPRuleEditorRowView__nestingMode(self, _cmd)
{ with(self)
{
return _nestingMode;
}
},["id"]),
new objj_method(sel_getUid("setNestingMode:"), function $SPRuleEditorRowView__setNestingMode_(self, _cmd, newValue)
{ with(self)
{
_nestingMode = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("addButton"), function $SPRuleEditorRowView__addButton(self, _cmd)
{ with(self)
{
return _addButton;
}
},["id"]),
new objj_method(sel_getUid("removeButton"), function $SPRuleEditorRowView__removeButton(self, _cmd)
{ with(self)
{
return _removeButton;
}
},["id"]),
new objj_method(sel_getUid("editable"), function $SPRuleEditorRowView__editable(self, _cmd)
{ with(self)
{
return _editable;
}
},["id"]),
new objj_method(sel_getUid("setEditable:"), function $SPRuleEditorRowView__setEditable_(self, _cmd, newValue)
{ with(self)
{
_editable = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("rowHeight"), function $SPRuleEditorRowView__rowHeight(self, _cmd)
{ with(self)
{
return _rowHeight;
}
},["id"]),
new objj_method(sel_getUid("setRowHeight:"), function $SPRuleEditorRowView__setRowHeight_(self, _cmd, newValue)
{ with(self)
{
_rowHeight = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("showDragIndicator"), function $SPRuleEditorRowView__showDragIndicator(self, _cmd)
{ with(self)
{
return _showDragIndicator;
}
},["id"]),
new objj_method(sel_getUid("setShowDragIndicator:"), function $SPRuleEditorRowView__setShowDragIndicator_(self, _cmd, newValue)
{ with(self)
{
_showDragIndicator = newValue;
}
},["void","id"]), new objj_method(sel_getUid("initWithFrame:"), function $SPRuleEditorRowView__initWithFrame_(self, _cmd, frame)
{ with(self)
{
    self=objj_msgSendSuper({ receiver:self, super_class:objj_getClass("SPRuleEditorRowView").super_class }, "initWithFrame:", frame);
    if(!self)
     return nil;
 objj_msgSend(self, "setThemeClass:", "rule-editor");
 objj_msgSend(self, "setAutoresizingMask:", CPViewWidthSizable);
 _selected=NO;
 _delegate=nil;
 _item=nil;
 _nestingMode=SPRuleEditorRowTypeSimple;
 _editable=YES;
 _rowHeight=frame.size.height;
 _updating=NO;
 _frozenActions=NO;
 _alternateAddButtonImage=objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:", objj_msgSend(objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(SPRuleEditor, "class")), "pathForResource:", "rule-editor-add-compound.png") );
 objj_msgSend(self, "createCriteriaView");
 objj_msgSend(self, "createSubrowsView");
 objj_msgSend(self, "createButtons");
    return self;
}
},["id","CGRect"]), new objj_method(sel_getUid("createButtons"), function $SPRuleEditorRowView__createButtons(self, _cmd)
{ with(self)
{
 _addButton=objj_msgSend(self, "createButtonWithAction:image:atPosition:", sel_getUid("addClicked:"), objj_msgSend(self, "valueForThemeAttribute:", "add-image"), 0);
 _removeButton=objj_msgSend(self, "createButtonWithAction:image:atPosition:", sel_getUid("removeClicked:"), objj_msgSend(self, "valueForThemeAttribute:", "remove-image"), 1);
 objj_msgSend(self, "addSubview:", _addButton);
 objj_msgSend(self, "addSubview:", _removeButton);
}
},["void"]), new objj_method(sel_getUid("createButtonWithAction:image:atPosition:"), function $SPRuleEditorRowView__createButtonWithAction_image_atPosition_(self, _cmd, action, image, position)
{ with(self)
{
 var frame=objj_msgSend(self, "frame");
 var deltaX=-position*(SPRuleEditorRowViewButtonHeight+SPRuleEditorRowViewButtonSpacing);
    var buttonFrame = CGRectMake(
     frame.size.width-SPRuleEditorRowViewButtonHeight-SPRuleEditorRowViewRightMargin+deltaX,
     (_rowHeight-SPRuleEditorRowViewButtonHeight)/2,
     SPRuleEditorRowViewButtonHeight,
     SPRuleEditorRowViewButtonHeight);
    var button=objj_msgSend(objj_msgSend(SPRuleEditorActionButton, "alloc"), "initWithFrame:", buttonFrame);
    objj_msgSend(button, "setImage:", image);
    objj_msgSend(button, "setAction:", action);
    objj_msgSend(button, "setTarget:", self);
    objj_msgSend(button, "setAutoresizingMask:", CPViewMinXMargin);
    return button;
}
},["CPButton","SEL","CPImage","CPInteger"]), new objj_method(sel_getUid("createCriteriaView"), function $SPRuleEditorRowView__createCriteriaView(self, _cmd)
{ with(self)
{
 _contentView=objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", objj_msgSend(self, "bounds"));
    objj_msgSend(_contentView, "setAutoresizingMask:", CPViewWidthSizable);
 objj_msgSend(self, "addSubview:", _contentView);
}
},["void"]), new objj_method(sel_getUid("createSubrowsView"), function $SPRuleEditorRowView__createSubrowsView(self, _cmd)
{ with(self)
{
 var bounds=objj_msgSend(self, "bounds");
 var rect=CGRectMake(0,bounds.size.height,bounds.size.width,0);
 _subrowsView=objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", rect);
    objj_msgSend(_subrowsView, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);
 objj_msgSend(self, "addSubview:", _subrowsView);
}
},["void"]), new objj_method(sel_getUid("setItem:"), function $SPRuleEditorRowView__setItem_(self, _cmd, item)
{ with(self)
{
 objj_msgSend(self, "resetCriteria");
 _item=item;
 var criteria=objj_msgSend(item, "criteria");
 var criterion;
 var previousCriterion;
 var displayValue;
 var view;
 var count=objj_msgSend(criteria, "count");
 if(count==0)
  objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, _cmd+" : Empty SPRuleEditorCriterion");
 _frozenActions=YES;
 for(var i=0;i<count;i++)
 {
  criterion=criteria[i];
  if(!objj_msgSend(criterion, "isKindOfClass:", SPRuleEditorCriterion)||!objj_msgSend(criterion, "isValid"))
   objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, _cmd+" : Invalid SPRuleEditorCriterion");
  displayValue=objj_msgSend(criterion, "displayValue");
  if(objj_msgSend(criterion, "isStandaloneView"))
  {
   previousCriterion=objj_msgSend(self, "addViewForCriterion:withValue:atIndex:afterCriterionView:", criterion, displayValue, i, previousCriterion);
   continue;
  }
  previousCriterion=objj_msgSend(self, "addMenuForCriterion:withValue:atIndex:afterCriterionView:", criterion, displayValue, i, previousCriterion);
 }
 _frozenActions=NO;
}
},["void","SPRuleEditorModelItem"]), new objj_method(sel_getUid("setNestingMode:"), function $SPRuleEditorRowView__setNestingMode_(self, _cmd, nestingMode)
{ with(self)
{
 if(nestingMode==_nestingMode)
  return;
 _nestingMode=nestingMode;
 var subviews=objj_msgSend(_subrowsView, "subviews");
 var subview;
 var view;
 var count=objj_msgSend(subviews, "count");
 for(var i=0;i<count;i++)
 {
  subview=subviews[i];
  if(!objj_msgSend(subview, "isKindOfClass:", SPRuleEditorRowView))
   continue;
  view=objj_msgSend(subview, "setNestingMode:", nestingMode);
  if(view)
   return view;
 }
}
},["void","CPInteger"]), new objj_method(sel_getUid("setDelegate:"), function $SPRuleEditorRowView__setDelegate_(self, _cmd, delegate)
{ with(self)
{
 if(delegate==_delegate)
  return;
 var subviews=objj_msgSend(_subrowsView, "subviews");
 var subview;
 var view;
 var count=objj_msgSend(subviews, "count");
 for(var i=0;i<count;i++)
 {
  subview=subviews[i];
  if(!objj_msgSend(subview, "isKindOfClass:", SPRuleEditorRowView))
   continue;
  objj_msgSend(subview, "setDelegate:", delegate);
 }
    var notificationCenter=objj_msgSend(CPNotificationCenter, "defaultCenter");
    if(_delegate)
    {
  objj_msgSend(notificationCenter, "removeObserver:name:object:", self, SPRuleEditorViewAltKeyDown, _delegate);
  objj_msgSend(notificationCenter, "removeObserver:name:object:", self, SPRuleEditorViewAltKeyUp, _delegate);
    }
 _delegate=delegate;
    if(_delegate&&objj_msgSend(_delegate, "nestingMode")==SPRuleEditorNestingModeCompound)
    {
  objj_msgSend(notificationCenter, "addObserver:selector:name:object:", self, sel_getUid("altKeyDown:"), SPRuleEditorViewAltKeyDown, _delegate);
  objj_msgSend(notificationCenter, "addObserver:selector:name:object:", self, sel_getUid("altKeyUp:"), SPRuleEditorViewAltKeyUp, _delegate);
  if(objj_msgSend(objj_msgSend(CPApp, "currentEvent"), "modifierFlags") & CPAlternateKeyMask)
   objj_msgSend(self, "altKeyDown:", nil);
    }
}
},["void","id"]), new objj_method(sel_getUid("setSelected:"), function $SPRuleEditorRowView__setSelected_(self, _cmd, selected)
{ with(self)
{
 if(selected==_selected)
  return;
 _selected=selected;
 if(_selected)
  objj_msgSend(self, "setThemeState:", CPThemeStateSelectedDataView);
 else
  objj_msgSend(self, "unsetThemeState:", CPThemeStateSelectedDataView);
}
},["void","BOOL"]), new objj_method(sel_getUid("setEditable:"), function $SPRuleEditorRowView__setEditable_(self, _cmd, editable)
{ with(self)
{
 if(_editable==editable)
  return;
 _editable=editable;
 objj_msgSend(_addButton, "setHidden:", !_editable);
 objj_msgSend(_removeButton, "setHidden:", !_editable);
 var subviews;
 var subview;
 subviews=objj_msgSend(_contentView, "subviews");
 var count=objj_msgSend(subviews, "count");
 for(var i=0;i<count;i++)
 {
  subview=subviews[i];
  if(objj_msgSend(subview, "respondsToSelector:", sel_getUid("setEnabled:")))
   objj_msgSend(subview, "setEnabled:", _editable);
  if(objj_msgSend(subview, "respondsToSelector:", sel_getUid("setEditable:")))
   objj_msgSend(subview, "setEditable:", _editable);
 }
 subviews=objj_msgSend(_subrowsView, "subviews");
 count=objj_msgSend(subviews, "count");
 for(var i=0;i<count;i++)
 {
  subview=subviews[i];
  if(!objj_msgSend(subview, "isKindOfClass:", SPRuleEditorRowView))
   continue;
  objj_msgSend(subview, "setEditable:", _editable);
 }
}
},["void","BOOL"]), new objj_method(sel_getUid("setRowHeight:"), function $SPRuleEditorRowView__setRowHeight_(self, _cmd, rowHeight)
{ with(self)
{
 if(_rowHeight==rowHeight)
  return;
 _rowHeight=Math.max(rowHeight,SPRuleEditorRowViewMinHeight);
 var subview;
 var subviews=objj_msgSend(_subrowsView, "subviews");
 var count=objj_msgSend(subviews, "count");
 for(var i=0;i<count;i++)
 {
  subview=subviews[i];
  if(!objj_msgSend(subview, "isKindOfClass:", SPRuleEditorRowView))
   continue;
  objj_msgSend(subview, "setRowHeight:", _rowHeight);
 }
}
},["void","CGFloat"]), new objj_method(sel_getUid("isLast"), function $SPRuleEditorRowView__isLast(self, _cmd)
{ with(self)
{
 if(!_item)
  return NO;
 var parent=objj_msgSend(_item, "parent");
 if(!parent)
  return objj_msgSend(_item, "subrows")==0;
 return objj_msgSend(parent, "indexOfChild:", _item)==(objj_msgSend(parent, "subrowsCount")-1);
}
},["BOOL"]), new objj_method(sel_getUid("setShowDragIndicator:"), function $SPRuleEditorRowView__setShowDragIndicator_(self, _cmd, show)
{ with(self)
{
 if(_showDragIndicator==show)
  return;
 _showDragIndicator=show;
 objj_msgSend(self, "setNeedsDisplay:", YES);
}
},["void","BOOL"]), new objj_method(sel_getUid("resetCriteria"), function $SPRuleEditorRowView__resetCriteria(self, _cmd)
{ with(self)
{
 var subviews=objj_msgSend(_contentView, "subviews");
 var count=objj_msgSend(subviews, "count");
 for(var i=count-1;i>=0;i--)
  objj_msgSend(subviews[i], "removeFromSuperview");
}
},["void"]), new objj_method(sel_getUid("indexOfCriterion:"), function $SPRuleEditorRowView__indexOfCriterion_(self, _cmd, aCriterion)
{ with(self)
{
 if(objj_msgSend(aCriterion, "isKindOfClass:", CPMenuItem))
  return objj_msgSend(self, "indexOfMenuItemCriterion:", aCriterion);
 var view;
 var subviews=objj_msgSend(_contentView, "subviews");
 var count=objj_msgSend(subviews, "count");
 for(var i=0;i<count;i++)
  if(objj_msgSend(subviews, "objectAtIndex:", i)===aCriterion)
   return i;
 return CPNotFound;
}
},["CPInteger","id"]), new objj_method(sel_getUid("indexOfMenuItemCriterion:"), function $SPRuleEditorRowView__indexOfMenuItemCriterion_(self, _cmd, item)
{ with(self)
{
 var view;
 var subviews=objj_msgSend(_contentView, "subviews");
 var count=objj_msgSend(subviews, "count");
 for(var i=0;i<count;i++)
 {
  view=objj_msgSend(subviews, "objectAtIndex:", i);
  if(!objj_msgSend(view, "isKindOfClass:", CPPopUpButton))
   continue;
  if(objj_msgSend(objj_msgSend(view, "menu"), "indexOfItem:", item)!=CPNotFound)
   return i;
 }
 return CPNotFound;
}
},["CPInteger","CPMenuItem"]), new objj_method(sel_getUid("addCriterionView:afterCriterionView:"), function $SPRuleEditorRowView__addCriterionView_afterCriterionView_(self, _cmd, criterion, previousCriterion)
{ with(self)
{
 var frame=objj_msgSend(self, "frame");
 var previousCriterionFrame=previousCriterion?objj_msgSend(previousCriterion, "frame"):nil;
 var xOrigin=previousCriterion?
  previousCriterionFrame.origin.x+previousCriterionFrame.size.width+SPRuleEditorRowViewCriterionSpacing
  :SPRuleEditorRowViewLeftMargin;
 if(objj_msgSend(criterion, "isKindOfClass:", CPTextField))
  objj_msgSend(criterion, "setSmallSize");
 var height=objj_msgSend(criterion, "isKindOfClass:", CPPopUpButton)?SPRuleEditorRowViewPopUpHeight:SPRuleEditorRowViewCriterionHeight;
    var criterionFrame=objj_msgSend(criterion, "frame");
    criterionFrame=CGRectMake(
     xOrigin,
     (_rowHeight-height)/2,
     criterionFrame.size.width,
     height);
    objj_msgSend(criterion, "setFrame:", criterionFrame);
    objj_msgSend(_contentView, "addSubview:", criterion);
}
},["void","CPView","CPView"]), new objj_method(sel_getUid("bindCriterionViewItem:"), function $SPRuleEditorRowView__bindCriterionViewItem_(self, _cmd, item)
{ with(self)
{
 if(!item)
  return;
 if(objj_msgSend(item, "isKindOfClass:", CPMenuItem))
 {
  objj_msgSend(item, "setTarget:", self);
  objj_msgSend(item, "setAction:", sel_getUid("criterionChanged:"));
  return;
 }
 if(objj_msgSend(item, "isKindOfClass:", CPTextField))
 {
     objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, sel_getUid("criterionChangedNotification:"), CPControlTextDidEndEditingNotification, item);
     return;
 }
 if(!objj_msgSend(item, "isKindOfClass:", CPControl))
  return;
 if(objj_msgSend(item, "respondsToSelector:", sel_getUid("objectValue")))
     objj_msgSend(item, "addObserver:forKeyPath:options:context:", self, "objectValue", CPKeyValueObservingOptionNew | CPKeyValueObservingOptionOld, nil);
 if(objj_msgSend(item, "respondsToSelector:", sel_getUid("stringValue")))
     objj_msgSend(item, "addObserver:forKeyPath:options:context:", self, "stringValue", CPKeyValueObservingOptionNew | CPKeyValueObservingOptionOld, nil);
 if(objj_msgSend(item, "respondsToSelector:", sel_getUid("color")))
     objj_msgSend(item, "addObserver:forKeyPath:options:context:", self, "color", CPKeyValueObservingOptionNew | CPKeyValueObservingOptionOld, nil);
}
},["void","id"]), new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"), function $SPRuleEditorRowView__observeValueForKeyPath_ofObject_change_context_(self, _cmd, aKeyPath, anObject, changes, aContext)
{ with(self)
{
 objj_msgSend(self, "criterionChanged:", anObject);
}
},["void","CPString","id","CPDictionary","id"]), new objj_method(sel_getUid("addViewForCriterion:withValue:atIndex:afterCriterionView:"), function $SPRuleEditorRowView__addViewForCriterion_withValue_atIndex_afterCriterionView_(self, _cmd, criterion, value, index, previousCriterion)
{ with(self)
{
 if(!objj_msgSend(criterion, "isStandaloneView"))
  objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, _cmd+" : Invalid SPRuleEditorCriterion");
 var view;
 if(objj_msgSend(value, "isKindOfClass:", CPView))
 {
  view=objj_msgSend(_delegate, "criterionItemCopy:", value);
  objj_msgSend(view, "setHidden:", objj_msgSend(criterion, "hidden"));
  objj_msgSend(self, "addCriterionView:afterCriterionView:", view, previousCriterion);
  objj_msgSend(self, "bindCriterionViewItem:", view);
  return view;
 }
 view=objj_msgSend(_delegate, "criterionItemCopy:", objj_msgSend(criterion, "standaloneView"));
 if(!value)
 {
  objj_msgSend(view, "setHidden:", objj_msgSend(criterion, "hidden"));
  objj_msgSend(self, "addCriterionView:afterCriterionView:", view, previousCriterion);
  objj_msgSend(self, "bindCriterionViewItem:", view);
  return view;
 }
 if(objj_msgSend(value, "isKindOfClass:", CPString))
 {
  if(objj_msgSend(view, "respondsToSelector:", sel_getUid("setStringValue:")))
   objj_msgSend(view, "setStringValue:", value);
  else
  if(objj_msgSend(view, "respondsToSelector:", sel_getUid("setObjectValue:")))
   objj_msgSend(view, "setObjectValue:", value);
  objj_msgSend(view, "setHidden:", objj_msgSend(criterion, "hidden"));
  objj_msgSend(self, "addCriterionView:afterCriterionView:", view, previousCriterion);
  objj_msgSend(self, "bindCriterionViewItem:", view);
  return view;
 }
 if(objj_msgSend(criterion, "respondsToSelector:", sel_getUid("setObjectValue:")))
  objj_msgSend(criterion, "setObjectValue:", value);
 objj_msgSend(view, "setHidden:", objj_msgSend(criterion, "hidden"));
 objj_msgSend(self, "addCriterionView:afterCriterionView:", view, previousCriterion);
 objj_msgSend(self, "bindCriterionViewItem:", view);
 return view;
}
},["CPView","SPRuleEditorCriterion","id","CPInteger","SPRuleEditorCriterion"]), new objj_method(sel_getUid("addMenuForCriterion:withValue:atIndex:afterCriterionView:"), function $SPRuleEditorRowView__addMenuForCriterion_withValue_atIndex_afterCriterionView_(self, _cmd, criterion, value, index, previousCriterion)
{ with(self)
{
 if(!objj_msgSend(criterion, "isMenu"))
  objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, _cmd+" : Invalid SPRuleEditorCriterion");
 var menuItems=objj_msgSend(CPArray, "arrayWithArray:", objj_msgSend(criterion, "items"));
 var menuCount=objj_msgSend(menuItems, "count");
 if(menuCount==1)
 {
  return objj_msgSend(self, "addStaticTextForCriterion:afterCriterionView:", criterion, previousCriterion);
 }
 var menuItem;
 var selectedIndex=CPNotFound;
 var selectedTitle=nil;
 if(value)
 {
  if(objj_msgSend(value, "isKindOfClass:", CPNumber))
   selectedIndex=objj_msgSend(value, "intValue");
  else if(objj_msgSend(value, "isKindOfClass:", CPString))
   selectedTitle=value;
  else if(!isNaN(value))
   selectedIndex=objj_msgSend(value, "intValue");
  else if(objj_msgSend(value, "isKindOfClass:", CPMenuItem))
   selectedTitle=objj_msgSend(value, "title");
  else if(objj_msgSend(value, "respondsToSelector:", sel_getUid("description")))
   selectedTitle=objj_msgSend(value, "description");
 }
 for(var i=0;i<menuCount;i++)
 {
  menuItem=menuItems[i];
  if(!menuItem)
  {
   menuItems[i]=objj_msgSend(CPMenuItem, "separatorItem");
   continue;
  }
  if(objj_msgSend(menuItem, "isKindOfClass:", CPString))
  {
   if(objj_msgSend(menuItem, "length")==0)
   {
    menuItems[i]=objj_msgSend(CPMenuItem, "separatorItem");
    continue;
   }
   menuItems[i]=objj_msgSend(objj_msgSend(CPMenuItem, "alloc"), "initWithTitle:action:keyEquivalent:", menuItem, sel_getUid("criterionChanged:"), "");
   objj_msgSend(self, "bindCriterionViewItem:", menuItems[i]);
   continue;
  }
  menuItem=objj_msgSend(_delegate, "criterionItemCopy:", menuItem);
  objj_msgSend(menuItem, "setState:", CPOffState);
  if(objj_msgSend(menuItem, "menu"))
   objj_msgSend(objj_msgSend(menuItem, "menu"), "removeItem:", menuItem);
  menuItems[i]=menuItem;
  objj_msgSend(self, "bindCriterionViewItem:", menuItems[i]);
 }
 var selectedItem=nil;
 if(selectedIndex!=CPNotFound&&selectedIndex<objj_msgSend(menuItems, "count"))
 {
  selectedItem=objj_msgSend(menuItems, "objectAtIndex:", selectedIndex);
 }
 else
 if(selectedTitle)
 {
  var idx=objj_msgSend(menuItems, "indexOfObjectPassingTest:", function(obj,index){
   return objj_msgSend(obj, "title")==selectedTitle;
  });
  if(idx!=CPNotFound)
   selectedItem=menuItems[idx];
 }
 else
 {
  var idx=selectedItem=objj_msgSend(menuItems, "indexOfObjectPassingTest:", function(obj,index){
   return !objj_msgSend(obj, "isSeparatorItem");
  });
  if(idx!=CPNotFound)
   selectedItem=menuItems[idx];
 }
 if(!selectedItem)
  objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, _cmd+" : Invalid SPRuleEditorCriterion");
 var title=objj_msgSend(selectedItem, "title");
    var font=objj_msgSend(self, "valueForThemeAttribute:", "font");
    var width=objj_msgSend(title, "sizeWithFont:", font).width+25;
    var frame=CGRectMake(0,0,width+((width%25)?25:0),SPRuleEditorRowViewButtonHeight);
    var popup=objj_msgSend(objj_msgSend(SPRuleEditorPopUpButton, "alloc"), "initWithFrame:", frame);
    objj_msgSend(popup, "setValue:forThemeAttribute:", font, "font");
    objj_msgSend(popup, "setValue:forThemeAttribute:", CGSizeMake(0.0, SPRuleEditorRowViewCriterionHeight), "min-size");
    for(var i=0;i<menuCount;i++)
    {
     menuItem=objj_msgSend(menuItems, "objectAtIndex:", i);
     if(!objj_msgSend(menuItem, "isSeparatorItem"))
     {
      title=objj_msgSend(menuItem, "title");
      objj_msgSend(menuItem, "setTitle:", objj_msgSend(self, "localizedString:", title));
     }
        objj_msgSend(popup, "addItem:", menuItem);
    }
    objj_msgSend(popup, "selectItemWithTitle:", objj_msgSend(selectedItem, "title"));
 objj_msgSend(popup, "setHidden:", objj_msgSend(criterion, "hidden"));
 objj_msgSend(self, "addCriterionView:afterCriterionView:", popup, previousCriterion);
    return popup;
}
},["CPView","SPRuleEditorCriterion","id","CPInteger","SPRuleEditorCriterion"]), new objj_method(sel_getUid("addStaticTextForCriterion:afterCriterionView:"), function $SPRuleEditorRowView__addStaticTextForCriterion_afterCriterionView_(self, _cmd, criterion, previousCriterion)
{ with(self)
{
 if(!objj_msgSend(criterion, "isMenu"))
  objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, _cmd+" : Invalid SPRuleEditorCriterion");
 var menuItems=objj_msgSend(CPArray, "arrayWithArray:", objj_msgSend(criterion, "items"));
 var menuItem;
 menuItem=menuItems[0];
 if(!menuItem||(objj_msgSend(menuItem, "isKindOfClass:", CPString)&&objj_msgSend(menuItem, "length")==0))
  objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, _cmd+" : Invalid SPRuleEditorCriterion");
 var text;
 if(objj_msgSend(menuItem, "isKindOfClass:", CPMenuItem))
  text=objj_msgSend(menuItem, "title");
 else
  text=menuItem;
 var frame=CGRectMake(0,0,100,_rowHeight);
    var textField=objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", frame);
    objj_msgSend(textField, "setStaticWithFont:", objj_msgSend(self, "valueForThemeAttribute:", "font"));
    objj_msgSend(textField, "setStringValue:", objj_msgSend(self, "localizedString:", text));
    objj_msgSend(textField, "sizeToFit");
 objj_msgSend(self, "addCriterionView:afterCriterionView:", textField, previousCriterion);
    return textField;
}
},["CPView","SPRuleEditorCriterion","SPRuleEditorCriterion"]), new objj_method(sel_getUid("removeFromSuperview"), function $SPRuleEditorRowView__removeFromSuperview(self, _cmd)
{ with(self)
{
 if(objj_msgSend(self, "superview"))
 {
  objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "removeObserver:", self);
 }
 objj_msgSendSuper({ receiver:self, super_class:objj_getClass("SPRuleEditorRowView").super_class }, "removeFromSuperview");
}
},["void"]), new objj_method(sel_getUid("addRowView:"), function $SPRuleEditorRowView__addRowView_(self, _cmd, aView)
{ with(self)
{
 objj_msgSend(_subrowsView, "addSubview:", aView);
}
},["void","SPRuleEditorRowView"]), new objj_method(sel_getUid("removeRowView:"), function $SPRuleEditorRowView__removeRowView_(self, _cmd, aView)
{ with(self)
{
 objj_msgSend(aView, "removeFromSuperview");
}
},["void","SPRuleEditorRowView"]), new objj_method(sel_getUid("addRowView:positioned:relativeTo:"), function $SPRuleEditorRowView__addRowView_positioned_relativeTo_(self, _cmd, rowView, position, aView)
{ with(self)
{
 objj_msgSend(_subrowsView, "addSubview:positioned:relativeTo:", rowView, position, aView);
}
},["void","SPRuleEditorRowView","CPInteger","CPView"]), new objj_method(sel_getUid("_layoutSubviews"), function $SPRuleEditorRowView___layoutSubviews(self, _cmd)
{ with(self)
{
 var subrows=objj_msgSend(_subrowsView, "subviews");
 var count=objj_msgSend(subrows, "count");
 var view;
 var rect;
 var deltaY=0;
 for(var i=0;i<count;i++)
 {
  view=subrows[i];
  if(!objj_msgSend(view, "isKindOfClass:", SPRuleEditorRowView))
   continue;
  objj_msgSend(view, "_layoutSubviews");
  rect=objj_msgSend(view, "frame");
  rect.origin.y=deltaY;
  objj_msgSend(view, "setFrame:", rect);
  deltaY+=rect.size.height;
  objj_msgSend(view, "setFrame:", rect);
 }
 var indicatorHeight=_showDragIndicator?SPRuleEditorRowViewDragIndicatorHeight:0;
 rect=objj_msgSend(_subrowsView, "frame");
 rect.origin.y=_rowHeight+indicatorHeight;
 rect.size.height=deltaY;
 objj_msgSend(_subrowsView, "setFrame:", rect);
    rect=objj_msgSend(_addButton, "frame");
    rect.origin.y=((_rowHeight-SPRuleEditorRowViewButtonHeight)/2)-1;
    objj_msgSend(_addButton, "setFrame:", rect);
    objj_msgSend(_addButton, "setHidden:", (!_editable||(_delegate&&objj_msgSend(_delegate, "nestingMode")==SPRuleEditorNestingModeSingle)));
    rect=objj_msgSend(_removeButton, "frame");
    rect.origin.y=((_rowHeight-SPRuleEditorRowViewButtonHeight)/2)-1;
    objj_msgSend(_removeButton, "setFrame:", rect);
    objj_msgSend(_removeButton, "setHidden:", (!_editable||(_delegate&&(!objj_msgSend(_delegate, "isRowRemoveable:", _item)||objj_msgSend(_delegate, "nestingMode")==SPRuleEditorNestingModeSingle))));
 subviews=objj_msgSend(_contentView, "subviews");
 count=objj_msgSend(subviews, "count");
 for(var i=0;i<count;i++)
 {
  view=subviews[i];
  rect=objj_msgSend(view, "frame");
  rect.origin.y=objj_msgSend(view, "isKindOfClass:", CPButton)?((_rowHeight-rect.size.height)/2)-1:((_rowHeight-rect.size.height)/2);
  objj_msgSend(view, "setFrame:", rect);
 }
 var size=objj_msgSend(_contentView, "frameSize");
 size.height=_rowHeight;
 objj_msgSend(_contentView, "setFrameSize:", size);
 size=objj_msgSend(self, "frameSize");
 size.height=deltaY+_rowHeight+indicatorHeight;
 objj_msgSend(self, "setFrameSize:", size);
}
},["void"]), new objj_method(sel_getUid("rowViewWithItem:"), function $SPRuleEditorRowView__rowViewWithItem_(self, _cmd, item)
{ with(self)
{
 if(_item==item)
  return self;
 var subviews=objj_msgSend(_subrowsView, "subviews");
 var subview;
 var view;
 var count=objj_msgSend(subviews, "count");
 for(var i=0;i<count;i++)
 {
  subview=subviews[i];
  if(!objj_msgSend(subview, "isKindOfClass:", SPRuleEditorRowView))
   continue;
  view=objj_msgSend(subview, "rowViewWithItem:", item);
  if(view)
   return view;
 }
 return nil;
}
},["SPRuleEditorRowView","SPRuleEditorModelItem"]), new objj_method(sel_getUid("drawBordersInContext:verticalOffset:width:"), function $SPRuleEditorRowView__drawBordersInContext_verticalOffset_width_(self, _cmd, context, vOffset, width)
{ with(self)
{
    var frame=objj_msgSend(self, "frame");
 CGContextSaveGState(context);
    CGContextBeginPath(context);
    CGContextMoveToPoint(context,0,frame.origin.y+vOffset+0.5);
    CGContextAddLineToPoint(context,width,frame.origin.y+vOffset+0.5);
    CGContextClosePath(context);
    CGContextSetStrokeColor(context,objj_msgSend(CPColor, "whiteColor"));
    CGContextSetLineWidth(1);
    CGContextStrokePath(context);
    var indicatorHeight=_showDragIndicator?SPRuleEditorRowViewDragIndicatorHeight:0;
    if(indicatorHeight)
    {
     indent=objj_msgSend(_item, "rowType")==SPRuleEditorRowTypeSimple?SPRuleEditorRowViewIndent*objj_msgSend(_item, "depth"):SPRuleEditorRowViewIndent*(objj_msgSend(_item, "depth")+1);
     CGContextBeginPath(context);
     CGContextMoveToPoint(context,indent,vOffset+frame.origin.y+_rowHeight+(indicatorHeight/2)+-0.5);
     CGContextAddLineToPoint(context,width,vOffset+frame.origin.y+_rowHeight+(indicatorHeight/2)-0.5);
     CGContextSetLineWidth(SPRuleEditorRowViewDragIndicatorHeight);
     CGContextClosePath(context);
     CGContextSetStrokeColor(context,objj_msgSend(CPColor, "grayColor"));
     CGContextStrokePath(context);
    }
    CGContextBeginPath(context);
    CGContextMoveToPoint(context,0,vOffset+frame.origin.y+_rowHeight+indicatorHeight+-0.5);
    CGContextAddLineToPoint(context,width,vOffset+frame.origin.y+_rowHeight+indicatorHeight-0.5);
    CGContextSetLineWidth(1);
    CGContextClosePath(context);
    CGContextSetStrokeColor(context,objj_msgSend(self, "valueForThemeAttribute:", "slice-bottom-border-color"));
    CGContextStrokePath(context);
 CGContextRestoreGState(context);
 var subrows=objj_msgSend(_subrowsView, "subviews");
 var count=objj_msgSend(subrows, "count");
 var subrow;
 vOffset+=frame.origin.y+_rowHeight+indicatorHeight;
 for(var i=0;i<count;i++)
 {
  subrow=subrows[i];
  if(!objj_msgSend(subrow, "isKindOfClass:", SPRuleEditorRowView))
   continue;
  objj_msgSend(subrow, "drawBordersInContext:verticalOffset:width:", context, vOffset, width);
 }
}
},["void","CGContext","float","float"]), new objj_method(sel_getUid("addClicked:"), function $SPRuleEditorRowView__addClicked_(self, _cmd, sender)
{ with(self)
{
 objj_msgSend(objj_msgSend(self, "window"), "makeFirstResponder:", self);
 if( _frozenActions
  ||!_delegate
  ||!sender
  ||!objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("insertNewRowOfType:afterRow:"))
  )
  return;
 var altKeyPressed=objj_msgSend(objj_msgSend(CPApp, "currentEvent"), "modifierFlags") & CPAlternateKeyMask;
 var rowType=(altKeyPressed&&_delegate&&objj_msgSend(_delegate, "nestingMode")==SPRuleEditorNestingModeCompound)?SPRuleEditorRowTypeCompound:SPRuleEditorRowTypeSimple;
 objj_msgSend(_delegate, "insertNewRowOfType:afterRow:", rowType, _item);
}
},["void","id"]), new objj_method(sel_getUid("removeClicked:"), function $SPRuleEditorRowView__removeClicked_(self, _cmd, sender)
{ with(self)
{
 objj_msgSend(objj_msgSend(self, "window"), "makeFirstResponder:", self);
 if( _frozenActions
  ||!_delegate
  ||!sender
  ||!objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("removeRow:"))
  )
  return;
 objj_msgSend(_delegate, "removeRow:", _item);
}
},["void","id"]), new objj_method(sel_getUid("criterionChangedNotification:"), function $SPRuleEditorRowView__criterionChangedNotification_(self, _cmd, notification)
{ with(self)
{
 if(!notification)
  return;
 var sender=objj_msgSend(notification, "object");
 if(!sender)
  return;
 objj_msgSend(self, "criterionChanged:", sender);
}
},["void","CPNotification"]), new objj_method(sel_getUid("criterionChanged:"), function $SPRuleEditorRowView__criterionChanged_(self, _cmd, sender)
{ with(self)
{
 if(_updating)
  return;
 _updating=YES;
 objj_msgSend(objj_msgSend(self, "window"), "makeFirstResponder:", self);
 _updating=NO;
 if( _frozenActions
  ||!_delegate
  ||!sender
  ||!objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("valueChanged:criterionIndex:valueIndex:inRow:"))
  )
  return;
 var value=nil;
 var criterionIndex=CPNotFound;
 var valueIndex=0;
 if(objj_msgSend(sender, "isKindOfClass:", CPMenuItem))
 {
  valueIndex=objj_msgSend(objj_msgSend(sender, "menu"), "indexOfItem:", sender);
  value=sender;
  criterionIndex=objj_msgSend(self, "indexOfCriterion:", sender);
 }
 else
 {
  value=sender;
  criterionIndex=objj_msgSend(self, "indexOfCriterion:", sender);
 }
 if(criterionIndex==CPNotFound)
  return;
 objj_msgSend(_delegate, "valueChanged:criterionIndex:valueIndex:inRow:", value, criterionIndex, valueIndex, _item);
}
},["void","id"]), new objj_method(sel_getUid("localizedString:"), function $SPRuleEditorRowView__localizedString_(self, _cmd, str)
{ with(self)
{
 if(_delegate&&objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("localizedString:")))
  return objj_msgSend(_delegate, "localizedString:", str);
 return str;
}
},["CPString","CPString"]), new objj_method(sel_getUid("hitTest:"), function $SPRuleEditorRowView__hitTest_(self, _cmd, aPoint)
{ with(self)
{
 var res=objj_msgSendSuper({ receiver:self, super_class:objj_getClass("SPRuleEditorRowView").super_class }, "hitTest:", aPoint);
 if(res==_contentView)
  return self;
 return res;
}
},["CPView","CPPoint"]), new objj_method(sel_getUid("viewAtPoint:"), function $SPRuleEditorRowView__viewAtPoint_(self, _cmd, aPoint)
{ with(self)
{
 var point=objj_msgSend(self, "convertPoint:fromView:", aPoint, nil);
 var rect=objj_msgSend(_contentView, "frame");
 if(CPRectContainsPoint(rect,point))
  return self;
 var view;
 var subview;
 var subviews=objj_msgSend(_subrowsView, "subviews");
 var count=objj_msgSend(subviews, "count");
 for(var i=0;i<count;i++)
 {
  subview=subviews[i];
  if(!objj_msgSend(subview, "isKindOfClass:", SPRuleEditorRowView))
   continue;
  view=objj_msgSend(subview, "viewAtPoint:", aPoint);
  if(view)
   return view;
 }
 return nil;
}
},["CPView","CPPoint"]), new objj_method(sel_getUid("hasSubrow:"), function $SPRuleEditorRowView__hasSubrow_(self, _cmd, rowView)
{ with(self)
{
 if(!rowView||rowView==self)
  return NO;
 var view;
 var subview;
 var subviews=objj_msgSend(_subrowsView, "subviews");
 var count=objj_msgSend(subviews, "count");
 for(var i=0;i<count;i++)
 {
  subview=subviews[i];
  if(!objj_msgSend(subview, "isKindOfClass:", SPRuleEditorRowView))
   continue;
  if(subview==rowView)
   return YES;
  if(objj_msgSend(subview, "hasSubrow:", rowView))
   return YES;
 }
 return NO;
}
},["BOOL","SPRuleEditorRowView"]), new objj_method(sel_getUid("isOpaque"), function $SPRuleEditorRowView__isOpaque(self, _cmd)
{ with(self)
{
    return YES;
}
},["BOOL"]), new objj_method(sel_getUid("mouseDragged:"), function $SPRuleEditorRowView__mouseDragged_(self, _cmd, event)
{ with(self)
{
 if(!_editable)
  return;
    var pasteboard=objj_msgSend(CPPasteboard, "pasteboardWithName:",  CPDragPboard);
    objj_msgSend(pasteboard, "declareTypes:owner:", objj_msgSend(CPArray, "arrayWithObjects:",  SPRuleEditorItemPBoardType, nil),  self);
    var dragView=objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", objj_msgSend(self, "frame"));
    var html = self._DOMElement.innerHTML;
    dragView._DOMElement.innerHTML = objj_msgSend(html, "copy");
    objj_msgSend(dragView, "setAlphaValue:", 0.7);
    objj_msgSend(dragView, "setBackgroundColor:", objj_msgSend(CPColor, "whiteColor"));
    objj_msgSend(self, "dragView:at:offset:event:pasteboard:source:slideBack:", dragView, CPPointMake(0,0), CPPointMake(0,0), event, pasteboard, self, YES);
}
},["void","CPEvent"]), new objj_method(sel_getUid("acceptsFirstResponder"), function $SPRuleEditorRowView__acceptsFirstResponder(self, _cmd)
{ with(self)
{
    return YES;
}
},["BOOL"]), new objj_method(sel_getUid("resignFirstResponder"), function $SPRuleEditorRowView__resignFirstResponder(self, _cmd)
{ with(self)
{
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("SPRuleEditorRowView").super_class }, "resignFirstResponder");
}
},["BOOL"]), new objj_method(sel_getUid("flagsChanged:"), function $SPRuleEditorRowView__flagsChanged_(self, _cmd, anEvent)
{ with(self)
{
 objj_msgSendSuper({ receiver:self, super_class:objj_getClass("SPRuleEditorRowView").super_class }, "flagsChanged:", anEvent);
    if(_delegate&&objj_msgSend(_delegate, "nestingMode")==SPRuleEditorNestingModeCompound)
 {
  if(objj_msgSend(anEvent, "modifierFlags")&CPAlternateKeyMask)
  {
   objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", SPRuleEditorViewAltKeyDown, _delegate, nil);
  }
  else
  {
   objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", SPRuleEditorViewAltKeyUp, _delegate, nil);
  }
 }
}
},["void","CPEvent"]), new objj_method(sel_getUid("altKeyDown:"), function $SPRuleEditorRowView__altKeyDown_(self, _cmd, notification)
{ with(self)
{
    objj_msgSend(_addButton, "setImage:", _alternateAddButtonImage);
    objj_msgSend(_addButton, "setNeedsDisplay:", YES);
}
},["void","CPNotification"]), new objj_method(sel_getUid("altKeyUp:"), function $SPRuleEditorRowView__altKeyUp_(self, _cmd, notification)
{ with(self)
{
    objj_msgSend(_addButton, "setImage:", objj_msgSend(self, "valueForThemeAttribute:", "add-image"));
    objj_msgSend(_addButton, "setNeedsDisplay:", YES);
}
},["void","CPNotification"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("themeAttributes"), function $SPRuleEditorRowView__themeAttributes(self, _cmd)
{ with(self)
{
 return objj_msgSend(SPRuleEditor, "themeAttributes");
}
},["id"]), new objj_method(sel_getUid("initialize"), function $SPRuleEditorRowView__initialize(self, _cmd)
{ with(self)
{
    if (CPBrowserIsEngine(CPWebKitBrowserEngine))
    {
        GRADIENT_NORMAL = "-webkit-gradient(linear, left top, left bottom, from(rgb(252, 252, 252)), to(rgb(223, 223, 223)))";
        GRADIENT_HIGHLIGHTED = "-webkit-gradient(linear, left top, left bottom, from(rgb(223, 223, 223)), to(rgb(252, 252, 252)))";
    }
    else if (CPBrowserIsEngine(CPGeckoBrowserEngine))
    {
        GRADIENT_NORMAL = "-moz-linear-gradient(top,  rgb(252, 252, 252),  rgb(223, 223, 223))";
        GRADIENT_HIGHLIGHTED = "-moz-linear-gradient(top,  rgb(223, 223, 223),  rgb(252, 252, 252))";
    }
}
},["void"])]);
}
{
var the_class = objj_getClass("CPTextField")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPTextField\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("setSmallSize"), function $CPTextField__setSmallSize(self, _cmd)
{ with(self)
{
 objj_msgSend(self, "setValue:forThemeAttribute:inState:", objj_msgSend(CPFont, "systemFontOfSize:", 11.0), "font", CPThemeStateBezeled);
 objj_msgSend(self, "setValue:forThemeAttribute:inState:", CGInsetMake(3.0, 7.0, 0.0, 8.0), "content-inset", CPThemeStateBezeled);
 objj_msgSend(self, "setValue:forThemeAttribute:inState:", CGInsetMake(2.0, 6.0, 0.0, 8.0), "content-inset", CPThemeStateBezeled | CPThemeStateEditing);
 objj_msgSend(self, "setValue:forThemeAttribute:inState:", CGInsetMake(0.0, 4.0, 0.0, 4.0), "bezel-inset", CPThemeStateBezeled);
 objj_msgSend(self, "setValue:forThemeAttribute:inState:", CGInsetMake(-2.0, 0.0, -2.0, 0.0), "bezel-inset", CPThemeStateBezeled | CPThemeStateEditing);
}
},["void"]), new objj_method(sel_getUid("setStaticWithFont:"), function $CPTextField__setStaticWithFont_(self, _cmd, font)
{ with(self)
{
 objj_msgSend(self, "setBordered:", NO);
 objj_msgSend(self, "setEditable:", NO);
 objj_msgSend(self, "setDrawsBackground:", NO);
    objj_msgSend(self, "setValue:forThemeAttribute:", font, "font");
 if(!objj_msgSend(self, "stringValue"))
  objj_msgSend(self, "setStringValue:", " ");
 objj_msgSend(self, "sizeToFit");
 objj_msgSend(self, "setValue:forThemeAttribute:inState:", CGInsetMake(((objj_msgSend(self, "frame").size.height-objj_msgSend(font, "size"))/2)+1, 0.0, 0.0, 0.0), "content-inset", CPThemeStateNormal);
}
},["void","CPFont"])]);
}

