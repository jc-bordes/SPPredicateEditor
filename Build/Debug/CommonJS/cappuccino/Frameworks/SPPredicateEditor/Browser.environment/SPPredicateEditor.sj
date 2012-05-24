@STATIC;1.0;p;19;SPPredicateEditor.jt;31969;@STATIC;1.0;i;14;SPRuleEditor.ji;30;SPPredicateEditorRowTemplate.jt;31895;objj_executeFile("SPRuleEditor.j", YES);
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

p;24;SPPredicateEditorClass.jt;554;@STATIC;1.0;I;21;Foundation/CPObject.jt;510;objj_executeFile("Foundation/CPObject.j", NO);
{var the_class = objj_allocateClassPair(CPObject, "SPPredicateEditor"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(meta_class, [new objj_method(sel_getUid("version"), function $SPPredicateEditor__version(self, _cmd)
{ with(self)
{
    var bundle = objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(self, "class"));
    return objj_msgSend(bundle, "objectForInfoDictionaryKey:", "CPBundleVersion");
}
},["CPString"])]);
}

p;33;SPPredicateEditorFloatTextField.jt;2731;@STATIC;1.0;I;20;AppKit/CPTextField.jt;2687;objj_executeFile("AppKit/CPTextField.j", NO);
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

p;35;SPPredicateEditorIntegerTextField.jt;2236;@STATIC;1.0;I;20;AppKit/CPTextField.jt;2192;objj_executeFile("AppKit/CPTextField.j", NO);
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

