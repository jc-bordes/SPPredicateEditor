@STATIC;1.0;I;21;Foundation/CPObject.jt;11587;
objj_executeFile("Foundation/CPObject.j",NO);
var _1=objj_allocateClassPair(CPObject,"SPRuleEditorModelItem"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_subrows"),new objj_ivar("_criteria"),new objj_ivar("_rowType"),new objj_ivar("_depth"),new objj_ivar("_canRemoveAllRows"),new objj_ivar("_data"),new objj_ivar("_parent")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("subrows"),function(_3,_4){
with(_3){
return _subrows;
}
}),new objj_method(sel_getUid("criteria"),function(_5,_6){
with(_5){
return _criteria;
}
}),new objj_method(sel_getUid("rowType"),function(_7,_8){
with(_7){
return _rowType;
}
}),new objj_method(sel_getUid("depth"),function(_9,_a){
with(_9){
return _depth;
}
}),new objj_method(sel_getUid("canRemoveAllRows"),function(_b,_c){
with(_b){
return _canRemoveAllRows;
}
}),new objj_method(sel_getUid("setCanRemoveAllRows:"),function(_d,_e,_f){
with(_d){
_canRemoveAllRows=_f;
}
}),new objj_method(sel_getUid("data"),function(_10,_11){
with(_10){
return _data;
}
}),new objj_method(sel_getUid("setData:"),function(_12,_13,_14){
with(_12){
_data=_14;
}
}),new objj_method(sel_getUid("parent"),function(_15,_16){
with(_15){
return _parent;
}
}),new objj_method(sel_getUid("setParent:"),function(_17,_18,_19){
with(_17){
_parent=_19;
}
}),new objj_method(sel_getUid("init"),function(_1a,_1b){
with(_1a){
_1a=objj_msgSendSuper({receiver:_1a,super_class:objj_getClass("SPRuleEditorModelItem").super_class},"init");
if(!_1a){
return _1a;
}
_subrows=nil;
_criteria=nil;
_canRemoveAllRows=YES;
_rowType=SPRuleEditorRowTypeSimple;
_depth=0;
_parent=nil;
_data=nil;
return _1a;
}
}),new objj_method(sel_getUid("initWithType:criteria:data:"),function(_1c,_1d,_1e,_1f,_20){
with(_1c){
_1c=objj_msgSendSuper({receiver:_1c,super_class:objj_getClass("SPRuleEditorModelItem").super_class},"init");
if(!_1c){
return _1c;
}
_rowType=_1e;
_subrows=nil;
_criteria=objj_msgSend(objj_msgSend(CPArray,"alloc"),"initWithArray:copyItems:",_1f,YES);
_depth=0;
_parent=nil;
_canRemoveAllRows=YES;
_data=_20;
return _1c;
}
}),new objj_method(sel_getUid("subrowsCount"),function(_21,_22){
with(_21){
return _subrows?objj_msgSend(_subrows,"count"):0;
}
}),new objj_method(sel_getUid("flatSubrowsCount"),function(_23,_24){
with(_23){
var row;
var _25=0;
var _26=objj_msgSend(_23,"subrowsCount");
for(var i=0;i<_26;i++){
row=objj_msgSend(_subrows,"objectAtIndex:",i);
if(objj_msgSend(row,"rowType")==SPRuleEditorRowTypeCompound){
_25+=objj_msgSend(row,"flatSubrowsCount");
}
_25++;
}
return _25;
}
}),new objj_method(sel_getUid("setParent:"),function(_27,_28,_29){
with(_27){
if(_parent==_29){
return;
}
_parent=_29;
var _2a=_29?objj_msgSend(_29,"depth")+1:0;
objj_msgSend(_27,"_setDepth:",_2a);
}
}),new objj_method(sel_getUid("_setDepth:"),function(_2b,_2c,_2d){
with(_2b){
if(_depth==_2d){
return;
}
_depth=_2d;
if(_subrows&&objj_msgSend(_subrows,"count")){
objj_msgSend(_subrows,"makeObjectsPerformSelector:withObject:",sel_getUid("_setDepth:"),_depth+1);
}
}
}),new objj_method(sel_getUid("hasAncestor:"),function(_2e,_2f,_30){
with(_2e){
if(!_30||!_parent){
return nil;
}
var _31=_2e;
var p;
while((p=objj_msgSend(_31,"parent"))!=nil){
if(p==_30){
return YES;
}
_31=p;
}
return NO;
}
}),new objj_method(sel_getUid("lastChild"),function(_32,_33){
with(_32){
if(!_subrows){
return nil;
}
var _34=objj_msgSend(_subrows,"count");
if(!_34){
return nil;
}
return objj_msgSend(_subrows,"objectAtIndex:",_34-1);
}
}),new objj_method(sel_getUid("indexOfChild:"),function(_35,_36,row){
with(_35){
if(!row||!_subrows||!objj_msgSend(_subrows,"count")||objj_msgSend(row,"parent")!=_35){
return CPNotFound;
}
return objj_msgSend(_subrows,"indexOfObject:",row);
}
}),new objj_method(sel_getUid("flatIndexOfChild:"),function(_37,_38,_39){
with(_37){
if(_39==_37){
return 0;
}
if(!_subrows||!_39){
return CPNotFound;
}
var row;
var _3a;
var _3b=objj_msgSend(_subrows,"count");
var _3c;
for(var i=0,idx=1;i<_3b;i++){
row=objj_msgSend(_subrows,"objectAtIndex:",i);
if(_39==row){
return idx;
}
if(objj_msgSend(row,"rowType")==SPRuleEditorRowTypeSimple){
idx++;
continue;
}
_3c=objj_msgSend(row,"flatIndexOfChild:",_39);
if(_3c!=CPNotFound){
return idx+_3c;
}
_3a=objj_msgSend(row,"flatSubrowsCount");
idx+=_3a+1;
}
return CPNotFound;
}
}),new objj_method(sel_getUid("childAtIndex:"),function(_3d,_3e,_3f){
with(_3d){
if(!_subrows||_3f<0||_3f>=objj_msgSend(_subrows,"count")){
return nil;
}
return objj_msgSend(_subrows,"objectAtIndex:",_3f);
}
}),new objj_method(sel_getUid("childAtFlatIndex:"),function(_40,_41,_42){
with(_40){
if(_42==0){
return _40;
}
if(!_subrows||_42<0){
return nil;
}
var row;
var _43;
var _44=objj_msgSend(_subrows,"count");
for(var i=0,idx=1;i<_44;i++){
row=objj_msgSend(_subrows,"objectAtIndex:",i);
if(idx==_42){
return row;
}
if(objj_msgSend(row,"rowType")==SPRuleEditorRowTypeSimple){
idx++;
continue;
}
_43=objj_msgSend(row,"flatSubrowsCount");
if(idx+_43<_42){
idx+=_43+1;
continue;
}
return objj_msgSend(row,"childAtFlatIndex:",_42-idx);
}
return nil;
}
}),new objj_method(sel_getUid("subrowWithDisplayValue:"),function(_45,_46,_47){
with(_45){
if(!_criteria||!objj_msgSend(_criteria,"count")){
return nil;
}
var _48=objj_msgSend(_criteria,"objectAtIndex:",0);
if(objj_msgSend(objj_msgSend(_48,"displayValue"),"isEqual:",_47)){
return _45;
}
var row,_49;
var _4a=objj_msgSend(_45,"subrowsCount");
for(var i=0,idx=0;i<_4a;i++){
row=objj_msgSend(_subrows,"objectAtIndex:",i);
_49=objj_msgSend(row,"subrowWithDisplayValue:",_47);
if(_49){
return _49;
}
}
return nil;
}
}),new objj_method(sel_getUid("addChild:context:"),function(_4b,_4c,row,_4d){
with(_4b){
if(!row||_rowType!=SPRuleEditorRowTypeCompound){
return CPNotFound;
}
if(!_subrows){
_subrows=objj_msgSend(objj_msgSend(CPMutableArray,"alloc"),"init");
}
objj_msgSend(_subrows,"addObject:",row);
objj_msgSend(row,"setParent:",_4b);
var _4e=objj_msgSend(_subrows,"count")-1;
if(_4d){
var _4f=objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[_4b,_4e,row],["parentRow","index","row"]);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",SPRuleEditorModelRowAdded,_4d,_4f);
}
return _4e;
}
}),new objj_method(sel_getUid("insertChild:atIndex:context:"),function(_50,_51,row,_52,_53){
with(_50){
if(!row||_rowType!=SPRuleEditorRowTypeCompound){
return CPNotFound;
}
if(!_subrows){
_subrows=objj_msgSend(objj_msgSend(CPMutableArray,"alloc"),"init");
}
if(_52<0){
_52=0;
}
if(_52>objj_msgSend(_subrows,"count")){
return objj_msgSend(_50,"addChild:context:",row,_53);
}
objj_msgSend(_subrows,"insertObject:atIndex:",row,_52);
objj_msgSend(row,"setParent:",_50);
if(_53){
var _54=objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[_50,_52,row],["parentRow","index","row"]);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",SPRuleEditorModelRowAdded,_53,_54);
}
return _52;
}
}),new objj_method(sel_getUid("removeChildAtIndex:keepSubrows:context:"),function(_55,_56,_57,_58,_59){
with(_55){
if(!_subrows||_rowType!=SPRuleEditorRowTypeCompound){
return nil;
}
if(!_canRemoveAllRows&&objj_msgSend(_subrows,"count")<=1){
return nil;
}
var row=objj_msgSend(_55,"childAtIndex:",_57);
if(!row){
return nil;
}
if(!_canRemoveAllRows&&((!_58&&objj_msgSend(_subrows,"count")<=1)||(_58&&objj_msgSend(_subrows,"count")==0))){
return nil;
}
objj_msgSend(_subrows,"removeObjectAtIndex:",_57);
objj_msgSend(row,"setParent:",nil);
objj_msgSend(row,"_setDepth:",-1);
if(_59){
var _5a=objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[_55,_57,row],["parentRow","index","row"]);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",SPRuleEditorModelRowRemoved,_59,_5a);
}
if(!_58){
return row;
}
var _5b=objj_msgSend(row,"subrows");
if(!_5b){
return;
}
var _5c;
var _5d=objj_msgSend(_5b,"count");
for(var i=_5d-1;i>=0;i--){
_5c=_5b[i];
objj_msgSend(_55,"insertChild:atIndex:context:",_5c,_57,_59);
}
return row;
}
}),new objj_method(sel_getUid("setCriteria:context:"),function(_5e,_5f,_60,_61){
with(_5e){
_criteria=_60;
var _62=_parent?objj_msgSend(_parent,"indexOfChild:",_5e):CPNotFound;
if(_61){
var _63=objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[_parent,_62,_5e],["parentRow","index","row"]);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",SPRuleEditorModelRowModified,_61,_63);
}
}
}),new objj_method(sel_getUid("criteriaItems"),function(_64,_65){
with(_64){
if(!_criteria){
return nil;
}
var _66;
var _67=objj_msgSend(_criteria,"count");
if(!_67){
return objj_msgSend(CPArray,"array");
}
var res=objj_msgSend(CPMutableArray,"arrayWithCapacity:",_67);
for(var i=0;i<_67;i++){
_66=_criteria[i];
objj_msgSend(res,"addObject:",objj_msgSend(_66,"items"));
}
return res;
}
}),new objj_method(sel_getUid("criteriaDisplayValues"),function(_68,_69){
with(_68){
if(!_criteria){
return nil;
}
var _6a;
var _6b=objj_msgSend(_criteria,"count");
if(!_6b){
return objj_msgSend(CPArray,"array");
}
var res=objj_msgSend(CPMutableArray,"arrayWithCapacity:",_6b);
for(var i=0;i<_6b;i++){
_6a=_criteria[i];
objj_msgSend(res,"addObject:",objj_msgSend(_6a,"displayValue"));
}
return res;
}
}),new objj_method(sel_getUid("flattenToArray:"),function(_6c,_6d,_6e){
with(_6c){
if(!_6e){
return;
}
objj_msgSend(_6e,"addObject:",_6c);
var row;
var _6f=objj_msgSend(_6c,"subrowsCount");
for(var i=0,idx=0;i<_6f;i++){
row=objj_msgSend(_subrows,"objectAtIndex:",i);
if(objj_msgSend(row,"rowType")==SPRuleEditorRowTypeSimple){
objj_msgSend(_6e,"addObject:",row);
continue;
}
objj_msgSend(row,"flattenToArray:",_6e);
}
}
}),new objj_method(sel_getUid("copy"),function(_70,_71){
with(_70){
var _72=objj_msgSend(objj_msgSend(SPRuleEditorModelItem,"alloc"),"init");
objj_msgSend(_72,"setRowType:",_rowType);
objj_msgSend(_72,"setDepth:",_depth);
objj_msgSend(_72,"setCanRemoveAllRows:",_canRemoveAllRows);
objj_msgSend(_72,"setCriteria:",objj_msgSend(objj_msgSend(CPArray,"alloc"),"initWithArray:copyItems:",_criteria,YES));
objj_msgSend(_72,"setSubrows:",objj_msgSend(objj_msgSend(CPArray,"alloc"),"initWithArray:copyItems:",_subrows,YES));
objj_msgSend(objj_msgSend(_72,"subrows"),"makeObjectsPerformSelector:withObject:",sel_getUid("setParent:"),_72);
objj_msgSend(_72,"setData:copy",_data);
return _72;
}
})]);
var _73="criteria";
var _74="subrows";
var _75="rowType";
var _76="depth";
var _77="parent";
var _78="canRemoveAllRows";
var _1=objj_getClass("SPRuleEditorModelItem");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"SPRuleEditorModelItem\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_79,_7a,_7b){
with(_79){
_79=objj_msgSendSuper({receiver:_79,super_class:objj_getClass("SPRuleEditorModelItem").super_class},"init");
if(!_79){
return nil;
}
_subrows=objj_msgSend(_7b,"decodeObjectForKey:",_74);
_criteria=objj_msgSend(_7b,"decodeObjectForKey:",_73);
_canRemoveAllRows=objj_msgSend(_7b,"decodeBool:",_78);
_rowType=objj_msgSend(_7b,"decodeIntForKey:",_75);
_depth=objj_msgSend(_7b,"decodeIntForKey:",_76);
_parent=objj_msgSend(_7b,"decodeObjectForKey:",_77);
return _79;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_7c,_7d,_7e){
with(_7c){
objj_msgSend(_7e,"encodeObject:forKey:",_subrows,_74);
objj_msgSend(_7e,"encodeObject:forKey:",_criteria,_73);
objj_msgSend(_7e,"encodeBool:forKey:",_canRemoveAllRows,_78);
objj_msgSend(_7e,"encodeInt:forKey:",_rowType,_75);
objj_msgSend(_7e,"encodeInt:forKey:",_depth,_76);
objj_msgSend(_7e,"encodeObject:forKey:",_parent,_77);
}
})]);
