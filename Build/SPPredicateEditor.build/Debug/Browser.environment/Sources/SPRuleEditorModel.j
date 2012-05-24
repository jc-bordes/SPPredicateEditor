@STATIC;1.0;I;21;Foundation/CPObject.ji;23;SPRuleEditorModelItem.jt;19627;objj_executeFile("Foundation/CPObject.j", NO);
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