p;30;SPPredicateEditorRowTemplate.jt;38576;@STATIC;1.0;i;33;SPPredicateEditorFloatTextField.ji;35;SPPredicateEditorIntegerTextField.jt;38478;objj_executeFile("SPPredicateEditorFloatTextField.j", YES);
objj_executeFile("SPPredicateEditorIntegerTextField.j", YES);
CPUndefinedAttributeType = 0;
CPInteger16AttributeType = 100;
CPInteger32AttributeType = 200;
CPInteger64AttributeType = 300;
CPDecimalAttributeType = 400;
CPDoubleAttributeType = 500;
CPFloatAttributeType = 600;
CPStringAttributeType = 700;
CPBooleanAttributeType = 800;
CPDateAttributeType = 900;
CPBinaryDataAttributeType = 1000;
CPTransformableAttributeType = 1800;
{var the_class = objj_allocateClassPair(CPObject, "SPPredicateEditorRowTemplate"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_templateType"), new objj_ivar("_predicateOptions"), new objj_ivar("_predicateModifier"), new objj_ivar("_leftAttributeType"), new objj_ivar("_rightAttributeType"), new objj_ivar("_leftIsWildcard"), new objj_ivar("_rightIsWildcard"), new objj_ivar("_views")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("_templateType"), function $SPPredicateEditorRowTemplate___templateType(self, _cmd)
{ with(self)
{
return _templateType;
}
},["id"]),
new objj_method(sel_getUid("_setTemplateType:"), function $SPPredicateEditorRowTemplate___setTemplateType_(self, _cmd, newValue)
{ with(self)
{
_templateType = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("_predicateOptions"), function $SPPredicateEditorRowTemplate___predicateOptions(self, _cmd)
{ with(self)
{
return _predicateOptions;
}
},["id"]),
new objj_method(sel_getUid("_setOptions:"), function $SPPredicateEditorRowTemplate___setOptions_(self, _cmd, newValue)
{ with(self)
{
_predicateOptions = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("_predicateModifier"), function $SPPredicateEditorRowTemplate___predicateModifier(self, _cmd)
{ with(self)
{
return _predicateModifier;
}
},["id"]),
new objj_method(sel_getUid("_setModifier:"), function $SPPredicateEditorRowTemplate___setModifier_(self, _cmd, newValue)
{ with(self)
{
_predicateModifier = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("leftAttributeType"), function $SPPredicateEditorRowTemplate__leftAttributeType(self, _cmd)
{ with(self)
{
return _leftAttributeType;
}
},["id"]),
new objj_method(sel_getUid("_setLeftAttributeType:"), function $SPPredicateEditorRowTemplate___setLeftAttributeType_(self, _cmd, newValue)
{ with(self)
{
_leftAttributeType = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("rightAttributeType"), function $SPPredicateEditorRowTemplate__rightAttributeType(self, _cmd)
{ with(self)
{
return _rightAttributeType;
}
},["id"]),
new objj_method(sel_getUid("_setRightAttributeType:"), function $SPPredicateEditorRowTemplate___setRightAttributeType_(self, _cmd, newValue)
{ with(self)
{
_rightAttributeType = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("leftIsWildcard"), function $SPPredicateEditorRowTemplate__leftIsWildcard(self, _cmd)
{ with(self)
{
return _leftIsWildcard;
}
},["id"]),
new objj_method(sel_getUid("setLeftIsWildcard:"), function $SPPredicateEditorRowTemplate__setLeftIsWildcard_(self, _cmd, newValue)
{ with(self)
{
_leftIsWildcard = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("rightIsWildcard"), function $SPPredicateEditorRowTemplate__rightIsWildcard(self, _cmd)
{ with(self)
{
return _rightIsWildcard;
}
},["id"]),
new objj_method(sel_getUid("setRightIsWildcard:"), function $SPPredicateEditorRowTemplate__setRightIsWildcard_(self, _cmd, newValue)
{ with(self)
{
_rightIsWildcard = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("_views"), function $SPPredicateEditorRowTemplate___views(self, _cmd)
{ with(self)
{
return _views;
}
},["id"]),
new objj_method(sel_getUid("setTemplateViews:"), function $SPPredicateEditorRowTemplate__setTemplateViews_(self, _cmd, newValue)
{ with(self)
{
_views = newValue;
}
},["void","id"]), new objj_method(sel_getUid("initWithLeftExpressions:rightExpressions:modifier:operators:options:"), function $SPPredicateEditorRowTemplate__initWithLeftExpressions_rightExpressions_modifier_operators_options_(self, _cmd, leftExpressions, rightExpressions, modifier, operators, options)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("SPPredicateEditorRowTemplate").super_class }, "init");
    if (self != nil)
    {
        _templateType = 1;
        _leftIsWildcard = NO;
        _rightIsWildcard = NO;
        _leftAttributeType = 0;
        _rightAttributeType = 0;
        _predicateModifier = modifier;
        _predicateOptions = options;
        var leftView = objj_msgSend(self, "_viewFromExpressions:", leftExpressions),
            rightView = objj_msgSend(self, "_viewFromExpressions:", rightExpressions),
            middleView = objj_msgSend(self, "_viewFromOperatorTypes:", operators),
            optionsView = objj_msgSend(self, "_viewFromOptions:", options);
  if(!optionsView)
         _views = objj_msgSend(objj_msgSend(CPArray, "alloc"), "initWithObjects:", leftView, middleView, rightView);
     else
         _views = objj_msgSend(objj_msgSend(CPArray, "alloc"), "initWithObjects:", leftView, middleView, rightView, optionsView);
    }
    return self;
}
},["id","CPArray","CPArray","int","CPArray","int"]), new objj_method(sel_getUid("initWithLeftExpressions:rightExpressionAttributeType:modifier:operators:options:"), function $SPPredicateEditorRowTemplate__initWithLeftExpressions_rightExpressionAttributeType_modifier_operators_options_(self, _cmd, leftExpressions, attributeType, modifier, operators, options)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("SPPredicateEditorRowTemplate").super_class }, "init");
    if (self != nil)
    {
        var leftView = objj_msgSend(self, "_viewFromExpressions:", leftExpressions),
            middleView = objj_msgSend(self, "_viewFromOperatorTypes:", operators),
            rightView = objj_msgSend(self, "_viewFromAttributeType:", attributeType),
            optionsView = objj_msgSend(self, "_viewFromOptions:", options);
        _templateType = 1;
        _leftIsWildcard = NO;
        _rightIsWildcard = YES;
        _leftAttributeType = 0;
        _rightAttributeType = attributeType;
        _predicateModifier = modifier;
        _predicateOptions = options;
  if(!optionsView)
         _views = objj_msgSend(objj_msgSend(CPArray, "alloc"), "initWithObjects:", leftView, middleView, rightView);
     else
         _views = objj_msgSend(objj_msgSend(CPArray, "alloc"), "initWithObjects:", leftView, middleView, rightView, optionsView);
    }
    return self;
}
},["id","CPArray","CPAttributeType","CPComparisonPredicateModifier","CPArray","int"]), new objj_method(sel_getUid("initWithCompoundTypes:"), function $SPPredicateEditorRowTemplate__initWithCompoundTypes_(self, _cmd, compoundTypes)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("SPPredicateEditorRowTemplate").super_class }, "init");
    if (self != nil)
    {
        var leftView = objj_msgSend(self, "_viewFromCompoundTypes:", compoundTypes),
            rightView = objj_msgSend(objj_msgSend(CPPopUpButton, "alloc"), "init");
        objj_msgSend(rightView, "addItemWithTitle:", "of the following are true");
        _templateType = 2;
        _leftIsWildcard = NO;
        _rightIsWildcard = NO;
        _rightAttributeType = 0;
        _views = objj_msgSend(objj_msgSend(CPArray, "alloc"), "initWithObjects:", leftView, rightView);
    }
    return self;
}
},["id","CPArray"]), new objj_method(sel_getUid("matchForPredicate:"), function $SPPredicateEditorRowTemplate__matchForPredicate_(self, _cmd, predicate)
{ with(self)
{
    if (objj_msgSend(self, "_templateType") == 2 && objj_msgSend(predicate, "isKindOfClass:", objj_msgSend(CPCompoundPredicate, "class")))
    {
        if (objj_msgSend(objj_msgSend(self, "compoundTypes"), "containsObject:", objj_msgSend(predicate, "compoundPredicateType")))
                return 1;
    }
    else if (objj_msgSend(self, "_templateType") == 1 && objj_msgSend(predicate, "isKindOfClass:", objj_msgSend(CPComparisonPredicate, "class")))
    {
        if (!_leftIsWildcard && !objj_msgSend(objj_msgSend(self, "leftExpressions"), "containsObject:", objj_msgSend(predicate, "leftExpression")))
            return 0;
        if (!objj_msgSend(objj_msgSend(self, "operators"), "containsObject:", objj_msgSend(predicate, "predicateOperatorType")))
            return 0;
        if (!_rightIsWildcard && !objj_msgSend(objj_msgSend(self, "rightExpressions"), "containsObject:", objj_msgSend(predicate, "rightExpression")))
         return 0;
        if((objj_msgSend(self, "options")&objj_msgSend(predicate, "options"))==0)
         return 0.5;
        return 1;
    }
    return 0;
}
},["double","CPPredicate"]), new objj_method(sel_getUid("templateViews"), function $SPPredicateEditorRowTemplate__templateViews(self, _cmd)
{ with(self)
{
    return _views;
}
},["CPArray"]), new objj_method(sel_getUid("setPredicate:"), function $SPPredicateEditorRowTemplate__setPredicate_(self, _cmd, predicate)
{ with(self)
{
    if (_templateType == 2)
        objj_msgSend(self, "_setCompoundPredicate:", predicate);
    else
        objj_msgSend(self, "_setComparisonPredicate:", predicate);
}
},["void","CPPredicate"]), new objj_method(sel_getUid("displayableSubpredicatesOfPredicate:"), function $SPPredicateEditorRowTemplate__displayableSubpredicatesOfPredicate_(self, _cmd, predicate)
{ with(self)
{
    if (objj_msgSend(predicate, "isKindOfClass:", objj_msgSend(CPCompoundPredicate, "class")))
    {
        var subpredicates = objj_msgSend(predicate, "subpredicates");
        if (objj_msgSend(subpredicates, "count") == 0)
            return nil;
        return subpredicates;
    }
    return nil;
}
},["CPArray","CPPredicate"]), new objj_method(sel_getUid("predicateWithSubpredicates:"), function $SPPredicateEditorRowTemplate__predicateWithSubpredicates_(self, _cmd, subpredicates)
{ with(self)
{
    if (_templateType == 2)
    {
        var type = objj_msgSend(objj_msgSend(_views[0], "selectedItem"), "representedObject");
  if(type==CPNotPredicateType)
  {
   var subpredicate=objj_msgSend(objj_msgSend(CPCompoundPredicate, "alloc"), "initWithType:subpredicates:", CPOrPredicateType, subpredicates);
         return objj_msgSend(objj_msgSend(CPCompoundPredicate, "alloc"), "initWithType:subpredicates:", type, objj_msgSend(CPArray, "arrayWithObject:", subpredicate));
  }
        return objj_msgSend(objj_msgSend(CPCompoundPredicate, "alloc"), "initWithType:subpredicates:", type, subpredicates);
    }
    if (_templateType == 1)
    {
        var lhs = objj_msgSend(self, "_leftExpression"),
            rhs = objj_msgSend(self, "_rightExpression"),
            operator = objj_msgSend(objj_msgSend(_views[1], "selectedItem"), "representedObject"),
            options = 0;
        var optionsView=objj_msgSend(self, "options")&&objj_msgSend(_views, "count")>3?objj_msgSend(_views, "objectAtIndex:", 3):nil;
        if(optionsView)
      options=objj_msgSend(objj_msgSend(optionsView, "selectedItem"), "representedObject");
        return objj_msgSend(CPComparisonPredicate, "predicateWithLeftExpression:rightExpression:modifier:type:options:", lhs, rhs, objj_msgSend(self, "modifier"), operator, options);
    }
    return nil;
}
},["CPPredicate","CPArray"]), new objj_method(sel_getUid("leftExpressions"), function $SPPredicateEditorRowTemplate__leftExpressions(self, _cmd)
{ with(self)
{
    if (_templateType ==1 && !_leftIsWildcard)
    {
        var view = objj_msgSend(_views, "objectAtIndex:", 0);
        return objj_msgSend(objj_msgSend(view, "itemArray"), "valueForKey:", "representedObject");
    }
    return nil;
}
},["CPArray"]), new objj_method(sel_getUid("rightExpressions"), function $SPPredicateEditorRowTemplate__rightExpressions(self, _cmd)
{ with(self)
{
    if (_templateType == 1 && !_rightIsWildcard)
    {
        var view = objj_msgSend(_views, "objectAtIndex:", 2);
        return objj_msgSend(objj_msgSend(view, "itemArray"), "valueForKey:", "representedObject");
    }
    return nil;
}
},["CPArray"]), new objj_method(sel_getUid("compoundTypes"), function $SPPredicateEditorRowTemplate__compoundTypes(self, _cmd)
{ with(self)
{
    if (_templateType == 2)
    {
        var view = objj_msgSend(_views, "objectAtIndex:", 0);
        return objj_msgSend(objj_msgSend(view, "itemArray"), "valueForKey:", "representedObject");
    }
    return nil;
}
},["CPArray"]), new objj_method(sel_getUid("modifier"), function $SPPredicateEditorRowTemplate__modifier(self, _cmd)
{ with(self)
{
    if (_templateType == 1)
        return _predicateModifier;
    return nil;
}
},["CPComparisonPredicateModifier"]), new objj_method(sel_getUid("operators"), function $SPPredicateEditorRowTemplate__operators(self, _cmd)
{ with(self)
{
    if (_templateType == 1)
    {
        var view = objj_msgSend(_views, "objectAtIndex:", 1);
        return objj_msgSend(objj_msgSend(view, "itemArray"), "valueForKey:", "representedObject");
    }
    return nil;
}
},["CPArray"]), new objj_method(sel_getUid("options"), function $SPPredicateEditorRowTemplate__options(self, _cmd)
{ with(self)
{
    if (_templateType == 1)
        return _predicateOptions;
    return nil;
}
},["int"]), new objj_method(sel_getUid("rightExpressionAttributeType"), function $SPPredicateEditorRowTemplate__rightExpressionAttributeType(self, _cmd)
{ with(self)
{
    return _rightAttributeType;
}
},["CPAttributeType"]), new objj_method(sel_getUid("leftExpressionAttributeType"), function $SPPredicateEditorRowTemplate__leftExpressionAttributeType(self, _cmd)
{ with(self)
{
    return _leftAttributeType;
}
},["CPAttributeType"]), new objj_method(sel_getUid("_setCompoundPredicate:"), function $SPPredicateEditorRowTemplate___setCompoundPredicate_(self, _cmd, predicate)
{ with(self)
{
    var left = objj_msgSend(_views, "objectAtIndex:", 0),
        type = objj_msgSend(predicate, "compoundPredicateType"),
        index = objj_msgSend(left, "indexOfItemWithRepresentedObject:", type);
    objj_msgSend(left, "selectItemAtIndex:", index);
}
},["void","CPCompoundPredicate"]), new objj_method(sel_getUid("_setComparisonPredicate:"), function $SPPredicateEditorRowTemplate___setComparisonPredicate_(self, _cmd, predicate)
{ with(self)
{
    var optionsView=nil,
     left = objj_msgSend(_views, "objectAtIndex:", 0),
        middle = objj_msgSend(_views, "objectAtIndex:", 1),
        right = objj_msgSend(_views, "objectAtIndex:", 2),
        leftExpression = objj_msgSend(predicate, "leftExpression"),
        rightExpression = objj_msgSend(predicate, "rightExpression"),
        operator = objj_msgSend(predicate, "predicateOperatorType"),
        options = objj_msgSend(predicate, "predicateOptions");
    if(objj_msgSend(_views, "count")>3)
     optionsView=objj_msgSend(_views, "objectAtIndex:", 3)
    if (_leftIsWildcard)
        objj_msgSend(left, "setObjectValue:", objj_msgSend(leftExpression, "constantValue"));
    else
    {
        var index = objj_msgSend(left, "indexOfItemWithRepresentedObject:", leftExpression);
        objj_msgSend(left, "selectItemAtIndex:", index);
    }
    var op_index = objj_msgSend(middle, "indexOfItemWithRepresentedObject:", operator);
    objj_msgSend(middle, "selectItemAtIndex:", op_index);
    if (_rightIsWildcard)
        objj_msgSend(right, "setObjectValue:", objj_msgSend(rightExpression, "constantValue"));
    else
    {
        var index = objj_msgSend(right, "indexOfItemWithRepresentedObject:", rightExpression);
        objj_msgSend(right, "selectItemAtIndex:", index);
    }
    if(optionsView&&objj_msgSend(self, "_shouldSetOptionsForOperatorType:", objj_msgSend(predicate, "predicateOperatorType")))
    {
     var valueIndex=objj_msgSend(optionsView, "indexOfItemWithRepresentedObject:", objj_msgSend(CPNumber, "numberWithInt:", options));
  objj_msgSend(optionsView, "setSelectedIndex:", valueIndex);
    }
}
},["void","CPComparisonPredicate"]), new objj_method(sel_getUid("_shouldSetOptionsForOperatorType:"), function $SPPredicateEditorRowTemplate___shouldSetOptionsForOperatorType_(self, _cmd, opType)
{ with(self)
{
    return (opType==CPMatchesPredicateOperatorType
               ||opType==CPLikePredicateOperatorType
               ||opType== CPBeginsWithPredicateOperatorType
               ||opType== CPEndsWithPredicateOperatorType
               ||opType== CPInPredicateOperatorType
               ||opType== CPContainsPredicateOperatorType);
}
},["BOOL","CPInteger"]), new objj_method(sel_getUid("_leftExpression"), function $SPPredicateEditorRowTemplate___leftExpression(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "_expressionFromView:forAttributeType:", _views[0], _leftAttributeType);
}
},["CPExpression"]), new objj_method(sel_getUid("_rightExpression"), function $SPPredicateEditorRowTemplate___rightExpression(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "_expressionFromView:forAttributeType:", _views[2], _rightAttributeType);
}
},["CPExpression"]), new objj_method(sel_getUid("_expressionFromView:forAttributeType:"), function $SPPredicateEditorRowTemplate___expressionFromView_forAttributeType_(self, _cmd, aView, attributeType)
{ with(self)
{
  switch(attributeType)
 {
  case CPUndefinedAttributeType :
         return objj_msgSend(objj_msgSend(aView, "selectedItem"), "representedObject");
  case CPInteger16AttributeType :
  case CPInteger32AttributeType :
  case CPInteger64AttributeType :
  case CPDecimalAttributeType :
         value = objj_msgSend(aView, "intValue");
     break;
  case CPDoubleAttributeType :
  case CPFloatAttributeType :
         value = objj_msgSend(aView, "doubleValue");
     break;
  case CPStringAttributeType :
         value = objj_msgSend(aView, "stringValue");
     break;
  case CPBooleanAttributeType :
         value = objj_msgSend(objj_msgSend(aView, "selectedItem"), "representedObject");
     break;
  case CPDateAttributeType :
         value = objj_msgSend(aView, "objectValue");
     break;
     default :
      if(objj_msgSend(aView, "respondsToSelector:", sel_getUid("objectValue")))
          value = objj_msgSend(aView, "objectValue");
      else
      if(objj_msgSend(aView, "respondsToSelector:", sel_getUid("stringValue")))
          value = objj_msgSend(aView, "stringValue");
      else
       return nil;
 }
    return objj_msgSend(CPExpression, "expressionForConstantValue:", value);
}
},["CPExpression","CPView","CPAttributeType"]), new objj_method(sel_getUid("_rowType"), function $SPPredicateEditorRowTemplate___rowType(self, _cmd)
{ with(self)
{
    return (_templateType - 1);
}
},["int"]), new objj_method(sel_getUid("copy"), function $SPPredicateEditorRowTemplate__copy(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPKeyedUnarchiver, "unarchiveObjectWithData:", objj_msgSend(CPKeyedArchiver, "archivedDataWithRootObject:", self));
}
},["id"]), new objj_method(sel_getUid("_templateType"), function $SPPredicateEditorRowTemplate___templateType(self, _cmd)
{ with(self)
{
    return _templateType;
}
},["int"]), new objj_method(sel_getUid("_displayValueForPredicateOperator:"), function $SPPredicateEditorRowTemplate___displayValueForPredicateOperator_(self, _cmd, operator)
{ with(self)
{
    var value;
    switch (operator)
    {
        case CPLessThanPredicateOperatorType : value = "is less than";
            break;
        case CPLessThanOrEqualToPredicateOperatorType : value = "is less than or equal to";
            break;
        case CPGreaterThanPredicateOperatorType : value = "is greater than";
            break;
        case CPGreaterThanOrEqualToPredicateOperatorType : value = "is greater than or equal to";
            break;
        case CPEqualToPredicateOperatorType : value = "is";
            break;
        case CPNotEqualToPredicateOperatorType : value = "is not";
            break;
        case CPMatchesPredicateOperatorType : value = "matches";
            break;
        case CPLikePredicateOperatorType : value = "is like";
            break;
        case CPBeginsWithPredicateOperatorType : value = "begins with";
            break;
        case CPEndsWithPredicateOperatorType : value = "ends with";
            break;
        case CPInPredicateOperatorType : value = "in";
            break;
        case CPContainsPredicateOperatorType : value = "contains";
            break;
        case CPBetweenPredicateOperatorType : value = "between";
            break;
        default : CPLogConsole("unknown predicate operator %d" + operator);
    }
    return value;
}
},["id","int"]), new objj_method(sel_getUid("_displayValueForCompoundPredicateType:"), function $SPPredicateEditorRowTemplate___displayValueForCompoundPredicateType_(self, _cmd, predicateType)
{ with(self)
{
    var value;
    switch (predicateType)
    {
        case CPNotPredicateType: value = "None";
            break;
        case CPAndPredicateType: value = "All";
            break;
        case CPOrPredicateType: value = "Any";
            break;
        default : value = objj_msgSend(CPString, "stringWithFormat:", "unknown compound predicate type %d",predicateType);
    }
    return value;
}
},["id","unsignedint"]), new objj_method(sel_getUid("_displayValueForConstantValue:"), function $SPPredicateEditorRowTemplate___displayValueForConstantValue_(self, _cmd, value)
{ with(self)
{
    return objj_msgSend(value, "description");
}
},["id","id"]), new objj_method(sel_getUid("_displayValueForKeyPath:"), function $SPPredicateEditorRowTemplate___displayValueForKeyPath_(self, _cmd, keyPath)
{ with(self)
{
    return keyPath;
}
},["id","CPString"]), new objj_method(sel_getUid("_viewFromExpressions:"), function $SPPredicateEditorRowTemplate___viewFromExpressions_(self, _cmd, expressions)
{ with(self)
{
    var popup = objj_msgSend(objj_msgSend(CPPopUpButton, "alloc"), "initWithFrame:", CPMakeRect(0, 0, 100, 18)),
        count = objj_msgSend(expressions, "count");
    for (var i = 0; i < count; i++)
    {
        var exp = expressions[i],
            type = objj_msgSend(exp, "expressionType"),
            title;
        switch (type)
        {
            case CPKeyPathExpressionType: title = objj_msgSend(exp, "description");
                break;
            case CPConstantValueExpressionType: title = objj_msgSend(self, "_displayValueForConstantValue:", objj_msgSend(exp, "constantValue"));
                break;
            default: objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "Invalid Expression type " + type);
                break;
        }
        var item = objj_msgSend(objj_msgSend(CPMenuItem, "alloc"), "initWithTitle:action:keyEquivalent:", title, nil, "");
        objj_msgSend(item, "setRepresentedObject:", exp);
        objj_msgSend(popup, "addItem:", item);
    }
    objj_msgSend(popup, "sizeToFit");
    return popup;
}
},["CPPopUpButton","CPArray"]), new objj_method(sel_getUid("_viewFromOperatorTypes:"), function $SPPredicateEditorRowTemplate___viewFromOperatorTypes_(self, _cmd, operators)
{ with(self)
{
    var popup = objj_msgSend(objj_msgSend(CPPopUpButton, "alloc"), "initWithFrame:", CGRectMake(0, 0, 100, 18)),
        count = objj_msgSend(operators, "count");
    for (var i = 0; i < count; i++)
    {
        var op = operators[i],
            title = objj_msgSend(self, "_displayValueForPredicateOperator:", op),
            item = objj_msgSend(objj_msgSend(CPMenuItem, "alloc"), "initWithTitle:action:keyEquivalent:", title, nil, "");
        objj_msgSend(item, "setRepresentedObject:", op);
        objj_msgSend(popup, "addItem:", item);
    }
    objj_msgSend(popup, "sizeToFit");
    return popup;
}
},["CPPopUpButton","CPArray"]), new objj_method(sel_getUid("_viewFromOptions:"), function $SPPredicateEditorRowTemplate___viewFromOptions_(self, _cmd, options)
{ with(self)
{
    if(!(options&(CPCaseInsensitivePredicateOption|CPDiacriticInsensitivePredicateOption)))
     return nil;
    var view = objj_msgSend(objj_msgSend(CPPopUpButton, "alloc"), "initWithFrame:", CGRectMake(0, 0, 50, 26));
    var item=objj_msgSend(objj_msgSend(CPMenuItem, "alloc"), "initWithTitle:action:keyEquivalent:", "case sensitive", nil, nil);
    objj_msgSend(item, "setRepresentedObject:", objj_msgSend(CPNumber, "numberWithInt:", 0));
    objj_msgSend(view, "addItem:", item);
 if(options&CPCaseInsensitivePredicateOption)
 {
     item=objj_msgSend(objj_msgSend(CPMenuItem, "alloc"), "initWithTitle:action:keyEquivalent:", "case insensitive", nil, nil);
     objj_msgSend(item, "setRepresentedObject:", objj_msgSend(CPNumber, "numberWithInt:", CPCaseInsensitivePredicateOption));
     objj_msgSend(view, "addItem:", item);
 }
 if(options&CPDiacriticInsensitivePredicateOption)
 {
     item=objj_msgSend(objj_msgSend(CPMenuItem, "alloc"), "initWithTitle:action:keyEquivalent:", "diacritic insensitive", nil, nil);
     objj_msgSend(item, "setRepresentedObject:", objj_msgSend(CPNumber, "numberWithInt:", CPDiacriticInsensitivePredicateOption));
     objj_msgSend(view, "addItem:", item);
 }
 if((options&CPCaseInsensitivePredicateOption)&&(options&CPDiacriticInsensitivePredicateOption))
 {
     item=objj_msgSend(objj_msgSend(CPMenuItem, "alloc"), "initWithTitle:action:keyEquivalent:", "case + diacritic insensitive", nil, nil);
     objj_msgSend(item, "setRepresentedObject:", objj_msgSend(CPNumber, "numberWithInt:", CPCaseInsensitivePredicateOption|CPDiacriticInsensitivePredicateOption));
     objj_msgSend(view, "addItem:", item);
 }
    objj_msgSend(view, "sizeToFit");
    return view;
}
},["CPPopUpButton","CPInteger"]), new objj_method(sel_getUid("_viewFromCompoundTypes:"), function $SPPredicateEditorRowTemplate___viewFromCompoundTypes_(self, _cmd, compoundTypes)
{ with(self)
{
    var popup = objj_msgSend(objj_msgSend(CPPopUpButton, "alloc"), "initWithFrame:", CGRectMake(0, 0, 100, 18)),
        count = objj_msgSend(compoundTypes, "count");
    for (var i = 0; i < count; i++)
    {
        var type = compoundTypes[i],
            title = objj_msgSend(self, "_displayValueForCompoundPredicateType:", type),
            item = objj_msgSend(objj_msgSend(CPMenuItem, "alloc"), "initWithTitle:action:keyEquivalent:", title, nil, "");
        objj_msgSend(item, "setRepresentedObject:", type);
        objj_msgSend(popup, "addItem:", item);
    }
    objj_msgSend(popup, "sizeToFit");
    return popup;
}
},["CPView","CPArray"]), new objj_method(sel_getUid("_viewFromAttributeType:"), function $SPPredicateEditorRowTemplate___viewFromAttributeType_(self, _cmd, attributeType)
{ with(self)
{
    var view;
 switch(attributeType)
 {
  case CPInteger16AttributeType :
  case CPInteger32AttributeType :
  case CPInteger64AttributeType :
  case CPDecimalAttributeType :
         view = objj_msgSend(self, "_integerTextFieldWithFrame:", CGRectMake(0, 0, 50, 26));
     break;
  case CPDoubleAttributeType :
  case CPFloatAttributeType :
         view = objj_msgSend(self, "_floatTextFieldWithFrame:", CGRectMake(0, 0, 50, 26));
     break;
  case CPStringAttributeType :
         view = objj_msgSend(self, "_textFieldWithFrame:", CGRectMake(0, 0, 150, 26));
     break;
  case CPBooleanAttributeType :
         view = objj_msgSend(objj_msgSend(CPPopUpButton, "alloc"), "initWithFrame:", CGRectMake(0, 0, 50, 26));
         var item=objj_msgSend(objj_msgSend(CPMenuItem, "alloc"), "initWithTitle:action:keyEquivalent:", "true", nil, nil);
         objj_msgSend(item, "setRepresentedObject:", objj_msgSend(CPNumber, "numberWithBool:", YES));
         objj_msgSend(view, "addItem:", item);
         item=objj_msgSend(objj_msgSend(CPMenuItem, "alloc"), "initWithTitle:action:keyEquivalent:", "false", nil, nil);
         objj_msgSend(item, "setRepresentedObject:", objj_msgSend(CPNumber, "numberWithBool:", NO));
         objj_msgSend(view, "addItem:", item);
     break;
  case CPDateAttributeType :
         view = objj_msgSend(objj_msgSend(CPDatePicker, "alloc"), "initWithFrame:", CGRectMake(0, 0, 150, 26));
     break;
     default :
      return nil;
 }
    objj_msgSend(view, "setTag:", attributeType);
    return view;
}
},["CPView","CPAttributeType"]), new objj_method(sel_getUid("_textFieldWithFrame:"), function $SPPredicateEditorRowTemplate___textFieldWithFrame_(self, _cmd, frame)
{ with(self)
{
    var textField = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", frame);
    objj_msgSend(textField, "setBezeled:", YES);
    objj_msgSend(textField, "setBezelStyle:", CPTextFieldSquareBezel);
    objj_msgSend(textField, "setBordered:", YES);
    objj_msgSend(textField, "setEditable:", YES);
    objj_msgSend(textField, "setFont:", objj_msgSend(CPFont, "systemFontOfSize:", 10));
    return textField;
}
},["CPTextField","CGRect"]), new objj_method(sel_getUid("_integerTextFieldWithFrame:"), function $SPPredicateEditorRowTemplate___integerTextFieldWithFrame_(self, _cmd, frame)
{ with(self)
{
    var textField = objj_msgSend(objj_msgSend(SPPredicateEditorIntegerTextField, "alloc"), "initWithFrame:", frame);
    objj_msgSend(textField, "setBezeled:", YES);
    objj_msgSend(textField, "setBezelStyle:", CPTextFieldSquareBezel);
    objj_msgSend(textField, "setBordered:", YES);
    objj_msgSend(textField, "setEditable:", YES);
    objj_msgSend(textField, "setFont:", objj_msgSend(CPFont, "systemFontOfSize:", 10));
    return textField;
}
},["CPTextField","CGRect"]), new objj_method(sel_getUid("_floatTextFieldWithFrame:"), function $SPPredicateEditorRowTemplate___floatTextFieldWithFrame_(self, _cmd, frame)
{ with(self)
{
    var textField = objj_msgSend(objj_msgSend(SPPredicateEditorFloatTextField, "alloc"), "initWithFrame:", frame);
    objj_msgSend(textField, "setBezeled:", YES);
    objj_msgSend(textField, "setBezelStyle:", CPTextFieldSquareBezel);
    objj_msgSend(textField, "setBordered:", YES);
    objj_msgSend(textField, "setEditable:", YES);
    objj_msgSend(textField, "setFont:", objj_msgSend(CPFont, "systemFontOfSize:", 10));
    return textField;
}
},["CPTextField","CGRect"]), new objj_method(sel_getUid("_setOptions:"), function $SPPredicateEditorRowTemplate___setOptions_(self, _cmd, options)
{ with(self)
{
 if(_predicateOptions == options)
  return;
 if(_predicateOptions&&!options)
  objj_msgSend(_views, "removeObjectAtIndex:", 3);
 else
 if(!_predicateOptions&&options)
 {
  var view=objj_msgSend(self, "_viewFromOptions:", options);
  if(!view)
   return;
  objj_msgSend(_views, "addObject:", view);
 }
    _predicateOptions = options;
}
},["void","unsignedint"]), new objj_method(sel_getUid("_setModifier:"), function $SPPredicateEditorRowTemplate___setModifier_(self, _cmd, modifier)
{ with(self)
{
    _predicateModifier = modifier;
}
},["void","unsignedint"]), new objj_method(sel_getUid("preProcessCriteria:"), function $SPPredicateEditorRowTemplate__preProcessCriteria_(self, _cmd, criteria)
{ with(self)
{
 if(!objj_msgSend(self, "options")||objj_msgSend(criteria, "count")<4)
  return criteria;
 var operatorCriterion=objj_msgSend(criteria, "objectAtIndex:", 1);
 var optionsCriterion=objj_msgSend(criteria, "objectAtIndex:", 3);
 var opType=objj_msgSend(objj_msgSend(operatorCriterion, "displayValue"), "representedObject");
 objj_msgSend(optionsCriterion, "setHidden:", !objj_msgSend(self, "_shouldSetOptionsForOperatorType:", opType));
 return criteria;
}
},["CPArray","CPArray"]), new objj_method(sel_getUid("description"), function $SPPredicateEditorRowTemplate__description(self, _cmd)
{ with(self)
{
    if (_templateType == 2)
        return objj_msgSend(CPString, "stringWithFormat:", "<%@ %p %@>",objj_msgSend(self, "className"),self,objj_msgSend(objj_msgSend(self, "compoundTypes"), "componentsJoinedByString:", ", "));
    else if (_templateType == 1 && _rightIsWildcard)
        return objj_msgSend(CPString, "stringWithFormat:", "<%@ %p [%@] [%@] %d>",objj_msgSend(self, "className"),self,objj_msgSend(objj_msgSend(self, "leftExpressions"), "componentsJoinedByString:", ", "),objj_msgSend(objj_msgSend(self, "operators"), "componentsJoinedByString:", ", "),objj_msgSend(self, "rightExpressionAttributeType"));
    else
        return objj_msgSend(CPString, "stringWithFormat:", "<%@ %p [%@] [%@] [%@]>",objj_msgSend(self, "className"),self,objj_msgSend(objj_msgSend(self, "leftExpressions"), "componentsJoinedByString:", ", "),objj_msgSend(objj_msgSend(self, "operators"), "componentsJoinedByString:", ", "),objj_msgSend(objj_msgSend(self, "rightExpressions"), "componentsJoinedByString:", ", "));
}
},["CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("_bestMatchForPredicate:inTemplates:quality:"), function $SPPredicateEditorRowTemplate___bestMatchForPredicate_inTemplates_quality_(self, _cmd, predicate, templates, quality)
{ with(self)
{
    var count = objj_msgSend(templates, "count"),
        match_value = 0,
        templateIndex = CPNotFound,
        i;
    for (i = 0; i < count; i++)
    {
        var template = objj_msgSend(templates, "objectAtIndex:", i),
            amatch = objj_msgSend(template, "matchForPredicate:", predicate);
        if (amatch > match_value)
        {
            templateIndex = i;
            match_value = amatch;
        }
    }
    if (templateIndex == CPNotFound)
    {
        objj_msgSend(CPException, "raise:reason:", CPRangeException, "Unable to find template matching predicate: " + objj_msgSend(predicate, "predicateFormat"));
        return nil;
    }
    return objj_msgSend(templates, "objectAtIndex:", templateIndex);
}
},["id","CPPredicate","CPArray","double"]), new objj_method(sel_getUid("_operatorsForAttributeType:"), function $SPPredicateEditorRowTemplate___operatorsForAttributeType_(self, _cmd, attributeType)
{ with(self)
{
    var operators_array = objj_msgSend(CPMutableArray, "array");
    switch (attributeType)
    {
        case CPInteger16AttributeType : objj_msgSend(operators_array, "addObjects:", 4,5,0,2,1,3);
            break;
        case CPInteger32AttributeType : objj_msgSend(operators_array, "addObjects:", 4,5,0,2,1,3);
            break;
        case CPInteger64AttributeType : objj_msgSend(operators_array, "addObjects:", 4,5,0,2,1,3);
            break;
        case CPDecimalAttributeType : objj_msgSend(operators_array, "addObjects:", 4,5,0,2,1,3);
            break;
        case CPDoubleAttributeType : objj_msgSend(operators_array, "addObjects:", 4,5,0,2,1,3);
            break;
        case CPFloatAttributeType : objj_msgSend(operators_array, "addObjects:", 4,5,0,2,1,3);
            break;
        case CPStringAttributeType : objj_msgSend(operators_array, "addObjects:", 99,4,5,8,9);
            break;
        case CPBooleanAttributeType : objj_msgSend(operators_array, "addObjects:", 4,5);
            break;
        case CPDateAttributeType : objj_msgSend(operators_array, "addObjects:", 4,5,0,2,1,3);
            break;
        default : CPLogConsole("Cannot create operators for an CPAttributeType " + attributeType);
            break;
    }
    return operators_array;
}
},["id","CPAttributeType"])]);
}
var CPPredicateTemplateTypeKey = "CPPredicateTemplateType",
    CPPredicateTemplateOptionsKey = "CPPredicateTemplateOptions",
    CPPredicateTemplateModifierKey = "CPPredicateTemplateModifier",
    CPPredicateTemplateLeftAttributeTypeKey = "CPPredicateTemplateLeftAttributeType",
    CPPredicateTemplateRightAttributeTypeKey = "CPPredicateTemplateRightAttributeType",
    CPPredicateTemplateLeftIsWildcardKey = "CPPredicateTemplateLeftIsWildcard",
    CPPredicateTemplateRightIsWildcardKey = "CPPredicateTemplateRightIsWildcard",
    CPPredicateTemplateViewsKey = "CPPredicateTemplateViews";
{
var the_class = objj_getClass("SPPredicateEditorRowTemplate")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"SPPredicateEditorRowTemplate\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $SPPredicateEditorRowTemplate__initWithCoder_(self, _cmd, coder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("SPPredicateEditorRowTemplate").super_class }, "init");
    if (self != nil)
    {
        _templateType = objj_msgSend(coder, "decodeIntForKey:", CPPredicateTemplateTypeKey);
        _predicateOptions = objj_msgSend(coder, "decodeIntForKey:", CPPredicateTemplateOptionsKey);
        _predicateModifier = objj_msgSend(coder, "decodeIntForKey:", CPPredicateTemplateModifierKey);
        _leftAttributeType = objj_msgSend(coder, "decodeIntForKey:", CPPredicateTemplateLeftAttributeTypeKey);
        _rightAttributeType = objj_msgSend(coder, "decodeIntForKey:", CPPredicateTemplateRightAttributeTypeKey);
        _leftIsWildcard = objj_msgSend(coder, "decodeBoolForKey:", CPPredicateTemplateLeftIsWildcardKey);
        _rightIsWildcard = objj_msgSend(coder, "decodeBoolForKey:", CPPredicateTemplateRightIsWildcardKey);
        _views = objj_msgSend(coder, "decodeObjectForKey:", CPPredicateTemplateViewsKey);
        if (_templateType == 1 && _leftIsWildcard == NO)
        {
            var itemArray = objj_msgSend(_views[0], "itemArray"),
                count = objj_msgSend(itemArray, "count");
            for (var i = 0; i < count; i++)
            {
                var item = itemArray[i];
                if (objj_msgSend(item, "representedObject") == nil)
                {
                    var exp = objj_msgSend(CPExpression, "expressionForKeyPath:", objj_msgSend(item, "title"));
                    objj_msgSend(item, "setRepresentedObject:", exp);
                }
            }
        }
    }
    return self;
}
},["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $SPPredicateEditorRowTemplate__encodeWithCoder_(self, _cmd, coder)
{ with(self)
{
    objj_msgSend(coder, "encodeInt:forKey:", _templateType, CPPredicateTemplateTypeKey);
    objj_msgSend(coder, "encodeInt:forKey:", _predicateOptions, CPPredicateTemplateOptionsKey);
    objj_msgSend(coder, "encodeInt:forKey:", _predicateModifier, CPPredicateTemplateModifierKey);
    objj_msgSend(coder, "encodeInt:forKey:", _leftAttributeType, CPPredicateTemplateLeftAttributeTypeKey);
    objj_msgSend(coder, "encodeInt:forKey:", _rightAttributeType, CPPredicateTemplateRightAttributeTypeKey);
    objj_msgSend(coder, "encodeBool:forKey:", _leftIsWildcard, CPPredicateTemplateLeftIsWildcardKey);
    objj_msgSend(coder, "encodeBool:forKey:", _rightIsWildcard, CPPredicateTemplateRightIsWildcardKey);
    objj_msgSend(coder, "encodeObject:forKey:", _views, CPPredicateTemplateViewsKey);
}
},["void","CPCoder"])]);
}

