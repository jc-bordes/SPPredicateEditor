@STATIC;1.0;i;14;SPRuleEditor.ji;30;SPPredicateEditorRowTemplate.jt;24097;
objj_executeFile("SPRuleEditor.j",YES);
objj_executeFile("SPPredicateEditorRowTemplate.j",YES);
var _1=objj_allocateClassPair(SPRuleEditor,"SPPredicateEditor"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_rowTemplates"),new objj_ivar("_simpleCriteriaRoot"),new objj_ivar("_compoundCriteriaRoot")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("rowTemplates"),function(_3,_4){
with(_3){
return _rowTemplates;
}
}),new objj_method(sel_getUid("setRowTemplates:"),function(_5,_6,_7){
with(_5){
_rowTemplates=_7;
objj_msgSend(_5,"setupRowTemplates");
}
}),new objj_method(sel_getUid("_build"),function(_8,_9){
with(_8){
objj_msgSendSuper({receiver:_8,super_class:objj_getClass("SPPredicateEditor").super_class},"_build");
objj_msgSendSuper({receiver:_8,super_class:objj_getClass("SPPredicateEditor").super_class},"setDelegate:",_8);
}
}),new objj_method(sel_getUid("objectValue"),function(_a,_b){
with(_a){
return objj_msgSendSuper({receiver:_a,super_class:objj_getClass("SPPredicateEditor").super_class},"predicate");
}
}),new objj_method(sel_getUid("setObjectValue:"),function(_c,_d,_e){
with(_c){
if(!_e){
objj_msgSend(_model,"removeAllRows");
return;
}
if(!objj_msgSend(_e,"isKindOfClass:",CPPredicate)){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,_d+" : argument must be a CPPredicate");
}
var _f=objj_msgSend(_model,"nestingMode");
var _10=_e;
objj_msgSend(_c,"willChangeValueForKey:","objectValue");
var _11;
switch(_f){
case SPRuleEditorNestingModeCompound:
case SPRuleEditorNestingModeSimple:
if(!objj_msgSend(_10,"isKindOfClass:",CPCompoundPredicate)){
_10=objj_msgSend(objj_msgSend(CPCompoundPredicate,"alloc"),"initWithType:subpredicates:",objj_msgSend(_c,"defaultCompoundType"),objj_msgSend(CPArray,"arrayWithObject:",_10));
_11=objj_msgSend(CPMutableArray,"arrayWithObject:",_10);
break;
}
if(objj_msgSend(_10,"compoundPredicateType")==CPNotPredicateType){
var _12=objj_msgSend(_10,"subpredicates");
var _13=_12&&objj_msgSend(_12,"count")==1?objj_msgSend(_12,"objectAtIndex:",0):nil;
if(_13&&objj_msgSend(_13,"compoundPredicateType")==CPOrPredicateType){
_11=objj_msgSend(_13,"subpredicates");
_10=objj_msgSend(objj_msgSend(CPCompoundPredicate,"alloc"),"initWithType:subpredicates:",CPNotPredicateType,_11);
}
}
_11=objj_msgSend(CPMutableArray,"arrayWithObject:",_10);
break;
case SPRuleEditorNestingModeList:
if(objj_msgSend(_10,"isKindOfClass:",CPCompoundPredicate)){
_11=objj_msgSend(_10,"subpredicates");
}else{
_11=objj_msgSend(CPMutableArray,"arrayWithObject:",_10);
}
break;
case SPRuleEditorNestingModeSingle:
if(objj_msgSend(_10,"isKindOfClass:",CPCompoundPredicate)){
_11=objj_msgSend(_10,"subpredicates");
if(_11&&objj_msgSend(_11,"count")){
_11=objj_msgSend(CPMutableArray,"arrayWithObject:",objj_msgSend(_11,"objectAtIndex:",0));
}
}else{
_11=objj_msgSend(CPMutableArray,"arrayWithObject:",_10);
}
break;
}
objj_msgSend(_model,"removeAllRows");
if(_11){
var _10;
var _14;
var row;
var _15=objj_msgSend(_11,"count");
for(var i=0;i<_15;i++){
_10=objj_msgSend(_11,"objectAtIndex:",i);
row=objj_msgSend(_c,"createRowForPredicate:",_10);
objj_msgSend(_model,"addRow:",row);
}
}
objj_msgSend(_c,"didChangeValueForKey:","objectValue");
}
}),new objj_method(sel_getUid("defaultCompoundType"),function(_16,_17){
with(_16){
if(!_compoundCriteriaRoot||!objj_msgSend(_compoundCriteriaRoot,"count")){
return CPAndPredicateType;
}
var _18=objj_msgSend(_compoundCriteriaRoot,"objectAtIndex:",0);
if(!_18||!objj_msgSend(_18,"isKindOfClass:",CPPopUpButton)){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_17+" : invalid compound template view");
}
var _19=objj_msgSend(_18,"itemArray");
if(!_19||!objj_msgSend(_19,"count")){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_17+" : invalid compound template view");
}
var _1a=objj_msgSend(_19,"objectAtIndex:",0);
var _1b=objj_msgSend(_16,"mappedTemplateForObject:",_1a);
if(!_1b){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_17+" : invalid compound template view");
}
var _1c=objj_msgSend(_1b,"compoundTypes");
if(!_1c||!objj_msgSend(_1c,"count")){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_17+" : invalid compound template");
}
return _1c[0];
}
}),new objj_method(sel_getUid("templateForPredicate:"),function(_1d,_1e,_1f){
with(_1d){
if(!_1f){
return nil;
}
var _20;
var _21=0;
var _22=CPNotFound;
var _23;
var _24=_rowTemplates?objj_msgSend(_rowTemplates,"count"):0;
for(var i=0;i<_24;i++){
_23=_rowTemplates[i];
_20=objj_msgSend(_23,"matchForPredicate:",_1f);
if(_20>_21){
_21=_20;
_22=i;
}
}
if(_22==CPNotFound){
return nil;
}
return objj_msgSend(_rowTemplates,"objectAtIndex:",_22);
}
}),new objj_method(sel_getUid("createRowForPredicate:"),function(_25,_26,_27){
with(_25){
if(!_27){
return nil;
}
var _28=objj_msgSend(_25,"templateForPredicate:",_27);
if(!_28){
return nil;
}
var _29=objj_msgSend(_25,"criteriaForPredicate:usingTemplate:",_27,_28);
_29=objj_msgSend(_28,"preProcessCriteria:",_29);
var _2a=objj_msgSend(_27,"isKindOfClass:",CPCompoundPredicate)?SPRuleEditorRowTypeCompound:SPRuleEditorRowTypeSimple;
var row=objj_msgSend(objj_msgSend(SPRuleEditorModelItem,"alloc"),"initWithType:criteria:data:",_2a,_29,_28);
var _2b=objj_msgSend(_28,"displayableSubpredicatesOfPredicate:",_27);
if(!_2b){
return row;
}
var _2c;
var _2d;
var _2e=objj_msgSend(_2b,"count");
for(var i=0;i<_2e;i++){
_2d=_2b[i];
_28=objj_msgSend(_25,"templateForPredicate:",_2d);
_2c=objj_msgSend(_25,"createRowForPredicate:",_2d);
if(_2c){
objj_msgSend(row,"addChild:context:",_2c,nil);
}
}
return row;
}
}),new objj_method(sel_getUid("criteriaForPredicate:usingTemplate:"),function(_2f,_30,_31,_32){
with(_2f){
if(objj_msgSend(_31,"isKindOfClass:",CPCompoundPredicate)){
return objj_msgSend(_2f,"criteriaForCompoundPredicate:usingTemplate:",_31,_32);
}
if(objj_msgSend(_31,"isKindOfClass:",CPComparisonPredicate)){
return objj_msgSend(_2f,"criteriaForComparisonPredicate:usingTemplate:",_31,_32);
}
return nil;
}
}),new objj_method(sel_getUid("criteriaForCompoundPredicate:usingTemplate:"),function(_33,_34,_35,_36){
with(_33){
if(!_compoundCriteriaRoot||!_36||!_35||!objj_msgSend(_35,"isKindOfClass:",CPCompoundPredicate)){
return nil;
}
var _37=objj_msgSend(_35,"compoundPredicateType");
var _38=objj_msgSend(_compoundCriteriaRoot,"count");
var _39=nil;
var _3a;
var _3b;
for(var i=0;i<_38;i++){
_3a=objj_msgSend(_compoundCriteriaRoot,"objectAtIndex:",i);
if(!objj_msgSend(_3a,"isKindOfClass:",CPMenuItem)||objj_msgSend(_3a,"representedObject")!==_37){
continue;
}
_3b=objj_msgSend(_33,"mappedTemplateForObject:",_3a);
if(_3b!=_36){
continue;
}
_39=_3a;
break;
}
if(!_39){
return nil;
}
var _3c=objj_msgSend(objj_msgSend(SPRuleEditorCriterion,"alloc"),"initWithItems:displayValue:",_compoundCriteriaRoot,_39);
var _3d=objj_msgSend(CPMutableArray,"arrayWithObject:",_3c);
var _3e=_39;
var _3f;
while((_3f=objj_msgSend(_3e,"target"))!=nil){
_3c=objj_msgSend(_33,"createCriterionFromView:",_3f);
if(objj_msgSend(_3f,"isKindOfClass:",CPPopUpButton)){
_3e=objj_msgSend(_3c,"displayValue");
objj_msgSend(_3d,"addObject:",_3c);
continue;
}
if(objj_msgSend(_3f,"isKindOfClass:",CPView)){
_3e=_3f;
objj_msgSend(_3d,"addObject:",_3c);
continue;
}
break;
}
return _3d;
}
}),new objj_method(sel_getUid("criteriaForComparisonPredicate:usingTemplate:"),function(_40,_41,_42,_43){
with(_40){
if(!_simpleCriteriaRoot||!_43||!_42||!objj_msgSend(_42,"isKindOfClass:",CPComparisonPredicate)){
return nil;
}
var _44=objj_msgSend(_42,"leftExpression");
if(!_44){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_41+" : invalid predicate");
}
var _45;
var _46;
var _47=objj_msgSend(_44,"keyPath");
var _48=objj_msgSend(_simpleCriteriaRoot,"count");
for(var i=0;i<_48;i++){
_46=objj_msgSend(_simpleCriteriaRoot,"objectAtIndex:",i);
if(!objj_msgSend(_46,"isKindOfClass:",CPMenuItem)||objj_msgSend(_46,"title")!==_47){
continue;
}
_45=objj_msgSend(_40,"mappedTemplateForObject:",_46);
if(_45!=_43){
continue;
}
rootItem=_46;
break;
}
var _49=objj_msgSend(objj_msgSend(SPRuleEditorCriterion,"alloc"),"initWithItems:displayValue:",_simpleCriteriaRoot,rootItem);
var _4a=objj_msgSend(CPMutableArray,"arrayWithObject:",_49);
var _4b=objj_msgSend(rootItem,"target");
var _4c=objj_msgSend(_42,"predicateOperatorType");
_49=objj_msgSend(_40,"createCriterionFromView:representedObject:",_4b,_4c);
if(!_49){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_41+" : invalid predicate");
}
objj_msgSend(_4a,"addObject:",_49);
_4b=objj_msgSend(objj_msgSend(_49,"displayValue"),"target");
_44=objj_msgSend(_42,"rightExpression");
if(!_44){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_41+" : invalid predicate");
}
_47=objj_msgSend(_44,"keyPath");
_49=objj_msgSend(_40,"createCriterionFromView:representedObject:",_4b,_47);
if(!_49){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_41+" : invalid predicate");
}
objj_msgSend(_4a,"addObject:",_49);
if(objj_msgSend(_43,"options")){
_4b=objj_msgSend(objj_msgSend(_49,"displayValue"),"target");
_49=objj_msgSend(_40,"createCriterionFromView:representedObject:",_4b,objj_msgSend(_42,"options"));
if(!_49){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_41+" : invalid predicate");
}
objj_msgSend(_4a,"addObject:",_49);
}
var _4d=objj_msgSend(objj_msgSend(_49,"displayValue"),"target");
while((_4b=objj_msgSend(_4d,"target"))!=nil){
_49=objj_msgSend(_40,"createCriterionFromView:",_4b);
if(objj_msgSend(_4b,"isKindOfClass:",CPPopUpButton)){
_4d=objj_msgSend(_49,"displayValue");
objj_msgSend(_4a,"addObject:",_49);
continue;
}
if(objj_msgSend(_4b,"isKindOfClass:",CPView)){
_4d=_4b;
objj_msgSend(_4a,"addObject:",_49);
continue;
}
break;
}
return _4a;
}
}),new objj_method(sel_getUid("createCriterionFromView:"),function(_4e,_4f,_50){
with(_4e){
var _51;
var _52;
if(objj_msgSend(_50,"isKindOfClass:",CPPopUpButton)){
_51=objj_msgSend(_50,"itemArray");
_52=_51&&objj_msgSend(_51,"count")?_51[0]:nil;
return objj_msgSend(objj_msgSend(SPRuleEditorCriterion,"alloc"),"initWithItems:displayValue:",_51,_52);
}
if(objj_msgSend(_50,"isKindOfClass:",CPView)){
_51=objj_msgSend(CPMutableArray,"arrayWithObject:",_50);
_52=objj_msgSend(CPKeyedUnarchiver,"unarchiveObjectWithData:",objj_msgSend(CPKeyedArchiver,"archivedDataWithRootObject:",_50));
objj_msgSend(_52,"setTarget:",objj_msgSend(_50,"target"));
return objj_msgSend(objj_msgSend(SPRuleEditorCriterion,"alloc"),"initWithItems:displayValue:",_51,_52);
}
return nil;
}
}),new objj_method(sel_getUid("createCriterionFromView:representedObject:"),function(_53,_54,_55,_56){
with(_53){
var _57;
var _58;
if(objj_msgSend(_55,"isKindOfClass:",CPPopUpButton)){
_57=objj_msgSend(_55,"itemArray");
if(objj_msgSend(_56,"isKindOfClass:",CPString)){
_58=objj_msgSend(_55,"itemWithTitle:",_56);
}else{
var _59=objj_msgSend(_55,"indexOfItemWithRepresentedObject:",_56);
if(_59==CPNotFound){
return nil;
}
_58=objj_msgSend(_55,"itemAtIndex:",_59);
}
return objj_msgSend(objj_msgSend(SPRuleEditorCriterion,"alloc"),"initWithItems:displayValue:",_57,_58);
}
if(objj_msgSend(_55,"isKindOfClass:",CPView)){
_57=objj_msgSend(CPMutableArray,"arrayWithObject:",_55);
_58=objj_msgSend(CPKeyedUnarchiver,"unarchiveObjectWithData:",objj_msgSend(CPKeyedArchiver,"archivedDataWithRootObject:",_55));
objj_msgSend(_58,"setTarget:",objj_msgSend(_55,"target"));
if(objj_msgSend(_56,"isKindOfClass:",CPString)&&objj_msgSend(_55,"respondsToSelector:",sel_getUid("setStringValue:"))){
objj_msgSend(_55,"setStringValue:",_56);
}else{
if(objj_msgSend(_55,"respondsToSelector:",sel_getUid("setObjectValue:"))){
objj_msgSend(_55,"setObjectValue:",_56);
}
}
return objj_msgSend(objj_msgSend(SPRuleEditorCriterion,"alloc"),"initWithItems:displayValue:",_57,_58);
}
return nil;
}
}),new objj_method(sel_getUid("setupRowTemplates"),function(_5a,_5b){
with(_5a){
if(!_rowTemplates||!objj_msgSend(_rowTemplates,"count")){
_simpleCriteriaRoot=nil;
_compoundCriteriaRoot=nil;
return;
}
var _5c;
var _5d;
var _5e=objj_msgSend(_rowTemplates,"count");
for(var i=0;i<_5e;i++){
objj_msgSend(_5a,"setupCriteriaForTemplate:",objj_msgSend(_rowTemplates,"objectAtIndex:",i));
}
}
}),new objj_method(sel_getUid("setupCriteriaForTemplate:"),function(_5f,_60,_61){
with(_5f){
if(!_61){
return;
}
var _62=objj_msgSend(_61,"templateViews");
if(!_62||!objj_msgSend(_62,"count")){
return;
}
var _63;
var _64=objj_msgSend(_61,"_rowType");
if(_64==SPRuleEditorRowTypeSimple){
if(!_simpleCriteriaRoot){
_simpleCriteriaRoot=objj_msgSend(CPMutableArray,"array");
}
_63=_simpleCriteriaRoot;
}else{
if(_64==SPRuleEditorRowTypeCompound){
if(!_compoundCriteriaRoot){
_compoundCriteriaRoot=objj_msgSend(CPMutableArray,"array");
}
_63=_compoundCriteriaRoot;
}else{
return;
}
}
var _65;
var _66=nil;
var _67=objj_msgSend(_62,"count");
for(var i=0;i<_67;i++){
_65=objj_msgSend(_62,"objectAtIndex:",i);
_66=(i<_67-1)?objj_msgSend(_62,"objectAtIndex:",i+1):nil;
objj_msgSend(_5f,"setTarget:forView:",_66,_65);
if(i==0){
objj_msgSend(_5f,"retainItemsOfView:inRoot:forTemplate:",_65,_63,_61);
}
}
}
}),new objj_method(sel_getUid("setTarget:forView:"),function(_68,_69,_6a,_6b){
with(_68){
if(!_6b){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,_69+" : template views must not be nil.");
}
if(!objj_msgSend(_6b,"isKindOfClass:",CPControl)){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,_69+" : template views must extend CPControl");
}
if(objj_msgSend(_6b,"isKindOfClass:",CPPopUpButton)){
var _6c=objj_msgSend(_6b,"itemArray");
var _6d=objj_msgSend(_6c,"count");
var _6e;
for(var i=0;i<_6d;i++){
_6e=objj_msgSend(_6c,"objectAtIndex:",i);
if(objj_msgSend(_6e,"isSeparatorItem")){
continue;
}
objj_msgSend(_6e,"setTarget:",_6a);
}
return;
}
objj_msgSend(_6b,"setTarget:",_6a);
}
}),new objj_method(sel_getUid("retainItemsOfView:inRoot:forTemplate:"),function(_6f,_70,_71,_72,_73){
with(_6f){
if(!_71){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,_70+" : template views must not be nil.");
}
if(!objj_msgSend(_71,"isKindOfClass:",CPPopUpButton)){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,_70+" : template root (the first view) must extend CPPopUpButton");
}
var _74=objj_msgSend(_71,"itemArray");
var _75=objj_msgSend(_74,"count");
var _76;
for(var i=0;i<_75;i++){
_76=objj_msgSend(_74,"objectAtIndex:",i);
if(objj_msgSend(_76,"isSeparatorItem")){
continue;
}
objj_msgSend(_72,"addObject:",_76);
objj_msgSend(_6f,"mapObject:withTemplate:protect:",_76,_73,YES);
}
}
}),new objj_method(sel_getUid("ruleEditor:numberOfChildrenForCriterion:withRowType:"),function(_77,_78,_79,_7a,_7b){
with(_77){
if(!_7a){
if(_7b==SPRuleEditorRowTypeSimple){
return objj_msgSend(_simpleCriteriaRoot,"count");
}
return objj_msgSend(_compoundCriteriaRoot,"count");
}
if(!objj_msgSend(_7a,"respondsToSelector:",sel_getUid("target"))){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_78+" : invalid criterion");
}
var _7c=objj_msgSend(_7a,"target");
if(!_7c||_7c==_7a){
return 0;
}
if(objj_msgSend(_7c,"isKindOfClass:",CPPopUpButton)){
return objj_msgSend(_7c,"numberOfItems");
}else{
if(objj_msgSend(_7c,"isKindOfClass:",CPControl)){
return 1;
}
}
return 0;
}
}),new objj_method(sel_getUid("ruleEditor:child:forCriterion:withRowType:"),function(_7d,_7e,_7f,_80,_81,_82){
with(_7d){
if(!_81){
if(_82==SPRuleEditorRowTypeSimple){
return objj_msgSend(_simpleCriteriaRoot,"objectAtIndex:",_80);
}
return objj_msgSend(_compoundCriteriaRoot,"objectAtIndex:",_80);
}
var _83=objj_msgSend(_81,"target");
if(objj_msgSend(_83,"isKindOfClass:",objj_msgSend(CPPopUpButton,"class"))){
return objj_msgSend(_83,"itemAtIndex:",_80);
}
if(objj_msgSend(_83,"isKindOfClass:",objj_msgSend(CPView,"class"))){
var _84=objj_msgSend(CPKeyedUnarchiver,"unarchiveObjectWithData:",objj_msgSend(CPKeyedArchiver,"archivedDataWithRootObject:",_83));
objj_msgSend(_84,"setTarget:",objj_msgSend(_83,"target"));
return _84;
}
return nil;
}
}),new objj_method(sel_getUid("ruleEditor:displayValueForCriterion:inRow:"),function(_85,_86,_87,_88,row){
with(_85){
if(objj_msgSend(_88,"isKindOfClass:",objj_msgSend(CPMenuItem,"class"))){
if(objj_msgSend(_88,"isSeparatorItem")){
return objj_msgSend(CPMenuItem,"separatorItem");
}
return _88;
}
return objj_msgSend(CPKeyedUnarchiver,"unarchiveObjectWithData:",objj_msgSend(CPKeyedArchiver,"archivedDataWithRootObject:",_88));
}
}),new objj_method(sel_getUid("predicateForRow:"),function(_89,_8a,_8b){
with(_89){
var row=objj_msgSend(_model,"rowAtIndex:",_8b);
if(!row){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_8a+" : invalid row index");
}
var _8c=objj_msgSend(row,"data");
if(!_8c||!objj_msgSend(_8c,"isKindOfClass:",SPPredicateEditorRowTemplate)){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_8a+" : invalid row data, no template ref");
}
var _8d=objj_msgSend(_8c,"templateViews");
if(!_8d){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_8a+" : invalid template, no views");
}
var _8e=objj_msgSend(row,"criteria");
if(!_8e){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_8a+" : invalid row, missing criteria");
}
var _8f=objj_msgSend(_8d,"count");
if(objj_msgSend(_8e,"count")<_8f){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_8a+" : invalid row or template, criteria and views number do not match");
}
var _90;
var _91;
var _92;
var _93=objj_msgSend(_89,"subpredicatesForRow:",row);
for(var i=0;i<_8f;i++){
_90=objj_msgSend(_8d,"objectAtIndex:",i);
_92=objj_msgSend(_8e,"objectAtIndex:",i);
_91=objj_msgSend(_92,"displayValue");
objj_msgSend(_89,"selectValue:inCriterionView:",_91,_90);
}
return objj_msgSend(_8c,"predicateWithSubpredicates:",_93);
}
}),new objj_method(sel_getUid("subpredicatesForRow:"),function(_94,_95,row){
with(_94){
if(!row||objj_msgSend(row,"rowType")!=SPRuleEditorRowTypeCompound){
return objj_msgSend(CPMutableArray,"array");
}
var _96;
var _97;
var _98=objj_msgSend(CPMutableArray,"array");
var _99=objj_msgSend(row,"subrowsCount");
for(var i=0;i<_99;i++){
_96=objj_msgSend(row,"childAtIndex:",i);
_97=objj_msgSend(_94,"predicateForRow:",objj_msgSend(_model,"indexOfRow:",_96));
if(!_97){
continue;
}
objj_msgSend(_98,"addObject:",_97);
}
return _98;
}
}),new objj_method(sel_getUid("selectValue:inCriterionView:"),function(_9a,_9b,_9c,_9d){
with(_9a){
if(!_9c){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_9b+" : invalid display value for criterion, must not be nil");
}
if(!_9d){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_9b+" : invalid view in template, must not be nil");
}
if(objj_msgSend(_9c,"isKindOfClass:",CPMenuItem)){
if(!objj_msgSend(_9d,"isKindOfClass:",CPPopUpButton)){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_9b+" : invalid display value for criterion, does not match template view class");
}
objj_msgSend(_9d,"selectItemWithTitle:",objj_msgSend(_9c,"title"));
return;
}
if(objj_msgSend(_9c,"isKindOfClass:",CPString)){
if(objj_msgSend(_9d,"isKindOfClass:",CPPopUpButton)){
objj_msgSend(_9d,"selectItemWithTitle:",_9c);
return;
}
if(objj_msgSend(_9d,"respondsToSelector:",sel_getUid("setStringValue:"))){
objj_msgSend(_9d,"setStringValue:",_9c);
return;
}
if(objj_msgSend(_9d,"respondsToSelector:",sel_getUid("setObjectValue:"))){
objj_msgSend(_9d,"setObjectValue:",objectValue);
return;
}
}
if(objj_msgSend(_9c,"isKindOfClass:",CPControl)){
if(objj_msgSend(_9d,"isKindOfClass:",CPPopUpButton)||!objj_msgSend(_9d,"isKindOfClass:",CPControl)){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_9b+" : invalid display value for criterion, does not match template view class");
}
if(objj_msgSend(_9c,"respondsToSelector:",sel_getUid("color"))){
if(!objj_msgSend(_9d,"respondsToSelector:",sel_getUid("setColor:"))){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_9b+" : invalid display value for criterion, does not match template view class");
}
objj_msgSend(_9d,"setColor:",objj_msgSend(_9c,"color"));
return;
}
if(objj_msgSend(_9c,"respondsToSelector:",sel_getUid("stringValue"))){
if(!objj_msgSend(_9d,"respondsToSelector:",sel_getUid("setStringValue:"))){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_9b+" : invalid display value for criterion, does not match template view class");
}
objj_msgSend(_9d,"setStringValue:",objj_msgSend(_9c,"stringValue"));
return;
}
if(objj_msgSend(_9c,"respondsToSelector:",sel_getUid("objectValue"))){
if(!objj_msgSend(_9d,"respondsToSelector:",sel_getUid("setObjectValue:"))){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_9b+" : invalid display value for criterion, does not match template view class");
}
objj_msgSend(_9d,"setObjectValue:",objj_msgSend(_9c,"objectValue"));
return;
}
}
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_9b+" : failed to set display value on criterion, classes do not match");
}
}),new objj_method(sel_getUid("setDelegate"),function(_9e,_9f){
with(_9e){
}
}),new objj_method(sel_getUid("willInsertNewRowWithCriteria:atIndex:"),function(_a0,_a1,_a2,_a3){
with(_a0){
var _a4=objj_msgSend(_a0,"templateRefFromCriteria:",_a2);
if(_a4){
return objj_msgSend(_a4,"preProcessCriteria:",_a2);
}
return _a2;
}
}),new objj_method(sel_getUid("didAddRow:"),function(_a5,_a6,row){
with(_a5){
objj_msgSend(_a5,"updateTemplateRefForRow:",row);
}
}),new objj_method(sel_getUid("willModifyRow:"),function(_a7,_a8,row){
with(_a7){
var _a9=objj_msgSend(_a7,"updateTemplateRefForRow:",row);
var _aa=objj_msgSend(row,"criteria");
if(!_aa||!_a9){
return;
}
objj_msgSend(_a9,"preProcessCriteria:",_aa);
}
}),new objj_method(sel_getUid("criterionItemCopy:"),function(_ab,_ac,_ad){
with(_ab){
var _ae=objj_msgSend(_ab,"mappedTemplateForObject:",_ad);
var _af=objj_msgSend(_ad,"copy");
objj_msgSend(_ab,"mapObject:withTemplate:",_af,_ae);
return _af;
}
}),new objj_method(sel_getUid("updateTemplateRefForRow:"),function(_b0,_b1,row){
with(_b0){
if(!row){
return nil;
}
var _b2=objj_msgSend(_b0,"templateRefFromCriteria:",objj_msgSend(row,"criteria"));
objj_msgSend(row,"setData:",_b2);
return _b2;
}
}),new objj_method(sel_getUid("templateRefFromCriteria:"),function(_b3,_b4,_b5){
with(_b3){
if(!_b5||!objj_msgSend(_b5,"count")){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_b4+" : invalid criterion array, must not be empty");
}
var _b6=objj_msgSend(_b5,"objectAtIndex:",0);
var _b7=objj_msgSend(_b3,"mappedTemplateForObject:",objj_msgSend(_b6,"displayValue"));
if(!_b7){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_b4+" : orphan row, no template found");
}
return _b7;
}
}),new objj_method(sel_getUid("mapObject:withTemplate:"),function(_b8,_b9,_ba,_bb){
with(_b8){
objj_msgSend(_b8,"mapObject:withTemplate:protect:",_ba,_bb,NO);
}
}),new objj_method(sel_getUid("mapObject:withTemplate:protect:"),function(_bc,_bd,_be,_bf,_c0){
with(_bc){
if(!_be||!_bf){
return;
}
_be[":)"]=_bf;
}
}),new objj_method(sel_getUid("mappedTemplateForObject:"),function(_c1,_c2,_c3){
with(_c1){
if(!_c3){
return nil;
}
return _c3[":)"];
}
})]);
var _c4="CPPredicateTemplates";
var _1=objj_getClass("SPPredicateEditor");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"SPPredicateEditor\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_c5,_c6,_c7){
with(_c5){
_c5=objj_msgSendSuper({receiver:_c5,super_class:objj_getClass("SPPredicateEditor").super_class},"initWithCoder:",_c7);
if(_c5!=nil){
objj_msgSend(_c5,"setRowTemplates:",objj_msgSend(_c7,"decodeObjectForKey:",_c4));
}
return _c5;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_c8,_c9,_ca){
with(_c8){
objj_msgSendSuper({receiver:_c8,super_class:objj_getClass("SPPredicateEditor").super_class},"encodeWithCoder:",_ca);
objj_msgSend(_ca,"encodeObject:forKey:",_rowTemplates,_c4);
}
})]);
