@STATIC;1.0;I;21;Foundation/CPObject.jt;15287;objj_executeFile("Foundation/CPObject.j", NO);
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