p;14;SPRuleEditor.jt;39322;@STATIC;1.0;I;24;Foundation/CPPredicate.jI;20;Foundation/CPArray.jI;25;Foundation/CPDictionary.jI;23;Foundation/CPIndexSet.jI;24;AppKit/CPViewAnimation.jI;15;AppKit/CPView.ji;19;SPRuleEditorModel.ji;18;SPRuleEditorView.ji;23;SPRuleEditorCriterion.jt;39066;objj_executeFile("Foundation/CPPredicate.j", NO);
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
 objj_msgSend(_model, "removeRowsAtIndexes:includeSubrows:", rowIndex, includeSubrows);
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

p;26;SPRuleEditorActionButton.jt;2867;@STATIC;1.0;I;17;AppKit/CPButton.jt;2826; objj_executeFile("AppKit/CPButton.j", NO);
var GRADIENT_NORMAL;
var GRADIENT_HIGHLIGHTED;
var IE_FILTER = "progid:DXImageTransform.Microsoft.gradient(startColorstr='#fcfcfc', endColorstr='#dfdfdf')";
{var the_class = objj_allocateClassPair(CPButton, "SPRuleEditorActionButton"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("radius")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $SPRuleEditorActionButton__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("SPRuleEditorActionButton").super_class }, "initWithFrame:", aFrame);
    if (self)
    {
        objj_msgSend(self, "setFont:", objj_msgSend(CPFont, "boldFontWithName:size:", "Apple Symbol", 12.0));
        objj_msgSend(self, "setTextColor:", objj_msgSend(CPColor, "colorWithWhite:alpha:", 150/255, 1));
        objj_msgSend(self, "setAlignment:", CPCenterTextAlignment);
        objj_msgSend(self, "setAutoresizingMask:", CPViewMinXMargin);
        objj_msgSend(self, "setImagePosition:", CPImageOnly);
        objj_msgSend(self, "setBordered:", NO);
        var style = _DOMElement.style;
        style.border = "1px solid rgb(189, 189, 189)";
        style.filter = IE_FILTER;
    }
    return self;
}
},["id","CGRect"]), new objj_method(sel_getUid("layoutSubviews"), function $SPRuleEditorActionButton__layoutSubviews(self, _cmd)
{ with(self)
{
    radius = FLOOR(CGRectGetHeight(objj_msgSend(self, "bounds"))/2);
    var style = _DOMElement.style,
        radiusCSS = radius + "px";
    style.borderRadius = radiusCSS;
    style.backgroundImage = (objj_msgSend(self, "isHighlighted")) ? GRADIENT_HIGHLIGHTED : GRADIENT_NORMAL;
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("SPRuleEditorActionButton").super_class }, "layoutSubviews");
}
},["void"]), new objj_method(sel_getUid("acceptsFirstResponder"), function $SPRuleEditorActionButton__acceptsFirstResponder(self, _cmd)
{ with(self)
{
    return NO;
}
},["BOOL"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function $SPRuleEditorActionButton__initialize(self, _cmd)
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

p;23;SPRuleEditorCriterion.jt;5575;@STATIC;1.0;I;21;Foundation/CPObject.jI;15;AppKit/CPView.jI;19;AppKit/CPMenuItem.jt;5486;objj_executeFile("Foundation/CPObject.j", NO);
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

p;19;SPRuleEditorModel.jt;19701;@STATIC;1.0;I;21;Foundation/CPObject.ji;23;SPRuleEditorModelItem.jt;19627;objj_executeFile("Foundation/CPObject.j", NO);
objj_executeFile("SPRuleEditorModelItem.j", YES);
SPRuleEditorNestingModeSingle = 0;
SPRuleEditorNestingModeList = 1;
SPRuleEditorNestingModeCompound = 2;
SPRuleEditorNestingModeSimple = 3;
SPRuleEditorRowTypeSimple = 0;
SPRuleEditorRowTypeCompound = 1;
SPRuleEditorModelRowAdded = "SPRuleEditorModelRowAdded";
SPRuleEditorModelRowRemoved = "SPRuleEditorModelRowRemoved";
SPRuleEditorModelRowModified = "SPRuleEditorModelRowModified";
SPRuleEditorModelNestingModeWillChange = "SPRuleEditorModelNestingModeWillChange";
SPRuleEditorModelNestingModeDidChange = "SPRuleEditorModelNestingModeDidChange";
SPRuleEditorModelRemovedAllRows = "SPRuleEditorModelRemovedAllRows";
{var the_class = objj_allocateClassPair(CPObject, "SPRuleEditorModel"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_rows"), new objj_ivar("_rootLess"), new objj_ivar("_nestingMode"), new objj_ivar("_canRemoveAllRows")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("rows"), function $SPRuleEditorModel__rows(self, _cmd)
{ with(self)
{
return _rows;
}
},["id"]),
new objj_method(sel_getUid("rootLess"), function $SPRuleEditorModel__rootLess(self, _cmd)
{ with(self)
{
return _rootLess;
}
},["id"]),
new objj_method(sel_getUid("nestingMode"), function $SPRuleEditorModel__nestingMode(self, _cmd)
{ with(self)
{
return _nestingMode;
}
},["id"]),
new objj_method(sel_getUid("setNestingMode:"), function $SPRuleEditorModel__setNestingMode_(self, _cmd, newValue)
{ with(self)
{
_nestingMode = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("canRemoveAllRows"), function $SPRuleEditorModel__canRemoveAllRows(self, _cmd)
{ with(self)
{
return _canRemoveAllRows;
}
},["id"]),
new objj_method(sel_getUid("setCanRemoveAllRows:"), function $SPRuleEditorModel__setCanRemoveAllRows_(self, _cmd, newValue)
{ with(self)
{
_canRemoveAllRows = newValue;
}
},["void","id"]), new objj_method(sel_getUid("init"), function $SPRuleEditorModel__init(self, _cmd)
{ with(self)
{
 self=objj_msgSendSuper({ receiver:self, super_class:objj_getClass("SPRuleEditorModel").super_class }, "init");
 if(!self)
  return nil;
 _nestingMode=SPRuleEditorNestingModeCompound;
 _rows=objj_msgSend(objj_msgSend(CPMutableArray, "alloc"), "init");
 _rootLess=NO;
 _canRemoveAllRows=NO;
 return self;
}
},["id"]), new objj_method(sel_getUid("initWithNestingMode:"), function $SPRuleEditorModel__initWithNestingMode_(self, _cmd, nestingMode)
{ with(self)
{
 self=objj_msgSendSuper({ receiver:self, super_class:objj_getClass("SPRuleEditorModel").super_class }, "init");
 if(!self)
  return nil;
 _nestingMode=nestingMode;
 _rows=objj_msgSend(objj_msgSend(CPMutableArray, "alloc"), "init");
 _rootLess=_nestingMode==SPRuleEditorNestingModeSingle||_nestingMode==SPRuleEditorNestingModeList;
 _canRemoveAllRows=NO;
 return self;
}
},["id","int"]), new objj_method(sel_getUid("defaultRowType"), function $SPRuleEditorModel__defaultRowType(self, _cmd)
{ with(self)
{
 if(_rootLess)
  return SPRuleEditorRowTypeSimple;
 return objj_msgSend(_rows, "count")?SPRuleEditorRowTypeSimple:SPRuleEditorRowTypeCompound;
}
},["int"]), new objj_method(sel_getUid("setNestingMode:"), function $SPRuleEditorModel__setNestingMode_(self, _cmd, nestingMode)
{ with(self)
{
 if(nestingMode==_nestingMode)
  return;
 var notificationCenter=objj_msgSend(CPNotificationCenter, "defaultCenter");
 var userInfo=objj_msgSend(CPDictionary, "dictionaryWithObjects:forKeys:", [nestingMode,_nestingMode], ["newNestingMode","oldNestingMode"]);
    objj_msgSend(notificationCenter, "postNotificationName:object:userInfo:", SPRuleEditorModelNestingModeWillChange, self, userInfo);
    var oldNestingMode=_nestingMode;
    _nestingMode=nestingMode;
 _rootLess=_nestingMode==SPRuleEditorNestingModeSingle||_nestingMode==SPRuleEditorNestingModeList;
 objj_msgSend(self, "setCanRemoveAllRows:", _canRemoveAllRows);
 objj_msgSend(self, "removeAllRows");
 userInfo=objj_msgSend(CPDictionary, "dictionaryWithObjects:forKeys:", [_nestingMode,oldNestingMode], ["newNestingMode","oldNestingMode"]);
    objj_msgSend(notificationCenter, "postNotificationName:object:userInfo:", SPRuleEditorModelNestingModeDidChange, self, userInfo);
}
},["void","int"]), new objj_method(sel_getUid("setCanRemoveAllRows:"), function $SPRuleEditorModel__setCanRemoveAllRows_(self, _cmd, canRemoveAllRows)
{ with(self)
{
 _canRemoveAllRows=canRemoveAllRows;
}
},["void","BOOL"]), new objj_method(sel_getUid("rowsCount"), function $SPRuleEditorModel__rowsCount(self, _cmd)
{ with(self)
{
 return objj_msgSend(_rows, "count");
}
},["int"]), new objj_method(sel_getUid("flatRowsCount"), function $SPRuleEditorModel__flatRowsCount(self, _cmd)
{ with(self)
{
 var total=0;
 var count=objj_msgSend(_rows, "count");
 for(var i=0;i<count;i++)
  total+=objj_msgSend(_rows[i], "flatSubrowsCount")+1;
 return total;
}
},["int"]), new objj_method(sel_getUid("lastRowIndex"), function $SPRuleEditorModel__lastRowIndex(self, _cmd)
{ with(self)
{
 var count=objj_msgSend(_rows, "count");
 if(!count)
  return CPNotFound;
 var row=objj_msgSend(self, "lastRow");
 return row?objj_msgSend(self, "indexOfRow:", row):CPNotFound;
}
},["int"]), new objj_method(sel_getUid("lastRow"), function $SPRuleEditorModel__lastRow(self, _cmd)
{ with(self)
{
 var count=objj_msgSend(_rows, "count");
 if(!count)
  return nil;
 var row=_rows[count-1];
 if(!row)
  return nil;
 return objj_msgSend(row, "lastChild");
}
},["void"]), new objj_method(sel_getUid("rowAtIndex:"), function $SPRuleEditorModel__rowAtIndex_(self, _cmd, rowIndex)
{ with(self)
{
 if(rowIndex<0)
  return nil;
 var count=objj_msgSend(_rows, "count");
 if(!count)
  return nil;
 var row,found,delta=0;
 for(var i=0;i<count;i++)
 {
  row=_rows[i];
  found=objj_msgSend(row, "childAtFlatIndex:", rowIndex-delta);
  if(found)
   return found;
  delta+=objj_msgSend(row, "flatSubrowsCount")+1;
 }
 return nil;
}
},["SPRuleEditorModelItem","int"]), new objj_method(sel_getUid("indexOfRow:"), function $SPRuleEditorModel__indexOfRow_(self, _cmd, aRow)
{ with(self)
{
 if(!aRow)
  return CPNotFound;
 var count=objj_msgSend(_rows, "count");
 if(!count)
  return CPNotFound;
 var row,found,delta=0;
 for(var i=0;i<count;i++)
 {
  row=_rows[i];
  found=objj_msgSend(row, "flatIndexOfChild:", aRow);
  if(found!=CPNotFound)
   return found+delta;
  delta+=objj_msgSend(row, "flatSubrowsCount")+1;
 }
 return CPNotFound;
}
},["int","SPRuleEditorModelItem"]), new objj_method(sel_getUid("rowWithDisplayValue:"), function $SPRuleEditorModel__rowWithDisplayValue_(self, _cmd, value)
{ with(self)
{
 var count=objj_msgSend(_rows, "count");
 if(!count)
  return nil;
 var row;
 for(var i=0;i<count;i++)
 {
  row=_rows[i];
  row=objj_msgSend(row, "subrowWithDisplayValue:", value);
  if(row)
   return row;
 }
 return nil;
}
},["SPRuleEditorModel","id"]), new objj_method(sel_getUid("immediateSubrowsIndexesOfRowAtIndex:"), function $SPRuleEditorModel__immediateSubrowsIndexesOfRowAtIndex_(self, _cmd, rowIndex)
{ with(self)
{
 var count=objj_msgSend(_rows, "count");
 if(!count)
  return nil;
 var row=rowIndex<0?nil:objj_msgSend(self, "rowAtIndex:", rowIndex);
 if(row&&objj_msgSend(row, "rowType")!=SPRuleEditorRowTypeCompound)
  return nil;
 var indexSet=objj_msgSend(objj_msgSend(CPMutableIndexSet, "alloc"), "init");
 var subrows=row?objj_msgSend(row, "subrows"):_rows;
 var count=objj_msgSend(subrows, "count");
 var subrow;
 for(var i=0;i<count;i++)
 {
  subrow=subrows[i]
  index=objj_msgSend(self, "indexOfRow:", subrow);
  if(index!=CPNotFound)
   objj_msgSend(indexSet, "addIndex:", index);
 }
 return indexSet;
}
},["CPIndexSet","int"]), new objj_method(sel_getUid("allowNewRowInsertOfType:withParent:"), function $SPRuleEditorModel__allowNewRowInsertOfType_withParent_(self, _cmd, rowType, aParentRow)
{ with(self)
{
 var count=objj_msgSend(_rows, "count");
 var firstRow=count?_rows[0]:nil;
 switch(_nestingMode)
 {
  case SPRuleEditorNestingModeSingle :
   return (count==0)&&(rowType==SPRuleEditorRowTypeSimple)&&(aParentRow==nil);
  case SPRuleEditorNestingModeList :
   return (rowType==SPRuleEditorRowTypeSimple)&&(aParentRow==nil);
  case SPRuleEditorNestingModeSimple :
   return ((!firstRow&&rowType==SPRuleEditorRowTypeCompound)&&(aParentRow==nil))
     ||(firstRow&&(rowType==SPRuleEditorRowTypeSimple)&&(aParentRow==firstRow));
 }
 return (!firstRow&&rowType==SPRuleEditorRowTypeCompound&&aParentRow==nil)
   ||(firstRow&&(aParentRow==firstRow||aParentRow!=nil));
}
},["BOOL","int","SPRuleEditorModelItem"]), new objj_method(sel_getUid("addNewRowOfType:criteria:"), function $SPRuleEditorModel__addNewRowOfType_criteria_(self, _cmd, rowType, criteria)
{ with(self)
{
 return objj_msgSend(self, "addNewRowOfType:criteria:data:", rowType, criteria, nil);
}
},["SPRuleEditorModelItem","SPRuleEditorRowType","CPArray"]), new objj_method(sel_getUid("addNewRowOfType:criteria:data:"), function $SPRuleEditorModel__addNewRowOfType_criteria_data_(self, _cmd, rowType, criteria, data)
{ with(self)
{
 var newRow=objj_msgSend(objj_msgSend(SPRuleEditorModelItem, "alloc"), "initWithType:criteria:data:", rowType, criteria, data);
 return objj_msgSend(self, "addRow:", newRow);
}
},["SPRuleEditorModelItem","SPRuleEditorRowType","CPArray","id"]), new objj_method(sel_getUid("addRow:"), function $SPRuleEditorModel__addRow_(self, _cmd, aRow)
{ with(self)
{
 if(!aRow)
  return nil;
 var rowType=objj_msgSend(aRow, "rowType");
 if(!objj_msgSend(self, "allowNewRowInsertOfType:withParent:", rowType, nil))
  return nil;
 objj_msgSend(aRow, "setCanRemoveAllRows:", YES);
 objj_msgSend(aRow, "_setDepth:", 0);
 objj_msgSend(_rows, "addObject:", aRow);
 var userInfo=objj_msgSend(CPDictionary, "dictionaryWithObjects:forKeys:", [nil,objj_msgSend(_rows, "count")-1,aRow], ["parentRow","index","row"]);
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", SPRuleEditorModelRowAdded, self, userInfo);
 return aRow;
}
},["SPRuleEditorModelItem","SPRuleEditorModelItem"]), new objj_method(sel_getUid("insertNewRowAtIndex:ofType:withParentRowIndex:criteria:"), function $SPRuleEditorModel__insertNewRowAtIndex_ofType_withParentRowIndex_criteria_(self, _cmd, insertIndex, rowType, parentRowIndex, criteria)
{ with(self)
{
 return objj_msgSend(self, "insertNewRowAtIndex:ofType:withParentRowIndex:criteria:data:", insertIndex, rowType, parentRowIndex, criteria, nil);
}
},["SPRuleEditorModelItem","int","SPRuleEditorRowType","int","CPArray"]), new objj_method(sel_getUid("insertNewRowAtIndex:ofType:withParentRowIndex:criteria:data:"), function $SPRuleEditorModel__insertNewRowAtIndex_ofType_withParentRowIndex_criteria_data_(self, _cmd, insertIndex, rowType, parentRowIndex, criteria, data)
{ with(self)
{
 var newRow=objj_msgSend(objj_msgSend(SPRuleEditorModelItem, "alloc"), "initWithType:criteria:data:", rowType, criteria, data);
 return objj_msgSend(self, "insertRow:atIndex:withParentRowIndex:", newRow, insertIndex, parentRowIndex);
}
},["SPRuleEditorModelItem","int","SPRuleEditorRowType","int","CPArray","id"]), new objj_method(sel_getUid("insertRow:atIndex:withParentRowIndex:"), function $SPRuleEditorModel__insertRow_atIndex_withParentRowIndex_(self, _cmd, aRow, insertIndex, parentRowIndex)
{ with(self)
{
 if(!aRow)
  return nil;
 var rowType=objj_msgSend(aRow, "rowType");
 if(insertIndex<=parentRowIndex)
  return nil;
 var parentRow=parentRowIndex<0?nil:objj_msgSend(self, "rowAtIndex:", parentRowIndex);
 if(!objj_msgSend(self, "allowNewRowInsertOfType:withParent:", rowType, parentRow))
  return nil;
 var childIndex;
 var currentRow=objj_msgSend(self, "rowAtIndex:", insertIndex);
 if(currentRow)
 {
  if(objj_msgSend(currentRow, "parent")!=parentRow)
  {
   var flatSubrowsCount=parentRow?objj_msgSend(parentRow, "flatSubrowsCount"):objj_msgSend(self, "flatRowsCount");
   if(objj_msgSend(currentRow, "parent")==objj_msgSend(parentRow, "parent")&&(insertIndex==parentRowIndex+flatSubrowsCount+1))
    childIndex=parentRow?objj_msgSend(parentRow, "subrowsCount"):objj_msgSend(self, "rowsCount");
   else
   {
    if((!parentRow||objj_msgSend(parentRow, "rowType")==SPRuleEditorRowTypeCompound)&&(insertIndex==parentRowIndex+flatSubrowsCount+1))
     childIndex=parentRow?objj_msgSend(parentRow, "subrowsCount"):objj_msgSend(self, "rowsCount");
    else
     return nil;
   }
  }
  else
   childIndex=parentRow?objj_msgSend(parentRow, "indexOfChild:", currentRow):objj_msgSend(_rows, "indexOfObject:", currentRow);
 }
 else
 {
  var subrowsCount=parentRow?objj_msgSend(parentRow, "subrowsCount"):objj_msgSend(self, "rowsCount");
  var flatSubrowsCount=parentRow?objj_msgSend(parentRow, "flatSubrowsCount"):objj_msgSend(self, "flatRowsCount");
  if(insertIndex>parentRowIndex+flatSubrowsCount+1)
   return objj_msgSend(self, "addRow:", aRow);
  childIndex=subrowsCount;
 }
 if(parentRow)
  objj_msgSend(parentRow, "insertChild:atIndex:context:", aRow, childIndex, self);
 else
 {
  objj_msgSend(aRow, "setCanRemoveAllRows:", YES);
  objj_msgSend(aRow, "_setDepth:", 0);
  objj_msgSend(_rows, "insertObject:atIndex:", aRow, childIndex);
  var userInfo=objj_msgSend(CPDictionary, "dictionaryWithObjects:forKeys:", [nil,childIndex,aRow], ["parentRow","index","row"]);
     objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", SPRuleEditorModelRowAdded, self, userInfo);
 }
 return aRow;
}
},["SPRuleEditorModelItem","SPRuleEditorModelItem","int","int"]), new objj_method(sel_getUid("removeAllRows"), function $SPRuleEditorModel__removeAllRows(self, _cmd)
{ with(self)
{
 _rows=objj_msgSend(objj_msgSend(CPMutableArray, "alloc"), "init");
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", SPRuleEditorModelRemovedAllRows, self, nil);
}
},["void"]), new objj_method(sel_getUid("isRowRemoveable:includeSubrows:"), function $SPRuleEditorModel__isRowRemoveable_includeSubrows_(self, _cmd, row, includeSubrows)
{ with(self)
{
 if(_canRemoveAllRows||objj_msgSend(row, "parent"))
  return YES;
 var count=objj_msgSend(_rows, "count");
 if(!_rootLess&&count<=1)
  return NO;
 if(includeSubrows&&count<=1)
  return NO;
 var subrows=objj_msgSend(row, "subrows");
 var subrowsCount=subrows?objj_msgSend(subrows, "count"):0;
 if(!includeSubrows&&count<=1&&subrowsCount==0)
  return NO;
 return YES;
}
},["BOOL","SPRuleEditorModelItem","BOOL"]), new objj_method(sel_getUid("removeRowAtIndex:includeSubrows:"), function $SPRuleEditorModel__removeRowAtIndex_includeSubrows_(self, _cmd, rowIndex, includeSubrows)
{ with(self)
{
 var count=objj_msgSend(_rows, "count");
 if(!count)
  return nil;
 var row=objj_msgSend(self, "rowAtIndex:", rowIndex);
 if(!row)
  return nil;
 if(!row||!objj_msgSend(self, "isRowRemoveable:includeSubrows:", row, includeSubrows))
  return nil;
 var parent=objj_msgSend(row, "parent");
 if(!parent)
 {
  return objj_msgSend(self, "_removeRowAtIndex:keepSubrows:", rowIndex, !includeSubrows);
 }
 var idx=objj_msgSend(parent, "indexOfChild:", row);
 if(idx==CPNotFound)
  return nil;
 objj_msgSend(parent, "removeChildAtIndex:keepSubrows:context:", idx, !includeSubrows, self);
 return row;
}
},["SPRuleEditorModelItem","int","BOOL"]), new objj_method(sel_getUid("removeRowsAtIndexes:includeSubrows:"), function $SPRuleEditorModel__removeRowsAtIndexes_includeSubrows_(self, _cmd, rowIndexes, includeSubrows)
{ with(self)
{
 var count=objj_msgSend(_rows, "count");
 if(!count)
  return;
 if(!rowIndexes||!objj_msgSend(rowIndexes, "count"))
  return;
 var row;
 var index=objj_msgSend(rowIndexes, "firstIndex");
 var cache=objj_msgSend(CPMutableArray, "arrayWithCapacity:", objj_msgSend(rowIndexes, "count"));
 while(index!=CPNotFound)
 {
  row=objj_msgSend(self, "rowAtIndex:", index);
  if(!row)
   continue;
  objj_msgSend(cache, "addObject:", row);
  index=objj_msgSend(rowIndexes, "indexGreaterThanIndex:", index);
 }
 var parent;
 var idx;
 var count=objj_msgSend(cache, "count");
 for(var i=0;i<count;i++)
 {
  row=objj_msgSend(cache, "objectAtIndex:", i);
  parent=objj_msgSend(row, "parent");
  if(!parent)
  {
   objj_msgSend(self, "_removeRowAtIndex:keepSubrows:", rowIndex, !includeSubrows);
   continue;
  }
  idx=objj_msgSend(parent, "indexOfChild:", row);
  if(idx==CPNotFound)
   continue;
  objj_msgSend(parent, "removeChildAtIndex:keepSubrows:context:", idx, !includeSubrows, self);
 }
}
},["void","CPIndexSet","BOOL"]), new objj_method(sel_getUid("setCriteria:forRow:"), function $SPRuleEditorModel__setCriteria_forRow_(self, _cmd, criteria, aRow)
{ with(self)
{
 objj_msgSend(aRow, "setCriteria:context:", criteria, self);
}
},["void","CPArray","SPRuleEditorModelItem"]), new objj_method(sel_getUid("_removeRowAtIndex:keepSubrows:"), function $SPRuleEditorModel___removeRowAtIndex_keepSubrows_(self, _cmd, index, keepSubrows)
{ with(self)
{
 var count=objj_msgSend(_rows, "count");
 if(!count)
  return nil;
 var row=objj_msgSend(self, "rowAtIndex:", index);
 if(!row)
  return nil;
 var subrows=objj_msgSend(row, "subrows");
 var subrowsCount=subrows?objj_msgSend(subrows, "count"):0;
 if(!objj_msgSend(self, "isRowRemoveable:includeSubrows:", row, !keepSubrows))
  return nil;
 objj_msgSend(_rows, "removeObjectAtIndex:", index);
 objj_msgSend(row, "setParent:", nil);
 objj_msgSend(row, "_setDepth:", -1);
 var notificationCenter=objj_msgSend(CPNotificationCenter, "defaultCenter");
 var userInfo=objj_msgSend(CPDictionary, "dictionaryWithObjects:forKeys:", [nil,index,row], ["parentRow","index","row"]);
    objj_msgSend(notificationCenter, "postNotificationName:object:userInfo:", SPRuleEditorModelRowRemoved, self, userInfo);
 if(!keepSubrows||!subrows||!_rootLess)
  return row;
 var subrow;
 for(var i=subrowsCount-1;i>=0;i--)
 {
  subrow=subrows[i];
  objj_msgSend(_rows, "insertObject:atIndex:", subrow, index);
  objj_msgSend(subrow, "setParent:", nil);
  var userInfo=objj_msgSend(CPDictionary, "dictionaryWithObjects:forKeys:", [nil,index,subrow], ["parentRow","index","row"]);
     objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", SPRuleEditorModelRowAdded, self, userInfo);
 }
 return row;
}
},["SPRuleEditorModelItem","int","BOOL"])]);
}
var RowsKey="rows";
var RootlessKey="rootLess";
var NestingModelKey="nestingMode";
var CanRemoveAllRowsKey="canRemoveAllRows";
{
var the_class = objj_getClass("SPRuleEditorModel")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"SPRuleEditorModel\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $SPRuleEditorModel__initWithCoder_(self, _cmd, coder)
{ with(self)
{
    self=objj_msgSendSuper({ receiver:self, super_class:objj_getClass("SPRuleEditorModel").super_class }, "init");
    if(!self)
     return nil;
    _rows=objj_msgSend(coder, "decodeObjectForKey:", RowsKey);
    _rootLess=objj_msgSend(coder, "decodeBoolForKey:", RootlessKey);
    _canRemoveAllRows=objj_msgSend(coder, "decodeBoolForKey:", CanRemoveAllRowsKey);
    _nestingMode=objj_msgSend(coder, "decodeIntForKey:", NestingModeKey);
    return self;
}
},["id","id"]), new objj_method(sel_getUid("encodeWithCoder:"), function $SPRuleEditorModel__encodeWithCoder_(self, _cmd, coder)
{ with(self)
{
    objj_msgSend(coder, "encodeObject:forKey:", _rows, RowsKey);
    objj_msgSend(coder, "encodeBool:forKey:", _rootLess, RootlessKey);
    objj_msgSend(coder, "encodeBool:forKey:", _canRemoveAllRows, CanRemoveAllRowsKey);
    objj_msgSend(coder, "encodeInt:forKey:", _nestingMode, NestingModeKey);
}
},["void","id"])]);
}

