@STATIC;1.0;I;21;Foundation/CPObject.ji;23;SPRuleEditorModelItem.jt;14520;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("SPRuleEditorModelItem.j",YES);
SPRuleEditorNestingModeSingle=0;
SPRuleEditorNestingModeList=1;
SPRuleEditorNestingModeCompound=2;
SPRuleEditorNestingModeSimple=3;
SPRuleEditorRowTypeSimple=0;
SPRuleEditorRowTypeCompound=1;
SPRuleEditorModelRowAdded="SPRuleEditorModelRowAdded";
SPRuleEditorModelRowRemoved="SPRuleEditorModelRowRemoved";
SPRuleEditorModelRowModified="SPRuleEditorModelRowModified";
SPRuleEditorModelNestingModeWillChange="SPRuleEditorModelNestingModeWillChange";
SPRuleEditorModelNestingModeDidChange="SPRuleEditorModelNestingModeDidChange";
SPRuleEditorModelRemovedAllRows="SPRuleEditorModelRemovedAllRows";
var _1=objj_allocateClassPair(CPObject,"SPRuleEditorModel"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_rows"),new objj_ivar("_rootLess"),new objj_ivar("_nestingMode"),new objj_ivar("_canRemoveAllRows")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("rows"),function(_3,_4){
with(_3){
return _rows;
}
}),new objj_method(sel_getUid("rootLess"),function(_5,_6){
with(_5){
return _rootLess;
}
}),new objj_method(sel_getUid("nestingMode"),function(_7,_8){
with(_7){
return _nestingMode;
}
}),new objj_method(sel_getUid("setNestingMode:"),function(_9,_a,_b){
with(_9){
_nestingMode=_b;
}
}),new objj_method(sel_getUid("canRemoveAllRows"),function(_c,_d){
with(_c){
return _canRemoveAllRows;
}
}),new objj_method(sel_getUid("setCanRemoveAllRows:"),function(_e,_f,_10){
with(_e){
_canRemoveAllRows=_10;
}
}),new objj_method(sel_getUid("init"),function(_11,_12){
with(_11){
_11=objj_msgSendSuper({receiver:_11,super_class:objj_getClass("SPRuleEditorModel").super_class},"init");
if(!_11){
return nil;
}
_nestingMode=SPRuleEditorNestingModeCompound;
_rows=objj_msgSend(objj_msgSend(CPMutableArray,"alloc"),"init");
_rootLess=NO;
_canRemoveAllRows=NO;
return _11;
}
}),new objj_method(sel_getUid("initWithNestingMode:"),function(_13,_14,_15){
with(_13){
_13=objj_msgSendSuper({receiver:_13,super_class:objj_getClass("SPRuleEditorModel").super_class},"init");
if(!_13){
return nil;
}
_nestingMode=_15;
_rows=objj_msgSend(objj_msgSend(CPMutableArray,"alloc"),"init");
_rootLess=_nestingMode==SPRuleEditorNestingModeSingle||_nestingMode==SPRuleEditorNestingModeList;
_canRemoveAllRows=NO;
return _13;
}
}),new objj_method(sel_getUid("defaultRowType"),function(_16,_17){
with(_16){
if(_rootLess){
return SPRuleEditorRowTypeSimple;
}
return objj_msgSend(_rows,"count")?SPRuleEditorRowTypeSimple:SPRuleEditorRowTypeCompound;
}
}),new objj_method(sel_getUid("setNestingMode:"),function(_18,_19,_1a){
with(_18){
if(_1a==_nestingMode){
return;
}
var _1b=objj_msgSend(CPNotificationCenter,"defaultCenter");
var _1c=objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[_1a,_nestingMode],["newNestingMode","oldNestingMode"]);
objj_msgSend(_1b,"postNotificationName:object:userInfo:",SPRuleEditorModelNestingModeWillChange,_18,_1c);
var _1d=_nestingMode;
_nestingMode=_1a;
_rootLess=_nestingMode==SPRuleEditorNestingModeSingle||_nestingMode==SPRuleEditorNestingModeList;
objj_msgSend(_18,"setCanRemoveAllRows:",_canRemoveAllRows);
objj_msgSend(_18,"removeAllRows");
_1c=objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[_nestingMode,_1d],["newNestingMode","oldNestingMode"]);
objj_msgSend(_1b,"postNotificationName:object:userInfo:",SPRuleEditorModelNestingModeDidChange,_18,_1c);
}
}),new objj_method(sel_getUid("setCanRemoveAllRows:"),function(_1e,_1f,_20){
with(_1e){
_canRemoveAllRows=_20;
}
}),new objj_method(sel_getUid("rowsCount"),function(_21,_22){
with(_21){
return objj_msgSend(_rows,"count");
}
}),new objj_method(sel_getUid("flatRowsCount"),function(_23,_24){
with(_23){
var _25=0;
var _26=objj_msgSend(_rows,"count");
for(var i=0;i<_26;i++){
_25+=objj_msgSend(_rows[i],"flatSubrowsCount")+1;
}
return _25;
}
}),new objj_method(sel_getUid("lastRowIndex"),function(_27,_28){
with(_27){
var _29=objj_msgSend(_rows,"count");
if(!_29){
return CPNotFound;
}
var row=objj_msgSend(_27,"lastRow");
return row?objj_msgSend(_27,"indexOfRow:",row):CPNotFound;
}
}),new objj_method(sel_getUid("lastRow"),function(_2a,_2b){
with(_2a){
var _2c=objj_msgSend(_rows,"count");
if(!_2c){
return nil;
}
var row=_rows[_2c-1];
if(!row){
return nil;
}
return objj_msgSend(row,"lastChild");
}
}),new objj_method(sel_getUid("rowAtIndex:"),function(_2d,_2e,_2f){
with(_2d){
if(_2f<0){
return nil;
}
var _30=objj_msgSend(_rows,"count");
if(!_30){
return nil;
}
var row,_31,_32=0;
for(var i=0;i<_30;i++){
row=_rows[i];
_31=objj_msgSend(row,"childAtFlatIndex:",_2f-_32);
if(_31){
return _31;
}
_32+=objj_msgSend(row,"flatSubrowsCount")+1;
}
return nil;
}
}),new objj_method(sel_getUid("indexOfRow:"),function(_33,_34,_35){
with(_33){
if(!_35){
return CPNotFound;
}
var _36=objj_msgSend(_rows,"count");
if(!_36){
return CPNotFound;
}
var row,_37,_38=0;
for(var i=0;i<_36;i++){
row=_rows[i];
_37=objj_msgSend(row,"flatIndexOfChild:",_35);
if(_37!=CPNotFound){
return _37+_38;
}
_38+=objj_msgSend(row,"flatSubrowsCount")+1;
}
return CPNotFound;
}
}),new objj_method(sel_getUid("rowWithDisplayValue:"),function(_39,_3a,_3b){
with(_39){
var _3c=objj_msgSend(_rows,"count");
if(!_3c){
return nil;
}
var row;
for(var i=0;i<_3c;i++){
row=_rows[i];
row=objj_msgSend(row,"subrowWithDisplayValue:",_3b);
if(row){
return row;
}
}
return nil;
}
}),new objj_method(sel_getUid("immediateSubrowsIndexesOfRowAtIndex:"),function(_3d,_3e,_3f){
with(_3d){
var _40=objj_msgSend(_rows,"count");
if(!_40){
return nil;
}
var row=_3f<0?nil:objj_msgSend(_3d,"rowAtIndex:",_3f);
if(row&&objj_msgSend(row,"rowType")!=SPRuleEditorRowTypeCompound){
return nil;
}
var _41=objj_msgSend(objj_msgSend(CPMutableIndexSet,"alloc"),"init");
var _42=row?objj_msgSend(row,"subrows"):_rows;
var _40=objj_msgSend(_42,"count");
var _43;
for(var i=0;i<_40;i++){
_43=_42[i];
index=objj_msgSend(_3d,"indexOfRow:",_43);
if(index!=CPNotFound){
objj_msgSend(_41,"addIndex:",index);
}
}
return _41;
}
}),new objj_method(sel_getUid("allowNewRowInsertOfType:withParent:"),function(_44,_45,_46,_47){
with(_44){
var _48=objj_msgSend(_rows,"count");
var _49=_48?_rows[0]:nil;
switch(_nestingMode){
case SPRuleEditorNestingModeSingle:
return (_48==0)&&(_46==SPRuleEditorRowTypeSimple)&&(_47==nil);
case SPRuleEditorNestingModeList:
return (_46==SPRuleEditorRowTypeSimple)&&(_47==nil);
case SPRuleEditorNestingModeSimple:
return ((!_49&&_46==SPRuleEditorRowTypeCompound)&&(_47==nil))||(_49&&(_46==SPRuleEditorRowTypeSimple)&&(_47==_49));
}
return (!_49&&_46==SPRuleEditorRowTypeCompound&&_47==nil)||(_49&&(_47==_49||_47!=nil));
}
}),new objj_method(sel_getUid("addNewRowOfType:criteria:"),function(_4a,_4b,_4c,_4d){
with(_4a){
return objj_msgSend(_4a,"addNewRowOfType:criteria:data:",_4c,_4d,nil);
}
}),new objj_method(sel_getUid("addNewRowOfType:criteria:data:"),function(_4e,_4f,_50,_51,_52){
with(_4e){
var _53=objj_msgSend(objj_msgSend(SPRuleEditorModelItem,"alloc"),"initWithType:criteria:data:",_50,_51,_52);
return objj_msgSend(_4e,"addRow:",_53);
}
}),new objj_method(sel_getUid("addRow:"),function(_54,_55,_56){
with(_54){
if(!_56){
return nil;
}
var _57=objj_msgSend(_56,"rowType");
if(!objj_msgSend(_54,"allowNewRowInsertOfType:withParent:",_57,nil)){
return nil;
}
objj_msgSend(_56,"setCanRemoveAllRows:",YES);
objj_msgSend(_56,"_setDepth:",0);
objj_msgSend(_rows,"addObject:",_56);
var _58=objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[nil,objj_msgSend(_rows,"count")-1,_56],["parentRow","index","row"]);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",SPRuleEditorModelRowAdded,_54,_58);
return _56;
}
}),new objj_method(sel_getUid("insertNewRowAtIndex:ofType:withParentRowIndex:criteria:"),function(_59,_5a,_5b,_5c,_5d,_5e){
with(_59){
return objj_msgSend(_59,"insertNewRowAtIndex:ofType:withParentRowIndex:criteria:data:",_5b,_5c,_5d,_5e,nil);
}
}),new objj_method(sel_getUid("insertNewRowAtIndex:ofType:withParentRowIndex:criteria:data:"),function(_5f,_60,_61,_62,_63,_64,_65){
with(_5f){
var _66=objj_msgSend(objj_msgSend(SPRuleEditorModelItem,"alloc"),"initWithType:criteria:data:",_62,_64,_65);
return objj_msgSend(_5f,"insertRow:atIndex:withParentRowIndex:",_66,_61,_63);
}
}),new objj_method(sel_getUid("insertRow:atIndex:withParentRowIndex:"),function(_67,_68,_69,_6a,_6b){
with(_67){
if(!_69){
return nil;
}
var _6c=objj_msgSend(_69,"rowType");
if(_6a<=_6b){
return nil;
}
var _6d=_6b<0?nil:objj_msgSend(_67,"rowAtIndex:",_6b);
if(!objj_msgSend(_67,"allowNewRowInsertOfType:withParent:",_6c,_6d)){
return nil;
}
var _6e;
var _6f=objj_msgSend(_67,"rowAtIndex:",_6a);
if(_6f){
if(objj_msgSend(_6f,"parent")!=_6d){
var _70=_6d?objj_msgSend(_6d,"flatSubrowsCount"):objj_msgSend(_67,"flatRowsCount");
if(objj_msgSend(_6f,"parent")==objj_msgSend(_6d,"parent")&&(_6a==_6b+_70+1)){
_6e=_6d?objj_msgSend(_6d,"subrowsCount"):objj_msgSend(_67,"rowsCount");
}else{
if((!_6d||objj_msgSend(_6d,"rowType")==SPRuleEditorRowTypeCompound)&&(_6a==_6b+_70+1)){
_6e=_6d?objj_msgSend(_6d,"subrowsCount"):objj_msgSend(_67,"rowsCount");
}else{
return nil;
}
}
}else{
_6e=_6d?objj_msgSend(_6d,"indexOfChild:",_6f):objj_msgSend(_rows,"indexOfObject:",_6f);
}
}else{
var _71=_6d?objj_msgSend(_6d,"subrowsCount"):objj_msgSend(_67,"rowsCount");
var _70=_6d?objj_msgSend(_6d,"flatSubrowsCount"):objj_msgSend(_67,"flatRowsCount");
if(_6a>_6b+_70+1){
return objj_msgSend(_67,"addRow:",_69);
}
_6e=_71;
}
if(_6d){
objj_msgSend(_6d,"insertChild:atIndex:context:",_69,_6e,_67);
}else{
objj_msgSend(_69,"setCanRemoveAllRows:",YES);
objj_msgSend(_69,"_setDepth:",0);
objj_msgSend(_rows,"insertObject:atIndex:",_69,_6e);
var _72=objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[nil,_6e,_69],["parentRow","index","row"]);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",SPRuleEditorModelRowAdded,_67,_72);
}
return _69;
}
}),new objj_method(sel_getUid("removeAllRows"),function(_73,_74){
with(_73){
_rows=objj_msgSend(objj_msgSend(CPMutableArray,"alloc"),"init");
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",SPRuleEditorModelRemovedAllRows,_73,nil);
}
}),new objj_method(sel_getUid("isRowRemoveable:includeSubrows:"),function(_75,_76,row,_77){
with(_75){
if(_canRemoveAllRows||objj_msgSend(row,"parent")){
return YES;
}
var _78=objj_msgSend(_rows,"count");
if(!_rootLess&&_78<=1){
return NO;
}
if(_77&&_78<=1){
return NO;
}
var _79=objj_msgSend(row,"subrows");
var _7a=_79?objj_msgSend(_79,"count"):0;
if(!_77&&_78<=1&&_7a==0){
return NO;
}
return YES;
}
}),new objj_method(sel_getUid("removeRowAtIndex:includeSubrows:"),function(_7b,_7c,_7d,_7e){
with(_7b){
var _7f=objj_msgSend(_rows,"count");
if(!_7f){
return nil;
}
var row=objj_msgSend(_7b,"rowAtIndex:",_7d);
if(!row){
return nil;
}
if(!row||!objj_msgSend(_7b,"isRowRemoveable:includeSubrows:",row,_7e)){
return nil;
}
var _80=objj_msgSend(row,"parent");
if(!_80){
return objj_msgSend(_7b,"_removeRowAtIndex:keepSubrows:",_7d,!_7e);
}
var idx=objj_msgSend(_80,"indexOfChild:",row);
if(idx==CPNotFound){
return nil;
}
objj_msgSend(_80,"removeChildAtIndex:keepSubrows:context:",idx,!_7e,_7b);
return row;
}
}),new objj_method(sel_getUid("removeRowsAtIndexes:includeSubrows:"),function(_81,_82,_83,_84){
with(_81){
var _85=objj_msgSend(_rows,"count");
if(!_85){
return;
}
if(!_83||!objj_msgSend(_83,"count")){
return;
}
var row;
var _86=objj_msgSend(_83,"firstIndex");
var _87=objj_msgSend(CPMutableArray,"arrayWithCapacity:",objj_msgSend(_83,"count"));
while(_86!=CPNotFound){
row=objj_msgSend(_81,"rowAtIndex:",_86);
if(!row){
continue;
}
objj_msgSend(_87,"addObject:",row);
_86=objj_msgSend(_83,"indexGreaterThanIndex:",_86);
}
var _88;
var idx;
var _85=objj_msgSend(_87,"count");
for(var i=0;i<_85;i++){
row=objj_msgSend(_87,"objectAtIndex:",i);
_88=objj_msgSend(row,"parent");
if(!_88){
objj_msgSend(_81,"_removeRowAtIndex:keepSubrows:",rowIndex,!_84);
continue;
}
idx=objj_msgSend(_88,"indexOfChild:",row);
if(idx==CPNotFound){
continue;
}
objj_msgSend(_88,"removeChildAtIndex:keepSubrows:context:",idx,!_84,_81);
}
}
}),new objj_method(sel_getUid("setCriteria:forRow:"),function(_89,_8a,_8b,_8c){
with(_89){
objj_msgSend(_8c,"setCriteria:context:",_8b,_89);
}
}),new objj_method(sel_getUid("_removeRowAtIndex:keepSubrows:"),function(_8d,_8e,_8f,_90){
with(_8d){
var _91=objj_msgSend(_rows,"count");
if(!_91){
return nil;
}
var row=objj_msgSend(_8d,"rowAtIndex:",_8f);
if(!row){
return nil;
}
var _92=objj_msgSend(row,"subrows");
var _93=_92?objj_msgSend(_92,"count"):0;
if(!objj_msgSend(_8d,"isRowRemoveable:includeSubrows:",row,!_90)){
return nil;
}
objj_msgSend(_rows,"removeObjectAtIndex:",_8f);
objj_msgSend(row,"setParent:",nil);
objj_msgSend(row,"_setDepth:",-1);
var _94=objj_msgSend(CPNotificationCenter,"defaultCenter");
var _95=objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[nil,_8f,row],["parentRow","index","row"]);
objj_msgSend(_94,"postNotificationName:object:userInfo:",SPRuleEditorModelRowRemoved,_8d,_95);
if(!_90||!_92||!_rootLess){
return row;
}
var _96;
for(var i=_93-1;i>=0;i--){
_96=_92[i];
objj_msgSend(_rows,"insertObject:atIndex:",_96,_8f);
objj_msgSend(_96,"setParent:",nil);
var _95=objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[nil,_8f,_96],["parentRow","index","row"]);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",SPRuleEditorModelRowAdded,_8d,_95);
}
return row;
}
})]);
var _97="rows";
var _98="rootLess";
var _99="nestingMode";
var _9a="canRemoveAllRows";
var _1=objj_getClass("SPRuleEditorModel");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"SPRuleEditorModel\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_9b,_9c,_9d){
with(_9b){
_9b=objj_msgSendSuper({receiver:_9b,super_class:objj_getClass("SPRuleEditorModel").super_class},"init");
if(!_9b){
return nil;
}
_rows=objj_msgSend(_9d,"decodeObjectForKey:",_97);
_rootLess=objj_msgSend(_9d,"decodeBoolForKey:",_98);
_canRemoveAllRows=objj_msgSend(_9d,"decodeBoolForKey:",_9a);
_nestingMode=objj_msgSend(_9d,"decodeIntForKey:",NestingModeKey);
return _9b;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_9e,_9f,_a0){
with(_9e){
objj_msgSend(_a0,"encodeObject:forKey:",_rows,_97);
objj_msgSend(_a0,"encodeBool:forKey:",_rootLess,_98);
objj_msgSend(_a0,"encodeBool:forKey:",_canRemoveAllRows,_9a);
objj_msgSend(_a0,"encodeInt:forKey:",_nestingMode,NestingModeKey);
}
})]);
