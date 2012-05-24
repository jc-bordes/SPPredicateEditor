@STATIC;1.0;i;14;SPRuleEditor.ji;30;SPPredicateEditorRowTemplate.jt;31895;objj_executeFile("SPRuleEditor.j", YES);
objj_executeFile("SPPredicateEditorRowTemplate.j", YES);
{var the_class = objj_allocateClassPair(SPRuleEditor, "SPPredicateEditor"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_rowTemplates"), new objj_ivar("_simpleCriteriaRoot"), new objj_ivar("_compoundCriteriaRoot")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("rowTemplates"), function $SPPredicateEditor__rowTemplates(self, _cmd)
{ with(self)
{
    return _rowTemplates;
}
},["CPArray"]), new objj_method(sel_getUid("setRowTemplates:"), function $SPPredicateEditor__setRowTemplates_(self, _cmd, rowTemplates)
{ with(self)
{
    _rowTemplates=rowTemplates;
    objj_msgSend(self, "setupRowTemplates");
}
},["void","id"]), new objj_method(sel_getUid("_build"), function $SPPredicateEditor___build(self, _cmd)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("SPPredicateEditor").super_class }, "_build");
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("SPPredicateEditor").super_class }, "setDelegate:", self);
}
},["void"]), new objj_method(sel_getUid("objectValue"), function $SPPredicateEditor__objectValue(self, _cmd)
{ with(self)
{
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("SPPredicateEditor").super_class }, "predicate");
}
},["id"]), new objj_method(sel_getUid("setObjectValue:"), function $SPPredicateEditor__setObjectValue_(self, _cmd, objectValue)
{ with(self)
{
 if(!objectValue)
 {
  objj_msgSend(_model, "removeAllRows");
  return;
 }
 if(!objj_msgSend(objectValue, "isKindOfClass:", CPPredicate))
  objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, _cmd+" : argument must be a CPPredicate");
 var nestingMode=objj_msgSend(_model, "nestingMode");
 var predicate=objectValue;
    objj_msgSend(self, "willChangeValueForKey:", "objectValue");
 var predicates;
 switch(nestingMode)
 {
  case SPRuleEditorNestingModeCompound :
  case SPRuleEditorNestingModeSimple :
   if(!objj_msgSend(predicate, "isKindOfClass:", CPCompoundPredicate))
   {
    predicate=objj_msgSend(objj_msgSend(CPCompoundPredicate, "alloc"), "initWithType:subpredicates:", objj_msgSend(self, "defaultCompoundType"), objj_msgSend(CPArray, "arrayWithObject:", predicate));
    predicates=objj_msgSend(CPMutableArray, "arrayWithObject:", predicate);
    break;
   }
   if(objj_msgSend(predicate, "compoundPredicateType")==CPNotPredicateType)
   {
    var subpredicates=objj_msgSend(predicate, "subpredicates");
    var singlePredicate=subpredicates&&objj_msgSend(subpredicates, "count")==1?objj_msgSend(subpredicates, "objectAtIndex:", 0):nil;
    if(singlePredicate&&objj_msgSend(singlePredicate, "compoundPredicateType")==CPOrPredicateType)
    {
     predicates=objj_msgSend(singlePredicate, "subpredicates");
     predicate=objj_msgSend(objj_msgSend(CPCompoundPredicate, "alloc"), "initWithType:subpredicates:", CPNotPredicateType, predicates);
    }
   }
   predicates=objj_msgSend(CPMutableArray, "arrayWithObject:", predicate);
  break;
  case SPRuleEditorNestingModeList :
   if(objj_msgSend(predicate, "isKindOfClass:", CPCompoundPredicate))
    predicates=objj_msgSend(predicate, "subpredicates");
   else
    predicates=objj_msgSend(CPMutableArray, "arrayWithObject:", predicate);
  break;
  case SPRuleEditorNestingModeSingle :
   if(objj_msgSend(predicate, "isKindOfClass:", CPCompoundPredicate))
   {
    predicates=objj_msgSend(predicate, "subpredicates");
    if(predicates&&objj_msgSend(predicates, "count"))
     predicates=objj_msgSend(CPMutableArray, "arrayWithObject:", objj_msgSend(predicates, "objectAtIndex:", 0));
   }
   else
    predicates=objj_msgSend(CPMutableArray, "arrayWithObject:", predicate);
  break;
 }
 objj_msgSend(_model, "removeAllRows");
 if(predicates)
 {
  var predicate;
  var template;
  var row;
  var count=objj_msgSend(predicates, "count");
  for(var i=0;i<count;i++)
  {
   predicate=objj_msgSend(predicates, "objectAtIndex:", i);
   row=objj_msgSend(self, "createRowForPredicate:", predicate);
   objj_msgSend(_model, "addRow:", row);
  }
 }
    objj_msgSend(self, "didChangeValueForKey:", "objectValue");
}
},["void","id"]), new objj_method(sel_getUid("defaultCompoundType"), function $SPPredicateEditor__defaultCompoundType(self, _cmd)
{ with(self)
{
 if(!_compoundCriteriaRoot||!objj_msgSend(_compoundCriteriaRoot, "count"))
  return CPAndPredicateType;
 var view=objj_msgSend(_compoundCriteriaRoot, "objectAtIndex:", 0);
 if(!view||!objj_msgSend(view, "isKindOfClass:", CPPopUpButton))
  objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, _cmd+" : invalid compound template view");
 var items=objj_msgSend(view, "itemArray");
 if(!items||!objj_msgSend(items, "count"))
  objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, _cmd+" : invalid compound template view");
 var value=objj_msgSend(items, "objectAtIndex:", 0);
 var template=objj_msgSend(self, "mappedTemplateForObject:", value);
 if(!template)
  objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, _cmd+" : invalid compound template view");
 var types=objj_msgSend(template, "compoundTypes");
 if(!types||!objj_msgSend(types, "count"))
  objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, _cmd+" : invalid compound template");
 return types[0];
}
},["CPNumber"]), new objj_method(sel_getUid("templateForPredicate:"), function $SPPredicateEditor__templateForPredicate_(self, _cmd, predicate)
{ with(self)
{
 if(!predicate)
  return nil;
 var result;
 var bestResult=0;
 var matchIndex=CPNotFound;
 var template;
 var count=_rowTemplates?objj_msgSend(_rowTemplates, "count"):0;
 for(var i=0;i<count;i++)
 {
  template=_rowTemplates[i];
  result=objj_msgSend(template, "matchForPredicate:", predicate);
  if(result>bestResult)
  {
   bestResult=result;
   matchIndex=i;
  }
 }
 if(matchIndex==CPNotFound)
  return nil;
 return objj_msgSend(_rowTemplates, "objectAtIndex:", matchIndex);
}
},["SPPredicateEditorRowTemplate","CPPredicate"]), new objj_method(sel_getUid("createRowForPredicate:"), function $SPPredicateEditor__createRowForPredicate_(self, _cmd, predicate)
{ with(self)
{
 if(!predicate)
  return nil;
 var template=objj_msgSend(self, "templateForPredicate:", predicate);
 if(!template)
  return nil;
 var criteria=objj_msgSend(self, "criteriaForPredicate:usingTemplate:", predicate, template);
 criteria=objj_msgSend(template, "preProcessCriteria:", criteria);
 var rowType=objj_msgSend(predicate, "isKindOfClass:", CPCompoundPredicate)?SPRuleEditorRowTypeCompound:SPRuleEditorRowTypeSimple;
 var row=objj_msgSend(objj_msgSend(SPRuleEditorModelItem, "alloc"), "initWithType:criteria:data:", rowType, criteria, template);
 var subpredicates=objj_msgSend(template, "displayableSubpredicatesOfPredicate:", predicate);
 if(!subpredicates)
  return row;
 var subrow;
 var subpredicate;
 var count=objj_msgSend(subpredicates, "count");
 for(var i=0;i<count;i++)
 {
  subpredicate=subpredicates[i];
  template=objj_msgSend(self, "templateForPredicate:", subpredicate);
  subrow=objj_msgSend(self, "createRowForPredicate:", subpredicate);
  if(subrow)
   objj_msgSend(row, "addChild:context:", subrow, nil);
 }
 return row;
}
},["SPRuleEditorModelItem","CPPredicate"]), new objj_method(sel_getUid("criteriaForPredicate:usingTemplate:"), function $SPPredicateEditor__criteriaForPredicate_usingTemplate_(self, _cmd, predicate, template)
{ with(self)
{
 if(objj_msgSend(predicate, "isKindOfClass:", CPCompoundPredicate))
  return objj_msgSend(self, "criteriaForCompoundPredicate:usingTemplate:", predicate, template);
 if(objj_msgSend(predicate, "isKindOfClass:", CPComparisonPredicate))
  return objj_msgSend(self, "criteriaForComparisonPredicate:usingTemplate:", predicate, template);
 return nil;
}
},["id","CPPredicate","SPPredicateEditorRowTemplate"]), new objj_method(sel_getUid("criteriaForCompoundPredicate:usingTemplate:"), function $SPPredicateEditor__criteriaForCompoundPredicate_usingTemplate_(self, _cmd, predicate, template)
{ with(self)
{
 if(!_compoundCriteriaRoot
  ||!template
  ||!predicate
  ||!objj_msgSend(predicate, "isKindOfClass:", CPCompoundPredicate))
  return nil;
 var type=objj_msgSend(predicate, "compoundPredicateType");
 var count=objj_msgSend(_compoundCriteriaRoot, "count");
 var rootItem=nil;
 var criterionItem;
 var aTemplate;
 for(var i=0;i<count;i++)
 {
  criterionItem=objj_msgSend(_compoundCriteriaRoot, "objectAtIndex:", i);
  if(!objj_msgSend(criterionItem, "isKindOfClass:", CPMenuItem)||objj_msgSend(criterionItem, "representedObject")!==type)
   continue;
  aTemplate=objj_msgSend(self, "mappedTemplateForObject:", criterionItem);
  if(aTemplate!=template)
   continue;
  rootItem=criterionItem;
  break;
 }
 if(!rootItem)
  return nil;
 var criterion=objj_msgSend(objj_msgSend(SPRuleEditorCriterion, "alloc"), "initWithItems:displayValue:", _compoundCriteriaRoot, rootItem);
 var criteria=objj_msgSend(CPMutableArray, "arrayWithObject:", criterion);
 var currentCriterionItem=rootItem;
 var target;
 while((target=objj_msgSend(currentCriterionItem, "target"))!=nil)
 {
  criterion=objj_msgSend(self, "createCriterionFromView:", target);
  if(objj_msgSend(target, "isKindOfClass:", CPPopUpButton))
  {
   currentCriterionItem=objj_msgSend(criterion, "displayValue");
   objj_msgSend(criteria, "addObject:", criterion);
   continue;
  }
  if(objj_msgSend(target, "isKindOfClass:", CPView))
  {
   currentCriterionItem=target;
   objj_msgSend(criteria, "addObject:", criterion);
   continue;
  }
  break;
 }
 return criteria;
}
},["id","CPPredicate","SPPredicateEditorRowTemplate"]), new objj_method(sel_getUid("criteriaForComparisonPredicate:usingTemplate:"), function $SPPredicateEditor__criteriaForComparisonPredicate_usingTemplate_(self, _cmd, predicate, template)
{ with(self)
{
 if(!_simpleCriteriaRoot
  ||!template
  ||!predicate
  ||!objj_msgSend(predicate, "isKindOfClass:", CPComparisonPredicate))
  return nil;
 var expression=objj_msgSend(predicate, "leftExpression");
 if(!expression)
  objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, _cmd+" : invalid predicate");
 var aTemplate;
 var criterionItem;
 var keypath=objj_msgSend(expression, "keyPath");
 var count=objj_msgSend(_simpleCriteriaRoot, "count");
 for(var i=0;i<count;i++)
 {
  criterionItem=objj_msgSend(_simpleCriteriaRoot, "objectAtIndex:", i);
  if(!objj_msgSend(criterionItem, "isKindOfClass:", CPMenuItem)||objj_msgSend(criterionItem, "title")!==keypath)
   continue;
  aTemplate=objj_msgSend(self, "mappedTemplateForObject:", criterionItem);
  if(aTemplate!=template)
   continue;
  rootItem=criterionItem;
  break;
 }
 var criterion=objj_msgSend(objj_msgSend(SPRuleEditorCriterion, "alloc"), "initWithItems:displayValue:", _simpleCriteriaRoot, rootItem);
 var criteria=objj_msgSend(CPMutableArray, "arrayWithObject:", criterion);
 var target=objj_msgSend(rootItem, "target");
 var opType=objj_msgSend(predicate, "predicateOperatorType");
 criterion=objj_msgSend(self, "createCriterionFromView:representedObject:", target, opType);
 if(!criterion)
  objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, _cmd+" : invalid predicate");
 objj_msgSend(criteria, "addObject:", criterion);
 target=objj_msgSend(objj_msgSend(criterion, "displayValue"), "target");
 expression=objj_msgSend(predicate, "rightExpression");
 if(!expression)
  objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, _cmd+" : invalid predicate");
 keypath=objj_msgSend(expression, "keyPath");
 criterion=objj_msgSend(self, "createCriterionFromView:representedObject:", target, keypath);
 if(!criterion)
  objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, _cmd+" : invalid predicate");
 objj_msgSend(criteria, "addObject:", criterion);
 if(objj_msgSend(template, "options"))
 {
  target=objj_msgSend(objj_msgSend(criterion, "displayValue"), "target");
  criterion=objj_msgSend(self, "createCriterionFromView:representedObject:", target, objj_msgSend(predicate, "options"));
  if(!criterion)
   objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, _cmd+" : invalid predicate");
  objj_msgSend(criteria, "addObject:", criterion);
 }
 var currentCriterionItem=objj_msgSend(objj_msgSend(criterion, "displayValue"), "target");
 while((target=objj_msgSend(currentCriterionItem, "target"))!=nil)
 {
  criterion=objj_msgSend(self, "createCriterionFromView:", target);
  if(objj_msgSend(target, "isKindOfClass:", CPPopUpButton))
  {
   currentCriterionItem=objj_msgSend(criterion, "displayValue");
   objj_msgSend(criteria, "addObject:", criterion);
   continue;
  }
  if(objj_msgSend(target, "isKindOfClass:", CPView))
  {
   currentCriterionItem=target;
   objj_msgSend(criteria, "addObject:", criterion);
   continue;
  }
  break;
 }
 return criteria;
}
},["id","CPPredicate","SPPredicateEditorRowTemplate"]), new objj_method(sel_getUid("createCriterionFromView:"), function $SPPredicateEditor__createCriterionFromView_(self, _cmd, view)
{ with(self)
{
 var criterionItems;
 var criterionDisplayValue;
 if(objj_msgSend(view, "isKindOfClass:", CPPopUpButton))
 {
  criterionItems=objj_msgSend(view, "itemArray");
  criterionDisplayValue=criterionItems&&objj_msgSend(criterionItems, "count")?criterionItems[0]:nil;
  return objj_msgSend(objj_msgSend(SPRuleEditorCriterion, "alloc"), "initWithItems:displayValue:", criterionItems, criterionDisplayValue);
 }
 if(objj_msgSend(view, "isKindOfClass:", CPView))
 {
  criterionItems=objj_msgSend(CPMutableArray, "arrayWithObject:", view);
     criterionDisplayValue=objj_msgSend(CPKeyedUnarchiver, "unarchiveObjectWithData:", objj_msgSend(CPKeyedArchiver, "archivedDataWithRootObject:", view));
     objj_msgSend(criterionDisplayValue, "setTarget:", objj_msgSend(view, "target"));
  return objj_msgSend(objj_msgSend(SPRuleEditorCriterion, "alloc"), "initWithItems:displayValue:", criterionItems, criterionDisplayValue);
 }
 return nil;
}
},["SPRuleEditorCriterion","CPView"]), new objj_method(sel_getUid("createCriterionFromView:representedObject:"), function $SPPredicateEditor__createCriterionFromView_representedObject_(self, _cmd, view, object)
{ with(self)
{
 var criterionItems;
 var criterionDisplayValue;
 if(objj_msgSend(view, "isKindOfClass:", CPPopUpButton))
 {
  criterionItems=objj_msgSend(view, "itemArray");
  if(objj_msgSend(object, "isKindOfClass:", CPString))
   criterionDisplayValue=objj_msgSend(view, "itemWithTitle:", object);
  else
  {
   var valueIndex=objj_msgSend(view, "indexOfItemWithRepresentedObject:", object);
   if(valueIndex==CPNotFound)
    return nil;
   criterionDisplayValue=objj_msgSend(view, "itemAtIndex:", valueIndex);
  }
  return objj_msgSend(objj_msgSend(SPRuleEditorCriterion, "alloc"), "initWithItems:displayValue:", criterionItems, criterionDisplayValue);
 }
 if(objj_msgSend(view, "isKindOfClass:", CPView))
 {
  criterionItems=objj_msgSend(CPMutableArray, "arrayWithObject:", view);
     criterionDisplayValue=objj_msgSend(CPKeyedUnarchiver, "unarchiveObjectWithData:", objj_msgSend(CPKeyedArchiver, "archivedDataWithRootObject:", view));
     objj_msgSend(criterionDisplayValue, "setTarget:", objj_msgSend(view, "target"));
     if(objj_msgSend(object, "isKindOfClass:", CPString)&&objj_msgSend(view, "respondsToSelector:", sel_getUid("setStringValue:")))
      objj_msgSend(view, "setStringValue:", object);
     else
     if(objj_msgSend(view, "respondsToSelector:", sel_getUid("setObjectValue:")))
      objj_msgSend(view, "setObjectValue:", object);
  return objj_msgSend(objj_msgSend(SPRuleEditorCriterion, "alloc"), "initWithItems:displayValue:", criterionItems, criterionDisplayValue);
 }
 return nil;
}
},["SPRuleEditorCriterion","CPView","id"]), new objj_method(sel_getUid("setupRowTemplates"), function $SPPredicateEditor__setupRowTemplates(self, _cmd)
{ with(self)
{
 if(!_rowTemplates||!objj_msgSend(_rowTemplates, "count"))
 {
  _simpleCriteriaRoot=nil;
  _compoundCriteriaRoot=nil;
  return;
 }
 var template;
 var views;
 var count=objj_msgSend(_rowTemplates, "count");
 for(var i=0;i<count;i++)
  objj_msgSend(self, "setupCriteriaForTemplate:", objj_msgSend(_rowTemplates, "objectAtIndex:", i));
}
},["void"]), new objj_method(sel_getUid("setupCriteriaForTemplate:"), function $SPPredicateEditor__setupCriteriaForTemplate_(self, _cmd, template)
{ with(self)
{
 if(!template)
  return;
 var views=objj_msgSend(template, "templateViews");
 if(!views||!objj_msgSend(views, "count"))
  return;
 var root;
 var rowType=objj_msgSend(template, "_rowType");
 if(rowType==SPRuleEditorRowTypeSimple)
 {
  if(!_simpleCriteriaRoot)
   _simpleCriteriaRoot=objj_msgSend(CPMutableArray, "array");
  root=_simpleCriteriaRoot;
 }
 else
 if(rowType==SPRuleEditorRowTypeCompound)
 {
  if(!_compoundCriteriaRoot)
   _compoundCriteriaRoot=objj_msgSend(CPMutableArray, "array");
  root=_compoundCriteriaRoot;
 }
 else
  return;
 var view;
 var nextView=nil;
 var count=objj_msgSend(views, "count");
 for(var i=0;i<count;i++)
 {
  view=objj_msgSend(views, "objectAtIndex:", i);
  nextView=(i<count-1)?objj_msgSend(views, "objectAtIndex:", i+1):nil;
  objj_msgSend(self, "setTarget:forView:", nextView, view);
  if(i==0)
   objj_msgSend(self, "retainItemsOfView:inRoot:forTemplate:", view, root, template);
 }
}
},["void","SPPredicateEditorRowTemplate"]), new objj_method(sel_getUid("setTarget:forView:"), function $SPPredicateEditor__setTarget_forView_(self, _cmd, target, view)
{ with(self)
{
 if(!view)
  objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, _cmd+" : template views must not be nil.");
 if(!objj_msgSend(view, "isKindOfClass:", CPControl))
  objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, _cmd+" : template views must extend CPControl");
 if(objj_msgSend(view, "isKindOfClass:", CPPopUpButton))
 {
  var items=objj_msgSend(view, "itemArray");
  var count=objj_msgSend(items, "count");
  var item;
  for(var i=0;i<count;i++)
  {
   item=objj_msgSend(items, "objectAtIndex:", i);
   if(objj_msgSend(item, "isSeparatorItem"))
    continue;
   objj_msgSend(item, "setTarget:", target);
  }
  return;
 }
 objj_msgSend(view, "setTarget:", target);
}
},["void","CPView","CPView"]), new objj_method(sel_getUid("retainItemsOfView:inRoot:forTemplate:"), function $SPPredicateEditor__retainItemsOfView_inRoot_forTemplate_(self, _cmd, view, root, template)
{ with(self)
{
 if(!view)
  objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, _cmd+" : template views must not be nil.");
 if(!objj_msgSend(view, "isKindOfClass:", CPPopUpButton))
  objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, _cmd+" : template root (the first view) must extend CPPopUpButton");
 var items=objj_msgSend(view, "itemArray");
 var count=objj_msgSend(items, "count");
 var item;
 for(var i=0;i<count;i++)
 {
  item=objj_msgSend(items, "objectAtIndex:", i);
  if(objj_msgSend(item, "isSeparatorItem"))
   continue;
  objj_msgSend(root, "addObject:", item);
  objj_msgSend(self, "mapObject:withTemplate:protect:", item, template, YES);
 }
}
},["void","CPView","CPArray","SPPredicateEditorRowTemplate"]), new objj_method(sel_getUid("ruleEditor:numberOfChildrenForCriterion:withRowType:"), function $SPPredicateEditor__ruleEditor_numberOfChildrenForCriterion_withRowType_(self, _cmd, editor, criterion, rowType)
{ with(self)
{
    if(!criterion)
    {
  if(rowType==SPRuleEditorRowTypeSimple)
   return objj_msgSend(_simpleCriteriaRoot, "count");
  return objj_msgSend(_compoundCriteriaRoot, "count");
    }
 if(!objj_msgSend(criterion, "respondsToSelector:", sel_getUid("target")))
  objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, _cmd+" : invalid criterion");
 var target=objj_msgSend(criterion, "target");
 if(!target||target==criterion)
  return 0;
 if(objj_msgSend(target, "isKindOfClass:", CPPopUpButton))
  return objj_msgSend(target, "numberOfItems");
 else
 if(objj_msgSend(target, "isKindOfClass:", CPControl))
  return 1;
 return 0;
}
},["CPInteger","SPRuleEditor","id","int"]), new objj_method(sel_getUid("ruleEditor:child:forCriterion:withRowType:"), function $SPPredicateEditor__ruleEditor_child_forCriterion_withRowType_(self, _cmd, editor, index, criterion, rowType)
{ with(self)
{
    if(!criterion)
    {
  if(rowType==SPRuleEditorRowTypeSimple)
   return objj_msgSend(_simpleCriteriaRoot, "objectAtIndex:", index);
  return objj_msgSend(_compoundCriteriaRoot, "objectAtIndex:", index);
    }
 var target=objj_msgSend(criterion, "target");
 if(objj_msgSend(target, "isKindOfClass:", objj_msgSend(CPPopUpButton, "class")))
  return objj_msgSend(target, "itemAtIndex:", index);
 if(objj_msgSend(target, "isKindOfClass:", objj_msgSend(CPView, "class")))
 {
     var newTarget=objj_msgSend(CPKeyedUnarchiver, "unarchiveObjectWithData:", objj_msgSend(CPKeyedArchiver, "archivedDataWithRootObject:", target));
     objj_msgSend(newTarget, "setTarget:", objj_msgSend(target, "target"));
     return newTarget;
 }
 return nil;
}
},["id","SPRuleEditor","CPInteger","id","int"]), new objj_method(sel_getUid("ruleEditor:displayValueForCriterion:inRow:"), function $SPPredicateEditor__ruleEditor_displayValueForCriterion_inRow_(self, _cmd, editor, criterion, row)
{ with(self)
{
    if(objj_msgSend(criterion, "isKindOfClass:", objj_msgSend(CPMenuItem, "class")))
    {
  if(objj_msgSend(criterion, "isSeparatorItem"))
   return objj_msgSend(CPMenuItem, "separatorItem");
  return criterion;
    }
 return objj_msgSend(CPKeyedUnarchiver, "unarchiveObjectWithData:", objj_msgSend(CPKeyedArchiver, "archivedDataWithRootObject:", criterion));
}
},["id","SPRuleEditor","id","CPInteger"]), new objj_method(sel_getUid("predicateForRow:"), function $SPPredicateEditor__predicateForRow_(self, _cmd, aRowIndex)
{ with(self)
{
 var row=objj_msgSend(_model, "rowAtIndex:", aRowIndex);
 if(!row)
  objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, _cmd+" : invalid row index");
 var template=objj_msgSend(row, "data");
 if(!template||!objj_msgSend(template, "isKindOfClass:", SPPredicateEditorRowTemplate))
  objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, _cmd+" : invalid row data, no template ref");
 var views=objj_msgSend(template, "templateViews");
 if(!views)
  objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, _cmd+" : invalid template, no views");
 var criteria=objj_msgSend(row, "criteria");
 if(!criteria)
  objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, _cmd+" : invalid row, missing criteria");
 var count=objj_msgSend(views, "count");
 if(objj_msgSend(criteria, "count")<count)
  objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, _cmd+" : invalid row or template, criteria and views number do not match");
 var view;
 var displayValue;
 var criterion;
 var subpredicates=objj_msgSend(self, "subpredicatesForRow:", row);
 for(var i=0;i<count;i++)
 {
  view=objj_msgSend(views, "objectAtIndex:", i);
  criterion=objj_msgSend(criteria, "objectAtIndex:", i);
  displayValue=objj_msgSend(criterion, "displayValue");
  objj_msgSend(self, "selectValue:inCriterionView:", displayValue, view);
 }
 return objj_msgSend(template, "predicateWithSubpredicates:", subpredicates);
}
},["CPPredicate","CPInteger"]), new objj_method(sel_getUid("subpredicatesForRow:"), function $SPPredicateEditor__subpredicatesForRow_(self, _cmd, row)
{ with(self)
{
 if(!row||objj_msgSend(row, "rowType")!=SPRuleEditorRowTypeCompound)
  return objj_msgSend(CPMutableArray, "array");
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
    return subpredicates;
}
},["CPArray","SPRuleEditorModelItem"]), new objj_method(sel_getUid("selectValue:inCriterionView:"), function $SPPredicateEditor__selectValue_inCriterionView_(self, _cmd, displayValue, view)
{ with(self)
{
 if(!displayValue)
  objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, _cmd+" : invalid display value for criterion, must not be nil");
 if(!view)
  objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, _cmd+" : invalid view in template, must not be nil");
 if(objj_msgSend(displayValue, "isKindOfClass:", CPMenuItem))
 {
  if(!objj_msgSend(view, "isKindOfClass:", CPPopUpButton))
   objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, _cmd+" : invalid display value for criterion, does not match template view class");
        objj_msgSend(view, "selectItemWithTitle:", objj_msgSend(displayValue, "title"));
        return;
 }
 if(objj_msgSend(displayValue, "isKindOfClass:", CPString))
 {
  if(objj_msgSend(view, "isKindOfClass:", CPPopUpButton))
  {
         objj_msgSend(view, "selectItemWithTitle:", displayValue);
         return;
  }
     if(objj_msgSend(view, "respondsToSelector:", sel_getUid("setStringValue:")))
  {
         objj_msgSend(view, "setStringValue:", displayValue);
         return;
  }
     if(objj_msgSend(view, "respondsToSelector:", sel_getUid("setObjectValue:")))
  {
         objj_msgSend(view, "setObjectValue:", objectValue);
         return;
  }
 }
 if(objj_msgSend(displayValue, "isKindOfClass:", CPControl))
 {
  if(objj_msgSend(view, "isKindOfClass:", CPPopUpButton)||!objj_msgSend(view, "isKindOfClass:", CPControl))
   objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, _cmd+" : invalid display value for criterion, does not match template view class");
        if(objj_msgSend(displayValue, "respondsToSelector:", sel_getUid("color")))
        {
         if(!objj_msgSend(view, "respondsToSelector:", sel_getUid("setColor:")))
    objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, _cmd+" : invalid display value for criterion, does not match template view class");
         objj_msgSend(view, "setColor:", objj_msgSend(displayValue, "color"));
         return;
        }
        if(objj_msgSend(displayValue, "respondsToSelector:", sel_getUid("stringValue")))
        {
         if(!objj_msgSend(view, "respondsToSelector:", sel_getUid("setStringValue:")))
    objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, _cmd+" : invalid display value for criterion, does not match template view class");
         objj_msgSend(view, "setStringValue:", objj_msgSend(displayValue, "stringValue"));
         return;
        }
        if(objj_msgSend(displayValue, "respondsToSelector:", sel_getUid("objectValue")))
        {
         if(!objj_msgSend(view, "respondsToSelector:", sel_getUid("setObjectValue:")))
    objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, _cmd+" : invalid display value for criterion, does not match template view class");
         objj_msgSend(view, "setObjectValue:", objj_msgSend(displayValue, "objectValue"));
         return;
        }
 }
 objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, _cmd+" : failed to set display value on criterion, classes do not match");
}
},["void","id","CPView"]), new objj_method(sel_getUid("setDelegate"), function $SPPredicateEditor__setDelegate(self, _cmd)
{ with(self)
{
}
},["void"]), new objj_method(sel_getUid("willInsertNewRowWithCriteria:atIndex:"), function $SPPredicateEditor__willInsertNewRowWithCriteria_atIndex_(self, _cmd, criteria, index)
{ with(self)
{
 var template=objj_msgSend(self, "templateRefFromCriteria:", criteria);
 if(template)
  return objj_msgSend(template, "preProcessCriteria:", criteria);
 return criteria;
}
},["CPArray","CPArray","CPInteger"]), new objj_method(sel_getUid("didAddRow:"), function $SPPredicateEditor__didAddRow_(self, _cmd, row)
{ with(self)
{
 objj_msgSend(self, "updateTemplateRefForRow:", row);
}
},["void","SPRuleEditorModelItem"]), new objj_method(sel_getUid("willModifyRow:"), function $SPPredicateEditor__willModifyRow_(self, _cmd, row)
{ with(self)
{
 var template=objj_msgSend(self, "updateTemplateRefForRow:", row);
 var criteria=objj_msgSend(row, "criteria");
 if(!criteria||!template)
  return;
 objj_msgSend(template, "preProcessCriteria:", criteria);
}
},["void","SPRuleEditorModelItem"]), new objj_method(sel_getUid("criterionItemCopy:"), function $SPPredicateEditor__criterionItemCopy_(self, _cmd, item)
{ with(self)
{
 var template=objj_msgSend(self, "mappedTemplateForObject:", item);
 var copy=objj_msgSend(item, "copy");
 objj_msgSend(self, "mapObject:withTemplate:", copy, template);
 return copy;
}
},["id","id"]), new objj_method(sel_getUid("updateTemplateRefForRow:"), function $SPPredicateEditor__updateTemplateRefForRow_(self, _cmd, row)
{ with(self)
{
 if(!row)
  return nil;
 var template=objj_msgSend(self, "templateRefFromCriteria:", objj_msgSend(row, "criteria"));
 objj_msgSend(row, "setData:", template);
 return template;
}
},["SPPredicateEditorRowTemplate","SPRuleEditorModelItem"]), new objj_method(sel_getUid("templateRefFromCriteria:"), function $SPPredicateEditor__templateRefFromCriteria_(self, _cmd, criteria)
{ with(self)
{
 if(!criteria||!objj_msgSend(criteria, "count"))
  objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, _cmd+" : invalid criterion array, must not be empty");
 var firstCriterion=objj_msgSend(criteria, "objectAtIndex:", 0);
 var template=objj_msgSend(self, "mappedTemplateForObject:", objj_msgSend(firstCriterion, "displayValue"));
 if(!template)
  objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, _cmd+" : orphan row, no template found");
 return template;
}
},["SPPredicateEditorRowTemplate","CPArray"]), new objj_method(sel_getUid("mapObject:withTemplate:"), function $SPPredicateEditor__mapObject_withTemplate_(self, _cmd, value, template)
{ with(self)
{
 objj_msgSend(self, "mapObject:withTemplate:protect:", value, template, NO);
}
},["void","id","SPPredicateEditorRowTemplate"]), new objj_method(sel_getUid("mapObject:withTemplate:protect:"), function $SPPredicateEditor__mapObject_withTemplate_protect_(self, _cmd, value, template, protect)
{ with(self)
{
 if(!value||!template)
  return;
 value[":)"]=template;
}
},["void","id","SPPredicateEditorRowTemplate","BOOL"]), new objj_method(sel_getUid("mappedTemplateForObject:"), function $SPPredicateEditor__mappedTemplateForObject_(self, _cmd, value)
{ with(self)
{
 if(!value)
  return nil;
 return value[":)"];
}
},["SPPredicateEditorRowTemplate","id"])]);
}
var CPPredicateTemplatesKey = "CPPredicateTemplates";
{
var the_class = objj_getClass("SPPredicateEditor")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"SPPredicateEditor\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $SPPredicateEditor__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    self=objj_msgSendSuper({ receiver:self, super_class:objj_getClass("SPPredicateEditor").super_class }, "initWithCoder:", aCoder);
    if (self != nil)
    {
        objj_msgSend(self, "setRowTemplates:", objj_msgSend(aCoder, "decodeObjectForKey:", CPPredicateTemplatesKey));
    }
    return self;
}
},["id","id"]), new objj_method(sel_getUid("encodeWithCoder:"), function $SPPredicateEditor__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("SPPredicateEditor").super_class }, "encodeWithCoder:", aCoder);
    objj_msgSend(aCoder, "encodeObject:forKey:", _rowTemplates, CPPredicateTemplatesKey);
}
},["void","id"])]);
}