p;23;SPRuleEditorModelItem.jt;15333;@STATIC;1.0;I;21;Foundation/CPObject.jt;15287;objj_executeFile("Foundation/CPObject.j", NO);
{var the_class = objj_allocateClassPair(CPObject, "SPRuleEditorModelItem"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_subrows"), new objj_ivar("_criteria"), new objj_ivar("_rowType"), new objj_ivar("_depth"), new objj_ivar("_canRemoveAllRows"), new objj_ivar("_data"), new objj_ivar("_parent")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("subrows"), function $SPRuleEditorModelItem__subrows(self, _cmd)
{ with(self)
{
return _subrows;
}
},["id"]),
new objj_method(sel_getUid("criteria"), function $SPRuleEditorModelItem__criteria(self, _cmd)
{ with(self)
{
return _criteria;
}
},["id"]),
new objj_method(sel_getUid("rowType"), function $SPRuleEditorModelItem__rowType(self, _cmd)
{ with(self)
{
return _rowType;
}
},["id"]),
new objj_method(sel_getUid("depth"), function $SPRuleEditorModelItem__depth(self, _cmd)
{ with(self)
{
return _depth;
}
},["id"]),
new objj_method(sel_getUid("canRemoveAllRows"), function $SPRuleEditorModelItem__canRemoveAllRows(self, _cmd)
{ with(self)
{
return _canRemoveAllRows;
}
},["id"]),
new objj_method(sel_getUid("setCanRemoveAllRows:"), function $SPRuleEditorModelItem__setCanRemoveAllRows_(self, _cmd, newValue)
{ with(self)
{
_canRemoveAllRows = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("data"), function $SPRuleEditorModelItem__data(self, _cmd)
{ with(self)
{
return _data;
}
},["id"]),
new objj_method(sel_getUid("setData:"), function $SPRuleEditorModelItem__setData_(self, _cmd, newValue)
{ with(self)
{
_data = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("parent"), function $SPRuleEditorModelItem__parent(self, _cmd)
{ with(self)
{
return _parent;
}
},["id"]),
new objj_method(sel_getUid("setParent:"), function $SPRuleEditorModelItem__setParent_(self, _cmd, newValue)
{ with(self)
{
_parent = newValue;
}
},["void","id"]), new objj_method(sel_getUid("init"), function $SPRuleEditorModelItem__init(self, _cmd)
{ with(self)
{
 self=objj_msgSendSuper({ receiver:self, super_class:objj_getClass("SPRuleEditorModelItem").super_class }, "init");
 if(!self)
  return self;
 _subrows=nil;
 _criteria=nil;
 _canRemoveAllRows=YES;
    _rowType=SPRuleEditorRowTypeSimple;
 _depth=0;
 _parent=nil;
 _data=nil;
 return self;
}
},["id"]), new objj_method(sel_getUid("initWithType:criteria:data:"), function $SPRuleEditorModelItem__initWithType_criteria_data_(self, _cmd, type, criteria, data)
{ with(self)
{
 self=objj_msgSendSuper({ receiver:self, super_class:objj_getClass("SPRuleEditorModelItem").super_class }, "init");
 if(!self)
  return self;
    _rowType=type;
 _subrows=nil;
 _criteria=objj_msgSend(objj_msgSend(CPArray, "alloc"), "initWithArray:copyItems:", criteria, YES);
 _depth=0;
 _parent=nil;
 _canRemoveAllRows=YES;
 _data=data;
 return self;
}
},["id","int","CPArray","id"]), new objj_method(sel_getUid("subrowsCount"), function $SPRuleEditorModelItem__subrowsCount(self, _cmd)
{ with(self)
{
 return _subrows?objj_msgSend(_subrows, "count"):0;
}
},["int"]), new objj_method(sel_getUid("flatSubrowsCount"), function $SPRuleEditorModelItem__flatSubrowsCount(self, _cmd)
{ with(self)
{
 var row;
 var total=0;
 var count=objj_msgSend(self, "subrowsCount");
 for(var i=0;i<count;i++)
 {
  row=objj_msgSend(_subrows, "objectAtIndex:", i);
  if(objj_msgSend(row, "rowType")==SPRuleEditorRowTypeCompound)
   total+=objj_msgSend(row, "flatSubrowsCount");
  total++;
 }
 return total;
}
},["int"]), new objj_method(sel_getUid("setParent:"), function $SPRuleEditorModelItem__setParent_(self, _cmd, aParent)
{ with(self)
{
 if(_parent==aParent)
  return;
 _parent=aParent;
 var newDepth=aParent?objj_msgSend(aParent, "depth")+1:0;
 objj_msgSend(self, "_setDepth:", newDepth);
}
},["void","SPRuleEditorModelItem"]), new objj_method(sel_getUid("_setDepth:"), function $SPRuleEditorModelItem___setDepth_(self, _cmd, newDepth)
{ with(self)
{
 if(_depth==newDepth)
  return;
 _depth=newDepth;
 if(_subrows&&objj_msgSend(_subrows, "count"))
  objj_msgSend(_subrows, "makeObjectsPerformSelector:withObject:", sel_getUid("_setDepth:"), _depth+1);
}
},["void","int"]), new objj_method(sel_getUid("hasAncestor:"), function $SPRuleEditorModelItem__hasAncestor_(self, _cmd, ancestor)
{ with(self)
{
 if(!ancestor||!_parent)
  return nil;
 var current=self;
 var p;
 while((p=objj_msgSend(current, "parent"))!=nil)
 {
  if(p==ancestor)
   return YES;
  current=p;
 }
 return NO;
}
},["BOOL","SPRuleEditorModelItem"]), new objj_method(sel_getUid("lastChild"), function $SPRuleEditorModelItem__lastChild(self, _cmd)
{ with(self)
{
 if(!_subrows)
  return nil;
 var count=objj_msgSend(_subrows, "count");
 if(!count)
  return nil;
 return objj_msgSend(_subrows, "objectAtIndex:", count-1);
}
},["SPRuleEditorModelItem"]), new objj_method(sel_getUid("indexOfChild:"), function $SPRuleEditorModelItem__indexOfChild_(self, _cmd, row)
{ with(self)
{
 if(!row||!_subrows||!objj_msgSend(_subrows, "count")||objj_msgSend(row, "parent")!=self)
  return CPNotFound;
 return objj_msgSend(_subrows, "indexOfObject:", row);
}
},["int","SPRuleEditorModelItem"]), new objj_method(sel_getUid("flatIndexOfChild:"), function $SPRuleEditorModelItem__flatIndexOfChild_(self, _cmd, aRow)
{ with(self)
{
 if(aRow==self)
  return 0;
 if(!_subrows||!aRow)
  return CPNotFound;
 var row;
 var rowsCount;
 var count=objj_msgSend(_subrows, "count");
 var relativeIndex;
 for(var i=0,idx=1;i<count;i++)
 {
  row=objj_msgSend(_subrows, "objectAtIndex:", i);
  if(aRow==row)
   return idx;
  if(objj_msgSend(row, "rowType")==SPRuleEditorRowTypeSimple)
  {
   idx++;
   continue;
  }
  relativeIndex=objj_msgSend(row, "flatIndexOfChild:", aRow);
  if(relativeIndex!=CPNotFound)
   return idx+relativeIndex;
  rowsCount=objj_msgSend(row, "flatSubrowsCount");
  idx+=rowsCount+1;
 }
 return CPNotFound;
}
},["int","SPRuleEditorModelItem"]), new objj_method(sel_getUid("childAtIndex:"), function $SPRuleEditorModelItem__childAtIndex_(self, _cmd, index)
{ with(self)
{
 if(!_subrows||index<0||index>=objj_msgSend(_subrows, "count"))
  return nil;
 return objj_msgSend(_subrows, "objectAtIndex:", index);
}
},["SPRuleEditorModelItem","int"]), new objj_method(sel_getUid("childAtFlatIndex:"), function $SPRuleEditorModelItem__childAtFlatIndex_(self, _cmd, index)
{ with(self)
{
 if(index==0)
  return self;
 if(!_subrows||index<0)
  return nil;
 var row;
 var rowsCount;
 var count=objj_msgSend(_subrows, "count");
 for(var i=0,idx=1;i<count;i++)
 {
  row=objj_msgSend(_subrows, "objectAtIndex:", i);
  if(idx==index)
   return row;
  if(objj_msgSend(row, "rowType")==SPRuleEditorRowTypeSimple)
  {
   idx++;
   continue;
  }
  rowsCount=objj_msgSend(row, "flatSubrowsCount");
  if(idx+rowsCount<index)
  {
   idx+=rowsCount+1;
   continue;
  }
  return objj_msgSend(row, "childAtFlatIndex:", index-idx);
 }
 return nil;
}
},["SPRuleEditorModelItem","int"]), new objj_method(sel_getUid("subrowWithDisplayValue:"), function $SPRuleEditorModelItem__subrowWithDisplayValue_(self, _cmd, value)
{ with(self)
{
 if(!_criteria||!objj_msgSend(_criteria, "count"))
  return nil;
 var criterion=objj_msgSend(_criteria, "objectAtIndex:", 0);
 if(objj_msgSend(objj_msgSend(criterion, "displayValue"), "isEqual:", value))
  return self;
 var row,found;
 var count=objj_msgSend(self, "subrowsCount");
 for(var i=0,idx=0;i<count;i++)
 {
  row=objj_msgSend(_subrows, "objectAtIndex:", i);
  found=objj_msgSend(row, "subrowWithDisplayValue:", value);
  if(found)
   return found;
 }
 return nil;
}
},["SPRuleEditorModel","id"]), new objj_method(sel_getUid("addChild:context:"), function $SPRuleEditorModelItem__addChild_context_(self, _cmd, row, context)
{ with(self)
{
 if(!row||_rowType!=SPRuleEditorRowTypeCompound)
  return CPNotFound;
 if(!_subrows)
  _subrows=objj_msgSend(objj_msgSend(CPMutableArray, "alloc"), "init");
 objj_msgSend(_subrows, "addObject:", row);
 objj_msgSend(row, "setParent:", self);
 var index=objj_msgSend(_subrows, "count")-1;
 if(context)
 {
  var userInfo=objj_msgSend(CPDictionary, "dictionaryWithObjects:forKeys:", [self,index,row], ["parentRow","index","row"]);
     objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", SPRuleEditorModelRowAdded, context, userInfo);
 }
 return index;
}
},["int","SPRuleEditorModelItem","id"]), new objj_method(sel_getUid("insertChild:atIndex:context:"), function $SPRuleEditorModelItem__insertChild_atIndex_context_(self, _cmd, row, index, context)
{ with(self)
{
 if(!row||_rowType!=SPRuleEditorRowTypeCompound)
  return CPNotFound;
 if(!_subrows)
  _subrows=objj_msgSend(objj_msgSend(CPMutableArray, "alloc"), "init");
 if(index<0)
  index=0;
 if(index>objj_msgSend(_subrows, "count"))
  return objj_msgSend(self, "addChild:context:", row, context);
 objj_msgSend(_subrows, "insertObject:atIndex:", row, index);
 objj_msgSend(row, "setParent:", self);
 if(context)
 {
  var userInfo=objj_msgSend(CPDictionary, "dictionaryWithObjects:forKeys:", [self,index,row], ["parentRow","index","row"]);
     objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", SPRuleEditorModelRowAdded, context, userInfo);
    }
 return index;
}
},["int","SPRuleEditorModelItem","int","id"]), new objj_method(sel_getUid("removeChildAtIndex:keepSubrows:context:"), function $SPRuleEditorModelItem__removeChildAtIndex_keepSubrows_context_(self, _cmd, index, keepSubrows, context)
{ with(self)
{
 if(!_subrows||_rowType!=SPRuleEditorRowTypeCompound)
  return nil;
 if(!_canRemoveAllRows&&objj_msgSend(_subrows, "count")<=1)
  return nil;
 var row=objj_msgSend(self, "childAtIndex:", index);
 if(!row)
  return nil;
 if(!_canRemoveAllRows
  &&((!keepSubrows&&objj_msgSend(_subrows, "count")<=1)||(keepSubrows&&objj_msgSend(_subrows, "count")==0)))
  return nil;
 objj_msgSend(_subrows, "removeObjectAtIndex:", index);
 objj_msgSend(row, "setParent:", nil);
 objj_msgSend(row, "_setDepth:", -1);
 if(context)
 {
  var userInfo=objj_msgSend(CPDictionary, "dictionaryWithObjects:forKeys:", [self,index,row], ["parentRow","index","row"]);
     objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", SPRuleEditorModelRowRemoved, context, userInfo);
 }
 if(!keepSubrows)
  return row;
 var subrows=objj_msgSend(row, "subrows");
 if(!subrows)
  return;
 var subrow;
 var count=objj_msgSend(subrows, "count");
 for(var i=count-1;i>=0;i--)
 {
  subrow=subrows[i];
  objj_msgSend(self, "insertChild:atIndex:context:", subrow, index, context);
 }
 return row;
}
},["SPRuleEditorModelItem","int","BOOL","id"]), new objj_method(sel_getUid("setCriteria:context:"), function $SPRuleEditorModelItem__setCriteria_context_(self, _cmd, criteria, context)
{ with(self)
{
 _criteria=criteria;
 var index=_parent?objj_msgSend(_parent, "indexOfChild:", self):CPNotFound;
 if(context)
 {
  var userInfo=objj_msgSend(CPDictionary, "dictionaryWithObjects:forKeys:", [_parent,index,self], ["parentRow","index","row"]);
     objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", SPRuleEditorModelRowModified, context, userInfo);
    }
}
},["void","CPArray","id"]), new objj_method(sel_getUid("criteriaItems"), function $SPRuleEditorModelItem__criteriaItems(self, _cmd)
{ with(self)
{
 if(!_criteria)
  return nil;
 var criterion;
 var count=objj_msgSend(_criteria, "count");
 if(!count)
  return objj_msgSend(CPArray, "array");
 var res=objj_msgSend(CPMutableArray, "arrayWithCapacity:", count);
 for(var i=0;i<count;i++)
 {
  criterion=_criteria[i];
  objj_msgSend(res, "addObject:", objj_msgSend(criterion, "items"));
 }
 return res;
}
},["CPArray"]), new objj_method(sel_getUid("criteriaDisplayValues"), function $SPRuleEditorModelItem__criteriaDisplayValues(self, _cmd)
{ with(self)
{
 if(!_criteria)
  return nil;
 var criterion;
 var count=objj_msgSend(_criteria, "count");
 if(!count)
  return objj_msgSend(CPArray, "array");
 var res=objj_msgSend(CPMutableArray, "arrayWithCapacity:", count);
 for(var i=0;i<count;i++)
 {
  criterion=_criteria[i];
  objj_msgSend(res, "addObject:", objj_msgSend(criterion, "displayValue"));
 }
 return res;
}
},["CPArray"]), new objj_method(sel_getUid("flattenToArray:"), function $SPRuleEditorModelItem__flattenToArray_(self, _cmd, array)
{ with(self)
{
 if(!array)
  return;
 objj_msgSend(array, "addObject:", self);
 var row;
 var count=objj_msgSend(self, "subrowsCount");
 for(var i=0,idx=0;i<count;i++)
 {
  row=objj_msgSend(_subrows, "objectAtIndex:", i);
  if(objj_msgSend(row, "rowType")==SPRuleEditorRowTypeSimple)
  {
   objj_msgSend(array, "addObject:", row)
   continue;
  }
  objj_msgSend(row, "flattenToArray:", array);
 }
}
},["void","CPMutableArray"]), new objj_method(sel_getUid("copy"), function $SPRuleEditorModelItem__copy(self, _cmd)
{ with(self)
{
    var copy = objj_msgSend(objj_msgSend(SPRuleEditorModelItem, "alloc"), "init");
    objj_msgSend(copy, "setRowType:", _rowType);
    objj_msgSend(copy, "setDepth:", _depth);
    objj_msgSend(copy, "setCanRemoveAllRows:", _canRemoveAllRows);
    objj_msgSend(copy, "setCriteria:", objj_msgSend(objj_msgSend(CPArray, "alloc"), "initWithArray:copyItems:", _criteria, YES));
    objj_msgSend(copy, "setSubrows:", objj_msgSend(objj_msgSend(CPArray, "alloc"), "initWithArray:copyItems:", _subrows, YES));
    objj_msgSend(objj_msgSend(copy, "subrows"), "makeObjectsPerformSelector:withObject:", sel_getUid("setParent:"), copy);
    objj_msgSend(copy, "setData:copy", _data);
    return copy;
}
},["id"])]);
}
var CriteriaKey = "criteria";
var SubrowsKey = "subrows";
var RowTypeKey = "rowType";
var DepthKey = "depth";
var ParentKey = "parent";
var CanRemoveAllRowsKey = "canRemoveAllRows";
{
var the_class = objj_getClass("SPRuleEditorModelItem")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"SPRuleEditorModelItem\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $SPRuleEditorModelItem__initWithCoder_(self, _cmd, coder)
{ with(self)
{
    self=objj_msgSendSuper({ receiver:self, super_class:objj_getClass("SPRuleEditorModelItem").super_class }, "init");
    if(!self)
     return nil;
    _subrows=objj_msgSend(coder, "decodeObjectForKey:", SubrowsKey);
    _criteria=objj_msgSend(coder, "decodeObjectForKey:", CriteriaKey);
    _canRemoveAllRows=objj_msgSend(coder, "decodeBool:", CanRemoveAllRowsKey);
    _rowType=objj_msgSend(coder, "decodeIntForKey:", RowTypeKey);
    _depth=objj_msgSend(coder, "decodeIntForKey:", DepthKey);
    _parent=objj_msgSend(coder, "decodeObjectForKey:", ParentKey);
    return self;
}
},["id","id"]), new objj_method(sel_getUid("encodeWithCoder:"), function $SPRuleEditorModelItem__encodeWithCoder_(self, _cmd, coder)
{ with(self)
{
    objj_msgSend(coder, "encodeObject:forKey:", _subrows, SubrowsKey);
    objj_msgSend(coder, "encodeObject:forKey:", _criteria, CriteriaKey);
    objj_msgSend(coder, "encodeBool:forKey:", _canRemoveAllRows, CanRemoveAllRowsKey);
    objj_msgSend(coder, "encodeInt:forKey:", _rowType, RowTypeKey);
    objj_msgSend(coder, "encodeInt:forKey:", _depth, DepthKey);
    objj_msgSend(coder, "encodeObject:forKey:", _parent, ParentKey);
}
},["void","id"])]);
}

