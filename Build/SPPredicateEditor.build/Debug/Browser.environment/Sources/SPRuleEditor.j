@STATIC;1.0;I;24;Foundation/CPPredicate.jI;20;Foundation/CPArray.jI;25;Foundation/CPDictionary.jI;23;Foundation/CPIndexSet.jI;24;AppKit/CPViewAnimation.jI;15;AppKit/CPView.ji;19;SPRuleEditorModel.ji;18;SPRuleEditorView.ji;23;SPRuleEditorCriterion.jt;39068;objj_executeFile("Foundation/CPPredicate.j", NO);
objj_executeFile("Foundation/CPArray.j", NO);
objj_executeFile("Foundation/CPDictionary.j", NO);
objj_executeFile("Foundation/CPIndexSet.j", NO);
objj_executeFile("AppKit/CPViewAnimation.j", NO);
objj_executeFile("AppKit/CPView.j", NO);
objj_executeFile("SPRuleEditorModel.j", YES);
objj_executeFile("SPRuleEditorView.j", YES);
objj_executeFile("SPRuleEditorCriterion.j", YES);
SPRuleEditorPredicateLeftExpression = "SPRuleEditorPredicateLeftExpression";
SPRuleEditorPredicateRightExpression = "SPRuleEditorPredicateRightExpression";
SPRuleEditorPredicateComparisonModifier = "SPRuleEditorPredicateComparisonModifier";
SPRuleEditorPredicateOptions = "SPRuleEditorPredicateOptions";
SPRuleEditorPredicateOperatorType = "SPRuleEditorPredicateOperatorType";
SPRuleEditorPredicateCustomSelector = "SPRuleEditorPredicateCustomSelector";
SPRuleEditorPredicateCompoundType = "SPRuleEditorPredicateCompoundType";
SPRuleEditorRowsDidChangeNotification = "SPRuleEditorRowsDidChangeNotification";
SPRuleEditorItemPBoardType = "SPRuleEditorItemPBoardType";
{var the_class = objj_allocateClassPair(CPControl, "SPRuleEditor"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_model"), new objj_ivar("_delegate"), new objj_ivar("_predicate"), new objj_ivar("_rowClass"), new objj_ivar("_rowTypeKeyPath"), new objj_ivar("_subrowsKeyPath"), new objj_ivar("_criteriaKeyPath"), new objj_ivar("_displayValuesKeyPath"), new objj_ivar("_stringsFilename"), new objj_ivar("_standardLocalizer"), new objj_ivar("_contentView")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("model"), function $SPRuleEditor__model(self, _cmd)
{ with(self)
{
return _model;
}
},["id"]),
new objj_method(sel_getUid("delegate"), function $SPRuleEditor__delegate(self, _cmd)
{ with(self)
{
return _delegate;
}
},["id"]),
new objj_method(sel_getUid("setDelegate:"), function $SPRuleEditor__setDelegate_(self, _cmd, newValue)
{ with(self)
{
_delegate = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("predicate"), function $SPRuleEditor__predicate(self, _cmd)
{ with(self)
{
return _predicate;
}
},["id"]),
new objj_method(sel_getUid("rowClass"), function $SPRuleEditor__rowClass(self, _cmd)
{ with(self)
{
return _rowClass;
}
},["id"]),
new objj_method(sel_getUid("setRowClass:"), function $SPRuleEditor__setRowClass_(self, _cmd, newValue)
{ with(self)
{
_rowClass = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("rowTypeKeyPath"), function $SPRuleEditor__rowTypeKeyPath(self, _cmd)
{ with(self)
{
return _rowTypeKeyPath;
}
},["id"]),
new objj_method(sel_getUid("setRowTypeKeyPath:"), function $SPRuleEditor__setRowTypeKeyPath_(self, _cmd, newValue)
{ with(self)
{
_rowTypeKeyPath = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("subrowsKeyPath"), function $SPRuleEditor__subrowsKeyPath(self, _cmd)
{ with(self)
{
return _subrowsKeyPath;
}
},["id"]),
new objj_method(sel_getUid("setSubrowsKeyPath:"), function $SPRuleEditor__setSubrowsKeyPath_(self, _cmd, newValue)
{ with(self)
{
_subrowsKeyPath = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("criteriaKeyPath"), function $SPRuleEditor__criteriaKeyPath(self, _cmd)
{ with(self)
{
return _criteriaKeyPath;
}
},["id"]),
new objj_method(sel_getUid("setCriteriaKeyPath:"), function $SPRuleEditor__setCriteriaKeyPath_(self, _cmd, newValue)
{ with(self)
{
_criteriaKeyPath = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("displayValuesKeyPath"), function $SPRuleEditor__displayValuesKeyPath(self, _cmd)
{ with(self)
{
return _displayValuesKeyPath;
}
},["id"]),
new objj_method(sel_getUid("setDisplayValuesKeyPath:"), function $SPRuleEditor__setDisplayValuesKeyPath_(self, _cmd, newValue)
{ with(self)
{
_displayValuesKeyPath = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("standardLocalizer"), function $SPRuleEditor__standardLocalizer(self, _cmd)
{ with(self)
{
return _standardLocalizer;
}
},["id"]),
new objj_method(sel_getUid("setStandardLocalizer:"), function $SPRuleEditor__setStandardLocalizer_(self, _cmd, newValue)
{ with(self)
{
_standardLocalizer = newValue;
}
},["void","id"]), new objj_method(sel_getUid("initWithFrame:"), function $SPRuleEditor__initWithFrame_(self, _cmd, frame)
{ with(self)
{
    self=objj_msgSendSuper({ receiver:self, super_class:objj_getClass("SPRuleEditor").super_class }, "initWithFrame:", frame);
    if(!self)
     return self;
    objj_msgSend(self, "_build");
    return self;
}
},["id","CGRect"]), new objj_method(sel_getUid("_build"), function $SPRuleEditor___build(self, _cmd)
{ with(self)
{
 _model=objj_msgSend(objj_msgSend(SPRuleEditorModel, "alloc"), "initWithNestingMode:", SPRuleEditorNestingModeCompound);
 objj_msgSend(_model, "setCanRemoveAllRows:", NO);
    objj_msgSend(self, "registerForDraggedTypes:", objj_msgSend(CPArray, "arrayWithObjects:", SPRuleEditorItemPBoardType,nil));
    _contentView=objj_msgSend(objj_msgSend(SPRuleEditorView, "alloc"), "initWithFrame:", objj_msgSend(self, "bounds"));
    objj_msgSend(_contentView, "setAutoresizingMask:", CPViewWidthSizable);
 objj_msgSend(self, "addSubview:", _contentView);
    var notificationCenter=objj_msgSend(CPNotificationCenter, "defaultCenter");
    objj_msgSend(notificationCenter, "addObserver:selector:name:object:", self, sel_getUid("_contentFrameChanged:"), CPViewFrameDidChangeNotification, _contentView);
 objj_msgSend(notificationCenter, "addObserver:selector:name:object:", self, sel_getUid("notifyRowAdded:"), SPRuleEditorModelRowAdded, _model);
 objj_msgSend(notificationCenter, "addObserver:selector:name:object:", self, sel_getUid("notifyRowRemoved:"), SPRuleEditorModelRowRemoved, _model);
 objj_msgSend(notificationCenter, "addObserver:selector:name:object:", self, sel_getUid("notifyRowModified:"), SPRuleEditorModelRowModified, _model);
    objj_msgSend(_contentView, "setDelegate:", self);
    objj_msgSend(_contentView, "setModel:", _model);
}
},["void"]), new objj_method(sel_getUid("removeFromSuperview"), function $SPRuleEditor__removeFromSuperview(self, _cmd)
{ with(self)
{
 if(objj_msgSend(self, "superview"))
  objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "removeObserver:", self);
 objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "removeObserver:", self);
}
},["void"]), new objj_method(sel_getUid("_contentFrameChanged:"), function $SPRuleEditor___contentFrameChanged_(self, _cmd, notification)
{ with(self)
{
 var contentSize=objj_msgSend(_contentView, "frameSize");
 if(CGSizeEqualToSize(contentSize,objj_msgSend(self, "frameSize")))
  return;
    objj_msgSend(_contentView, "setPostsFrameChangedNotifications:", NO);
 objj_msgSend(self, "setFrameSize:", contentSize);
    objj_msgSend(_contentView, "setPostsFrameChangedNotifications:", YES);
}
},["void","CPNotification"]), new objj_method(sel_getUid("viewDidMoveToSuperview"), function $SPRuleEditor__viewDidMoveToSuperview(self, _cmd)
{ with(self)
{
 objj_msgSendSuper({ receiver:self, super_class:objj_getClass("SPRuleEditor").super_class }, "viewDidMoveToSuperview");
 var ua=window.navigator.userAgent;
 var isChrome=ua.indexOf("Chrome")!=-1;
 if(isChrome&&objj_msgSend(objj_msgSend(self, "superview"), "isKindOfClass:", CPClipView))
 {
     objj_msgSend(objj_msgSend(self, "superview"), "setPostsBoundsChangedNotifications:", YES);
     objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, sel_getUid("_wasScrolled:"), CPViewBoundsDidChangeNotification, objj_msgSend(self, "superview"));
 }
}
},["void"]), new objj_method(sel_getUid("_wasScrolled:"), function $SPRuleEditor___wasScrolled_(self, _cmd, notification)
{ with(self)
{
 objj_msgSend(_contentView, "forceRedrawForChromeBug");
}
},["void","CPNotification"]), new objj_method(sel_getUid("delegate"), function $SPRuleEditor__delegate(self, _cmd)
{ with(self)
{
     return _delegate;
}
},["id"]), new objj_method(sel_getUid("setDelegate:"), function $SPRuleEditor__setDelegate_(self, _cmd, aDelegate)
{ with(self)
{
    if(_delegate==aDelegate)
        return;
    if(aDelegate
     &&( !objj_msgSend(aDelegate, "respondsToSelector:", sel_getUid("ruleEditor:numberOfChildrenForCriterion:withRowType:"))
      ||!objj_msgSend(aDelegate, "respondsToSelector:", sel_getUid("ruleEditor:displayValueForCriterion:inRow:"))
      ||!objj_msgSend(aDelegate, "respondsToSelector:", sel_getUid("ruleEditor:child:forCriterion:withRowType:")) ) )
   objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, _cmd+" : missing required delegate methods");
    _delegate=aDelegate;
}
},["void","id"]), new objj_method(sel_getUid("isEditable"), function $SPRuleEditor__isEditable(self, _cmd)
{ with(self)
{
    return objj_msgSend(_contentView, "editable");
}
},["BOOL"]), new objj_method(sel_getUid("setEditable:"), function $SPRuleEditor__setEditable_(self, _cmd, editable)
{ with(self)
{
 objj_msgSend(_contentView, "setEditable:", editable);
}
},["void","BOOL"]), new objj_method(sel_getUid("nestingMode"), function $SPRuleEditor__nestingMode(self, _cmd)
{ with(self)
{
     return objj_msgSend(_model, "nestingMode");
}
},["SPRuleEditorNestingMode"]), new objj_method(sel_getUid("setNestingMode:"), function $SPRuleEditor__setNestingMode_(self, _cmd, nestingMode)
{ with(self)
{
 objj_msgSend(_model, "setNestingMode:", nestingMode);
}
},["void","SPRuleEditorNestingMode"]), new objj_method(sel_getUid("canRemoveAllRows"), function $SPRuleEditor__canRemoveAllRows(self, _cmd)
{ with(self)
{
    return objj_msgSend(_model, "canRemoveAllRows");
}
},["BOOL"]), new objj_method(sel_getUid("setCanRemoveAllRows:"), function $SPRuleEditor__setCanRemoveAllRows_(self, _cmd, canRemoveAllRows)
{ with(self)
{
    objj_msgSend(_model, "setCanRemoveAllRows:", canRemoveAllRows);
}
},["void","BOOL"]), new objj_method(sel_getUid("rowHeight"), function $SPRuleEditor__rowHeight(self, _cmd)
{ with(self)
{
 return objj_msgSend(_contentView, "rowHeight");
}
},["CGFloat"]), new objj_method(sel_getUid("setRowHeight:"), function $SPRuleEditor__setRowHeight_(self, _cmd, rowHeight)
{ with(self)
{
 objj_msgSend(_contentView, "setRowHeight:", rowHeight);
}
},["void","CGFloat"]), new objj_method(sel_getUid("formattingDictionary"), function $SPRuleEditor__formattingDictionary(self, _cmd)
{ with(self)
{
    return objj_msgSend(_standardLocalizer, "dictionary");
}
},["CPDictionary"]), new objj_method(sel_getUid("setFormattingDictionary:"), function $SPRuleEditor__setFormattingDictionary_(self, _cmd, dictionary)
{ with(self)
{
    objj_msgSend(_standardLocalizer, "setDictionary:", dictionary);
    _stringsFilename = nil;
}
},["void","CPDictionary"]), new objj_method(sel_getUid("formattingStringsFilename"), function $SPRuleEditor__formattingStringsFilename(self, _cmd)
{ with(self)
{
    return _stringsFilename;
}
},["CPString"]), new objj_method(sel_getUid("setFormattingStringsFilename:"), function $SPRuleEditor__setFormattingStringsFilename_(self, _cmd, stringsFilename)
{ with(self)
{
    if (_standardLocalizer == nil)
        _standardLocalizer = objj_msgSend(SPRuleEditorLocalizer, "new");
    if (_stringsFilename != stringsFilename)
    {
        _stringsFilename = stringsFilename;
        if (stringsFilename !== nil)
        {
            if (!objj_msgSend(stringsFilename, "hasSuffix:", ".strings"))
                stringsFilename = stringsFilename + ".strings";
            var path = objj_msgSend(objj_msgSend(CPBundle, "mainBundle"), "pathForResource:", stringsFilename);
            if (path !=nil)
                objj_msgSend(_standardLocalizer, "loadContentOfURL:", objj_msgSend(CPURL, "URLWithString:", path));
        }
    }
}
},["void","CPString"]), new objj_method(sel_getUid("reloadCriteria"), function $SPRuleEditor__reloadCriteria(self, _cmd)
{ with(self)
{
}
},["void"]), new objj_method(sel_getUid("setCriteria:andDisplayValues:forRowAtIndex:"), function $SPRuleEditor__setCriteria_andDisplayValues_forRowAtIndex_(self, _cmd, criteria, values, rowIndex)
{ with(self)
{
 if(!criteria||!values)
  return;
 var row=objj_msgSend(_model, "rowAtIndex:", rowIndex);
 if(!row)
  return;
 var cCount=objj_msgSend(criteria, "count");
 if(!cCount)
  objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, _cmd+" : invalid criterion array, must not be empty");
 var items;
 var value;
 var criterion;
 var vCount=objj_msgSend(values, "count");
 var res=objj_msgSend(CPArray, "initWithCapacity:", cCount);
 for(var i=0;i<cCount;i++)
 {
  items=objj_msgSend(criteria, "objectAtIndex:", i);
  if(!items||!objj_msgSend(items, "isKindOfClass:", CPArray))
   objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, _cmd+" : invalid criteria : criteria must be an array of arrays");
  value=(i<vCount)?values[i]:nil;
  criterion=objj_msgSend(objj_msgSend(SPRuleEditorCriterion, "alloc"), "initWithItems:displayValue:", items, value);
  objj_msgSend(res, "addObject:", criterion);
 }
 objj_msgSend(row, "setCriteria:", res);
}
},["void","CPArray","CPArray","int"]), new objj_method(sel_getUid("criteriaForRow:"), function $SPRuleEditor__criteriaForRow_(self, _cmd, rowIndex)
{ with(self)
{
 var row=objj_msgSend(_model, "rowAtIndex:", rowIndex);
 if(!row)
  return nil;
 return objj_msgSend(row, "criteriaItems");
}
},["id","int"]), new objj_method(sel_getUid("displayValuesForRow:"), function $SPRuleEditor__displayValuesForRow_(self, _cmd, rowIndex)
{ with(self)
{
 var row=objj_msgSend(_model, "rowAtIndex:", rowIndex);
 if(!row)
  return nil;
 return objj_msgSend(row, "criteriaDisplayValues");
}
},["CPMutableArray","int"]), new objj_method(sel_getUid("numberOfRows"), function $SPRuleEditor__numberOfRows(self, _cmd)
{ with(self)
{
 return objj_msgSend(_model, "flatRowsCount");
}
},["int"]), new objj_method(sel_getUid("parentRowForRow:"), function $SPRuleEditor__parentRowForRow_(self, _cmd, rowIndex)
{ with(self)
{
 var row=objj_msgSend(_model, "rowAtIndex:", rowIndex);
 if(!row)
  return nil;
 return objj_msgSend(row, "parent");
}
},["int","int"]), new objj_method(sel_getUid("rowForDisplayValue:"), function $SPRuleEditor__rowForDisplayValue_(self, _cmd, displayValue)
{ with(self)
{
 return objj_msgSend(_model, "rowWithDisplayValue:", displayValue);
}
},["CPInteger","id"]), new objj_method(sel_getUid("rowTypeForRow:"), function $SPRuleEditor__rowTypeForRow_(self, _cmd, rowIndex)
{ with(self)
{
 var row=objj_msgSend(_model, "rowAtIndex:", rowIndex);
 if(!row)
  return nil;
 return objj_msgSend(row, "rowType");
}
},["SPRuleEditorRowType","int"]), new objj_method(sel_getUid("subrowIndexesForRow:"), function $SPRuleEditor__subrowIndexesForRow_(self, _cmd, rowIndex)
{ with(self)
{
 return objj_msgSend(_model, "immediateSubrowsIndexesOfRowAtIndex:", rowIndex);
}
},["CPIndexSet","int"]), new objj_method(sel_getUid("selectedRowIndexes"), function $SPRuleEditor__selectedRowIndexes(self, _cmd)
{ with(self)
{
 return nil;
}
},["CPIndexSet"]), new objj_method(sel_getUid("selectRowIndexes:byExtendingSelection:"), function $SPRuleEditor__selectRowIndexes_byExtendingSelection_(self, _cmd, indexes, extend)
{ with(self)
{
}
},["void","CPIndexSet","BOOL"]), new objj_method(sel_getUid("addRow:"), function $SPRuleEditor__addRow_(self, _cmd, sender)
{ with(self)
{
 var rowType=objj_msgSend(_model, "defaultRowType");
 var index=objj_msgSend(_model, "lastRowIndex")+1;
 var criteria=objj_msgSend(self, "refreshCriteriaForNewRowOfType:atIndex:", rowType, index);
 criteria=objj_msgSend(self, "willInsertNewRowWithCriteria:atIndex:", criteria, index);
 if(!criteria)
  return;
 objj_msgSend(_model, "addNewRowOfType:criteria:", rowType, criteria);
}
},["void","id"]), new objj_method(sel_getUid("insertRowAtIndex:withType:asSubrowOfRow:animate:"), function $SPRuleEditor__insertRowAtIndex_withType_asSubrowOfRow_animate_(self, _cmd, rowIndex, rowType, parentRow, shouldAnimate)
{ with(self)
{
 var criteria=objj_msgSend(self, "refreshCriteriaForNewRowOfType:atIndex:", rowType, rowIndex);
 criteria=objj_msgSend(self, "willInsertNewRowWithCriteria:atIndex:", criteria, rowIndex);
 if(!criteria)
  return;
 objj_msgSend(_model, "insertNewRowAtIndex:ofType:withParentRowIndex:criteria:data:", rowIndex, rowType, parentRow, criteria, nil);
}
},["void","int","unsignedint","int","BOOL"]), new objj_method(sel_getUid("removeRowAtIndex:"), function $SPRuleEditor__removeRowAtIndex_(self, _cmd, rowIndex)
{ with(self)
{
 objj_msgSend(_model, "removeRowAtIndex:includeSubrows:", rowIndex, NO);
}
},["void","int"]), new objj_method(sel_getUid("removeRowsAtIndexes:includeSubrows:"), function $SPRuleEditor__removeRowsAtIndexes_includeSubrows_(self, _cmd, rowIndexes, includeSubrows)
{ with(self)
{
 objj_msgSend(_model, "removeRowsAtIndexes:includeSubrows:", rowIndexes, includeSubrows);
}
},["void","CPIndexSet","BOOL"]), new objj_method(sel_getUid("rowClass"), function $SPRuleEditor__rowClass(self, _cmd)
{ with(self)
{
 return _rowClass;
}
},["Class"]), new objj_method(sel_getUid("setRowClass:"), function $SPRuleEditor__setRowClass_(self, _cmd, rowClass)
{ with(self)
{
 if(_rowClass!==rowClass)
  _rowClass=rowClass;
}
},["void","Class"]), new objj_method(sel_getUid("rowTypeKeyPath"), function $SPRuleEditor__rowTypeKeyPath(self, _cmd)
{ with(self)
{
    return _rowTypeKeyPath;
}
},["CPString"]), new objj_method(sel_getUid("setRowTypeKeyPath:"), function $SPRuleEditor__setRowTypeKeyPath_(self, _cmd, keyPath)
{ with(self)
{
    if(_rowTypeKeyPath!==keyPath)
       _rowTypeKeyPath=keyPath;
}
},["void","CPString"]), new objj_method(sel_getUid("subrowsKeyPath"), function $SPRuleEditor__subrowsKeyPath(self, _cmd)
{ with(self)
{
    return _subrowsKeyPath;
}
},["CPString"]), new objj_method(sel_getUid("setSubrowsKeyPath:"), function $SPRuleEditor__setSubrowsKeyPath_(self, _cmd, keyPath)
{ with(self)
{
    if(_subrowsKeyPath!==keyPath)
        _subrowsKeyPath=keyPath;
}
},["void","CPString"]), new objj_method(sel_getUid("criteriaKeyPath"), function $SPRuleEditor__criteriaKeyPath(self, _cmd)
{ with(self)
{
    return _criteriaKeyPath;
}
},["CPString"]), new objj_method(sel_getUid("setCriteriaKeyPath:"), function $SPRuleEditor__setCriteriaKeyPath_(self, _cmd, keyPath)
{ with(self)
{
    if(_criteriaKeyPath!==keyPath)
        _criteriaKeyPath=keyPath;
}
},["void","CPString"]), new objj_method(sel_getUid("displayValuesKeyPath"), function $SPRuleEditor__displayValuesKeyPath(self, _cmd)
{ with(self)
{
    return _displayValuesKeyPath;
}
},["CPString"]), new objj_method(sel_getUid("setDisplayValuesKeyPath:"), function $SPRuleEditor__setDisplayValuesKeyPath_(self, _cmd, keyPath)
{ with(self)
{
    if(_displayValuesKeyPath!==keyPath)
        _displayValuesKeyPath=keyPath;
}
},["void","CPString"]), new objj_method(sel_getUid("animation"), function $SPRuleEditor__animation(self, _cmd)
{ with(self)
{
    return nil;
}
},["id"]), new objj_method(sel_getUid("setAnimation:"), function $SPRuleEditor__setAnimation_(self, _cmd, animation)
{ with(self)
{
}
},["void","CPViewAnimation"]), new objj_method(sel_getUid("refreshCriteriaForNewRowOfType:atIndex:"), function $SPRuleEditor__refreshCriteriaForNewRowOfType_atIndex_(self, _cmd, rowType, rowIndex)
{ with(self)
{
 return objj_msgSend(self, "refreshCriteriaForRow:rowIndex:rowType:startingAtIndex:currentValueIndex:currentValue:", nil, rowIndex, rowType, 0, 0, nil);
}
},["CPArray","CPInteger",null]), new objj_method(sel_getUid("refreshCriteriaForRow:rowIndex:rowType:startingAtIndex:currentValueIndex:currentValue:"), function $SPRuleEditor__refreshCriteriaForRow_rowIndex_rowType_startingAtIndex_currentValueIndex_currentValue_(self, _cmd, aRow, rowIndex, rowType, index, valueIndex, currentValue)
{ with(self)
{
 if(!aRow&&index>0)
  objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, _cmd+" : startingIndex must be 0 when refreshing criteria from delegate when row is not yet created");
 if(aRow&&valueIndex<0)
  objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, _cmd+" : parentValueIndex must be >= 0");
 var criteria;
 var currentCriterion=nil;
 var currentCriterionItem=nil;
 if(aRow&&index>=0)
 {
  var criteria=objj_msgSend(aRow, "criteria");
  var count=objj_msgSend(criteria, "count");
  for(var i=index;i<count;i++)
   objj_msgSend(criteria, "removeObjectAtIndex:", index);
  count=objj_msgSend(criteria, "count");
  if(count)
  {
   currentCriterion=criteria[count-1];
   objj_msgSend(currentCriterion, "setDisplayValue:", currentValue);
  }
 }
 else
  criteria=objj_msgSend(objj_msgSend(CPMutableArray, "alloc"), "init");
 if(currentCriterion)
 {
  var items=objj_msgSend(currentCriterion, "items")
  var count=items?objj_msgSend(items, "count"):0;
  if(!count)
   objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, _cmd+" : invalid internal criterion object");
  if(valueIndex>=count)
   objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, _cmd+" : invalid internal criterion object");
  currentCriterionItem=items[valueIndex];
  objj_msgSend(currentCriterion, "setCurrentIndex:", valueIndex);
 }
 var newCriterion;
 var criterionItem;
 var criterionDisplayValue=nil;
 var nb;
 var first=YES;
 while((nb=objj_msgSend(_delegate, "ruleEditor:numberOfChildrenForCriterion:withRowType:", self, currentCriterionItem, rowType))>0)
 {
  var items=objj_msgSend(CPMutableArray, "arrayWithCapacity:", nb);
  for(var i=0;i<nb;i++)
  {
   criterionItem=objj_msgSend(_delegate, "ruleEditor:child:forCriterion:withRowType:", self, i, currentCriterionItem, rowType);
   if(!criterionItem)
    objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, _cmd+" : delegate must return not null criterion children");
   objj_msgSend(items, "addObject:", criterionItem);
  }
  if(currentCriterionItem==objj_msgSend(items, "objectAtIndex:", 0))
   objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, _cmd+" : infinite loop detected");
  if(first)
  {
   first=NO;
   var value;
   for(var i=0;i<nb;i++)
   {
    criterionItem=objj_msgSend(items, "objectAtIndex:", i);
    value=objj_msgSend(_delegate, "ruleEditor:displayValueForCriterion:inRow:", self, criterionItem, rowIndex);
    if(objj_msgSend(value, "isKindOfClass:", CPMenuItem)&&objj_msgSend(value, "isSeparatorItem"))
     continue;
    if(!objj_msgSend(self, "rowForDisplayValue:", value))
    {
     currentCriterionItem=criterionItem;
     criterionDisplayValue=value;
     break;
    }
   }
   if(!criterionDisplayValue)
   {
    do
    {
     var useCeil=(new Date().getTime()%2)==0;
     var rand=Math.random()*(nb-1);
     var idx=useCeil?Math.ceil(rand):Math.floor(rand);
     idx=Math.min(idx,nb-1);
     currentCriterionItem=objj_msgSend(items, "objectAtIndex:", idx);
     criterionDisplayValue=objj_msgSend(_delegate, "ruleEditor:displayValueForCriterion:inRow:", self, currentCriterionItem, rowIndex);
    }
    while(objj_msgSend(criterionDisplayValue, "isKindOfClass:", CPMenuItem)&&objj_msgSend(criterionDisplayValue, "isSeparatorItem"));
   }
  }
  else
  {
   currentCriterionItem=objj_msgSend(items, "objectAtIndex:", 0);
   criterionDisplayValue=objj_msgSend(_delegate, "ruleEditor:displayValueForCriterion:inRow:", self, currentCriterionItem, rowIndex);
  }
  objj_msgSend(criteria, "addObject:", objj_msgSend(objj_msgSend(SPRuleEditorCriterion, "alloc"), "initWithItems:displayValue:", items, criterionDisplayValue));
 }
 return criteria;
}
},["CPArray","SPRuleEditorModelItem","CPInteger","CPInteger","CPInteger",null,"id"]), new objj_method(sel_getUid("predicate"), function $SPRuleEditor__predicate(self, _cmd)
{ with(self)
{
 if(_predicate)
     return _predicate;
 objj_msgSend(self, "reloadPredicate");
 return _predicate;
}
},["CPPredicate"]), new objj_method(sel_getUid("reloadPredicate"), function $SPRuleEditor__reloadPredicate(self, _cmd)
{ with(self)
{
    var count=objj_msgSend(_model, "rowsCount");
    if(!count)
     return;
 var row;
 var subpredicate;
    var subpredicates=objj_msgSend(CPMutableArray, "array");
 var indexes=objj_msgSend(self, "subrowIndexesForRow:", -1);
 var index=indexes?objj_msgSend(indexes, "firstIndex"):CPNotFound;
 while(index!=CPNotFound)
    {
     row=objj_msgSend(_model, "rowAtIndex:", index);
     subpredicate=objj_msgSend(self, "predicateForRow:", index);
     if(subpredicate)
      objj_msgSend(subpredicates, "addObject:", subpredicate);
     index=objj_msgSend(indexes, "indexGreaterThanIndex:", index);
    }
    if(objj_msgSend(subpredicates, "count")==1&&objj_msgSend(objj_msgSend(subpredicates, "objectAtIndex:", 0), "isKindOfClass:", CPCompoundPredicate))
    {
     _predicate=objj_msgSend(subpredicates, "objectAtIndex:", 0);
  if(objj_msgSend(_predicate, "compoundPredicateType")==CPNotPredicateType)
  {
   var subpredicates=objj_msgSend(_predicate, "subpredicates");
   var subpredicate=objj_msgSend(objj_msgSend(CPCompoundPredicate, "alloc"), "initWithType:subpredicates:", CPOrPredicateType, subpredicates);
         _predicate=objj_msgSend(objj_msgSend(CPCompoundPredicate, "alloc"), "initWithType:subpredicates:", CPNotPredicateType, objj_msgSend(CPArray, "arrayWithObject:", subpredicate));
  }
     return;
    }
    _predicate=objj_msgSend(objj_msgSend(CPCompoundPredicate, "alloc"), "initWithType:subpredicates:", CPAndPredicateType, subpredicates);
}
},["void"]), new objj_method(sel_getUid("predicateForRow:"), function $SPRuleEditor__predicateForRow_(self, _cmd, aRowIndex)
{ with(self)
{
 if(!_delegate||!objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("ruleEditor:predicatePartsForCriterion:withDisplayValue:inRow:")))
  return nil;
    var row=objj_msgSend(_model, "rowAtIndex:", aRowIndex);
    if(!row)
     return nil;
    var predicate;
    var criteria=objj_msgSend(row, "criteria");
    var count=objj_msgSend(criteria, "count");
 var criterion;
 var criterionItem;
 var displayValue;
 var predicateInfo;
    var predicateParts=objj_msgSend(CPDictionary, "dictionary");
    for(var i=0;i<count;i++)
    {
        criterion=objj_msgSend(criteria, "objectAtIndex:", i);
        criterionItem=objj_msgSend(criterion, "currentItem");
        if(!criterionItem)
         continue;
        displayValue=objj_msgSend(criterion, "displayValue");
        predicateInfo=objj_msgSend(_delegate, "ruleEditor:predicatePartsForCriterion:withDisplayValue:inRow:", self, criterionItem, displayValue, aRowIndex);
        if(predicateInfo)
            objj_msgSend(predicateParts, "addEntriesFromDictionary:", predicateInfo);
    }
    if(objj_msgSend(row, "rowType")==SPRuleEditorRowTypeCompound)
    {
     var compoundType=objj_msgSend(predicateParts, "objectForKey:", SPRuleEditorPredicateCompoundType);
  return objj_msgSend(self, "compoundPredicateForRow:compoundType:", row, compoundType);
    }
    var options=objj_msgSend(predicateParts, "objectForKey:", SPRuleEditorPredicateOptions);
    var modifier=objj_msgSend(predicateParts, "objectForKey:", SPRuleEditorPredicateComparisonModifier);
    var selector=CPSelectorFromString(objj_msgSend(predicateParts, "objectForKey:", SPRuleEditorPredicateCustomSelector));
    try
    {
        if(selector)
        {
            return objj_msgSend(CPComparisonPredicate, "predicateWithLeftExpression:rightExpression:customSelector:", objj_msgSend(predicateParts, "objectForKey:", SPRuleEditorPredicateLeftExpression), objj_msgSend(predicateParts, "objectForKey:", SPRuleEditorPredicateRightExpression), selector);
        }
        return objj_msgSend(CPComparisonPredicate, "predicateWithLeftExpression:rightExpression:modifier:type:options:", objj_msgSend(predicateParts, "objectForKey:", SPRuleEditorPredicateLeftExpression), objj_msgSend(predicateParts, "objectForKey:", SPRuleEditorPredicateRightExpression), (modifier||CPDirectPredicateModifier), objj_msgSend(predicateParts, "objectForKey:", SPRuleEditorPredicateOperatorType), (options||CPCaseInsensitivePredicateOption));
    }
    catch(error)
    {
        CPLog.debug("predicate error: ["+objj_msgSend(error, "description")+"] for row "+aRow);
        return nil;
    }
}
},["CPPredicate","CPInteger"]), new objj_method(sel_getUid("compoundPredicateForRow:compoundType:"), function $SPRuleEditor__compoundPredicateForRow_compoundType_(self, _cmd, row, compoundType)
{ with(self)
{
 if(!row)
  return nil;
 var subrow;
    var subpredicate;
    var subpredicates=objj_msgSend(CPMutableArray, "array");
    var count=objj_msgSend(row, "subrowsCount");
    for(var i=0;i<count;i++)
    {
     subrow=objj_msgSend(row, "childAtIndex:", i);
     subpredicate=objj_msgSend(self, "predicateForRow:", objj_msgSend(_model, "indexOfRow:", subrow));
     if(!subpredicate)
      continue;
     objj_msgSend(subpredicates, "addObject:", subpredicate);
    }
    if(!objj_msgSend(subpredicates, "count"))
        return nil;
    try
    {
        return objj_msgSend(objj_msgSend(CPCompoundPredicate, "alloc"), "initWithType:subpredicates:", compoundType, subpredicates);
    }
    catch(error)
    {
        CPLog.debug("predicate error"+objj_msgSend(error, "description"));
        return nil;
    }
}
},["CPPredicate","SPRuleEditorModelItem","CPInteger"]), new objj_method(sel_getUid("willInsertNewRowWithCriteria:atIndex:"), function $SPRuleEditor__willInsertNewRowWithCriteria_atIndex_(self, _cmd, criteria, index)
{ with(self)
{
 return criteria;
}
},["CPArray","CPArray","CPInteger"]), new objj_method(sel_getUid("didAddRow:"), function $SPRuleEditor__didAddRow_(self, _cmd, row)
{ with(self)
{
}
},["void","SPRuleEditorModelItem"]), new objj_method(sel_getUid("willModifyRow:"), function $SPRuleEditor__willModifyRow_(self, _cmd, row)
{ with(self)
{
}
},["void","SPRuleEditorModelItem"]), new objj_method(sel_getUid("didModifyRow:"), function $SPRuleEditor__didModifyRow_(self, _cmd, row)
{ with(self)
{
}
},["void","SPRuleEditorModelItem"]), new objj_method(sel_getUid("didRemoveRow:"), function $SPRuleEditor__didRemoveRow_(self, _cmd, row)
{ with(self)
{
}
},["void","SPRuleEditorModelItem"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("defaultThemeClass"), function $SPRuleEditor__defaultThemeClass(self, _cmd)
{ with(self)
{
    return "rule-editor";
}
},["CPString"]), new objj_method(sel_getUid("themeAttributes"), function $SPRuleEditor__themeAttributes(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPDictionary, "dictionaryWithObjects:forKeys:", [objj_msgSend(CPNull, "null"), objj_msgSend(CPNull, "null"), objj_msgSend(CPNull, "null"), objj_msgSend(CPNull, "null"), objj_msgSend(CPNull, "null"), objj_msgSend(CPNull, "null"), objj_msgSend(CPNull, "null"), objj_msgSend(CPNull, "null")], ["alternating-row-colors", "selected-color", "slice-top-border-color", "slice-bottom-border-color", "slice-last-bottom-border-color", "font", "add-image", "remove-image"]);
}
},["id"])]);
}
{
var the_class = objj_getClass("SPRuleEditor")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"SPRuleEditor\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("notifyRowAdded:"), function $SPRuleEditor__notifyRowAdded_(self, _cmd, notification)
{ with(self)
{
 if(!notification)
  objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, _cmd+" : null notification");
 var userInfo=objj_msgSend(notification, "userInfo");
 if(!userInfo)
  objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, _cmd+" : notification userInfo is null");
 var row=objj_msgSend(userInfo, "valueForKey:", "row");
 if(!row)
  objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, _cmd+" : notification userInfo is missing row");
 objj_msgSend(self, "didAddRow:", row);
 objj_msgSend(self, "notifyRowsDidChange:", notification);
}
},["void","CPNotification"]), new objj_method(sel_getUid("notifyRowRemoved:"), function $SPRuleEditor__notifyRowRemoved_(self, _cmd, notification)
{ with(self)
{
 if(!notification)
  objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, _cmd+" : null notification");
 var userInfo=objj_msgSend(notification, "userInfo");
 if(!userInfo)
  objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, _cmd+" : notification userInfo is null");
 var row=objj_msgSend(userInfo, "valueForKey:", "row");
 if(!row)
  objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, _cmd+" : notification userInfo is missing row");
 objj_msgSend(self, "didRemoveRow:", row);
 objj_msgSend(self, "notifyRowsDidChange:", notification);
}
},["void","CPNotification"]), new objj_method(sel_getUid("notifyRowModified:"), function $SPRuleEditor__notifyRowModified_(self, _cmd, notification)
{ with(self)
{
 if(!notification)
  objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, _cmd+" : null notification");
 var userInfo=objj_msgSend(notification, "userInfo");
 if(!userInfo)
  objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, _cmd+" : notification userInfo is null");
 var row=objj_msgSend(userInfo, "valueForKey:", "row");
 if(!row)
  objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, _cmd+" : notification userInfo is missing row");
 objj_msgSend(self, "didModifyRow:", row);
 objj_msgSend(self, "notifyRowsDidChange:", notification);
}
},["void","CPNotification"]), new objj_method(sel_getUid("notifyRowsDidChange:"), function $SPRuleEditor__notifyRowsDidChange_(self, _cmd, notification)
{ with(self)
{
 objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", SPRuleEditorRowsDidChangeNotification, self);
 if(!_delegate||!objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("ruleEditorRowsDidChange:")))
  return;
 var notif=objj_msgSend(CPNotification, "notificationWithName:object:", SPRuleEditorRowsDidChangeNotification, self);
 objj_msgSend(_delegate, "ruleEditorRowsDidChange:", notif);
}
},["void","CPNotification"])]);
}
{
var the_class = objj_getClass("SPRuleEditor")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"SPRuleEditor\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("localizedString:"), function $SPRuleEditor__localizedString_(self, _cmd, text)
{ with(self)
{
 if(!objj_msgSend(self, "standardLocalizer"))
  return text;
 var res=objj_msgSend(objj_msgSend(self, "standardLocalizer"), "localizedStringForString:", text);
 return res!=nil?res:text;
}
},["CPString","CPString"]), new objj_method(sel_getUid("canMoveRow:afterRow:"), function $SPRuleEditor__canMoveRow_afterRow_(self, _cmd, aRow, anotherRow)
{ with(self)
{
 if(aRow==anotherRow||objj_msgSend(anotherRow, "hasAncestor:", aRow))
  return NO;
 if(!objj_msgSend(_model, "isRowRemoveable:includeSubrows:", aRow, YES))
  return NO;
 if(objj_msgSend(anotherRow, "rowType")==SPRuleEditorRowTypeCompound)
  return objj_msgSend(_model, "allowNewRowInsertOfType:withParent:", objj_msgSend(aRow, "rowType"), anotherRow);
 else
  return objj_msgSend(_model, "allowNewRowInsertOfType:withParent:", objj_msgSend(aRow, "rowType"), objj_msgSend(anotherRow, "parent"));
}
},["BOOL","SPRuleEditorModelItem","SPRuleEditorModelItem"]), new objj_method(sel_getUid("moveRow:afterRow:"), function $SPRuleEditor__moveRow_afterRow_(self, _cmd, aRow, anotherRow)
{ with(self)
{
 if(!objj_msgSend(self, "canMoveRow:afterRow:", aRow, anotherRow))
  return;
 var index=objj_msgSend(_model, "indexOfRow:", aRow);
 var removedRow=objj_msgSend(_model, "removeRowAtIndex:includeSubrows:", index, YES);
 if(!removedRow)
  return;
 index=objj_msgSend(_model, "indexOfRow:", anotherRow)+1;
 var parentIndex=objj_msgSend(anotherRow, "rowType")==SPRuleEditorRowTypeCompound?index-1:objj_msgSend(_model, "indexOfRow:", objj_msgSend(anotherRow, "parent"));
 objj_msgSend(_model, "insertRow:atIndex:withParentRowIndex:", removedRow, index, parentIndex);
}
},["void","SPRuleEditorModelItem","SPRuleEditorModelItem"]), new objj_method(sel_getUid("insertNewRowOfType:afterRow:"), function $SPRuleEditor__insertNewRowOfType_afterRow_(self, _cmd, rowType, aRow)
{ with(self)
{
 if(!aRow)
  return;
 var index=objj_msgSend(_model, "indexOfRow:", aRow);
 if(index==CPNotFound)
  return;
 var originalRowType=objj_msgSend(aRow, "rowType");
 if(originalRowType==SPRuleEditorRowTypeCompound)
 {
  rowType=objj_msgSend(_model, "allowNewRowInsertOfType:withParent:", rowType, aRow)?rowType:SPRuleEditorRowTypeSimple;
  objj_msgSend(self, "insertRowAtIndex:withType:asSubrowOfRow:animate:", index+1, rowType, index, YES);
  return;
 }
 var parent=objj_msgSend(aRow, "parent");
 var parentIndex=parent?objj_msgSend(_model, "indexOfRow:", parent):-1;
 index++;
 objj_msgSend(self, "insertRowAtIndex:withType:asSubrowOfRow:animate:", index, rowType, parentIndex, YES);
}
},["void","CPInteger","SPRuleEditorModelItem"]), new objj_method(sel_getUid("isRowRemoveable:"), function $SPRuleEditor__isRowRemoveable_(self, _cmd, aRow)
{ with(self)
{
 return objj_msgSend(_model, "isRowRemoveable:includeSubrows:", aRow, NO);
}
},["BOOL","SPRuleEditorModelItem"]), new objj_method(sel_getUid("removeRow:"), function $SPRuleEditor__removeRow_(self, _cmd, aRow)
{ with(self)
{
 if(!aRow)
  return;
 var index=objj_msgSend(_model, "indexOfRow:", aRow);
 if(index==CPNotFound)
  return;
 objj_msgSend(self, "removeRowAtIndex:", index);
}
},["void","SPRuleEditorModelItem"]), new objj_method(sel_getUid("valueChanged:criterionIndex:valueIndex:inRow:"), function $SPRuleEditor__valueChanged_criterionIndex_valueIndex_inRow_(self, _cmd, value, index, valueIndex, aRow)
{ with(self)
{
 if(!aRow)
  return;
 var rowIndex=objj_msgSend(_model, "indexOfRow:", aRow);
 if(rowIndex==CPNotFound)
  return;
 var criteria=objj_msgSend(self, "refreshCriteriaForRow:rowIndex:rowType:startingAtIndex:currentValueIndex:currentValue:", aRow, rowIndex, SPRuleEditorRowTypeSimple, index+1, valueIndex, value);
 objj_msgSend(self, "willModifyRow:", aRow);
 objj_msgSend(_model, "setCriteria:forRow:", criteria, aRow);
}
},["void","id","CPInteger",null,"SPRuleEditorModelItem"]), new objj_method(sel_getUid("criterionItemCopy:"), function $SPRuleEditor__criterionItemCopy_(self, _cmd, item)
{ with(self)
{
 return objj_msgSend(item, "copy");
}
},["id","id"])]);
}
{
var the_class = objj_getClass("SPRuleEditor")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"SPRuleEditor\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $SPRuleEditor__initWithCoder_(self, _cmd, coder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("SPRuleEditor").super_class }, "initWithCoder:", coder);
    if (self != nil)
    {
     objj_msgSend(self, "_build");
    }
    return self;
}
},["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $SPRuleEditor__encodeWithCoder_(self, _cmd, coder)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("SPRuleEditor").super_class }, "encodeWithCoder:", coder);
}
},["void","id"])]);
}

