@STATIC;1.0;i;33;SPPredicateEditorFloatTextField.ji;35;SPPredicateEditorIntegerTextField.jt;38478;objj_executeFile("SPPredicateEditorFloatTextField.j", YES);
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