p;25;SPRuleEditorPopUpButton.jt;4883;@STATIC;1.0;t;4864;var GRADIENT_NORMAL,
    GRADIENT_HIGHLIGHTED,
    IE_FILTER = "progid:DXImageTransform.Microsoft.gradient(startColorstr='#fcfcfc', endColorstr='#dfdfdf')";
{var the_class = objj_allocateClassPair(CPPopUpButton, "SPRuleEditorPopUpButton"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_radius"), new objj_ivar("_isEditable")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("editable"), function $SPRuleEditorPopUpButton__editable(self, _cmd)
{ with(self)
{
return _isEditable;
}
},["id"]),
new objj_method(sel_getUid("setEditable:"), function $SPRuleEditorPopUpButton__setEditable_(self, _cmd, newValue)
{ with(self)
{
_isEditable = newValue;
}
},["void","id"]), new objj_method(sel_getUid("initWithFrame:"), function $SPRuleEditorPopUpButton__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("SPRuleEditorPopUpButton").super_class }, "initWithFrame:", aFrame))
    {
        var style = _DOMElement.style;
        style.backgroundImage = GRADIENT_NORMAL;
        style.border = "1px solid rgb(189, 189, 189)";
        style.filter = IE_FILTER;
        _radius=9.0;
        _isEditable=YES;
        objj_msgSend(self, "setTextColor:", objj_msgSend(CPColor, "colorWithWhite:alpha:", 0, 1));
        objj_msgSend(self, "setBordered:", NO);
     }
    return self;
}
},["id","CGRect"]), new objj_method(sel_getUid("editable"), function $SPRuleEditorPopUpButton__editable(self, _cmd)
{ with(self)
{
 return objj_msgSend(self, "enabled");
}
},["BOOL"]), new objj_method(sel_getUid("setEditable:"), function $SPRuleEditorPopUpButton__setEditable_(self, _cmd, isEditable)
{ with(self)
{
 objj_msgSend(self, "setEnabled:", isEditable);
}
},["void","BOOL"]), new objj_method(sel_getUid("setHighlighted:"), function $SPRuleEditorPopUpButton__setHighlighted_(self, _cmd, shouldHighlight)
{ with(self)
{
    _DOMElement.style.backgroundImage = (shouldHighlight) ? GRADIENT_HIGHLIGHTED : GRADIENT_NORMAL;
}
},["void","BOOL"]), new objj_method(sel_getUid("contentRectForBounds:"), function $SPRuleEditorPopUpButton__contentRectForBounds_(self, _cmd, bounds)
{ with(self)
{
    var contentRect = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("SPRuleEditorPopUpButton").super_class }, "contentRectForBounds:", bounds);
    contentRect.origin.x += _radius;
    contentRect.size.width -= 2 * _radius;
    return contentRect;
}
},["CGRect","CGRect"]), new objj_method(sel_getUid("layoutSubviews"), function $SPRuleEditorPopUpButton__layoutSubviews(self, _cmd)
{ with(self)
{
    _radius = FLOOR(CGRectGetHeight(objj_msgSend(self, "bounds"))/2);
    var style = _DOMElement.style,
        radiusCSS = _radius + "px";
    style.borderRadius=radiusCSS;
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("SPRuleEditorPopUpButton").super_class }, "layoutSubviews");
}
},["void"]), new objj_method(sel_getUid("drawRect:"), function $SPRuleEditorPopUpButton__drawRect_(self, _cmd, aRect)
{ with(self)
{
    var bounds = objj_msgSend(self, "bounds"),
        context = objj_msgSend(objj_msgSend(CPGraphicsContext, "currentContext"), "graphicsPort");
    var arrow_width = FLOOR(CGRectGetHeight(bounds)/3.5);
    CGContextTranslateCTM(context, CGRectGetWidth(bounds) - _radius - arrow_width, CGRectGetHeight(bounds) / 2);
    var arrowsPath = objj_msgSend(CPBezierPath, "bezierPath");
    objj_msgSend(arrowsPath, "moveToPoint:", CGPointMake(0, 1));
    objj_msgSend(arrowsPath, "lineToPoint:", CGPointMake(arrow_width, 1));
    objj_msgSend(arrowsPath, "lineToPoint:", CGPointMake(arrow_width/2, arrow_width + 1));
    objj_msgSend(arrowsPath, "closePath");
    CGContextSetFillColor(context, objj_msgSend(CPColor, "colorWithWhite:alpha:", 101/255, 1));
    objj_msgSend(arrowsPath, "fill");
    CGContextScaleCTM(context, 1 , -1);
    objj_msgSend(arrowsPath, "fill");
}
},["void","CGRect"]), new objj_method(sel_getUid("acceptsFirstResponder"), function $SPRuleEditorPopUpButton__acceptsFirstResponder(self, _cmd)
{ with(self)
{
    return NO;
}
},["BOOL"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function $SPRuleEditorPopUpButton__initialize(self, _cmd)
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

p;21;SPRuleEditorRowView.jt;41808;@STATIC;1.0;I;21;Foundation/CPObject.jI;15;AppKit/CPView.jI;17;AppKit/CPButton.jI;20;AppKit/CPTextField.jI;15;AppKit/CPMenu.jI;22;AppKit/CPPopUpButton.jI;17;AppKit/CPButton.ji;23;SPRuleEditorCriterion.ji;25;SPRuleEditorPopUpButton.ji;26;SPRuleEditorActionButton.jt;41537;objj_executeFile("Foundation/CPObject.j", NO);
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

p;18;SPRuleEditorView.jt;20184;@STATIC;1.0;I;21;Foundation/CPObject.jI;15;AppKit/CPView.ji;21;SPRuleEditorRowView.jt;20092;objj_executeFile("Foundation/CPObject.j", NO);
objj_executeFile("AppKit/CPView.j", NO);
objj_executeFile("SPRuleEditorRowView.j", YES);
SPRuleEditorRowViewMinHeight=26;
SPRuleEditorRowViewIndent=30;
{var the_class = objj_allocateClassPair(CPView, "SPRuleEditorView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_delegate"), new objj_ivar("_editable"), new objj_ivar("_rowHeight"), new objj_ivar("_dragging"), new objj_ivar("_currentDropTarget"), new objj_ivar("_forcedRedraw")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("delegate"), function $SPRuleEditorView__delegate(self, _cmd)
{ with(self)
{
return _delegate;
}
},["id"]),
new objj_method(sel_getUid("setDelegate:"), function $SPRuleEditorView__setDelegate_(self, _cmd, newValue)
{ with(self)
{
_delegate = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("editable"), function $SPRuleEditorView__editable(self, _cmd)
{ with(self)
{
return _editable;
}
},["id"]),
new objj_method(sel_getUid("setEditable:"), function $SPRuleEditorView__setEditable_(self, _cmd, newValue)
{ with(self)
{
_editable = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("rowHeight"), function $SPRuleEditorView__rowHeight(self, _cmd)
{ with(self)
{
return _rowHeight;
}
},["id"]),
new objj_method(sel_getUid("setRowHeight:"), function $SPRuleEditorView__setRowHeight_(self, _cmd, newValue)
{ with(self)
{
_rowHeight = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("dragging"), function $SPRuleEditorView__dragging(self, _cmd)
{ with(self)
{
return _dragging;
}
},["id"]), new objj_method(sel_getUid("initWithFrame:"), function $SPRuleEditorView__initWithFrame_(self, _cmd, frame)
{ with(self)
{
    self=objj_msgSendSuper({ receiver:self, super_class:objj_getClass("SPRuleEditorView").super_class }, "initWithFrame:", frame);
    if(!self)
     return nil;
    _model=nil;
    _delegate=nil;
    _editable=YES;
    _rowHeight=SPRuleEditorRowViewMinHeight;
    _dragging=NO;
    _forcedRedraw=NO;
  objj_msgSend(self, "setThemeClass:", "rule-editor");
    objj_msgSend(self, "setBackgroundColor:", objj_msgSend(CPColor, "colorWithHexString:", "ededed"));
    objj_msgSend(self, "setPostsFrameChangedNotifications:", YES);
    objj_msgSend(self, "registerForDraggedTypes:", objj_msgSend(CPArray, "arrayWithObjects:", SPRuleEditorItemPBoardType,nil));
    return self;
}
},["id","CGRect"]), new objj_method(sel_getUid("removeFromSuperview"), function $SPRuleEditorView__removeFromSuperview(self, _cmd)
{ with(self)
{
 if(objj_msgSend(self, "superview"))
  objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "removeObserver:", self);
 objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "removeObserver:", self);
}
},["void"]), new objj_method(sel_getUid("setModel:"), function $SPRuleEditorView__setModel_(self, _cmd, model)
{ with(self)
{
 if(model==_model)
  return nil;
    var notificationCenter=objj_msgSend(CPNotificationCenter, "defaultCenter");
    if(_model)
    {
  objj_msgSend(notificationCenter, "removeObserver:name:object:", self, SPRuleEditorModelRowAdded, _model);
  objj_msgSend(notificationCenter, "removeObserver:name:object:", self, SPRuleEditorModelRowRemoved, _model);
  objj_msgSend(notificationCenter, "removeObserver:name:object:", self, SPRuleEditorModelRowModified, _model);
  objj_msgSend(notificationCenter, "removeObserver:name:object:", self, SPRuleEditorModelNestingModeWillChange, _model);
  objj_msgSend(notificationCenter, "removeObserver:name:object:", self, SPRuleEditorModelNestingModeDidChange, _model);
  objj_msgSend(notificationCenter, "removeObserver:name:object:", self, SPRuleEditorModelRemovedAllRows, _model);
    }
    _model=model;
    if(_model)
    {
  objj_msgSend(notificationCenter, "addObserver:selector:name:object:", self, sel_getUid("rowAdded:"), SPRuleEditorModelRowAdded, _model);
  objj_msgSend(notificationCenter, "addObserver:selector:name:object:", self, sel_getUid("rowRemoved:"), SPRuleEditorModelRowRemoved, _model);
  objj_msgSend(notificationCenter, "addObserver:selector:name:object:", self, sel_getUid("rowModified:"), SPRuleEditorModelRowModified, _model);
  objj_msgSend(notificationCenter, "addObserver:selector:name:object:", self, sel_getUid("nestingModeWillChange:"), SPRuleEditorModelNestingModeWillChange, _model);
  objj_msgSend(notificationCenter, "addObserver:selector:name:object:", self, sel_getUid("nestingModeDidChange:"), SPRuleEditorModelNestingModeDidChange, _model);
  objj_msgSend(notificationCenter, "addObserver:selector:name:object:", self, sel_getUid("allRowsRemoved:"), SPRuleEditorModelRemovedAllRows, _model);
    }
}
},["void","SPRuleEditorModel"]), new objj_method(sel_getUid("setDelegate:"), function $SPRuleEditorView__setDelegate_(self, _cmd, delegate)
{ with(self)
{
 if(delegate==_delegate)
  return;
 _delegate=delegate;
 var subviews=objj_msgSend(self, "subviews");
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
}
},["void","id"]), new objj_method(sel_getUid("setEditable:"), function $SPRuleEditorView__setEditable_(self, _cmd, editable)
{ with(self)
{
 if(_editable==editable)
  return;
 _editable=editable;
 var subviews=objj_msgSend(self, "subviews");
 var subview;
 var view;
 var count=objj_msgSend(subviews, "count");
 for(var i=0;i<count;i++)
 {
  subview=subviews[i];
  if(!objj_msgSend(subview, "isKindOfClass:", SPRuleEditorRowView))
   continue;
  objj_msgSend(subview, "setEditable:", _editable);
 }
 objj_msgSend(self, "setNeedsLayout");
}
},["void","BOOL"]), new objj_method(sel_getUid("setRowHeight:"), function $SPRuleEditorView__setRowHeight_(self, _cmd, rowHeight)
{ with(self)
{
 if(_rowHeight==rowHeight)
  return;
 _rowHeight=Math.max(rowHeight,SPRuleEditorRowViewMinHeight);
    var subviews=objj_msgSend(self, "subviews");
 var subview;
 var view;
 var count=objj_msgSend(subviews, "count");
 for(var i=0;i<count;i++)
 {
  subview=subviews[i];
  if(!objj_msgSend(subview, "isKindOfClass:", SPRuleEditorRowView))
   continue;
  objj_msgSend(subview, "setRowHeight:", _rowHeight);
 }
 objj_msgSend(self, "setNeedsLayout");
}
},["void","CGFloat"]), new objj_method(sel_getUid("rowViewWithItem:"), function $SPRuleEditorView__rowViewWithItem_(self, _cmd, item)
{ with(self)
{
 var subviews=objj_msgSend(self, "subviews");
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
},["SPRuleEditorRowView","SPRuleEditorModelItem"]), new objj_method(sel_getUid("rowViewAtPoint:"), function $SPRuleEditorView__rowViewAtPoint_(self, _cmd, aPoint)
{ with(self)
{
 var subviews=objj_msgSend(self, "subviews");
 var subview;
 var view;
 var count=objj_msgSend(subviews, "count");
 for(var i=0;i<count;i++)
 {
  subview=subviews[i];
  if(!objj_msgSend(subview, "isKindOfClass:", SPRuleEditorRowView))
   continue;
  view=objj_msgSend(subview, "viewAtPoint:", aPoint);
  if(!view||!objj_msgSend(view, "isKindOfClass:", SPRuleEditorRowView))
   continue;
  return view;
 }
 return nil;
}
},["CPView","CPPoint"]), new objj_method(sel_getUid("rowAdded:"), function $SPRuleEditorView__rowAdded_(self, _cmd, notification)
{ with(self)
{
 if(!notification)
  objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, _cmd+" : null notification");
 var userInfo=objj_msgSend(notification, "userInfo");
 if(!userInfo)
  objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, _cmd+" : notification userInfo is null");
 var parentRow=objj_msgSend(userInfo, "valueForKey:", "parentRow");
 var index=objj_msgSend(userInfo, "valueForKey:", "index");
 var row=objj_msgSend(userInfo, "valueForKey:", "row");
 objj_msgSend(self, "row:addedAtIndex:withParentRow:", row, index, parentRow);
}
},["void","CPNotification"]), new objj_method(sel_getUid("row:addedAtIndex:withParentRow:"), function $SPRuleEditorView__row_addedAtIndex_withParentRow_(self, _cmd, row, index, parentRow)
{ with(self)
{
 objj_msgSend(self, "_row:addedAtIndex:withParentRow:", row, index, parentRow);
 var count=objj_msgSend(row, "subrowsCount");
 for(var i=0;i<count;i++)
  objj_msgSend(self, "row:addedAtIndex:withParentRow:", objj_msgSend(row, "childAtIndex:", i), i, row);
}
},["void","SPRuleEditorModelItem","CPInteger","SPRuleEditorModelItem"]), new objj_method(sel_getUid("_row:addedAtIndex:withParentRow:"), function $SPRuleEditorView___row_addedAtIndex_withParentRow_(self, _cmd, row, index, parentRow)
{ with(self)
{
 if(index<0||!row)
  objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, _cmd+" : invalid SPRuleEditorModelRowAdded notification userInfo");
 var parentView;
 var subviews=objj_msgSend(parentView, "subviews");
 var parentViewIsSelf;
 if(!parentRow)
 {
  parentView=self;
  subviews=objj_msgSend(self, "subviews");
  parentViewIsSelf=YES;
 }
 else
 {
  parentView=objj_msgSend(self, "rowViewWithItem:", parentRow);
  subviews=objj_msgSend(objj_msgSend(parentView, "subrowsView"), "subviews");
  parentViewIsSelf=NO;
 }
 if(!parentView)
  objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, _cmd+" : parent row view does not exist");
 var count=objj_msgSend(subviews, "count");
 if(index>count)
  objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, _cmd+" : invalid SPRuleEditorModelRowAdded notification userInfo");
 var rowView=objj_msgSend(objj_msgSend(SPRuleEditorRowView, "alloc"), "initWithFrame:", objj_msgSend(self, "initialFrameForItem:", row));
 objj_msgSend(rowView, "setDelegate:", _delegate);
    objj_msgSend(rowView, "setAutoresizingMask:", CPViewWidthSizable);
 objj_msgSend(rowView, "setItem:", row);
 objj_msgSend(rowView, "setNestingMode:", objj_msgSend(_model, "nestingMode"));
 objj_msgSend(rowView, "setDelegate:", _delegate);
 objj_msgSend(rowView, "setEditable:", _editable);
 if(!count||index==count)
 {
  if(parentViewIsSelf)
   objj_msgSend(self, "addSubview:", rowView);
  else
   objj_msgSend(parentView, "addRowView:", rowView);
 }
 else
 {
  var siblingView=objj_msgSend(subviews, "objectAtIndex:", index);
  if(parentViewIsSelf)
   objj_msgSend(self, "addSubview:positioned:relativeTo:", rowView, CPWindowBelow, siblingView);
  else
   objj_msgSend(parentView, "addRowView:positioned:relativeTo:", rowView, CPWindowBelow, siblingView);
 }
 objj_msgSend(objj_msgSend(self, "window"), "makeFirstResponder:", rowView);
 objj_msgSend(self, "setNeedsLayout");
}
},["void","SPRuleEditorModelItem","CPInteger","SPRuleEditorModelItem"]), new objj_method(sel_getUid("rowRemoved:"), function $SPRuleEditorView__rowRemoved_(self, _cmd, notification)
{ with(self)
{
 if(!notification)
  objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, _cmd+" : null notification");
 var userInfo=objj_msgSend(notification, "userInfo");
 if(!userInfo)
  objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, _cmd+" : notification userInfo is null");
 var row=objj_msgSend(userInfo, "valueForKey:", "row");
 if(!row)
  objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, _cmd+" : invalid SPRuleEditorModelRowAdded notification userInfo");
 var parentRow=objj_msgSend(userInfo, "valueForKey:", "parentRow");
 var view=objj_msgSend(self, "rowViewWithItem:", row);
 if(!view)
  return;
 var parentView;
 if(!parentRow)
 {
  objj_msgSend(view, "removeFromSuperview");
 }
 else
 {
  var parentView=objj_msgSend(self, "rowViewWithItem:", parentRow);
  if(!parentView)
   objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, _cmd+" : invalid SPRuleEditorModelRowRemoved notification userInfo");
  objj_msgSend(parentView, "removeRowView:", view);
 }
 objj_msgSend(self, "setNeedsLayout");
}
},["void","CPNotification"]), new objj_method(sel_getUid("allRowsRemoved:"), function $SPRuleEditorView__allRowsRemoved_(self, _cmd, notification)
{ with(self)
{
 var subviews=objj_msgSend(self, "subviews");
 var count=objj_msgSend(subviews, "count");
 for(var i=0;i<count;i++)
 {
  objj_msgSend(subviews[i], "removeFromSuperview");
 }
}
},["void","CPNotification"]), new objj_method(sel_getUid("rowModified:"), function $SPRuleEditorView__rowModified_(self, _cmd, notification)
{ with(self)
{
 if(!notification)
  objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, _cmd+" : null notification");
 var userInfo=objj_msgSend(notification, "userInfo");
 if(!userInfo)
  objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, _cmd+" : notification userInfo is null");
 var row=objj_msgSend(userInfo, "valueForKey:", "row");
 var view=objj_msgSend(self, "rowViewWithItem:", row);
 if(!view)
  return;
 objj_msgSend(view, "setItem:", row);
 objj_msgSend(self, "setNeedsLayout");
}
},["void","CPNotification"]), new objj_method(sel_getUid("nestingModeWillChange:"), function $SPRuleEditorView__nestingModeWillChange_(self, _cmd, notification)
{ with(self)
{
}
},["void","CPNotification"]), new objj_method(sel_getUid("nestingModeDidChange:"), function $SPRuleEditorView__nestingModeDidChange_(self, _cmd, notification)
{ with(self)
{
 if(!notification)
  objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, _cmd+" : null notification");
 var userInfo=objj_msgSend(notification, "userInfo");
 if(!userInfo)
  objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, _cmd+" : notification userInfo is null");
 var nestingMode=objj_msgSend(userInfo, "valueForKey:", "newNestingMode");
 var subviews=objj_msgSend(self, "subviews");
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
 objj_msgSend(self, "setNeedsLayout");
}
},["void","CPNotification"]), new objj_method(sel_getUid("drawRect:"), function $SPRuleEditorView__drawRect_(self, _cmd, rect)
{ with(self)
{
 var subviews=objj_msgSend(self, "subviews");
 var count=objj_msgSend(subviews, "count");
 if(!count)
  return;
 var view;
    var context=objj_msgSend(objj_msgSend(CPGraphicsContext, "currentContext"), "graphicsPort");
    if(!context)
     return;
 var frame=objj_msgSend(self, "frame");
 for(var i=0;i<count;i++)
 {
  view=subviews[i];
  if(!objj_msgSend(view, "isKindOfClass:", SPRuleEditorRowView))
   continue;
  objj_msgSend(view, "drawBordersInContext:verticalOffset:width:", context, 0, frame.size.width);
 }
}
},["void","CPRect"]), new objj_method(sel_getUid("forceRedrawForChromeBug"), function $SPRuleEditorView__forceRedrawForChromeBug(self, _cmd)
{ with(self)
{
 var size=objj_msgSend(self, "frameSize");
 self._DOMElement.style.height=(size.height+1)+"px";
 _forcedRedraw=YES;
 objj_msgSend(self, "setNeedsLayout");
}
},["void"]), new objj_method(sel_getUid("layoutSubviews"), function $SPRuleEditorView__layoutSubviews(self, _cmd)
{ with(self)
{
 if(_forcedRedraw)
 {
  var size=objj_msgSend(self, "frameSize");
  self._DOMElement.style.height=(size.height-1)+"px";
  _forcedRedraw=NO;
  return;
 }
 var subviews=objj_msgSend(self, "subviews");
 var count=objj_msgSend(subviews, "count");
 var bounds=objj_msgSend(self, "bounds");
 var view;
 var deltaY=0;
 var frame;
 for(var i=0;i<count;i++)
 {
  view=subviews[i];
  if(!objj_msgSend(view, "isKindOfClass:", SPRuleEditorRowView))
   continue;
  objj_msgSend(view, "_layoutSubviews");
  frame=objj_msgSend(view, "frame");
  frame.origin.y=deltaY;
  objj_msgSend(view, "setFrame:", frame);
  deltaY+=frame.size.height;
  objj_msgSend(view, "setFrame:", frame);
 }
 var size=objj_msgSend(self, "frameSize");
 size.height=deltaY;
 objj_msgSend(self, "setFrameSize:", size);
}
},["void"]), new objj_method(sel_getUid("initialFrameForItem:"), function $SPRuleEditorView__initialFrameForItem_(self, _cmd, item)
{ with(self)
{
 var depth=objj_msgSend(item, "depth");
 var indentation=!depth?0:SPRuleEditorRowViewIndent;
 return CGRectMake(indentation,0,objj_msgSend(self, "frame").size.width-(indentation*depth),_rowHeight);
}
},["CGRect","SPRuleEditorModelItem"]), new objj_method(sel_getUid("draggingEntered:"), function $SPRuleEditorView__draggingEntered_(self, _cmd, sender)
{ with(self)
{
 if(_dragging)
  return CPDragOperationNone;
 var source=objj_msgSend(sender, "draggingSource");
    if(objj_msgSend(source, "isKindOfClass:", SPRuleEditorRowView)&&objj_msgSend(source, "delegate")==_delegate)
    {
  _dragging=YES;
        return CPDragOperationMove;
    }
 _dragging=NO;
    return CPDragOperationNone;
}
},["CPDragOperation","id<CPDraggingInfo>"]), new objj_method(sel_getUid("draggingExited:"), function $SPRuleEditorView__draggingExited_(self, _cmd, sender)
{ with(self)
{
 _dragging=NO;
 objj_msgSend(self, "updateDropTarget:", nil);
}
},["void","id"]), new objj_method(sel_getUid("draggingUpdated:"), function $SPRuleEditorView__draggingUpdated_(self, _cmd, sender)
{ with(self)
{
 if(!_dragging)
  return;
    var view=objj_msgSend(self, "rowViewAtPoint:", objj_msgSend(sender, "draggingLocation"));
    var source=objj_msgSend(sender, "draggingSource");
    if(!objj_msgSend(source, "isKindOfClass:", SPRuleEditorRowView))
    {
     objj_msgSend(self, "updateDropTarget:", nil);
        return CPDragOperationNone;
    }
    if(!view||view==source||objj_msgSend(source, "hasSubrow:", view))
    {
     objj_msgSend(self, "updateDropTarget:", nil);
        return CPDragOperationNone;
    }
    var row=objj_msgSend(source, "item");
    var anotherRow=objj_msgSend(view, "item");
    if(_delegate
     &&objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("canMoveRow:afterRow:"))
     &&!objj_msgSend(_delegate, "canMoveRow:afterRow:", row, anotherRow))
    {
     objj_msgSend(self, "updateDropTarget:", nil);
        return CPDragOperationNone;
    }
    objj_msgSend(self, "updateDropTarget:", view);
    return CPDragOperationMove;
}
},["CPDragOperation","id<CPDraggingInfo>"]), new objj_method(sel_getUid("performDragOperation:"), function $SPRuleEditorView__performDragOperation_(self, _cmd, sender)
{ with(self)
{
    var view=objj_msgSend(self, "rowViewAtPoint:", objj_msgSend(sender, "draggingLocation"));
    var source=objj_msgSend(sender, "draggingSource");
    if(!objj_msgSend(source, "isKindOfClass:", SPRuleEditorRowView))
    {
     objj_msgSend(self, "updateDropTarget:", nil);
        return CPDragOperationNone;
    }
    if(!view||view==source||objj_msgSend(source, "hasSubrow:", view))
    {
     objj_msgSend(self, "updateDropTarget:", nil);
        return CPDragOperationNone;
    }
    var row=objj_msgSend(source, "item");
    var anotherRow=objj_msgSend(view, "item");
    if(_delegate
     &&objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("moveRow:afterRow:")) )
    {
  objj_msgSend(_delegate, "moveRow:afterRow:", row, anotherRow);
 }
    _dragging=NO;
    objj_msgSend(self, "updateDropTarget:", nil);
    return YES;
}
},["BOOL","id<CPDraggingInfo>"]), new objj_method(sel_getUid("updateDropTarget:"), function $SPRuleEditorView__updateDropTarget_(self, _cmd, rowView)
{ with(self)
{
 if(_currentDropTarget==rowView)
  return;
 objj_msgSend(_currentDropTarget, "setShowDragIndicator:", NO);
 if(rowView)
 {
  _currentDropTarget=rowView;
  objj_msgSend(_currentDropTarget, "setShowDragIndicator:", YES);
 }
 objj_msgSend(self, "layoutSubviews");
 objj_msgSend(self, "setNeedsDisplay:", YES);
}
},["void","SPRuleEditorRowView"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("themeAttributes"), function $SPRuleEditorView__themeAttributes(self, _cmd)
{ with(self)
{
 return objj_msgSend(SPRuleEditor, "themeAttributes");
}
},["id"])]);
}

e;