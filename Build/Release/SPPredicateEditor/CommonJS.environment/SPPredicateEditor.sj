@STATIC;1.0;p;19;SPPredicateEditor.jt;24171;@STATIC;1.0;i;14;SPRuleEditor.ji;30;SPPredicateEditorRowTemplate.jt;24097;
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
p;24;SPPredicateEditorClass.jt;431;@STATIC;1.0;I;21;Foundation/CPObject.jt;387;
objj_executeFile("Foundation/CPObject.j",NO);
var _1=objj_allocateClassPair(CPObject,"SPPredicateEditor"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_2,[new objj_method(sel_getUid("version"),function(_3,_4){
with(_3){
var _5=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(_3,"class"));
return objj_msgSend(_5,"objectForInfoDictionaryKey:","CPBundleVersion");
}
})]);
p;33;SPPredicateEditorFloatTextField.jt;2059;@STATIC;1.0;I;20;AppKit/CPTextField.jt;2015;
objj_executeFile("AppKit/CPTextField.j",NO);
var _1=objj_allocateClassPair(CPTextField,"SPPredicateEditorUnsignedFloatTextField"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("keyDown:"),function(_3,_4,_5){
with(_3){
if(objj_msgSend(_3,"isCharacterValid:",objj_msgSend(_5,"characters"))){
objj_msgSendSuper({receiver:_3,super_class:objj_getClass("SPPredicateEditorUnsignedFloatTextField").super_class},"keyDown:",_5);
return;
}
objj_msgSend(objj_msgSend(objj_msgSend(_3,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",NO);
}
}),new objj_method(sel_getUid("isCharacterValid:"),function(_6,_7,_8){
with(_6){
var _9=_8.charCodeAt(0);
var _a=objj_msgSend(_6,"selectedRange");
if(_9==46){
var _b=objj_msgSend(_6,"stringValue");
if(_b.length&&_b.indexOf(".")>=0){
return NO;
}
return YES;
}
if(_9==27||_9==13||_9==8||_9==127||_9>63232||(_9>=48&&_9<=57)){
return YES;
}
return NO;
}
})]);
var _1=objj_allocateClassPair(CPTextField,"SPPredicateEditorFloatTextField"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("keyDown:"),function(_c,_d,_e){
with(_c){
if(objj_msgSend(_c,"isCharacterValid:",objj_msgSend(_e,"characters"))){
objj_msgSendSuper({receiver:_c,super_class:objj_getClass("SPPredicateEditorFloatTextField").super_class},"keyDown:",_e);
return;
}
objj_msgSend(objj_msgSend(objj_msgSend(_c,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",NO);
}
}),new objj_method(sel_getUid("isCharacterValid:"),function(_f,_10,str){
with(_f){
var _11=str.charCodeAt(0);
var _12=objj_msgSend(_f,"selectedRange");
if(_11==46){
var _13=objj_msgSend(_f,"stringValue");
if(_13.length){
if(_13.indexOf(".")>=0){
return NO;
}
if(_12.location>0){
return YES;
}
var _14=objj_msgSend(_13,"characterAtIndex:",0);
if(_14=="-"||_14=="+"){
return NO;
}
return YES;
}
return YES;
}
if(_12.location==0&&(_11==43||_11==45)){
return YES;
}
if(_11==27||_11==13||_11==8||_11>63232||_11==127||(_11>=48&&_11<=57)){
return YES;
}
return NO;
}
})]);
p;35;SPPredicateEditorIntegerTextField.jt;1655;@STATIC;1.0;I;20;AppKit/CPTextField.jt;1611;
objj_executeFile("AppKit/CPTextField.j",NO);
var _1=objj_allocateClassPair(CPTextField,"SPPredicateEditorUnsignedIntegerTextField"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("keyDown:"),function(_3,_4,_5){
with(_3){
if(objj_msgSend(_3,"isCharacterValid:",objj_msgSend(_5,"characters"))){
objj_msgSendSuper({receiver:_3,super_class:objj_getClass("SPPredicateEditorUnsignedIntegerTextField").super_class},"keyDown:",_5);
return;
}
objj_msgSend(objj_msgSend(objj_msgSend(_3,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",NO);
}
}),new objj_method(sel_getUid("isCharacterValid:"),function(_6,_7,_8){
with(_6){
var _9=_8.charCodeAt(0);
if(_9==27||_9==13||_9==8||_9==127||_9>63232||(_9>=48&&_9<=57)){
return YES;
}
return NO;
}
})]);
var _1=objj_allocateClassPair(CPTextField,"SPPredicateEditorIntegerTextField"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("keyDown:"),function(_a,_b,_c){
with(_a){
if(objj_msgSend(_a,"isCharacterValid:",objj_msgSend(_c,"characters"))){
objj_msgSendSuper({receiver:_a,super_class:objj_getClass("SPPredicateEditorIntegerTextField").super_class},"keyDown:",_c);
return;
}
objj_msgSend(objj_msgSend(objj_msgSend(_a,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",NO);
}
}),new objj_method(sel_getUid("isCharacterValid:"),function(_d,_e,_f){
with(_d){
var _10=_f.charCodeAt(0);
var _11=objj_msgSend(_d,"selectedRange");
if(_11.location==0&&(_10==43||_10==45)){
return YES;
}
if(_10==27||_10==13||_10==8||_10>63232||_10==127||(_10>=48&&_10<=57)){
return YES;
}
return NO;
}
})]);
p;30;SPPredicateEditorRowTemplate.jt;26490;@STATIC;1.0;i;33;SPPredicateEditorFloatTextField.ji;35;SPPredicateEditorIntegerTextField.jt;26392;
objj_executeFile("SPPredicateEditorFloatTextField.j",YES);
objj_executeFile("SPPredicateEditorIntegerTextField.j",YES);
CPUndefinedAttributeType=0;
CPInteger16AttributeType=100;
CPInteger32AttributeType=200;
CPInteger64AttributeType=300;
CPDecimalAttributeType=400;
CPDoubleAttributeType=500;
CPFloatAttributeType=600;
CPStringAttributeType=700;
CPBooleanAttributeType=800;
CPDateAttributeType=900;
CPBinaryDataAttributeType=1000;
CPTransformableAttributeType=1800;
var _1=objj_allocateClassPair(CPObject,"SPPredicateEditorRowTemplate"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_templateType"),new objj_ivar("_predicateOptions"),new objj_ivar("_predicateModifier"),new objj_ivar("_leftAttributeType"),new objj_ivar("_rightAttributeType"),new objj_ivar("_leftIsWildcard"),new objj_ivar("_rightIsWildcard"),new objj_ivar("_views")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("_templateType"),function(_3,_4){
with(_3){
return _templateType;
}
}),new objj_method(sel_getUid("_setTemplateType:"),function(_5,_6,_7){
with(_5){
_templateType=_7;
}
}),new objj_method(sel_getUid("_predicateOptions"),function(_8,_9){
with(_8){
return _predicateOptions;
}
}),new objj_method(sel_getUid("_setOptions:"),function(_a,_b,_c){
with(_a){
_predicateOptions=_c;
}
}),new objj_method(sel_getUid("_predicateModifier"),function(_d,_e){
with(_d){
return _predicateModifier;
}
}),new objj_method(sel_getUid("_setModifier:"),function(_f,_10,_11){
with(_f){
_predicateModifier=_11;
}
}),new objj_method(sel_getUid("leftAttributeType"),function(_12,_13){
with(_12){
return _leftAttributeType;
}
}),new objj_method(sel_getUid("_setLeftAttributeType:"),function(_14,_15,_16){
with(_14){
_leftAttributeType=_16;
}
}),new objj_method(sel_getUid("rightAttributeType"),function(_17,_18){
with(_17){
return _rightAttributeType;
}
}),new objj_method(sel_getUid("_setRightAttributeType:"),function(_19,_1a,_1b){
with(_19){
_rightAttributeType=_1b;
}
}),new objj_method(sel_getUid("leftIsWildcard"),function(_1c,_1d){
with(_1c){
return _leftIsWildcard;
}
}),new objj_method(sel_getUid("setLeftIsWildcard:"),function(_1e,_1f,_20){
with(_1e){
_leftIsWildcard=_20;
}
}),new objj_method(sel_getUid("rightIsWildcard"),function(_21,_22){
with(_21){
return _rightIsWildcard;
}
}),new objj_method(sel_getUid("setRightIsWildcard:"),function(_23,_24,_25){
with(_23){
_rightIsWildcard=_25;
}
}),new objj_method(sel_getUid("_views"),function(_26,_27){
with(_26){
return _views;
}
}),new objj_method(sel_getUid("setTemplateViews:"),function(_28,_29,_2a){
with(_28){
_views=_2a;
}
}),new objj_method(sel_getUid("initWithLeftExpressions:rightExpressions:modifier:operators:options:"),function(_2b,_2c,_2d,_2e,_2f,_30,_31){
with(_2b){
_2b=objj_msgSendSuper({receiver:_2b,super_class:objj_getClass("SPPredicateEditorRowTemplate").super_class},"init");
if(_2b!=nil){
_templateType=1;
_leftIsWildcard=NO;
_rightIsWildcard=NO;
_leftAttributeType=0;
_rightAttributeType=0;
_predicateModifier=_2f;
_predicateOptions=_31;
var _32=objj_msgSend(_2b,"_viewFromExpressions:",_2d),_33=objj_msgSend(_2b,"_viewFromExpressions:",_2e),_34=objj_msgSend(_2b,"_viewFromOperatorTypes:",_30),_35=objj_msgSend(_2b,"_viewFromOptions:",_31);
if(!_35){
_views=objj_msgSend(objj_msgSend(CPArray,"alloc"),"initWithObjects:",_32,_34,_33);
}else{
_views=objj_msgSend(objj_msgSend(CPArray,"alloc"),"initWithObjects:",_32,_34,_33,_35);
}
}
return _2b;
}
}),new objj_method(sel_getUid("initWithLeftExpressions:rightExpressionAttributeType:modifier:operators:options:"),function(_36,_37,_38,_39,_3a,_3b,_3c){
with(_36){
_36=objj_msgSendSuper({receiver:_36,super_class:objj_getClass("SPPredicateEditorRowTemplate").super_class},"init");
if(_36!=nil){
var _3d=objj_msgSend(_36,"_viewFromExpressions:",_38),_3e=objj_msgSend(_36,"_viewFromOperatorTypes:",_3b),_3f=objj_msgSend(_36,"_viewFromAttributeType:",_39),_40=objj_msgSend(_36,"_viewFromOptions:",_3c);
_templateType=1;
_leftIsWildcard=NO;
_rightIsWildcard=YES;
_leftAttributeType=0;
_rightAttributeType=_39;
_predicateModifier=_3a;
_predicateOptions=_3c;
if(!_40){
_views=objj_msgSend(objj_msgSend(CPArray,"alloc"),"initWithObjects:",_3d,_3e,_3f);
}else{
_views=objj_msgSend(objj_msgSend(CPArray,"alloc"),"initWithObjects:",_3d,_3e,_3f,_40);
}
}
return _36;
}
}),new objj_method(sel_getUid("initWithCompoundTypes:"),function(_41,_42,_43){
with(_41){
_41=objj_msgSendSuper({receiver:_41,super_class:objj_getClass("SPPredicateEditorRowTemplate").super_class},"init");
if(_41!=nil){
var _44=objj_msgSend(_41,"_viewFromCompoundTypes:",_43),_45=objj_msgSend(objj_msgSend(CPPopUpButton,"alloc"),"init");
objj_msgSend(_45,"addItemWithTitle:","of the following are true");
_templateType=2;
_leftIsWildcard=NO;
_rightIsWildcard=NO;
_rightAttributeType=0;
_views=objj_msgSend(objj_msgSend(CPArray,"alloc"),"initWithObjects:",_44,_45);
}
return _41;
}
}),new objj_method(sel_getUid("matchForPredicate:"),function(_46,_47,_48){
with(_46){
if(objj_msgSend(_46,"_templateType")==2&&objj_msgSend(_48,"isKindOfClass:",objj_msgSend(CPCompoundPredicate,"class"))){
if(objj_msgSend(objj_msgSend(_46,"compoundTypes"),"containsObject:",objj_msgSend(_48,"compoundPredicateType"))){
return 1;
}
}else{
if(objj_msgSend(_46,"_templateType")==1&&objj_msgSend(_48,"isKindOfClass:",objj_msgSend(CPComparisonPredicate,"class"))){
if(!_leftIsWildcard&&!objj_msgSend(objj_msgSend(_46,"leftExpressions"),"containsObject:",objj_msgSend(_48,"leftExpression"))){
return 0;
}
if(!objj_msgSend(objj_msgSend(_46,"operators"),"containsObject:",objj_msgSend(_48,"predicateOperatorType"))){
return 0;
}
if(!_rightIsWildcard&&!objj_msgSend(objj_msgSend(_46,"rightExpressions"),"containsObject:",objj_msgSend(_48,"rightExpression"))){
return 0;
}
if((objj_msgSend(_46,"options")&objj_msgSend(_48,"options"))==0){
return 0.5;
}
return 1;
}
}
return 0;
}
}),new objj_method(sel_getUid("templateViews"),function(_49,_4a){
with(_49){
return _views;
}
}),new objj_method(sel_getUid("setPredicate:"),function(_4b,_4c,_4d){
with(_4b){
if(_templateType==2){
objj_msgSend(_4b,"_setCompoundPredicate:",_4d);
}else{
objj_msgSend(_4b,"_setComparisonPredicate:",_4d);
}
}
}),new objj_method(sel_getUid("displayableSubpredicatesOfPredicate:"),function(_4e,_4f,_50){
with(_4e){
if(objj_msgSend(_50,"isKindOfClass:",objj_msgSend(CPCompoundPredicate,"class"))){
var _51=objj_msgSend(_50,"subpredicates");
if(objj_msgSend(_51,"count")==0){
return nil;
}
return _51;
}
return nil;
}
}),new objj_method(sel_getUid("predicateWithSubpredicates:"),function(_52,_53,_54){
with(_52){
if(_templateType==2){
var _55=objj_msgSend(objj_msgSend(_views[0],"selectedItem"),"representedObject");
if(_55==CPNotPredicateType){
var _56=objj_msgSend(objj_msgSend(CPCompoundPredicate,"alloc"),"initWithType:subpredicates:",CPOrPredicateType,_54);
return objj_msgSend(objj_msgSend(CPCompoundPredicate,"alloc"),"initWithType:subpredicates:",_55,objj_msgSend(CPArray,"arrayWithObject:",_56));
}
return objj_msgSend(objj_msgSend(CPCompoundPredicate,"alloc"),"initWithType:subpredicates:",_55,_54);
}
if(_templateType==1){
var lhs=objj_msgSend(_52,"_leftExpression"),rhs=objj_msgSend(_52,"_rightExpression"),_57=objj_msgSend(objj_msgSend(_views[1],"selectedItem"),"representedObject"),_58=0;
var _59=objj_msgSend(_52,"options")&&objj_msgSend(_views,"count")>3?objj_msgSend(_views,"objectAtIndex:",3):nil;
if(_59){
_58=objj_msgSend(objj_msgSend(_59,"selectedItem"),"representedObject");
}
return objj_msgSend(CPComparisonPredicate,"predicateWithLeftExpression:rightExpression:modifier:type:options:",lhs,rhs,objj_msgSend(_52,"modifier"),_57,_58);
}
return nil;
}
}),new objj_method(sel_getUid("leftExpressions"),function(_5a,_5b){
with(_5a){
if(_templateType==1&&!_leftIsWildcard){
var _5c=objj_msgSend(_views,"objectAtIndex:",0);
return objj_msgSend(objj_msgSend(_5c,"itemArray"),"valueForKey:","representedObject");
}
return nil;
}
}),new objj_method(sel_getUid("rightExpressions"),function(_5d,_5e){
with(_5d){
if(_templateType==1&&!_rightIsWildcard){
var _5f=objj_msgSend(_views,"objectAtIndex:",2);
return objj_msgSend(objj_msgSend(_5f,"itemArray"),"valueForKey:","representedObject");
}
return nil;
}
}),new objj_method(sel_getUid("compoundTypes"),function(_60,_61){
with(_60){
if(_templateType==2){
var _62=objj_msgSend(_views,"objectAtIndex:",0);
return objj_msgSend(objj_msgSend(_62,"itemArray"),"valueForKey:","representedObject");
}
return nil;
}
}),new objj_method(sel_getUid("modifier"),function(_63,_64){
with(_63){
if(_templateType==1){
return _predicateModifier;
}
return nil;
}
}),new objj_method(sel_getUid("operators"),function(_65,_66){
with(_65){
if(_templateType==1){
var _67=objj_msgSend(_views,"objectAtIndex:",1);
return objj_msgSend(objj_msgSend(_67,"itemArray"),"valueForKey:","representedObject");
}
return nil;
}
}),new objj_method(sel_getUid("options"),function(_68,_69){
with(_68){
if(_templateType==1){
return _predicateOptions;
}
return nil;
}
}),new objj_method(sel_getUid("rightExpressionAttributeType"),function(_6a,_6b){
with(_6a){
return _rightAttributeType;
}
}),new objj_method(sel_getUid("leftExpressionAttributeType"),function(_6c,_6d){
with(_6c){
return _leftAttributeType;
}
}),new objj_method(sel_getUid("_setCompoundPredicate:"),function(_6e,_6f,_70){
with(_6e){
var _71=objj_msgSend(_views,"objectAtIndex:",0),_72=objj_msgSend(_70,"compoundPredicateType"),_73=objj_msgSend(_71,"indexOfItemWithRepresentedObject:",_72);
objj_msgSend(_71,"selectItemAtIndex:",_73);
}
}),new objj_method(sel_getUid("_setComparisonPredicate:"),function(_74,_75,_76){
with(_74){
var _77=nil,_78=objj_msgSend(_views,"objectAtIndex:",0),_79=objj_msgSend(_views,"objectAtIndex:",1),_7a=objj_msgSend(_views,"objectAtIndex:",2),_7b=objj_msgSend(_76,"leftExpression"),_7c=objj_msgSend(_76,"rightExpression"),_7d=objj_msgSend(_76,"predicateOperatorType"),_7e=objj_msgSend(_76,"predicateOptions");
if(objj_msgSend(_views,"count")>3){
_77=objj_msgSend(_views,"objectAtIndex:",3);
}
if(_leftIsWildcard){
objj_msgSend(_78,"setObjectValue:",objj_msgSend(_7b,"constantValue"));
}else{
var _7f=objj_msgSend(_78,"indexOfItemWithRepresentedObject:",_7b);
objj_msgSend(_78,"selectItemAtIndex:",_7f);
}
var _80=objj_msgSend(_79,"indexOfItemWithRepresentedObject:",_7d);
objj_msgSend(_79,"selectItemAtIndex:",_80);
if(_rightIsWildcard){
objj_msgSend(_7a,"setObjectValue:",objj_msgSend(_7c,"constantValue"));
}else{
var _7f=objj_msgSend(_7a,"indexOfItemWithRepresentedObject:",_7c);
objj_msgSend(_7a,"selectItemAtIndex:",_7f);
}
if(_77&&objj_msgSend(_74,"_shouldSetOptionsForOperatorType:",objj_msgSend(_76,"predicateOperatorType"))){
var _81=objj_msgSend(_77,"indexOfItemWithRepresentedObject:",objj_msgSend(CPNumber,"numberWithInt:",_7e));
objj_msgSend(_77,"setSelectedIndex:",_81);
}
}
}),new objj_method(sel_getUid("_shouldSetOptionsForOperatorType:"),function(_82,_83,_84){
with(_82){
return (_84==CPMatchesPredicateOperatorType||_84==CPLikePredicateOperatorType||_84==CPBeginsWithPredicateOperatorType||_84==CPEndsWithPredicateOperatorType||_84==CPInPredicateOperatorType||_84==CPContainsPredicateOperatorType);
}
}),new objj_method(sel_getUid("_leftExpression"),function(_85,_86){
with(_85){
return objj_msgSend(_85,"_expressionFromView:forAttributeType:",_views[0],_leftAttributeType);
}
}),new objj_method(sel_getUid("_rightExpression"),function(_87,_88){
with(_87){
return objj_msgSend(_87,"_expressionFromView:forAttributeType:",_views[2],_rightAttributeType);
}
}),new objj_method(sel_getUid("_expressionFromView:forAttributeType:"),function(_89,_8a,_8b,_8c){
with(_89){
switch(_8c){
case CPUndefinedAttributeType:
return objj_msgSend(objj_msgSend(_8b,"selectedItem"),"representedObject");
case CPInteger16AttributeType:
case CPInteger32AttributeType:
case CPInteger64AttributeType:
case CPDecimalAttributeType:
value=objj_msgSend(_8b,"intValue");
break;
case CPDoubleAttributeType:
case CPFloatAttributeType:
value=objj_msgSend(_8b,"doubleValue");
break;
case CPStringAttributeType:
value=objj_msgSend(_8b,"stringValue");
break;
case CPBooleanAttributeType:
value=objj_msgSend(objj_msgSend(_8b,"selectedItem"),"representedObject");
break;
case CPDateAttributeType:
value=objj_msgSend(_8b,"objectValue");
break;
default:
if(objj_msgSend(_8b,"respondsToSelector:",sel_getUid("objectValue"))){
value=objj_msgSend(_8b,"objectValue");
}else{
if(objj_msgSend(_8b,"respondsToSelector:",sel_getUid("stringValue"))){
value=objj_msgSend(_8b,"stringValue");
}else{
return nil;
}
}
}
return objj_msgSend(CPExpression,"expressionForConstantValue:",value);
}
}),new objj_method(sel_getUid("_rowType"),function(_8d,_8e){
with(_8d){
return (_templateType-1);
}
}),new objj_method(sel_getUid("copy"),function(_8f,_90){
with(_8f){
return objj_msgSend(CPKeyedUnarchiver,"unarchiveObjectWithData:",objj_msgSend(CPKeyedArchiver,"archivedDataWithRootObject:",_8f));
}
}),new objj_method(sel_getUid("_templateType"),function(_91,_92){
with(_91){
return _templateType;
}
}),new objj_method(sel_getUid("_displayValueForPredicateOperator:"),function(_93,_94,_95){
with(_93){
var _96;
switch(_95){
case CPLessThanPredicateOperatorType:
_96="is less than";
break;
case CPLessThanOrEqualToPredicateOperatorType:
_96="is less than or equal to";
break;
case CPGreaterThanPredicateOperatorType:
_96="is greater than";
break;
case CPGreaterThanOrEqualToPredicateOperatorType:
_96="is greater than or equal to";
break;
case CPEqualToPredicateOperatorType:
_96="is";
break;
case CPNotEqualToPredicateOperatorType:
_96="is not";
break;
case CPMatchesPredicateOperatorType:
_96="matches";
break;
case CPLikePredicateOperatorType:
_96="is like";
break;
case CPBeginsWithPredicateOperatorType:
_96="begins with";
break;
case CPEndsWithPredicateOperatorType:
_96="ends with";
break;
case CPInPredicateOperatorType:
_96="in";
break;
case CPContainsPredicateOperatorType:
_96="contains";
break;
case CPBetweenPredicateOperatorType:
_96="between";
break;
default:
CPLogConsole("unknown predicate operator %d"+_95);
}
return _96;
}
}),new objj_method(sel_getUid("_displayValueForCompoundPredicateType:"),function(_97,_98,_99){
with(_97){
var _9a;
switch(_99){
case CPNotPredicateType:
_9a="None";
break;
case CPAndPredicateType:
_9a="All";
break;
case CPOrPredicateType:
_9a="Any";
break;
default:
_9a=objj_msgSend(CPString,"stringWithFormat:","unknown compound predicate type %d",_99);
}
return _9a;
}
}),new objj_method(sel_getUid("_displayValueForConstantValue:"),function(_9b,_9c,_9d){
with(_9b){
return objj_msgSend(_9d,"description");
}
}),new objj_method(sel_getUid("_displayValueForKeyPath:"),function(_9e,_9f,_a0){
with(_9e){
return _a0;
}
}),new objj_method(sel_getUid("_viewFromExpressions:"),function(_a1,_a2,_a3){
with(_a1){
var _a4=objj_msgSend(objj_msgSend(CPPopUpButton,"alloc"),"initWithFrame:",CPMakeRect(0,0,100,18)),_a5=objj_msgSend(_a3,"count");
for(var i=0;i<_a5;i++){
var exp=_a3[i],_a6=objj_msgSend(exp,"expressionType"),_a7;
switch(_a6){
case CPKeyPathExpressionType:
_a7=objj_msgSend(exp,"description");
break;
case CPConstantValueExpressionType:
_a7=objj_msgSend(_a1,"_displayValueForConstantValue:",objj_msgSend(exp,"constantValue"));
break;
default:
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Invalid Expression type "+_a6);
break;
}
var _a8=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:",_a7,nil,"");
objj_msgSend(_a8,"setRepresentedObject:",exp);
objj_msgSend(_a4,"addItem:",_a8);
}
objj_msgSend(_a4,"sizeToFit");
return _a4;
}
}),new objj_method(sel_getUid("_viewFromOperatorTypes:"),function(_a9,_aa,_ab){
with(_a9){
var _ac=objj_msgSend(objj_msgSend(CPPopUpButton,"alloc"),"initWithFrame:",CGRectMake(0,0,100,18)),_ad=objj_msgSend(_ab,"count");
for(var i=0;i<_ad;i++){
var op=_ab[i],_ae=objj_msgSend(_a9,"_displayValueForPredicateOperator:",op),_af=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:",_ae,nil,"");
objj_msgSend(_af,"setRepresentedObject:",op);
objj_msgSend(_ac,"addItem:",_af);
}
objj_msgSend(_ac,"sizeToFit");
return _ac;
}
}),new objj_method(sel_getUid("_viewFromOptions:"),function(_b0,_b1,_b2){
with(_b0){
if(!(_b2&(CPCaseInsensitivePredicateOption|CPDiacriticInsensitivePredicateOption))){
return nil;
}
var _b3=objj_msgSend(objj_msgSend(CPPopUpButton,"alloc"),"initWithFrame:",CGRectMake(0,0,50,26));
var _b4=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","case sensitive",nil,nil);
objj_msgSend(_b4,"setRepresentedObject:",objj_msgSend(CPNumber,"numberWithInt:",0));
objj_msgSend(_b3,"addItem:",_b4);
if(_b2&CPCaseInsensitivePredicateOption){
_b4=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","case insensitive",nil,nil);
objj_msgSend(_b4,"setRepresentedObject:",objj_msgSend(CPNumber,"numberWithInt:",CPCaseInsensitivePredicateOption));
objj_msgSend(_b3,"addItem:",_b4);
}
if(_b2&CPDiacriticInsensitivePredicateOption){
_b4=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","diacritic insensitive",nil,nil);
objj_msgSend(_b4,"setRepresentedObject:",objj_msgSend(CPNumber,"numberWithInt:",CPDiacriticInsensitivePredicateOption));
objj_msgSend(_b3,"addItem:",_b4);
}
if((_b2&CPCaseInsensitivePredicateOption)&&(_b2&CPDiacriticInsensitivePredicateOption)){
_b4=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","case + diacritic insensitive",nil,nil);
objj_msgSend(_b4,"setRepresentedObject:",objj_msgSend(CPNumber,"numberWithInt:",CPCaseInsensitivePredicateOption|CPDiacriticInsensitivePredicateOption));
objj_msgSend(_b3,"addItem:",_b4);
}
objj_msgSend(_b3,"sizeToFit");
return _b3;
}
}),new objj_method(sel_getUid("_viewFromCompoundTypes:"),function(_b5,_b6,_b7){
with(_b5){
var _b8=objj_msgSend(objj_msgSend(CPPopUpButton,"alloc"),"initWithFrame:",CGRectMake(0,0,100,18)),_b9=objj_msgSend(_b7,"count");
for(var i=0;i<_b9;i++){
var _ba=_b7[i],_bb=objj_msgSend(_b5,"_displayValueForCompoundPredicateType:",_ba),_bc=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:",_bb,nil,"");
objj_msgSend(_bc,"setRepresentedObject:",_ba);
objj_msgSend(_b8,"addItem:",_bc);
}
objj_msgSend(_b8,"sizeToFit");
return _b8;
}
}),new objj_method(sel_getUid("_viewFromAttributeType:"),function(_bd,_be,_bf){
with(_bd){
var _c0;
switch(_bf){
case CPInteger16AttributeType:
case CPInteger32AttributeType:
case CPInteger64AttributeType:
case CPDecimalAttributeType:
_c0=objj_msgSend(_bd,"_integerTextFieldWithFrame:",CGRectMake(0,0,50,26));
break;
case CPDoubleAttributeType:
case CPFloatAttributeType:
_c0=objj_msgSend(_bd,"_floatTextFieldWithFrame:",CGRectMake(0,0,50,26));
break;
case CPStringAttributeType:
_c0=objj_msgSend(_bd,"_textFieldWithFrame:",CGRectMake(0,0,150,26));
break;
case CPBooleanAttributeType:
_c0=objj_msgSend(objj_msgSend(CPPopUpButton,"alloc"),"initWithFrame:",CGRectMake(0,0,50,26));
var _c1=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","true",nil,nil);
objj_msgSend(_c1,"setRepresentedObject:",objj_msgSend(CPNumber,"numberWithBool:",YES));
objj_msgSend(_c0,"addItem:",_c1);
_c1=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","false",nil,nil);
objj_msgSend(_c1,"setRepresentedObject:",objj_msgSend(CPNumber,"numberWithBool:",NO));
objj_msgSend(_c0,"addItem:",_c1);
break;
case CPDateAttributeType:
_c0=objj_msgSend(objj_msgSend(CPDatePicker,"alloc"),"initWithFrame:",CGRectMake(0,0,150,26));
break;
default:
return nil;
}
objj_msgSend(_c0,"setTag:",_bf);
return _c0;
}
}),new objj_method(sel_getUid("_textFieldWithFrame:"),function(_c2,_c3,_c4){
with(_c2){
var _c5=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",_c4);
objj_msgSend(_c5,"setBezeled:",YES);
objj_msgSend(_c5,"setBezelStyle:",CPTextFieldSquareBezel);
objj_msgSend(_c5,"setBordered:",YES);
objj_msgSend(_c5,"setEditable:",YES);
objj_msgSend(_c5,"setFont:",objj_msgSend(CPFont,"systemFontOfSize:",10));
return _c5;
}
}),new objj_method(sel_getUid("_integerTextFieldWithFrame:"),function(_c6,_c7,_c8){
with(_c6){
var _c9=objj_msgSend(objj_msgSend(SPPredicateEditorIntegerTextField,"alloc"),"initWithFrame:",_c8);
objj_msgSend(_c9,"setBezeled:",YES);
objj_msgSend(_c9,"setBezelStyle:",CPTextFieldSquareBezel);
objj_msgSend(_c9,"setBordered:",YES);
objj_msgSend(_c9,"setEditable:",YES);
objj_msgSend(_c9,"setFont:",objj_msgSend(CPFont,"systemFontOfSize:",10));
return _c9;
}
}),new objj_method(sel_getUid("_floatTextFieldWithFrame:"),function(_ca,_cb,_cc){
with(_ca){
var _cd=objj_msgSend(objj_msgSend(SPPredicateEditorFloatTextField,"alloc"),"initWithFrame:",_cc);
objj_msgSend(_cd,"setBezeled:",YES);
objj_msgSend(_cd,"setBezelStyle:",CPTextFieldSquareBezel);
objj_msgSend(_cd,"setBordered:",YES);
objj_msgSend(_cd,"setEditable:",YES);
objj_msgSend(_cd,"setFont:",objj_msgSend(CPFont,"systemFontOfSize:",10));
return _cd;
}
}),new objj_method(sel_getUid("_setOptions:"),function(_ce,_cf,_d0){
with(_ce){
if(_predicateOptions==_d0){
return;
}
if(_predicateOptions&&!_d0){
objj_msgSend(_views,"removeObjectAtIndex:",3);
}else{
if(!_predicateOptions&&_d0){
var _d1=objj_msgSend(_ce,"_viewFromOptions:",_d0);
if(!_d1){
return;
}
objj_msgSend(_views,"addObject:",_d1);
}
}
_predicateOptions=_d0;
}
}),new objj_method(sel_getUid("_setModifier:"),function(_d2,_d3,_d4){
with(_d2){
_predicateModifier=_d4;
}
}),new objj_method(sel_getUid("preProcessCriteria:"),function(_d5,_d6,_d7){
with(_d5){
if(!objj_msgSend(_d5,"options")||objj_msgSend(_d7,"count")<4){
return _d7;
}
var _d8=objj_msgSend(_d7,"objectAtIndex:",1);
var _d9=objj_msgSend(_d7,"objectAtIndex:",3);
var _da=objj_msgSend(objj_msgSend(_d8,"displayValue"),"representedObject");
objj_msgSend(_d9,"setHidden:",!objj_msgSend(_d5,"_shouldSetOptionsForOperatorType:",_da));
return _d7;
}
}),new objj_method(sel_getUid("description"),function(_db,_dc){
with(_db){
if(_templateType==2){
return objj_msgSend(CPString,"stringWithFormat:","<%@ %p %@>",objj_msgSend(_db,"className"),_db,objj_msgSend(objj_msgSend(_db,"compoundTypes"),"componentsJoinedByString:",", "));
}else{
if(_templateType==1&&_rightIsWildcard){
return objj_msgSend(CPString,"stringWithFormat:","<%@ %p [%@] [%@] %d>",objj_msgSend(_db,"className"),_db,objj_msgSend(objj_msgSend(_db,"leftExpressions"),"componentsJoinedByString:",", "),objj_msgSend(objj_msgSend(_db,"operators"),"componentsJoinedByString:",", "),objj_msgSend(_db,"rightExpressionAttributeType"));
}else{
return objj_msgSend(CPString,"stringWithFormat:","<%@ %p [%@] [%@] [%@]>",objj_msgSend(_db,"className"),_db,objj_msgSend(objj_msgSend(_db,"leftExpressions"),"componentsJoinedByString:",", "),objj_msgSend(objj_msgSend(_db,"operators"),"componentsJoinedByString:",", "),objj_msgSend(objj_msgSend(_db,"rightExpressions"),"componentsJoinedByString:",", "));
}
}
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("_bestMatchForPredicate:inTemplates:quality:"),function(_dd,_de,_df,_e0,_e1){
with(_dd){
var _e2=objj_msgSend(_e0,"count"),_e3=0,_e4=CPNotFound,i;
for(i=0;i<_e2;i++){
var _e5=objj_msgSend(_e0,"objectAtIndex:",i),_e6=objj_msgSend(_e5,"matchForPredicate:",_df);
if(_e6>_e3){
_e4=i;
_e3=_e6;
}
}
if(_e4==CPNotFound){
objj_msgSend(CPException,"raise:reason:",CPRangeException,"Unable to find template matching predicate: "+objj_msgSend(_df,"predicateFormat"));
return nil;
}
return objj_msgSend(_e0,"objectAtIndex:",_e4);
}
}),new objj_method(sel_getUid("_operatorsForAttributeType:"),function(_e7,_e8,_e9){
with(_e7){
var _ea=objj_msgSend(CPMutableArray,"array");
switch(_e9){
case CPInteger16AttributeType:
objj_msgSend(_ea,"addObjects:",4,5,0,2,1,3);
break;
case CPInteger32AttributeType:
objj_msgSend(_ea,"addObjects:",4,5,0,2,1,3);
break;
case CPInteger64AttributeType:
objj_msgSend(_ea,"addObjects:",4,5,0,2,1,3);
break;
case CPDecimalAttributeType:
objj_msgSend(_ea,"addObjects:",4,5,0,2,1,3);
break;
case CPDoubleAttributeType:
objj_msgSend(_ea,"addObjects:",4,5,0,2,1,3);
break;
case CPFloatAttributeType:
objj_msgSend(_ea,"addObjects:",4,5,0,2,1,3);
break;
case CPStringAttributeType:
objj_msgSend(_ea,"addObjects:",99,4,5,8,9);
break;
case CPBooleanAttributeType:
objj_msgSend(_ea,"addObjects:",4,5);
break;
case CPDateAttributeType:
objj_msgSend(_ea,"addObjects:",4,5,0,2,1,3);
break;
default:
CPLogConsole("Cannot create operators for an CPAttributeType "+_e9);
break;
}
return _ea;
}
})]);
var _eb="CPPredicateTemplateType",_ec="CPPredicateTemplateOptions",_ed="CPPredicateTemplateModifier",_ee="CPPredicateTemplateLeftAttributeType",_ef="CPPredicateTemplateRightAttributeType",_f0="CPPredicateTemplateLeftIsWildcard",_f1="CPPredicateTemplateRightIsWildcard",_f2="CPPredicateTemplateViews";
var _1=objj_getClass("SPPredicateEditorRowTemplate");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"SPPredicateEditorRowTemplate\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_f3,_f4,_f5){
with(_f3){
_f3=objj_msgSendSuper({receiver:_f3,super_class:objj_getClass("SPPredicateEditorRowTemplate").super_class},"init");
if(_f3!=nil){
_templateType=objj_msgSend(_f5,"decodeIntForKey:",_eb);
_predicateOptions=objj_msgSend(_f5,"decodeIntForKey:",_ec);
_predicateModifier=objj_msgSend(_f5,"decodeIntForKey:",_ed);
_leftAttributeType=objj_msgSend(_f5,"decodeIntForKey:",_ee);
_rightAttributeType=objj_msgSend(_f5,"decodeIntForKey:",_ef);
_leftIsWildcard=objj_msgSend(_f5,"decodeBoolForKey:",_f0);
_rightIsWildcard=objj_msgSend(_f5,"decodeBoolForKey:",_f1);
_views=objj_msgSend(_f5,"decodeObjectForKey:",_f2);
if(_templateType==1&&_leftIsWildcard==NO){
var _f6=objj_msgSend(_views[0],"itemArray"),_f7=objj_msgSend(_f6,"count");
for(var i=0;i<_f7;i++){
var _f8=_f6[i];
if(objj_msgSend(_f8,"representedObject")==nil){
var exp=objj_msgSend(CPExpression,"expressionForKeyPath:",objj_msgSend(_f8,"title"));
objj_msgSend(_f8,"setRepresentedObject:",exp);
}
}
}
}
return _f3;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_f9,_fa,_fb){
with(_f9){
objj_msgSend(_fb,"encodeInt:forKey:",_templateType,_eb);
objj_msgSend(_fb,"encodeInt:forKey:",_predicateOptions,_ec);
objj_msgSend(_fb,"encodeInt:forKey:",_predicateModifier,_ed);
objj_msgSend(_fb,"encodeInt:forKey:",_leftAttributeType,_ee);
objj_msgSend(_fb,"encodeInt:forKey:",_rightAttributeType,_ef);
objj_msgSend(_fb,"encodeBool:forKey:",_leftIsWildcard,_f0);
objj_msgSend(_fb,"encodeBool:forKey:",_rightIsWildcard,_f1);
objj_msgSend(_fb,"encodeObject:forKey:",_views,_f2);
}
})]);
p;14;SPRuleEditor.jt;29097;@STATIC;1.0;I;24;Foundation/CPPredicate.jI;20;Foundation/CPArray.jI;25;Foundation/CPDictionary.jI;23;Foundation/CPIndexSet.jI;24;AppKit/CPViewAnimation.jI;15;AppKit/CPView.ji;19;SPRuleEditorModel.ji;18;SPRuleEditorView.ji;23;SPRuleEditorCriterion.jt;28841;
objj_executeFile("Foundation/CPPredicate.j",NO);
objj_executeFile("Foundation/CPArray.j",NO);
objj_executeFile("Foundation/CPDictionary.j",NO);
objj_executeFile("Foundation/CPIndexSet.j",NO);
objj_executeFile("AppKit/CPViewAnimation.j",NO);
objj_executeFile("AppKit/CPView.j",NO);
objj_executeFile("SPRuleEditorModel.j",YES);
objj_executeFile("SPRuleEditorView.j",YES);
objj_executeFile("SPRuleEditorCriterion.j",YES);
SPRuleEditorPredicateLeftExpression="SPRuleEditorPredicateLeftExpression";
SPRuleEditorPredicateRightExpression="SPRuleEditorPredicateRightExpression";
SPRuleEditorPredicateComparisonModifier="SPRuleEditorPredicateComparisonModifier";
SPRuleEditorPredicateOptions="SPRuleEditorPredicateOptions";
SPRuleEditorPredicateOperatorType="SPRuleEditorPredicateOperatorType";
SPRuleEditorPredicateCustomSelector="SPRuleEditorPredicateCustomSelector";
SPRuleEditorPredicateCompoundType="SPRuleEditorPredicateCompoundType";
SPRuleEditorRowsDidChangeNotification="SPRuleEditorRowsDidChangeNotification";
SPRuleEditorItemPBoardType="SPRuleEditorItemPBoardType";
var _1=objj_allocateClassPair(CPControl,"SPRuleEditor"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_model"),new objj_ivar("_delegate"),new objj_ivar("_predicate"),new objj_ivar("_rowClass"),new objj_ivar("_rowTypeKeyPath"),new objj_ivar("_subrowsKeyPath"),new objj_ivar("_criteriaKeyPath"),new objj_ivar("_displayValuesKeyPath"),new objj_ivar("_stringsFilename"),new objj_ivar("_standardLocalizer"),new objj_ivar("_contentView")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("model"),function(_3,_4){
with(_3){
return _model;
}
}),new objj_method(sel_getUid("delegate"),function(_5,_6){
with(_5){
return _delegate;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_7,_8,_9){
with(_7){
_delegate=_9;
}
}),new objj_method(sel_getUid("predicate"),function(_a,_b){
with(_a){
return _predicate;
}
}),new objj_method(sel_getUid("rowClass"),function(_c,_d){
with(_c){
return _rowClass;
}
}),new objj_method(sel_getUid("setRowClass:"),function(_e,_f,_10){
with(_e){
_rowClass=_10;
}
}),new objj_method(sel_getUid("rowTypeKeyPath"),function(_11,_12){
with(_11){
return _rowTypeKeyPath;
}
}),new objj_method(sel_getUid("setRowTypeKeyPath:"),function(_13,_14,_15){
with(_13){
_rowTypeKeyPath=_15;
}
}),new objj_method(sel_getUid("subrowsKeyPath"),function(_16,_17){
with(_16){
return _subrowsKeyPath;
}
}),new objj_method(sel_getUid("setSubrowsKeyPath:"),function(_18,_19,_1a){
with(_18){
_subrowsKeyPath=_1a;
}
}),new objj_method(sel_getUid("criteriaKeyPath"),function(_1b,_1c){
with(_1b){
return _criteriaKeyPath;
}
}),new objj_method(sel_getUid("setCriteriaKeyPath:"),function(_1d,_1e,_1f){
with(_1d){
_criteriaKeyPath=_1f;
}
}),new objj_method(sel_getUid("displayValuesKeyPath"),function(_20,_21){
with(_20){
return _displayValuesKeyPath;
}
}),new objj_method(sel_getUid("setDisplayValuesKeyPath:"),function(_22,_23,_24){
with(_22){
_displayValuesKeyPath=_24;
}
}),new objj_method(sel_getUid("standardLocalizer"),function(_25,_26){
with(_25){
return _standardLocalizer;
}
}),new objj_method(sel_getUid("setStandardLocalizer:"),function(_27,_28,_29){
with(_27){
_standardLocalizer=_29;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_2a,_2b,_2c){
with(_2a){
_2a=objj_msgSendSuper({receiver:_2a,super_class:objj_getClass("SPRuleEditor").super_class},"initWithFrame:",_2c);
if(!_2a){
return _2a;
}
objj_msgSend(_2a,"_build");
return _2a;
}
}),new objj_method(sel_getUid("_build"),function(_2d,_2e){
with(_2d){
_model=objj_msgSend(objj_msgSend(SPRuleEditorModel,"alloc"),"initWithNestingMode:",SPRuleEditorNestingModeCompound);
objj_msgSend(_model,"setCanRemoveAllRows:",NO);
objj_msgSend(_2d,"registerForDraggedTypes:",objj_msgSend(CPArray,"arrayWithObjects:",SPRuleEditorItemPBoardType,nil));
_contentView=objj_msgSend(objj_msgSend(SPRuleEditorView,"alloc"),"initWithFrame:",objj_msgSend(_2d,"bounds"));
objj_msgSend(_contentView,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_2d,"addSubview:",_contentView);
var _2f=objj_msgSend(CPNotificationCenter,"defaultCenter");
objj_msgSend(_2f,"addObserver:selector:name:object:",_2d,sel_getUid("_contentFrameChanged:"),CPViewFrameDidChangeNotification,_contentView);
objj_msgSend(_2f,"addObserver:selector:name:object:",_2d,sel_getUid("notifyRowAdded:"),SPRuleEditorModelRowAdded,_model);
objj_msgSend(_2f,"addObserver:selector:name:object:",_2d,sel_getUid("notifyRowRemoved:"),SPRuleEditorModelRowRemoved,_model);
objj_msgSend(_2f,"addObserver:selector:name:object:",_2d,sel_getUid("notifyRowModified:"),SPRuleEditorModelRowModified,_model);
objj_msgSend(_contentView,"setDelegate:",_2d);
objj_msgSend(_contentView,"setModel:",_model);
}
}),new objj_method(sel_getUid("removeFromSuperview"),function(_30,_31){
with(_30){
if(objj_msgSend(_30,"superview")){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"removeObserver:",_30);
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"removeObserver:",_30);
}
}),new objj_method(sel_getUid("_contentFrameChanged:"),function(_32,_33,_34){
with(_32){
var _35=objj_msgSend(_contentView,"frameSize");
if(CGSizeEqualToSize(_35,objj_msgSend(_32,"frameSize"))){
return;
}
objj_msgSend(_contentView,"setPostsFrameChangedNotifications:",NO);
objj_msgSend(_32,"setFrameSize:",_35);
objj_msgSend(_contentView,"setPostsFrameChangedNotifications:",YES);
}
}),new objj_method(sel_getUid("viewDidMoveToSuperview"),function(_36,_37){
with(_36){
objj_msgSendSuper({receiver:_36,super_class:objj_getClass("SPRuleEditor").super_class},"viewDidMoveToSuperview");
var ua=window.navigator.userAgent;
var _38=ua.indexOf("Chrome")!=-1;
if(_38&&objj_msgSend(objj_msgSend(_36,"superview"),"isKindOfClass:",CPClipView)){
objj_msgSend(objj_msgSend(_36,"superview"),"setPostsBoundsChangedNotifications:",YES);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_36,sel_getUid("_wasScrolled:"),CPViewBoundsDidChangeNotification,objj_msgSend(_36,"superview"));
}
}
}),new objj_method(sel_getUid("_wasScrolled:"),function(_39,_3a,_3b){
with(_39){
objj_msgSend(_contentView,"forceRedrawForChromeBug");
}
}),new objj_method(sel_getUid("delegate"),function(_3c,_3d){
with(_3c){
return _delegate;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_3e,_3f,_40){
with(_3e){
if(_delegate==_40){
return;
}
if(_40&&(!objj_msgSend(_40,"respondsToSelector:",sel_getUid("ruleEditor:numberOfChildrenForCriterion:withRowType:"))||!objj_msgSend(_40,"respondsToSelector:",sel_getUid("ruleEditor:displayValueForCriterion:inRow:"))||!objj_msgSend(_40,"respondsToSelector:",sel_getUid("ruleEditor:child:forCriterion:withRowType:")))){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,_3f+" : missing required delegate methods");
}
_delegate=_40;
}
}),new objj_method(sel_getUid("isEditable"),function(_41,_42){
with(_41){
return objj_msgSend(_contentView,"editable");
}
}),new objj_method(sel_getUid("setEditable:"),function(_43,_44,_45){
with(_43){
objj_msgSend(_contentView,"setEditable:",_45);
}
}),new objj_method(sel_getUid("nestingMode"),function(_46,_47){
with(_46){
return objj_msgSend(_model,"nestingMode");
}
}),new objj_method(sel_getUid("setNestingMode:"),function(_48,_49,_4a){
with(_48){
objj_msgSend(_model,"setNestingMode:",_4a);
}
}),new objj_method(sel_getUid("canRemoveAllRows"),function(_4b,_4c){
with(_4b){
return objj_msgSend(_model,"canRemoveAllRows");
}
}),new objj_method(sel_getUid("setCanRemoveAllRows:"),function(_4d,_4e,_4f){
with(_4d){
objj_msgSend(_model,"setCanRemoveAllRows:",_4f);
}
}),new objj_method(sel_getUid("rowHeight"),function(_50,_51){
with(_50){
return objj_msgSend(_contentView,"rowHeight");
}
}),new objj_method(sel_getUid("setRowHeight:"),function(_52,_53,_54){
with(_52){
objj_msgSend(_contentView,"setRowHeight:",_54);
}
}),new objj_method(sel_getUid("formattingDictionary"),function(_55,_56){
with(_55){
return objj_msgSend(_standardLocalizer,"dictionary");
}
}),new objj_method(sel_getUid("setFormattingDictionary:"),function(_57,_58,_59){
with(_57){
objj_msgSend(_standardLocalizer,"setDictionary:",_59);
_stringsFilename=nil;
}
}),new objj_method(sel_getUid("formattingStringsFilename"),function(_5a,_5b){
with(_5a){
return _stringsFilename;
}
}),new objj_method(sel_getUid("setFormattingStringsFilename:"),function(_5c,_5d,_5e){
with(_5c){
if(_standardLocalizer==nil){
_standardLocalizer=objj_msgSend(SPRuleEditorLocalizer,"new");
}
if(_stringsFilename!=_5e){
_stringsFilename=_5e;
if(_5e!==nil){
if(!objj_msgSend(_5e,"hasSuffix:",".strings")){
_5e=_5e+".strings";
}
var _5f=objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:",_5e);
if(_5f!=nil){
objj_msgSend(_standardLocalizer,"loadContentOfURL:",objj_msgSend(CPURL,"URLWithString:",_5f));
}
}
}
}
}),new objj_method(sel_getUid("reloadCriteria"),function(_60,_61){
with(_60){
}
}),new objj_method(sel_getUid("setCriteria:andDisplayValues:forRowAtIndex:"),function(_62,_63,_64,_65,_66){
with(_62){
if(!_64||!_65){
return;
}
var row=objj_msgSend(_model,"rowAtIndex:",_66);
if(!row){
return;
}
var _67=objj_msgSend(_64,"count");
if(!_67){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_63+" : invalid criterion array, must not be empty");
}
var _68;
var _69;
var _6a;
var _6b=objj_msgSend(_65,"count");
var res=objj_msgSend(CPArray,"initWithCapacity:",_67);
for(var i=0;i<_67;i++){
_68=objj_msgSend(_64,"objectAtIndex:",i);
if(!_68||!objj_msgSend(_68,"isKindOfClass:",CPArray)){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_63+" : invalid criteria : criteria must be an array of arrays");
}
_69=(i<_6b)?_65[i]:nil;
_6a=objj_msgSend(objj_msgSend(SPRuleEditorCriterion,"alloc"),"initWithItems:displayValue:",_68,_69);
objj_msgSend(res,"addObject:",_6a);
}
objj_msgSend(row,"setCriteria:",res);
}
}),new objj_method(sel_getUid("criteriaForRow:"),function(_6c,_6d,_6e){
with(_6c){
var row=objj_msgSend(_model,"rowAtIndex:",_6e);
if(!row){
return nil;
}
return objj_msgSend(row,"criteriaItems");
}
}),new objj_method(sel_getUid("displayValuesForRow:"),function(_6f,_70,_71){
with(_6f){
var row=objj_msgSend(_model,"rowAtIndex:",_71);
if(!row){
return nil;
}
return objj_msgSend(row,"criteriaDisplayValues");
}
}),new objj_method(sel_getUid("numberOfRows"),function(_72,_73){
with(_72){
return objj_msgSend(_model,"flatRowsCount");
}
}),new objj_method(sel_getUid("parentRowForRow:"),function(_74,_75,_76){
with(_74){
var row=objj_msgSend(_model,"rowAtIndex:",_76);
if(!row){
return nil;
}
return objj_msgSend(row,"parent");
}
}),new objj_method(sel_getUid("rowForDisplayValue:"),function(_77,_78,_79){
with(_77){
return objj_msgSend(_model,"rowWithDisplayValue:",_79);
}
}),new objj_method(sel_getUid("rowTypeForRow:"),function(_7a,_7b,_7c){
with(_7a){
var row=objj_msgSend(_model,"rowAtIndex:",_7c);
if(!row){
return nil;
}
return objj_msgSend(row,"rowType");
}
}),new objj_method(sel_getUid("subrowIndexesForRow:"),function(_7d,_7e,_7f){
with(_7d){
return objj_msgSend(_model,"immediateSubrowsIndexesOfRowAtIndex:",_7f);
}
}),new objj_method(sel_getUid("selectedRowIndexes"),function(_80,_81){
with(_80){
return nil;
}
}),new objj_method(sel_getUid("selectRowIndexes:byExtendingSelection:"),function(_82,_83,_84,_85){
with(_82){
}
}),new objj_method(sel_getUid("addRow:"),function(_86,_87,_88){
with(_86){
var _89=objj_msgSend(_model,"defaultRowType");
var _8a=objj_msgSend(_model,"lastRowIndex")+1;
var _8b=objj_msgSend(_86,"refreshCriteriaForNewRowOfType:atIndex:",_89,_8a);
_8b=objj_msgSend(_86,"willInsertNewRowWithCriteria:atIndex:",_8b,_8a);
if(!_8b){
return;
}
objj_msgSend(_model,"addNewRowOfType:criteria:",_89,_8b);
}
}),new objj_method(sel_getUid("insertRowAtIndex:withType:asSubrowOfRow:animate:"),function(_8c,_8d,_8e,_8f,_90,_91){
with(_8c){
var _92=objj_msgSend(_8c,"refreshCriteriaForNewRowOfType:atIndex:",_8f,_8e);
_92=objj_msgSend(_8c,"willInsertNewRowWithCriteria:atIndex:",_92,_8e);
if(!_92){
return;
}
objj_msgSend(_model,"insertNewRowAtIndex:ofType:withParentRowIndex:criteria:data:",_8e,_8f,_90,_92,nil);
}
}),new objj_method(sel_getUid("removeRowAtIndex:"),function(_93,_94,_95){
with(_93){
objj_msgSend(_model,"removeRowAtIndex:includeSubrows:",_95,NO);
}
}),new objj_method(sel_getUid("removeRowsAtIndexes:includeSubrows:"),function(_96,_97,_98,_99){
with(_96){
objj_msgSend(_model,"removeRowsAtIndexes:includeSubrows:",rowIndex,_99);
}
}),new objj_method(sel_getUid("rowClass"),function(_9a,_9b){
with(_9a){
return _rowClass;
}
}),new objj_method(sel_getUid("setRowClass:"),function(_9c,_9d,_9e){
with(_9c){
if(_rowClass!==_9e){
_rowClass=_9e;
}
}
}),new objj_method(sel_getUid("rowTypeKeyPath"),function(_9f,_a0){
with(_9f){
return _rowTypeKeyPath;
}
}),new objj_method(sel_getUid("setRowTypeKeyPath:"),function(_a1,_a2,_a3){
with(_a1){
if(_rowTypeKeyPath!==_a3){
_rowTypeKeyPath=_a3;
}
}
}),new objj_method(sel_getUid("subrowsKeyPath"),function(_a4,_a5){
with(_a4){
return _subrowsKeyPath;
}
}),new objj_method(sel_getUid("setSubrowsKeyPath:"),function(_a6,_a7,_a8){
with(_a6){
if(_subrowsKeyPath!==_a8){
_subrowsKeyPath=_a8;
}
}
}),new objj_method(sel_getUid("criteriaKeyPath"),function(_a9,_aa){
with(_a9){
return _criteriaKeyPath;
}
}),new objj_method(sel_getUid("setCriteriaKeyPath:"),function(_ab,_ac,_ad){
with(_ab){
if(_criteriaKeyPath!==_ad){
_criteriaKeyPath=_ad;
}
}
}),new objj_method(sel_getUid("displayValuesKeyPath"),function(_ae,_af){
with(_ae){
return _displayValuesKeyPath;
}
}),new objj_method(sel_getUid("setDisplayValuesKeyPath:"),function(_b0,_b1,_b2){
with(_b0){
if(_displayValuesKeyPath!==_b2){
_displayValuesKeyPath=_b2;
}
}
}),new objj_method(sel_getUid("animation"),function(_b3,_b4){
with(_b3){
return nil;
}
}),new objj_method(sel_getUid("setAnimation:"),function(_b5,_b6,_b7){
with(_b5){
}
}),new objj_method(sel_getUid("refreshCriteriaForNewRowOfType:atIndex:"),function(_b8,_b9,_ba,_bb){
with(_b8){
return objj_msgSend(_b8,"refreshCriteriaForRow:rowIndex:rowType:startingAtIndex:currentValueIndex:currentValue:",nil,_bb,_ba,0,0,nil);
}
}),new objj_method(sel_getUid("refreshCriteriaForRow:rowIndex:rowType:startingAtIndex:currentValueIndex:currentValue:"),function(_bc,_bd,_be,_bf,_c0,_c1,_c2,_c3){
with(_bc){
if(!_be&&_c1>0){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_bd+" : startingIndex must be 0 when refreshing criteria from delegate when row is not yet created");
}
if(_be&&_c2<0){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_bd+" : parentValueIndex must be >= 0");
}
var _c4;
var _c5=nil;
var _c6=nil;
if(_be&&_c1>=0){
var _c4=objj_msgSend(_be,"criteria");
var _c7=objj_msgSend(_c4,"count");
for(var i=_c1;i<_c7;i++){
objj_msgSend(_c4,"removeObjectAtIndex:",_c1);
}
_c7=objj_msgSend(_c4,"count");
if(_c7){
_c5=_c4[_c7-1];
objj_msgSend(_c5,"setDisplayValue:",_c3);
}
}else{
_c4=objj_msgSend(objj_msgSend(CPMutableArray,"alloc"),"init");
}
if(_c5){
var _c8=objj_msgSend(_c5,"items");
var _c7=_c8?objj_msgSend(_c8,"count"):0;
if(!_c7){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_bd+" : invalid internal criterion object");
}
if(_c2>=_c7){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_bd+" : invalid internal criterion object");
}
_c6=_c8[_c2];
objj_msgSend(_c5,"setCurrentIndex:",_c2);
}
var _c9;
var _ca;
var _cb=nil;
var nb;
var _cc=YES;
while((nb=objj_msgSend(_delegate,"ruleEditor:numberOfChildrenForCriterion:withRowType:",_bc,_c6,_c0))>0){
var _c8=objj_msgSend(CPMutableArray,"arrayWithCapacity:",nb);
for(var i=0;i<nb;i++){
_ca=objj_msgSend(_delegate,"ruleEditor:child:forCriterion:withRowType:",_bc,i,_c6,_c0);
if(!_ca){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_bd+" : delegate must return not null criterion children");
}
objj_msgSend(_c8,"addObject:",_ca);
}
if(_c6==objj_msgSend(_c8,"objectAtIndex:",0)){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_bd+" : infinite loop detected");
}
if(_cc){
_cc=NO;
var _cd;
for(var i=0;i<nb;i++){
_ca=objj_msgSend(_c8,"objectAtIndex:",i);
_cd=objj_msgSend(_delegate,"ruleEditor:displayValueForCriterion:inRow:",_bc,_ca,_bf);
if(objj_msgSend(_cd,"isKindOfClass:",CPMenuItem)&&objj_msgSend(_cd,"isSeparatorItem")){
continue;
}
if(!objj_msgSend(_bc,"rowForDisplayValue:",_cd)){
_c6=_ca;
_cb=_cd;
break;
}
}
if(!_cb){
do{
var _ce=(new Date().getTime()%2)==0;
var _cf=Math.random()*(nb-1);
var idx=_ce?Math.ceil(_cf):Math.floor(_cf);
idx=Math.min(idx,nb-1);
_c6=objj_msgSend(_c8,"objectAtIndex:",idx);
_cb=objj_msgSend(_delegate,"ruleEditor:displayValueForCriterion:inRow:",_bc,_c6,_bf);
}while(objj_msgSend(_cb,"isKindOfClass:",CPMenuItem)&&objj_msgSend(_cb,"isSeparatorItem"));
}
}else{
_c6=objj_msgSend(_c8,"objectAtIndex:",0);
_cb=objj_msgSend(_delegate,"ruleEditor:displayValueForCriterion:inRow:",_bc,_c6,_bf);
}
objj_msgSend(_c4,"addObject:",objj_msgSend(objj_msgSend(SPRuleEditorCriterion,"alloc"),"initWithItems:displayValue:",_c8,_cb));
}
return _c4;
}
}),new objj_method(sel_getUid("predicate"),function(_d0,_d1){
with(_d0){
if(_predicate){
return _predicate;
}
objj_msgSend(_d0,"reloadPredicate");
return _predicate;
}
}),new objj_method(sel_getUid("reloadPredicate"),function(_d2,_d3){
with(_d2){
var _d4=objj_msgSend(_model,"rowsCount");
if(!_d4){
return;
}
var row;
var _d5;
var _d6=objj_msgSend(CPMutableArray,"array");
var _d7=objj_msgSend(_d2,"subrowIndexesForRow:",-1);
var _d8=_d7?objj_msgSend(_d7,"firstIndex"):CPNotFound;
while(_d8!=CPNotFound){
row=objj_msgSend(_model,"rowAtIndex:",_d8);
_d5=objj_msgSend(_d2,"predicateForRow:",_d8);
if(_d5){
objj_msgSend(_d6,"addObject:",_d5);
}
_d8=objj_msgSend(_d7,"indexGreaterThanIndex:",_d8);
}
if(objj_msgSend(_d6,"count")==1&&objj_msgSend(objj_msgSend(_d6,"objectAtIndex:",0),"isKindOfClass:",CPCompoundPredicate)){
_predicate=objj_msgSend(_d6,"objectAtIndex:",0);
if(objj_msgSend(_predicate,"compoundPredicateType")==CPNotPredicateType){
var _d6=objj_msgSend(_predicate,"subpredicates");
var _d5=objj_msgSend(objj_msgSend(CPCompoundPredicate,"alloc"),"initWithType:subpredicates:",CPOrPredicateType,_d6);
_predicate=objj_msgSend(objj_msgSend(CPCompoundPredicate,"alloc"),"initWithType:subpredicates:",CPNotPredicateType,objj_msgSend(CPArray,"arrayWithObject:",_d5));
}
return;
}
_predicate=objj_msgSend(objj_msgSend(CPCompoundPredicate,"alloc"),"initWithType:subpredicates:",CPAndPredicateType,_d6);
}
}),new objj_method(sel_getUid("predicateForRow:"),function(_d9,_da,_db){
with(_d9){
if(!_delegate||!objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("ruleEditor:predicatePartsForCriterion:withDisplayValue:inRow:"))){
return nil;
}
var row=objj_msgSend(_model,"rowAtIndex:",_db);
if(!row){
return nil;
}
var _dc;
var _dd=objj_msgSend(row,"criteria");
var _de=objj_msgSend(_dd,"count");
var _df;
var _e0;
var _e1;
var _e2;
var _e3=objj_msgSend(CPDictionary,"dictionary");
for(var i=0;i<_de;i++){
_df=objj_msgSend(_dd,"objectAtIndex:",i);
_e0=objj_msgSend(_df,"currentItem");
if(!_e0){
continue;
}
_e1=objj_msgSend(_df,"displayValue");
_e2=objj_msgSend(_delegate,"ruleEditor:predicatePartsForCriterion:withDisplayValue:inRow:",_d9,_e0,_e1,_db);
if(_e2){
objj_msgSend(_e3,"addEntriesFromDictionary:",_e2);
}
}
if(objj_msgSend(row,"rowType")==SPRuleEditorRowTypeCompound){
var _e4=objj_msgSend(_e3,"objectForKey:",SPRuleEditorPredicateCompoundType);
return objj_msgSend(_d9,"compoundPredicateForRow:compoundType:",row,_e4);
}
var _e5=objj_msgSend(_e3,"objectForKey:",SPRuleEditorPredicateOptions);
var _e6=objj_msgSend(_e3,"objectForKey:",SPRuleEditorPredicateComparisonModifier);
var _e7=CPSelectorFromString(objj_msgSend(_e3,"objectForKey:",SPRuleEditorPredicateCustomSelector));
try{
if(_e7){
return objj_msgSend(CPComparisonPredicate,"predicateWithLeftExpression:rightExpression:customSelector:",objj_msgSend(_e3,"objectForKey:",SPRuleEditorPredicateLeftExpression),objj_msgSend(_e3,"objectForKey:",SPRuleEditorPredicateRightExpression),_e7);
}
return objj_msgSend(CPComparisonPredicate,"predicateWithLeftExpression:rightExpression:modifier:type:options:",objj_msgSend(_e3,"objectForKey:",SPRuleEditorPredicateLeftExpression),objj_msgSend(_e3,"objectForKey:",SPRuleEditorPredicateRightExpression),(_e6||CPDirectPredicateModifier),objj_msgSend(_e3,"objectForKey:",SPRuleEditorPredicateOperatorType),(_e5||CPCaseInsensitivePredicateOption));
}
catch(error){
CPLog.debug("predicate error: ["+objj_msgSend(error,"description")+"] for row "+aRow);
return nil;
}
}
}),new objj_method(sel_getUid("compoundPredicateForRow:compoundType:"),function(_e8,_e9,row,_ea){
with(_e8){
if(!row){
return nil;
}
var _eb;
var _ec;
var _ed=objj_msgSend(CPMutableArray,"array");
var _ee=objj_msgSend(row,"subrowsCount");
for(var i=0;i<_ee;i++){
_eb=objj_msgSend(row,"childAtIndex:",i);
_ec=objj_msgSend(_e8,"predicateForRow:",objj_msgSend(_model,"indexOfRow:",_eb));
if(!_ec){
continue;
}
objj_msgSend(_ed,"addObject:",_ec);
}
if(!objj_msgSend(_ed,"count")){
return nil;
}
try{
return objj_msgSend(objj_msgSend(CPCompoundPredicate,"alloc"),"initWithType:subpredicates:",_ea,_ed);
}
catch(error){
CPLog.debug("predicate error"+objj_msgSend(error,"description"));
return nil;
}
}
}),new objj_method(sel_getUid("willInsertNewRowWithCriteria:atIndex:"),function(_ef,_f0,_f1,_f2){
with(_ef){
return _f1;
}
}),new objj_method(sel_getUid("didAddRow:"),function(_f3,_f4,row){
with(_f3){
}
}),new objj_method(sel_getUid("willModifyRow:"),function(_f5,_f6,row){
with(_f5){
}
}),new objj_method(sel_getUid("didModifyRow:"),function(_f7,_f8,row){
with(_f7){
}
}),new objj_method(sel_getUid("didRemoveRow:"),function(_f9,_fa,row){
with(_f9){
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("defaultThemeClass"),function(_fb,_fc){
with(_fb){
return "rule-editor";
}
}),new objj_method(sel_getUid("themeAttributes"),function(_fd,_fe){
with(_fd){
return objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[objj_msgSend(CPNull,"null"),objj_msgSend(CPNull,"null"),objj_msgSend(CPNull,"null"),objj_msgSend(CPNull,"null"),objj_msgSend(CPNull,"null"),objj_msgSend(CPNull,"null"),objj_msgSend(CPNull,"null"),objj_msgSend(CPNull,"null")],["alternating-row-colors","selected-color","slice-top-border-color","slice-bottom-border-color","slice-last-bottom-border-color","font","add-image","remove-image"]);
}
})]);
var _1=objj_getClass("SPRuleEditor");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"SPRuleEditor\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("notifyRowAdded:"),function(_ff,_100,_101){
with(_ff){
if(!_101){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_100+" : null notification");
}
var _102=objj_msgSend(_101,"userInfo");
if(!_102){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_100+" : notification userInfo is null");
}
var row=objj_msgSend(_102,"valueForKey:","row");
if(!row){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_100+" : notification userInfo is missing row");
}
objj_msgSend(_ff,"didAddRow:",row);
objj_msgSend(_ff,"notifyRowsDidChange:",_101);
}
}),new objj_method(sel_getUid("notifyRowRemoved:"),function(self,_103,_104){
with(self){
if(!_104){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_103+" : null notification");
}
var _105=objj_msgSend(_104,"userInfo");
if(!_105){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_103+" : notification userInfo is null");
}
var row=objj_msgSend(_105,"valueForKey:","row");
if(!row){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_103+" : notification userInfo is missing row");
}
objj_msgSend(self,"didRemoveRow:",row);
objj_msgSend(self,"notifyRowsDidChange:",_104);
}
}),new objj_method(sel_getUid("notifyRowModified:"),function(self,_106,_107){
with(self){
if(!_107){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_106+" : null notification");
}
var _108=objj_msgSend(_107,"userInfo");
if(!_108){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_106+" : notification userInfo is null");
}
var row=objj_msgSend(_108,"valueForKey:","row");
if(!row){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_106+" : notification userInfo is missing row");
}
objj_msgSend(self,"didModifyRow:",row);
objj_msgSend(self,"notifyRowsDidChange:",_107);
}
}),new objj_method(sel_getUid("notifyRowsDidChange:"),function(self,_109,_10a){
with(self){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",SPRuleEditorRowsDidChangeNotification,self);
if(!_delegate||!objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("ruleEditorRowsDidChange:"))){
return;
}
var _10b=objj_msgSend(CPNotification,"notificationWithName:object:",SPRuleEditorRowsDidChangeNotification,self);
objj_msgSend(_delegate,"ruleEditorRowsDidChange:",_10b);
}
})]);
var _1=objj_getClass("SPRuleEditor");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"SPRuleEditor\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("localizedString:"),function(self,_10c,text){
with(self){
if(!objj_msgSend(self,"standardLocalizer")){
return text;
}
var res=objj_msgSend(objj_msgSend(self,"standardLocalizer"),"localizedStringForString:",text);
return res!=nil?res:text;
}
}),new objj_method(sel_getUid("canMoveRow:afterRow:"),function(self,_10d,aRow,_10e){
with(self){
if(aRow==_10e||objj_msgSend(_10e,"hasAncestor:",aRow)){
return NO;
}
if(!objj_msgSend(_model,"isRowRemoveable:includeSubrows:",aRow,YES)){
return NO;
}
if(objj_msgSend(_10e,"rowType")==SPRuleEditorRowTypeCompound){
return objj_msgSend(_model,"allowNewRowInsertOfType:withParent:",objj_msgSend(aRow,"rowType"),_10e);
}else{
return objj_msgSend(_model,"allowNewRowInsertOfType:withParent:",objj_msgSend(aRow,"rowType"),objj_msgSend(_10e,"parent"));
}
}
}),new objj_method(sel_getUid("moveRow:afterRow:"),function(self,_10f,aRow,_110){
with(self){
if(!objj_msgSend(self,"canMoveRow:afterRow:",aRow,_110)){
return;
}
var _111=objj_msgSend(_model,"indexOfRow:",aRow);
var _112=objj_msgSend(_model,"removeRowAtIndex:includeSubrows:",_111,YES);
if(!_112){
return;
}
_111=objj_msgSend(_model,"indexOfRow:",_110)+1;
var _113=objj_msgSend(_110,"rowType")==SPRuleEditorRowTypeCompound?_111-1:objj_msgSend(_model,"indexOfRow:",objj_msgSend(_110,"parent"));
objj_msgSend(_model,"insertRow:atIndex:withParentRowIndex:",_112,_111,_113);
}
}),new objj_method(sel_getUid("insertNewRowOfType:afterRow:"),function(self,_114,_115,aRow){
with(self){
if(!aRow){
return;
}
var _116=objj_msgSend(_model,"indexOfRow:",aRow);
if(_116==CPNotFound){
return;
}
var _117=objj_msgSend(aRow,"rowType");
if(_117==SPRuleEditorRowTypeCompound){
_115=objj_msgSend(_model,"allowNewRowInsertOfType:withParent:",_115,aRow)?_115:SPRuleEditorRowTypeSimple;
objj_msgSend(self,"insertRowAtIndex:withType:asSubrowOfRow:animate:",_116+1,_115,_116,YES);
return;
}
var _118=objj_msgSend(aRow,"parent");
var _119=_118?objj_msgSend(_model,"indexOfRow:",_118):-1;
_116++;
objj_msgSend(self,"insertRowAtIndex:withType:asSubrowOfRow:animate:",_116,_115,_119,YES);
}
}),new objj_method(sel_getUid("isRowRemoveable:"),function(self,_11a,aRow){
with(self){
return objj_msgSend(_model,"isRowRemoveable:includeSubrows:",aRow,NO);
}
}),new objj_method(sel_getUid("removeRow:"),function(self,_11b,aRow){
with(self){
if(!aRow){
return;
}
var _11c=objj_msgSend(_model,"indexOfRow:",aRow);
if(_11c==CPNotFound){
return;
}
objj_msgSend(self,"removeRowAtIndex:",_11c);
}
}),new objj_method(sel_getUid("valueChanged:criterionIndex:valueIndex:inRow:"),function(self,_11d,_11e,_11f,_120,aRow){
with(self){
if(!aRow){
return;
}
var _121=objj_msgSend(_model,"indexOfRow:",aRow);
if(_121==CPNotFound){
return;
}
var _122=objj_msgSend(self,"refreshCriteriaForRow:rowIndex:rowType:startingAtIndex:currentValueIndex:currentValue:",aRow,_121,SPRuleEditorRowTypeSimple,_11f+1,_120,_11e);
objj_msgSend(self,"willModifyRow:",aRow);
objj_msgSend(_model,"setCriteria:forRow:",_122,aRow);
}
}),new objj_method(sel_getUid("criterionItemCopy:"),function(self,_123,item){
with(self){
return objj_msgSend(item,"copy");
}
})]);
var _1=objj_getClass("SPRuleEditor");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"SPRuleEditor\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(self,_124,_125){
with(self){
self=objj_msgSendSuper({receiver:self,super_class:objj_getClass("SPRuleEditor").super_class},"initWithCoder:",_125);
if(self!=nil){
objj_msgSend(self,"_build");
}
return self;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(self,_126,_127){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("SPRuleEditor").super_class},"encodeWithCoder:",_127);
}
})]);
p;26;SPRuleEditorActionButton.jt;2095;@STATIC;1.0;I;17;AppKit/CPButton.jt;2054;
objj_executeFile("AppKit/CPButton.j",NO);
var _1;
var _2;
var _3="progid:DXImageTransform.Microsoft.gradient(startColorstr='#fcfcfc', endColorstr='#dfdfdf')";
var _4=objj_allocateClassPair(CPButton,"SPRuleEditorActionButton"),_5=_4.isa;
class_addIvars(_4,[new objj_ivar("radius")]);
objj_registerClassPair(_4);
class_addMethods(_4,[new objj_method(sel_getUid("initWithFrame:"),function(_6,_7,_8){
with(_6){
_6=objj_msgSendSuper({receiver:_6,super_class:objj_getClass("SPRuleEditorActionButton").super_class},"initWithFrame:",_8);
if(_6){
objj_msgSend(_6,"setFont:",objj_msgSend(CPFont,"boldFontWithName:size:","Apple Symbol",12));
objj_msgSend(_6,"setTextColor:",objj_msgSend(CPColor,"colorWithWhite:alpha:",150/255,1));
objj_msgSend(_6,"setAlignment:",CPCenterTextAlignment);
objj_msgSend(_6,"setAutoresizingMask:",CPViewMinXMargin);
objj_msgSend(_6,"setImagePosition:",CPImageOnly);
objj_msgSend(_6,"setBordered:",NO);
var _9=_DOMElement.style;
_9.border="1px solid rgb(189, 189, 189)";
_9.filter=_3;
}
return _6;
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_a,_b){
with(_a){
radius=FLOOR(CGRectGetHeight(objj_msgSend(_a,"bounds"))/2);
var _c=_DOMElement.style,_d=radius+"px";
_c.borderRadius=_d;
_c.backgroundImage=(objj_msgSend(_a,"isHighlighted"))?_2:_1;
objj_msgSendSuper({receiver:_a,super_class:objj_getClass("SPRuleEditorActionButton").super_class},"layoutSubviews");
}
}),new objj_method(sel_getUid("acceptsFirstResponder"),function(_e,_f){
with(_e){
return NO;
}
})]);
class_addMethods(_5,[new objj_method(sel_getUid("initialize"),function(_10,_11){
with(_10){
if(CPBrowserIsEngine(CPWebKitBrowserEngine)){
_1="-webkit-gradient(linear, left top, left bottom, from(rgb(252, 252, 252)), to(rgb(223, 223, 223)))";
_2="-webkit-gradient(linear, left top, left bottom, from(rgb(223, 223, 223)), to(rgb(252, 252, 252)))";
}else{
if(CPBrowserIsEngine(CPGeckoBrowserEngine)){
_1="-moz-linear-gradient(top,  rgb(252, 252, 252),  rgb(223, 223, 223))";
_2="-moz-linear-gradient(top,  rgb(223, 223, 223),  rgb(252, 252, 252))";
}
}
}
})]);
p;23;SPRuleEditorCriterion.jt;4117;@STATIC;1.0;I;21;Foundation/CPObject.jI;15;AppKit/CPView.jI;19;AppKit/CPMenuItem.jt;4028;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("AppKit/CPView.j",NO);
objj_executeFile("AppKit/CPMenuItem.j",NO);
var _1=objj_allocateClassPair(CPObject,"SPRuleEditorCriterion"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_items"),new objj_ivar("_displayValue"),new objj_ivar("_currentIndex"),new objj_ivar("_hidden")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("items"),function(_3,_4){
with(_3){
return _items;
}
}),new objj_method(sel_getUid("setItems:"),function(_5,_6,_7){
with(_5){
_items=_7;
}
}),new objj_method(sel_getUid("displayValue"),function(_8,_9){
with(_8){
return _displayValue;
}
}),new objj_method(sel_getUid("setDisplayValue:"),function(_a,_b,_c){
with(_a){
_displayValue=_c;
}
}),new objj_method(sel_getUid("currentIndex"),function(_d,_e){
with(_d){
return _currentIndex;
}
}),new objj_method(sel_getUid("setCurrentIndex:"),function(_f,_10,_11){
with(_f){
_currentIndex=_11;
}
}),new objj_method(sel_getUid("hidden"),function(_12,_13){
with(_12){
return _hidden;
}
}),new objj_method(sel_getUid("setHidden:"),function(_14,_15,_16){
with(_14){
_hidden=_16;
}
}),new objj_method(sel_getUid("init"),function(_17,_18){
with(_17){
_17=objj_msgSendSuper({receiver:_17,super_class:objj_getClass("SPRuleEditorCriterion").super_class},"init");
if(!_17){
return nil;
}
_items=nil;
_displayValue=nil;
_currentIndex=-1;
_hidden=NO;
return _17;
}
}),new objj_method(sel_getUid("initWithItems:displayValue:"),function(_19,_1a,_1b,_1c){
with(_19){
_19=objj_msgSendSuper({receiver:_19,super_class:objj_getClass("SPRuleEditorCriterion").super_class},"init");
if(!_19){
return nil;
}
_items=_1b;
_displayValue=_1c;
_currentIndex=objj_msgSend(_19,"isEmpty")?-1:0;
return _19;
}
}),new objj_method(sel_getUid("currentItem"),function(_1d,_1e){
with(_1d){
if(_currentIndex==-1){
return nil;
}
var _1f=_items?objj_msgSend(_items,"count"):0;
if(!_1f||_currentIndex>=_1f){
return nil;
}
return objj_msgSend(_items,"objectAtIndex:",_currentIndex);
}
}),new objj_method(sel_getUid("isEmpty"),function(_20,_21){
with(_20){
return !_items||objj_msgSend(_items,"count")==0;
}
}),new objj_method(sel_getUid("isStandaloneView"),function(_22,_23){
with(_22){
return _items&&objj_msgSend(_items,"count")==1&&!(objj_msgSend(_items[0],"isKindOfClass:",CPMenuItem));
}
}),new objj_method(sel_getUid("isValid"),function(_24,_25){
with(_24){
if(objj_msgSend(_24,"isEmpty")){
return NO;
}
if(objj_msgSend(_24,"isStandaloneView")){
return YES;
}
var _26;
var _27=objj_msgSend(_items,"count");
for(var i=0;i<_27;i++){
_26=_items[i];
if(!(objj_msgSend(_26,"isKindOfClass:",CPMenuItem)||objj_msgSend(_26,"isKindOfClass:",CPString))){
return NO;
}
}
return YES;
}
}),new objj_method(sel_getUid("isMenu"),function(_28,_29){
with(_28){
return !objj_msgSend(_28,"isStandaloneView")&&objj_msgSend(_28,"isValid");
}
}),new objj_method(sel_getUid("standaloneView"),function(_2a,_2b){
with(_2a){
if(!objj_msgSend(_2a,"isStandaloneView")){
return nil;
}
return _items[0];
}
})]);
var _2c="items";
var _2d="displayValue";
var _2e="currentIndex";
var _2f="hidden";
var _1=objj_getClass("SPRuleEditorCriterion");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"SPRuleEditorCriterion\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_30,_31,_32){
with(_30){
_30=objj_msgSendSuper({receiver:_30,super_class:objj_getClass("SPRuleEditorCriterion").super_class},"init");
if(!_30){
return nil;
}
_items=objj_msgSend(_32,"decodeObjectForKey:",_2c);
_displayValue=objj_msgSend(_32,"decodeObjectForKey:",_2d);
_currentIndex=objj_msgSend(_32,"decodeIntForKey:",_2e);
_hidden=objj_msgSend(_32,"decodeBoolForKey:",_2f);
return _30;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_33,_34,_35){
with(_33){
objj_msgSend(_35,"encodeObject:forKey:",_items,_2c);
objj_msgSend(_35,"encodeObject:forKey:",_displayValue,_2d);
objj_msgSend(_35,"encodeInt:forKey:",_currentIndex,_2e);
objj_msgSend(_35,"encodeBool:forKey:",_hidden,_2f);
}
})]);
p;19;SPRuleEditorModel.jt;14594;@STATIC;1.0;I;21;Foundation/CPObject.ji;23;SPRuleEditorModelItem.jt;14520;
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
p;23;SPRuleEditorModelItem.jt;11633;@STATIC;1.0;I;21;Foundation/CPObject.jt;11587;
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
p;25;SPRuleEditorPopUpButton.jt;3351;@STATIC;1.0;t;3332;
var _1,_2,_3="progid:DXImageTransform.Microsoft.gradient(startColorstr='#fcfcfc', endColorstr='#dfdfdf')";
var _4=objj_allocateClassPair(CPPopUpButton,"SPRuleEditorPopUpButton"),_5=_4.isa;
class_addIvars(_4,[new objj_ivar("_radius"),new objj_ivar("_isEditable")]);
objj_registerClassPair(_4);
class_addMethods(_4,[new objj_method(sel_getUid("editable"),function(_6,_7){
with(_6){
return _isEditable;
}
}),new objj_method(sel_getUid("setEditable:"),function(_8,_9,_a){
with(_8){
_isEditable=_a;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_b,_c,_d){
with(_b){
if(_b=objj_msgSendSuper({receiver:_b,super_class:objj_getClass("SPRuleEditorPopUpButton").super_class},"initWithFrame:",_d)){
var _e=_DOMElement.style;
_e.backgroundImage=_1;
_e.border="1px solid rgb(189, 189, 189)";
_e.filter=_3;
_radius=9;
_isEditable=YES;
objj_msgSend(_b,"setTextColor:",objj_msgSend(CPColor,"colorWithWhite:alpha:",0,1));
objj_msgSend(_b,"setBordered:",NO);
}
return _b;
}
}),new objj_method(sel_getUid("editable"),function(_f,_10){
with(_f){
return objj_msgSend(_f,"enabled");
}
}),new objj_method(sel_getUid("setEditable:"),function(_11,_12,_13){
with(_11){
objj_msgSend(_11,"setEnabled:",_13);
}
}),new objj_method(sel_getUid("setHighlighted:"),function(_14,_15,_16){
with(_14){
_DOMElement.style.backgroundImage=(_16)?_2:_1;
}
}),new objj_method(sel_getUid("contentRectForBounds:"),function(_17,_18,_19){
with(_17){
var _1a=objj_msgSendSuper({receiver:_17,super_class:objj_getClass("SPRuleEditorPopUpButton").super_class},"contentRectForBounds:",_19);
_1a.origin.x+=_radius;
_1a.size.width-=2*_radius;
return _1a;
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_1b,_1c){
with(_1b){
_radius=FLOOR(CGRectGetHeight(objj_msgSend(_1b,"bounds"))/2);
var _1d=_DOMElement.style,_1e=_radius+"px";
_1d.borderRadius=_1e;
objj_msgSendSuper({receiver:_1b,super_class:objj_getClass("SPRuleEditorPopUpButton").super_class},"layoutSubviews");
}
}),new objj_method(sel_getUid("drawRect:"),function(_1f,_20,_21){
with(_1f){
var _22=objj_msgSend(_1f,"bounds"),_23=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort");
var _24=FLOOR(CGRectGetHeight(_22)/3.5);
CGContextTranslateCTM(_23,CGRectGetWidth(_22)-_radius-_24,CGRectGetHeight(_22)/2);
var _25=objj_msgSend(CPBezierPath,"bezierPath");
objj_msgSend(_25,"moveToPoint:",CGPointMake(0,1));
objj_msgSend(_25,"lineToPoint:",CGPointMake(_24,1));
objj_msgSend(_25,"lineToPoint:",CGPointMake(_24/2,_24+1));
objj_msgSend(_25,"closePath");
CGContextSetFillColor(_23,objj_msgSend(CPColor,"colorWithWhite:alpha:",101/255,1));
objj_msgSend(_25,"fill");
CGContextScaleCTM(_23,1,-1);
objj_msgSend(_25,"fill");
}
}),new objj_method(sel_getUid("acceptsFirstResponder"),function(_26,_27){
with(_26){
return NO;
}
})]);
class_addMethods(_5,[new objj_method(sel_getUid("initialize"),function(_28,_29){
with(_28){
if(CPBrowserIsEngine(CPWebKitBrowserEngine)){
_1="-webkit-gradient(linear, left top, left bottom, from(rgb(252, 252, 252)), to(rgb(223, 223, 223)))";
_2="-webkit-gradient(linear, left top, left bottom, from(rgb(223, 223, 223)), to(rgb(252, 252, 252)))";
}else{
if(CPBrowserIsEngine(CPGeckoBrowserEngine)){
_1="-moz-linear-gradient(top,  rgb(252, 252, 252),  rgb(223, 223, 223))";
_2="-moz-linear-gradient(top,  rgb(223, 223, 223),  rgb(252, 252, 252))";
}
}
}
})]);
p;21;SPRuleEditorRowView.jt;32372;@STATIC;1.0;I;21;Foundation/CPObject.jI;15;AppKit/CPView.jI;17;AppKit/CPButton.jI;20;AppKit/CPTextField.jI;15;AppKit/CPMenu.jI;22;AppKit/CPPopUpButton.jI;17;AppKit/CPButton.ji;23;SPRuleEditorCriterion.ji;25;SPRuleEditorPopUpButton.ji;26;SPRuleEditorActionButton.jt;32101;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("AppKit/CPView.j",NO);
objj_executeFile("AppKit/CPButton.j",NO);
objj_executeFile("AppKit/CPTextField.j",NO);
objj_executeFile("AppKit/CPMenu.j",NO);
objj_executeFile("AppKit/CPPopUpButton.j",NO);
objj_executeFile("AppKit/CPButton.j",NO);
objj_executeFile("SPRuleEditorCriterion.j",YES);
objj_executeFile("SPRuleEditorPopUpButton.j",YES);
objj_executeFile("SPRuleEditorActionButton.j",YES);
var _1;
var _2;
IE_FILTER="progid:DXImageTransform.Microsoft.gradient(startColorstr='#fcfcfc', endColorstr='#dfdfdf')";
SPRuleEditorRowViewRightMargin=10;
SPRuleEditorRowViewLeftMargin=10;
SPRuleEditorRowViewVerticalMargin=4;
SPRuleEditorRowViewButtonHeight=14;
SPRuleEditorRowViewButtonSpacing=6;
SPRuleEditorRowViewCriterionHeight=18;
SPRuleEditorRowViewPopUpHeight=14;
SPRuleEditorRowViewCriterionSpacing=10;
SPRuleEditorRowViewDragIndicatorHeight=3;
SPRuleEditorViewAltKeyDown="SPRuleEditorViewAltKeyDown";
SPRuleEditorViewAltKeyUp="SPRuleEditorViewAltKeyUp";
var _3=objj_allocateClassPair(CPView,"SPRuleEditorRowView"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("_contentView"),new objj_ivar("_subrowsView"),new objj_ivar("_delegate"),new objj_ivar("_item"),new objj_ivar("_selected"),new objj_ivar("_nestingMode"),new objj_ivar("_addButton"),new objj_ivar("_removeButton"),new objj_ivar("_editable"),new objj_ivar("_rowHeight"),new objj_ivar("_showDragIndicator"),new objj_ivar("_alternateAddButtonImage"),new objj_ivar("_notificationCenter"),new objj_ivar("nil"),new objj_ivar("_frozenActions"),new objj_ivar("_updating")]);
objj_registerClassPair(_3);
class_addMethods(_3,[new objj_method(sel_getUid("contentView"),function(_5,_6){
with(_5){
return _contentView;
}
}),new objj_method(sel_getUid("subrowsView"),function(_7,_8){
with(_7){
return _subrowsView;
}
}),new objj_method(sel_getUid("delegate"),function(_9,_a){
with(_9){
return _delegate;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_b,_c,_d){
with(_b){
_delegate=_d;
}
}),new objj_method(sel_getUid("item"),function(_e,_f){
with(_e){
return _item;
}
}),new objj_method(sel_getUid("setItem:"),function(_10,_11,_12){
with(_10){
_item=_12;
}
}),new objj_method(sel_getUid("selected"),function(_13,_14){
with(_13){
return _selected;
}
}),new objj_method(sel_getUid("setSelected:"),function(_15,_16,_17){
with(_15){
_selected=_17;
}
}),new objj_method(sel_getUid("nestingMode"),function(_18,_19){
with(_18){
return _nestingMode;
}
}),new objj_method(sel_getUid("setNestingMode:"),function(_1a,_1b,_1c){
with(_1a){
_nestingMode=_1c;
}
}),new objj_method(sel_getUid("addButton"),function(_1d,_1e){
with(_1d){
return _addButton;
}
}),new objj_method(sel_getUid("removeButton"),function(_1f,_20){
with(_1f){
return _removeButton;
}
}),new objj_method(sel_getUid("editable"),function(_21,_22){
with(_21){
return _editable;
}
}),new objj_method(sel_getUid("setEditable:"),function(_23,_24,_25){
with(_23){
_editable=_25;
}
}),new objj_method(sel_getUid("rowHeight"),function(_26,_27){
with(_26){
return _rowHeight;
}
}),new objj_method(sel_getUid("setRowHeight:"),function(_28,_29,_2a){
with(_28){
_rowHeight=_2a;
}
}),new objj_method(sel_getUid("showDragIndicator"),function(_2b,_2c){
with(_2b){
return _showDragIndicator;
}
}),new objj_method(sel_getUid("setShowDragIndicator:"),function(_2d,_2e,_2f){
with(_2d){
_showDragIndicator=_2f;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_30,_31,_32){
with(_30){
_30=objj_msgSendSuper({receiver:_30,super_class:objj_getClass("SPRuleEditorRowView").super_class},"initWithFrame:",_32);
if(!_30){
return nil;
}
objj_msgSend(_30,"setThemeClass:","rule-editor");
objj_msgSend(_30,"setAutoresizingMask:",CPViewWidthSizable);
_selected=NO;
_delegate=nil;
_item=nil;
_nestingMode=SPRuleEditorRowTypeSimple;
_editable=YES;
_rowHeight=_32.size.height;
_updating=NO;
_frozenActions=NO;
_alternateAddButtonImage=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:",objj_msgSend(objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(SPRuleEditor,"class")),"pathForResource:","rule-editor-add-compound.png"));
objj_msgSend(_30,"createCriteriaView");
objj_msgSend(_30,"createSubrowsView");
objj_msgSend(_30,"createButtons");
return _30;
}
}),new objj_method(sel_getUid("createButtons"),function(_33,_34){
with(_33){
_addButton=objj_msgSend(_33,"createButtonWithAction:image:atPosition:",sel_getUid("addClicked:"),objj_msgSend(_33,"valueForThemeAttribute:","add-image"),0);
_removeButton=objj_msgSend(_33,"createButtonWithAction:image:atPosition:",sel_getUid("removeClicked:"),objj_msgSend(_33,"valueForThemeAttribute:","remove-image"),1);
objj_msgSend(_33,"addSubview:",_addButton);
objj_msgSend(_33,"addSubview:",_removeButton);
}
}),new objj_method(sel_getUid("createButtonWithAction:image:atPosition:"),function(_35,_36,_37,_38,_39){
with(_35){
var _3a=objj_msgSend(_35,"frame");
var _3b=-_39*(SPRuleEditorRowViewButtonHeight+SPRuleEditorRowViewButtonSpacing);
var _3c=CGRectMake(_3a.size.width-SPRuleEditorRowViewButtonHeight-SPRuleEditorRowViewRightMargin+_3b,(_rowHeight-SPRuleEditorRowViewButtonHeight)/2,SPRuleEditorRowViewButtonHeight,SPRuleEditorRowViewButtonHeight);
var _3d=objj_msgSend(objj_msgSend(SPRuleEditorActionButton,"alloc"),"initWithFrame:",_3c);
objj_msgSend(_3d,"setImage:",_38);
objj_msgSend(_3d,"setAction:",_37);
objj_msgSend(_3d,"setTarget:",_35);
objj_msgSend(_3d,"setAutoresizingMask:",CPViewMinXMargin);
return _3d;
}
}),new objj_method(sel_getUid("createCriteriaView"),function(_3e,_3f){
with(_3e){
_contentView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",objj_msgSend(_3e,"bounds"));
objj_msgSend(_contentView,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_3e,"addSubview:",_contentView);
}
}),new objj_method(sel_getUid("createSubrowsView"),function(_40,_41){
with(_40){
var _42=objj_msgSend(_40,"bounds");
var _43=CGRectMake(0,_42.size.height,_42.size.width,0);
_subrowsView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",_43);
objj_msgSend(_subrowsView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_40,"addSubview:",_subrowsView);
}
}),new objj_method(sel_getUid("setItem:"),function(_44,_45,_46){
with(_44){
objj_msgSend(_44,"resetCriteria");
_item=_46;
var _47=objj_msgSend(_46,"criteria");
var _48;
var _49;
var _4a;
var _4b;
var _4c=objj_msgSend(_47,"count");
if(_4c==0){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_45+" : Empty SPRuleEditorCriterion");
}
_frozenActions=YES;
for(var i=0;i<_4c;i++){
_48=_47[i];
if(!objj_msgSend(_48,"isKindOfClass:",SPRuleEditorCriterion)||!objj_msgSend(_48,"isValid")){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_45+" : Invalid SPRuleEditorCriterion");
}
_4a=objj_msgSend(_48,"displayValue");
if(objj_msgSend(_48,"isStandaloneView")){
_49=objj_msgSend(_44,"addViewForCriterion:withValue:atIndex:afterCriterionView:",_48,_4a,i,_49);
continue;
}
_49=objj_msgSend(_44,"addMenuForCriterion:withValue:atIndex:afterCriterionView:",_48,_4a,i,_49);
}
_frozenActions=NO;
}
}),new objj_method(sel_getUid("setNestingMode:"),function(_4d,_4e,_4f){
with(_4d){
if(_4f==_nestingMode){
return;
}
_nestingMode=_4f;
var _50=objj_msgSend(_subrowsView,"subviews");
var _51;
var _52;
var _53=objj_msgSend(_50,"count");
for(var i=0;i<_53;i++){
_51=_50[i];
if(!objj_msgSend(_51,"isKindOfClass:",SPRuleEditorRowView)){
continue;
}
_52=objj_msgSend(_51,"setNestingMode:",_4f);
if(_52){
return _52;
}
}
}
}),new objj_method(sel_getUid("setDelegate:"),function(_54,_55,_56){
with(_54){
if(_56==_delegate){
return;
}
var _57=objj_msgSend(_subrowsView,"subviews");
var _58;
var _59;
var _5a=objj_msgSend(_57,"count");
for(var i=0;i<_5a;i++){
_58=_57[i];
if(!objj_msgSend(_58,"isKindOfClass:",SPRuleEditorRowView)){
continue;
}
objj_msgSend(_58,"setDelegate:",_56);
}
var _5b=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(_delegate){
objj_msgSend(_5b,"removeObserver:name:object:",_54,SPRuleEditorViewAltKeyDown,_delegate);
objj_msgSend(_5b,"removeObserver:name:object:",_54,SPRuleEditorViewAltKeyUp,_delegate);
}
_delegate=_56;
if(_delegate&&objj_msgSend(_delegate,"nestingMode")==SPRuleEditorNestingModeCompound){
objj_msgSend(_5b,"addObserver:selector:name:object:",_54,sel_getUid("altKeyDown:"),SPRuleEditorViewAltKeyDown,_delegate);
objj_msgSend(_5b,"addObserver:selector:name:object:",_54,sel_getUid("altKeyUp:"),SPRuleEditorViewAltKeyUp,_delegate);
if(objj_msgSend(objj_msgSend(CPApp,"currentEvent"),"modifierFlags")&CPAlternateKeyMask){
objj_msgSend(_54,"altKeyDown:",nil);
}
}
}
}),new objj_method(sel_getUid("setSelected:"),function(_5c,_5d,_5e){
with(_5c){
if(_5e==_selected){
return;
}
_selected=_5e;
if(_selected){
objj_msgSend(_5c,"setThemeState:",CPThemeStateSelectedDataView);
}else{
objj_msgSend(_5c,"unsetThemeState:",CPThemeStateSelectedDataView);
}
}
}),new objj_method(sel_getUid("setEditable:"),function(_5f,_60,_61){
with(_5f){
if(_editable==_61){
return;
}
_editable=_61;
objj_msgSend(_addButton,"setHidden:",!_editable);
objj_msgSend(_removeButton,"setHidden:",!_editable);
var _62;
var _63;
_62=objj_msgSend(_contentView,"subviews");
var _64=objj_msgSend(_62,"count");
for(var i=0;i<_64;i++){
_63=_62[i];
if(objj_msgSend(_63,"respondsToSelector:",sel_getUid("setEnabled:"))){
objj_msgSend(_63,"setEnabled:",_editable);
}
if(objj_msgSend(_63,"respondsToSelector:",sel_getUid("setEditable:"))){
objj_msgSend(_63,"setEditable:",_editable);
}
}
_62=objj_msgSend(_subrowsView,"subviews");
_64=objj_msgSend(_62,"count");
for(var i=0;i<_64;i++){
_63=_62[i];
if(!objj_msgSend(_63,"isKindOfClass:",SPRuleEditorRowView)){
continue;
}
objj_msgSend(_63,"setEditable:",_editable);
}
}
}),new objj_method(sel_getUid("setRowHeight:"),function(_65,_66,_67){
with(_65){
if(_rowHeight==_67){
return;
}
_rowHeight=Math.max(_67,SPRuleEditorRowViewMinHeight);
var _68;
var _69=objj_msgSend(_subrowsView,"subviews");
var _6a=objj_msgSend(_69,"count");
for(var i=0;i<_6a;i++){
_68=_69[i];
if(!objj_msgSend(_68,"isKindOfClass:",SPRuleEditorRowView)){
continue;
}
objj_msgSend(_68,"setRowHeight:",_rowHeight);
}
}
}),new objj_method(sel_getUid("isLast"),function(_6b,_6c){
with(_6b){
if(!_item){
return NO;
}
var _6d=objj_msgSend(_item,"parent");
if(!_6d){
return objj_msgSend(_item,"subrows")==0;
}
return objj_msgSend(_6d,"indexOfChild:",_item)==(objj_msgSend(_6d,"subrowsCount")-1);
}
}),new objj_method(sel_getUid("setShowDragIndicator:"),function(_6e,_6f,_70){
with(_6e){
if(_showDragIndicator==_70){
return;
}
_showDragIndicator=_70;
objj_msgSend(_6e,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("resetCriteria"),function(_71,_72){
with(_71){
var _73=objj_msgSend(_contentView,"subviews");
var _74=objj_msgSend(_73,"count");
for(var i=_74-1;i>=0;i--){
objj_msgSend(_73[i],"removeFromSuperview");
}
}
}),new objj_method(sel_getUid("indexOfCriterion:"),function(_75,_76,_77){
with(_75){
if(objj_msgSend(_77,"isKindOfClass:",CPMenuItem)){
return objj_msgSend(_75,"indexOfMenuItemCriterion:",_77);
}
var _78;
var _79=objj_msgSend(_contentView,"subviews");
var _7a=objj_msgSend(_79,"count");
for(var i=0;i<_7a;i++){
if(objj_msgSend(_79,"objectAtIndex:",i)===_77){
return i;
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("indexOfMenuItemCriterion:"),function(_7b,_7c,_7d){
with(_7b){
var _7e;
var _7f=objj_msgSend(_contentView,"subviews");
var _80=objj_msgSend(_7f,"count");
for(var i=0;i<_80;i++){
_7e=objj_msgSend(_7f,"objectAtIndex:",i);
if(!objj_msgSend(_7e,"isKindOfClass:",CPPopUpButton)){
continue;
}
if(objj_msgSend(objj_msgSend(_7e,"menu"),"indexOfItem:",_7d)!=CPNotFound){
return i;
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("addCriterionView:afterCriterionView:"),function(_81,_82,_83,_84){
with(_81){
var _85=objj_msgSend(_81,"frame");
var _86=_84?objj_msgSend(_84,"frame"):nil;
var _87=_84?_86.origin.x+_86.size.width+SPRuleEditorRowViewCriterionSpacing:SPRuleEditorRowViewLeftMargin;
if(objj_msgSend(_83,"isKindOfClass:",CPTextField)){
objj_msgSend(_83,"setSmallSize");
}
var _88=objj_msgSend(_83,"isKindOfClass:",CPPopUpButton)?SPRuleEditorRowViewPopUpHeight:SPRuleEditorRowViewCriterionHeight;
var _89=objj_msgSend(_83,"frame");
_89=CGRectMake(_87,(_rowHeight-_88)/2,_89.size.width,_88);
objj_msgSend(_83,"setFrame:",_89);
objj_msgSend(_contentView,"addSubview:",_83);
}
}),new objj_method(sel_getUid("bindCriterionViewItem:"),function(_8a,_8b,_8c){
with(_8a){
if(!_8c){
return;
}
if(objj_msgSend(_8c,"isKindOfClass:",CPMenuItem)){
objj_msgSend(_8c,"setTarget:",_8a);
objj_msgSend(_8c,"setAction:",sel_getUid("criterionChanged:"));
return;
}
if(objj_msgSend(_8c,"isKindOfClass:",CPTextField)){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_8a,sel_getUid("criterionChangedNotification:"),CPControlTextDidEndEditingNotification,_8c);
return;
}
if(!objj_msgSend(_8c,"isKindOfClass:",CPControl)){
return;
}
if(objj_msgSend(_8c,"respondsToSelector:",sel_getUid("objectValue"))){
objj_msgSend(_8c,"addObserver:forKeyPath:options:context:",_8a,"objectValue",CPKeyValueObservingOptionNew|CPKeyValueObservingOptionOld,nil);
}
if(objj_msgSend(_8c,"respondsToSelector:",sel_getUid("stringValue"))){
objj_msgSend(_8c,"addObserver:forKeyPath:options:context:",_8a,"stringValue",CPKeyValueObservingOptionNew|CPKeyValueObservingOptionOld,nil);
}
if(objj_msgSend(_8c,"respondsToSelector:",sel_getUid("color"))){
objj_msgSend(_8c,"addObserver:forKeyPath:options:context:",_8a,"color",CPKeyValueObservingOptionNew|CPKeyValueObservingOptionOld,nil);
}
}
}),new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"),function(_8d,_8e,_8f,_90,_91,_92){
with(_8d){
objj_msgSend(_8d,"criterionChanged:",_90);
}
}),new objj_method(sel_getUid("addViewForCriterion:withValue:atIndex:afterCriterionView:"),function(_93,_94,_95,_96,_97,_98){
with(_93){
if(!objj_msgSend(_95,"isStandaloneView")){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_94+" : Invalid SPRuleEditorCriterion");
}
var _99;
if(objj_msgSend(_96,"isKindOfClass:",CPView)){
_99=objj_msgSend(_delegate,"criterionItemCopy:",_96);
objj_msgSend(_99,"setHidden:",objj_msgSend(_95,"hidden"));
objj_msgSend(_93,"addCriterionView:afterCriterionView:",_99,_98);
objj_msgSend(_93,"bindCriterionViewItem:",_99);
return _99;
}
_99=objj_msgSend(_delegate,"criterionItemCopy:",objj_msgSend(_95,"standaloneView"));
if(!_96){
objj_msgSend(_99,"setHidden:",objj_msgSend(_95,"hidden"));
objj_msgSend(_93,"addCriterionView:afterCriterionView:",_99,_98);
objj_msgSend(_93,"bindCriterionViewItem:",_99);
return _99;
}
if(objj_msgSend(_96,"isKindOfClass:",CPString)){
if(objj_msgSend(_99,"respondsToSelector:",sel_getUid("setStringValue:"))){
objj_msgSend(_99,"setStringValue:",_96);
}else{
if(objj_msgSend(_99,"respondsToSelector:",sel_getUid("setObjectValue:"))){
objj_msgSend(_99,"setObjectValue:",_96);
}
}
objj_msgSend(_99,"setHidden:",objj_msgSend(_95,"hidden"));
objj_msgSend(_93,"addCriterionView:afterCriterionView:",_99,_98);
objj_msgSend(_93,"bindCriterionViewItem:",_99);
return _99;
}
if(objj_msgSend(_95,"respondsToSelector:",sel_getUid("setObjectValue:"))){
objj_msgSend(_95,"setObjectValue:",_96);
}
objj_msgSend(_99,"setHidden:",objj_msgSend(_95,"hidden"));
objj_msgSend(_93,"addCriterionView:afterCriterionView:",_99,_98);
objj_msgSend(_93,"bindCriterionViewItem:",_99);
return _99;
}
}),new objj_method(sel_getUid("addMenuForCriterion:withValue:atIndex:afterCriterionView:"),function(_9a,_9b,_9c,_9d,_9e,_9f){
with(_9a){
if(!objj_msgSend(_9c,"isMenu")){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_9b+" : Invalid SPRuleEditorCriterion");
}
var _a0=objj_msgSend(CPArray,"arrayWithArray:",objj_msgSend(_9c,"items"));
var _a1=objj_msgSend(_a0,"count");
if(_a1==1){
return objj_msgSend(_9a,"addStaticTextForCriterion:afterCriterionView:",_9c,_9f);
}
var _a2;
var _a3=CPNotFound;
var _a4=nil;
if(_9d){
if(objj_msgSend(_9d,"isKindOfClass:",CPNumber)){
_a3=objj_msgSend(_9d,"intValue");
}else{
if(objj_msgSend(_9d,"isKindOfClass:",CPString)){
_a4=_9d;
}else{
if(!isNaN(_9d)){
_a3=objj_msgSend(_9d,"intValue");
}else{
if(objj_msgSend(_9d,"isKindOfClass:",CPMenuItem)){
_a4=objj_msgSend(_9d,"title");
}else{
if(objj_msgSend(_9d,"respondsToSelector:",sel_getUid("description"))){
_a4=objj_msgSend(_9d,"description");
}
}
}
}
}
}
for(var i=0;i<_a1;i++){
_a2=_a0[i];
if(!_a2){
_a0[i]=objj_msgSend(CPMenuItem,"separatorItem");
continue;
}
if(objj_msgSend(_a2,"isKindOfClass:",CPString)){
if(objj_msgSend(_a2,"length")==0){
_a0[i]=objj_msgSend(CPMenuItem,"separatorItem");
continue;
}
_a0[i]=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:",_a2,sel_getUid("criterionChanged:"),"");
objj_msgSend(_9a,"bindCriterionViewItem:",_a0[i]);
continue;
}
_a2=objj_msgSend(_delegate,"criterionItemCopy:",_a2);
objj_msgSend(_a2,"setState:",CPOffState);
if(objj_msgSend(_a2,"menu")){
objj_msgSend(objj_msgSend(_a2,"menu"),"removeItem:",_a2);
}
_a0[i]=_a2;
objj_msgSend(_9a,"bindCriterionViewItem:",_a0[i]);
}
var _a5=nil;
if(_a3!=CPNotFound&&_a3<objj_msgSend(_a0,"count")){
_a5=objj_msgSend(_a0,"objectAtIndex:",_a3);
}else{
if(_a4){
var idx=objj_msgSend(_a0,"indexOfObjectPassingTest:",function(obj,_a6){
return objj_msgSend(obj,"title")==_a4;
});
if(idx!=CPNotFound){
_a5=_a0[idx];
}
}else{
var idx=_a5=objj_msgSend(_a0,"indexOfObjectPassingTest:",function(obj,_a7){
return !objj_msgSend(obj,"isSeparatorItem");
});
if(idx!=CPNotFound){
_a5=_a0[idx];
}
}
}
if(!_a5){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_9b+" : Invalid SPRuleEditorCriterion");
}
var _a8=objj_msgSend(_a5,"title");
var _a9=objj_msgSend(_9a,"valueForThemeAttribute:","font");
var _aa=objj_msgSend(_a8,"sizeWithFont:",_a9).width+25;
var _ab=CGRectMake(0,0,_aa+((_aa%25)?25:0),SPRuleEditorRowViewButtonHeight);
var _ac=objj_msgSend(objj_msgSend(SPRuleEditorPopUpButton,"alloc"),"initWithFrame:",_ab);
objj_msgSend(_ac,"setValue:forThemeAttribute:",_a9,"font");
objj_msgSend(_ac,"setValue:forThemeAttribute:",CGSizeMake(0,SPRuleEditorRowViewCriterionHeight),"min-size");
for(var i=0;i<_a1;i++){
_a2=objj_msgSend(_a0,"objectAtIndex:",i);
if(!objj_msgSend(_a2,"isSeparatorItem")){
_a8=objj_msgSend(_a2,"title");
objj_msgSend(_a2,"setTitle:",objj_msgSend(_9a,"localizedString:",_a8));
}
objj_msgSend(_ac,"addItem:",_a2);
}
objj_msgSend(_ac,"selectItemWithTitle:",objj_msgSend(_a5,"title"));
objj_msgSend(_ac,"setHidden:",objj_msgSend(_9c,"hidden"));
objj_msgSend(_9a,"addCriterionView:afterCriterionView:",_ac,_9f);
return _ac;
}
}),new objj_method(sel_getUid("addStaticTextForCriterion:afterCriterionView:"),function(_ad,_ae,_af,_b0){
with(_ad){
if(!objj_msgSend(_af,"isMenu")){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_ae+" : Invalid SPRuleEditorCriterion");
}
var _b1=objj_msgSend(CPArray,"arrayWithArray:",objj_msgSend(_af,"items"));
var _b2;
_b2=_b1[0];
if(!_b2||(objj_msgSend(_b2,"isKindOfClass:",CPString)&&objj_msgSend(_b2,"length")==0)){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_ae+" : Invalid SPRuleEditorCriterion");
}
var _b3;
if(objj_msgSend(_b2,"isKindOfClass:",CPMenuItem)){
_b3=objj_msgSend(_b2,"title");
}else{
_b3=_b2;
}
var _b4=CGRectMake(0,0,100,_rowHeight);
var _b5=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",_b4);
objj_msgSend(_b5,"setStaticWithFont:",objj_msgSend(_ad,"valueForThemeAttribute:","font"));
objj_msgSend(_b5,"setStringValue:",objj_msgSend(_ad,"localizedString:",_b3));
objj_msgSend(_b5,"sizeToFit");
objj_msgSend(_ad,"addCriterionView:afterCriterionView:",_b5,_b0);
return _b5;
}
}),new objj_method(sel_getUid("removeFromSuperview"),function(_b6,_b7){
with(_b6){
if(objj_msgSend(_b6,"superview")){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"removeObserver:",_b6);
}
objj_msgSendSuper({receiver:_b6,super_class:objj_getClass("SPRuleEditorRowView").super_class},"removeFromSuperview");
}
}),new objj_method(sel_getUid("addRowView:"),function(_b8,_b9,_ba){
with(_b8){
objj_msgSend(_subrowsView,"addSubview:",_ba);
}
}),new objj_method(sel_getUid("removeRowView:"),function(_bb,_bc,_bd){
with(_bb){
objj_msgSend(_bd,"removeFromSuperview");
}
}),new objj_method(sel_getUid("addRowView:positioned:relativeTo:"),function(_be,_bf,_c0,_c1,_c2){
with(_be){
objj_msgSend(_subrowsView,"addSubview:positioned:relativeTo:",_c0,_c1,_c2);
}
}),new objj_method(sel_getUid("_layoutSubviews"),function(_c3,_c4){
with(_c3){
var _c5=objj_msgSend(_subrowsView,"subviews");
var _c6=objj_msgSend(_c5,"count");
var _c7;
var _c8;
var _c9=0;
for(var i=0;i<_c6;i++){
_c7=_c5[i];
if(!objj_msgSend(_c7,"isKindOfClass:",SPRuleEditorRowView)){
continue;
}
objj_msgSend(_c7,"_layoutSubviews");
_c8=objj_msgSend(_c7,"frame");
_c8.origin.y=_c9;
objj_msgSend(_c7,"setFrame:",_c8);
_c9+=_c8.size.height;
objj_msgSend(_c7,"setFrame:",_c8);
}
var _ca=_showDragIndicator?SPRuleEditorRowViewDragIndicatorHeight:0;
_c8=objj_msgSend(_subrowsView,"frame");
_c8.origin.y=_rowHeight+_ca;
_c8.size.height=_c9;
objj_msgSend(_subrowsView,"setFrame:",_c8);
_c8=objj_msgSend(_addButton,"frame");
_c8.origin.y=((_rowHeight-SPRuleEditorRowViewButtonHeight)/2)-1;
objj_msgSend(_addButton,"setFrame:",_c8);
objj_msgSend(_addButton,"setHidden:",(!_editable||(_delegate&&objj_msgSend(_delegate,"nestingMode")==SPRuleEditorNestingModeSingle)));
_c8=objj_msgSend(_removeButton,"frame");
_c8.origin.y=((_rowHeight-SPRuleEditorRowViewButtonHeight)/2)-1;
objj_msgSend(_removeButton,"setFrame:",_c8);
objj_msgSend(_removeButton,"setHidden:",(!_editable||(_delegate&&(!objj_msgSend(_delegate,"isRowRemoveable:",_item)||objj_msgSend(_delegate,"nestingMode")==SPRuleEditorNestingModeSingle))));
subviews=objj_msgSend(_contentView,"subviews");
_c6=objj_msgSend(subviews,"count");
for(var i=0;i<_c6;i++){
_c7=subviews[i];
_c8=objj_msgSend(_c7,"frame");
_c8.origin.y=objj_msgSend(_c7,"isKindOfClass:",CPButton)?((_rowHeight-_c8.size.height)/2)-1:((_rowHeight-_c8.size.height)/2);
objj_msgSend(_c7,"setFrame:",_c8);
}
var _cb=objj_msgSend(_contentView,"frameSize");
_cb.height=_rowHeight;
objj_msgSend(_contentView,"setFrameSize:",_cb);
_cb=objj_msgSend(_c3,"frameSize");
_cb.height=_c9+_rowHeight+_ca;
objj_msgSend(_c3,"setFrameSize:",_cb);
}
}),new objj_method(sel_getUid("rowViewWithItem:"),function(_cc,_cd,_ce){
with(_cc){
if(_item==_ce){
return _cc;
}
var _cf=objj_msgSend(_subrowsView,"subviews");
var _d0;
var _d1;
var _d2=objj_msgSend(_cf,"count");
for(var i=0;i<_d2;i++){
_d0=_cf[i];
if(!objj_msgSend(_d0,"isKindOfClass:",SPRuleEditorRowView)){
continue;
}
_d1=objj_msgSend(_d0,"rowViewWithItem:",_ce);
if(_d1){
return _d1;
}
}
return nil;
}
}),new objj_method(sel_getUid("drawBordersInContext:verticalOffset:width:"),function(_d3,_d4,_d5,_d6,_d7){
with(_d3){
var _d8=objj_msgSend(_d3,"frame");
CGContextSaveGState(_d5);
CGContextBeginPath(_d5);
CGContextMoveToPoint(_d5,0,_d8.origin.y+_d6+0.5);
CGContextAddLineToPoint(_d5,_d7,_d8.origin.y+_d6+0.5);
CGContextClosePath(_d5);
CGContextSetStrokeColor(_d5,objj_msgSend(CPColor,"whiteColor"));
CGContextSetLineWidth(1);
CGContextStrokePath(_d5);
var _d9=_showDragIndicator?SPRuleEditorRowViewDragIndicatorHeight:0;
if(_d9){
indent=objj_msgSend(_item,"rowType")==SPRuleEditorRowTypeSimple?SPRuleEditorRowViewIndent*objj_msgSend(_item,"depth"):SPRuleEditorRowViewIndent*(objj_msgSend(_item,"depth")+1);
CGContextBeginPath(_d5);
CGContextMoveToPoint(_d5,indent,_d6+_d8.origin.y+_rowHeight+(_d9/2)+-0.5);
CGContextAddLineToPoint(_d5,_d7,_d6+_d8.origin.y+_rowHeight+(_d9/2)-0.5);
CGContextSetLineWidth(SPRuleEditorRowViewDragIndicatorHeight);
CGContextClosePath(_d5);
CGContextSetStrokeColor(_d5,objj_msgSend(CPColor,"grayColor"));
CGContextStrokePath(_d5);
}
CGContextBeginPath(_d5);
CGContextMoveToPoint(_d5,0,_d6+_d8.origin.y+_rowHeight+_d9+-0.5);
CGContextAddLineToPoint(_d5,_d7,_d6+_d8.origin.y+_rowHeight+_d9-0.5);
CGContextSetLineWidth(1);
CGContextClosePath(_d5);
CGContextSetStrokeColor(_d5,objj_msgSend(_d3,"valueForThemeAttribute:","slice-bottom-border-color"));
CGContextStrokePath(_d5);
CGContextRestoreGState(_d5);
var _da=objj_msgSend(_subrowsView,"subviews");
var _db=objj_msgSend(_da,"count");
var _dc;
_d6+=_d8.origin.y+_rowHeight+_d9;
for(var i=0;i<_db;i++){
_dc=_da[i];
if(!objj_msgSend(_dc,"isKindOfClass:",SPRuleEditorRowView)){
continue;
}
objj_msgSend(_dc,"drawBordersInContext:verticalOffset:width:",_d5,_d6,_d7);
}
}
}),new objj_method(sel_getUid("addClicked:"),function(_dd,_de,_df){
with(_dd){
objj_msgSend(objj_msgSend(_dd,"window"),"makeFirstResponder:",_dd);
if(_frozenActions||!_delegate||!_df||!objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("insertNewRowOfType:afterRow:"))){
return;
}
var _e0=objj_msgSend(objj_msgSend(CPApp,"currentEvent"),"modifierFlags")&CPAlternateKeyMask;
var _e1=(_e0&&_delegate&&objj_msgSend(_delegate,"nestingMode")==SPRuleEditorNestingModeCompound)?SPRuleEditorRowTypeCompound:SPRuleEditorRowTypeSimple;
objj_msgSend(_delegate,"insertNewRowOfType:afterRow:",_e1,_item);
}
}),new objj_method(sel_getUid("removeClicked:"),function(_e2,_e3,_e4){
with(_e2){
objj_msgSend(objj_msgSend(_e2,"window"),"makeFirstResponder:",_e2);
if(_frozenActions||!_delegate||!_e4||!objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("removeRow:"))){
return;
}
objj_msgSend(_delegate,"removeRow:",_item);
}
}),new objj_method(sel_getUid("criterionChangedNotification:"),function(_e5,_e6,_e7){
with(_e5){
if(!_e7){
return;
}
var _e8=objj_msgSend(_e7,"object");
if(!_e8){
return;
}
objj_msgSend(_e5,"criterionChanged:",_e8);
}
}),new objj_method(sel_getUid("criterionChanged:"),function(_e9,_ea,_eb){
with(_e9){
if(_updating){
return;
}
_updating=YES;
objj_msgSend(objj_msgSend(_e9,"window"),"makeFirstResponder:",_e9);
_updating=NO;
if(_frozenActions||!_delegate||!_eb||!objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("valueChanged:criterionIndex:valueIndex:inRow:"))){
return;
}
var _ec=nil;
var _ed=CPNotFound;
var _ee=0;
if(objj_msgSend(_eb,"isKindOfClass:",CPMenuItem)){
_ee=objj_msgSend(objj_msgSend(_eb,"menu"),"indexOfItem:",_eb);
_ec=_eb;
_ed=objj_msgSend(_e9,"indexOfCriterion:",_eb);
}else{
_ec=_eb;
_ed=objj_msgSend(_e9,"indexOfCriterion:",_eb);
}
if(_ed==CPNotFound){
return;
}
objj_msgSend(_delegate,"valueChanged:criterionIndex:valueIndex:inRow:",_ec,_ed,_ee,_item);
}
}),new objj_method(sel_getUid("localizedString:"),function(_ef,_f0,str){
with(_ef){
if(_delegate&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("localizedString:"))){
return objj_msgSend(_delegate,"localizedString:",str);
}
return str;
}
}),new objj_method(sel_getUid("hitTest:"),function(_f1,_f2,_f3){
with(_f1){
var res=objj_msgSendSuper({receiver:_f1,super_class:objj_getClass("SPRuleEditorRowView").super_class},"hitTest:",_f3);
if(res==_contentView){
return _f1;
}
return res;
}
}),new objj_method(sel_getUid("viewAtPoint:"),function(_f4,_f5,_f6){
with(_f4){
var _f7=objj_msgSend(_f4,"convertPoint:fromView:",_f6,nil);
var _f8=objj_msgSend(_contentView,"frame");
if(CPRectContainsPoint(_f8,_f7)){
return _f4;
}
var _f9;
var _fa;
var _fb=objj_msgSend(_subrowsView,"subviews");
var _fc=objj_msgSend(_fb,"count");
for(var i=0;i<_fc;i++){
_fa=_fb[i];
if(!objj_msgSend(_fa,"isKindOfClass:",SPRuleEditorRowView)){
continue;
}
_f9=objj_msgSend(_fa,"viewAtPoint:",_f6);
if(_f9){
return _f9;
}
}
return nil;
}
}),new objj_method(sel_getUid("hasSubrow:"),function(_fd,_fe,_ff){
with(_fd){
if(!_ff||_ff==_fd){
return NO;
}
var view;
var _100;
var _101=objj_msgSend(_subrowsView,"subviews");
var _102=objj_msgSend(_101,"count");
for(var i=0;i<_102;i++){
_100=_101[i];
if(!objj_msgSend(_100,"isKindOfClass:",SPRuleEditorRowView)){
continue;
}
if(_100==_ff){
return YES;
}
if(objj_msgSend(_100,"hasSubrow:",_ff)){
return YES;
}
}
return NO;
}
}),new objj_method(sel_getUid("isOpaque"),function(self,_103){
with(self){
return YES;
}
}),new objj_method(sel_getUid("mouseDragged:"),function(self,_104,_105){
with(self){
if(!_editable){
return;
}
var _106=objj_msgSend(CPPasteboard,"pasteboardWithName:",CPDragPboard);
objj_msgSend(_106,"declareTypes:owner:",objj_msgSend(CPArray,"arrayWithObjects:",SPRuleEditorItemPBoardType,nil),self);
var _107=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",objj_msgSend(self,"frame"));
var html=self._DOMElement.innerHTML;
_107._DOMElement.innerHTML=objj_msgSend(html,"copy");
objj_msgSend(_107,"setAlphaValue:",0.7);
objj_msgSend(_107,"setBackgroundColor:",objj_msgSend(CPColor,"whiteColor"));
objj_msgSend(self,"dragView:at:offset:event:pasteboard:source:slideBack:",_107,CPPointMake(0,0),CPPointMake(0,0),_105,_106,self,YES);
}
}),new objj_method(sel_getUid("acceptsFirstResponder"),function(self,_108){
with(self){
return YES;
}
}),new objj_method(sel_getUid("resignFirstResponder"),function(self,_109){
with(self){
return objj_msgSendSuper({receiver:self,super_class:objj_getClass("SPRuleEditorRowView").super_class},"resignFirstResponder");
}
}),new objj_method(sel_getUid("flagsChanged:"),function(self,_10a,_10b){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("SPRuleEditorRowView").super_class},"flagsChanged:",_10b);
if(_delegate&&objj_msgSend(_delegate,"nestingMode")==SPRuleEditorNestingModeCompound){
if(objj_msgSend(_10b,"modifierFlags")&CPAlternateKeyMask){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",SPRuleEditorViewAltKeyDown,_delegate,nil);
}else{
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",SPRuleEditorViewAltKeyUp,_delegate,nil);
}
}
}
}),new objj_method(sel_getUid("altKeyDown:"),function(self,_10c,_10d){
with(self){
objj_msgSend(_addButton,"setImage:",_alternateAddButtonImage);
objj_msgSend(_addButton,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("altKeyUp:"),function(self,_10e,_10f){
with(self){
objj_msgSend(_addButton,"setImage:",objj_msgSend(self,"valueForThemeAttribute:","add-image"));
objj_msgSend(_addButton,"setNeedsDisplay:",YES);
}
})]);
class_addMethods(_4,[new objj_method(sel_getUid("themeAttributes"),function(self,_110){
with(self){
return objj_msgSend(SPRuleEditor,"themeAttributes");
}
}),new objj_method(sel_getUid("initialize"),function(self,_111){
with(self){
if(CPBrowserIsEngine(CPWebKitBrowserEngine)){
_1="-webkit-gradient(linear, left top, left bottom, from(rgb(252, 252, 252)), to(rgb(223, 223, 223)))";
_2="-webkit-gradient(linear, left top, left bottom, from(rgb(223, 223, 223)), to(rgb(252, 252, 252)))";
}else{
if(CPBrowserIsEngine(CPGeckoBrowserEngine)){
_1="-moz-linear-gradient(top,  rgb(252, 252, 252),  rgb(223, 223, 223))";
_2="-moz-linear-gradient(top,  rgb(223, 223, 223),  rgb(252, 252, 252))";
}
}
}
})]);
var _3=objj_getClass("CPTextField");
if(!_3){
throw new SyntaxError("*** Could not find definition for class \"CPTextField\"");
}
var _4=_3.isa;
class_addMethods(_3,[new objj_method(sel_getUid("setSmallSize"),function(self,_112){
with(self){
objj_msgSend(self,"setValue:forThemeAttribute:inState:",objj_msgSend(CPFont,"systemFontOfSize:",11),"font",CPThemeStateBezeled);
objj_msgSend(self,"setValue:forThemeAttribute:inState:",CGInsetMake(3,7,0,8),"content-inset",CPThemeStateBezeled);
objj_msgSend(self,"setValue:forThemeAttribute:inState:",CGInsetMake(2,6,0,8),"content-inset",CPThemeStateBezeled|CPThemeStateEditing);
objj_msgSend(self,"setValue:forThemeAttribute:inState:",CGInsetMake(0,4,0,4),"bezel-inset",CPThemeStateBezeled);
objj_msgSend(self,"setValue:forThemeAttribute:inState:",CGInsetMake(-2,0,-2,0),"bezel-inset",CPThemeStateBezeled|CPThemeStateEditing);
}
}),new objj_method(sel_getUid("setStaticWithFont:"),function(self,_113,font){
with(self){
objj_msgSend(self,"setBordered:",NO);
objj_msgSend(self,"setEditable:",NO);
objj_msgSend(self,"setDrawsBackground:",NO);
objj_msgSend(self,"setValue:forThemeAttribute:",font,"font");
if(!objj_msgSend(self,"stringValue")){
objj_msgSend(self,"setStringValue:"," ");
}
objj_msgSend(self,"sizeToFit");
objj_msgSend(self,"setValue:forThemeAttribute:inState:",CGInsetMake(((objj_msgSend(self,"frame").size.height-objj_msgSend(font,"size"))/2)+1,0,0,0),"content-inset",CPThemeStateNormal);
}
})]);
p;18;SPRuleEditorView.jt;15440;@STATIC;1.0;I;21;Foundation/CPObject.jI;15;AppKit/CPView.ji;21;SPRuleEditorRowView.jt;15348;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("AppKit/CPView.j",NO);
objj_executeFile("SPRuleEditorRowView.j",YES);
SPRuleEditorRowViewMinHeight=26;
SPRuleEditorRowViewIndent=30;
var _1=objj_allocateClassPair(CPView,"SPRuleEditorView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_delegate"),new objj_ivar("_editable"),new objj_ivar("_rowHeight"),new objj_ivar("_dragging"),new objj_ivar("_currentDropTarget"),new objj_ivar("_forcedRedraw")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("delegate"),function(_3,_4){
with(_3){
return _delegate;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_5,_6,_7){
with(_5){
_delegate=_7;
}
}),new objj_method(sel_getUid("editable"),function(_8,_9){
with(_8){
return _editable;
}
}),new objj_method(sel_getUid("setEditable:"),function(_a,_b,_c){
with(_a){
_editable=_c;
}
}),new objj_method(sel_getUid("rowHeight"),function(_d,_e){
with(_d){
return _rowHeight;
}
}),new objj_method(sel_getUid("setRowHeight:"),function(_f,_10,_11){
with(_f){
_rowHeight=_11;
}
}),new objj_method(sel_getUid("dragging"),function(_12,_13){
with(_12){
return _dragging;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_14,_15,_16){
with(_14){
_14=objj_msgSendSuper({receiver:_14,super_class:objj_getClass("SPRuleEditorView").super_class},"initWithFrame:",_16);
if(!_14){
return nil;
}
_model=nil;
_delegate=nil;
_editable=YES;
_rowHeight=SPRuleEditorRowViewMinHeight;
_dragging=NO;
_forcedRedraw=NO;
objj_msgSend(_14,"setThemeClass:","rule-editor");
objj_msgSend(_14,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithHexString:","ededed"));
objj_msgSend(_14,"setPostsFrameChangedNotifications:",YES);
objj_msgSend(_14,"registerForDraggedTypes:",objj_msgSend(CPArray,"arrayWithObjects:",SPRuleEditorItemPBoardType,nil));
return _14;
}
}),new objj_method(sel_getUid("removeFromSuperview"),function(_17,_18){
with(_17){
if(objj_msgSend(_17,"superview")){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"removeObserver:",_17);
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"removeObserver:",_17);
}
}),new objj_method(sel_getUid("setModel:"),function(_19,_1a,_1b){
with(_19){
if(_1b==_model){
return nil;
}
var _1c=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(_model){
objj_msgSend(_1c,"removeObserver:name:object:",_19,SPRuleEditorModelRowAdded,_model);
objj_msgSend(_1c,"removeObserver:name:object:",_19,SPRuleEditorModelRowRemoved,_model);
objj_msgSend(_1c,"removeObserver:name:object:",_19,SPRuleEditorModelRowModified,_model);
objj_msgSend(_1c,"removeObserver:name:object:",_19,SPRuleEditorModelNestingModeWillChange,_model);
objj_msgSend(_1c,"removeObserver:name:object:",_19,SPRuleEditorModelNestingModeDidChange,_model);
objj_msgSend(_1c,"removeObserver:name:object:",_19,SPRuleEditorModelRemovedAllRows,_model);
}
_model=_1b;
if(_model){
objj_msgSend(_1c,"addObserver:selector:name:object:",_19,sel_getUid("rowAdded:"),SPRuleEditorModelRowAdded,_model);
objj_msgSend(_1c,"addObserver:selector:name:object:",_19,sel_getUid("rowRemoved:"),SPRuleEditorModelRowRemoved,_model);
objj_msgSend(_1c,"addObserver:selector:name:object:",_19,sel_getUid("rowModified:"),SPRuleEditorModelRowModified,_model);
objj_msgSend(_1c,"addObserver:selector:name:object:",_19,sel_getUid("nestingModeWillChange:"),SPRuleEditorModelNestingModeWillChange,_model);
objj_msgSend(_1c,"addObserver:selector:name:object:",_19,sel_getUid("nestingModeDidChange:"),SPRuleEditorModelNestingModeDidChange,_model);
objj_msgSend(_1c,"addObserver:selector:name:object:",_19,sel_getUid("allRowsRemoved:"),SPRuleEditorModelRemovedAllRows,_model);
}
}
}),new objj_method(sel_getUid("setDelegate:"),function(_1d,_1e,_1f){
with(_1d){
if(_1f==_delegate){
return;
}
_delegate=_1f;
var _20=objj_msgSend(_1d,"subviews");
var _21;
var _22;
var _23=objj_msgSend(_20,"count");
for(var i=0;i<_23;i++){
_21=_20[i];
if(!objj_msgSend(_21,"isKindOfClass:",SPRuleEditorRowView)){
continue;
}
objj_msgSend(_21,"setDelegate:",_1f);
}
}
}),new objj_method(sel_getUid("setEditable:"),function(_24,_25,_26){
with(_24){
if(_editable==_26){
return;
}
_editable=_26;
var _27=objj_msgSend(_24,"subviews");
var _28;
var _29;
var _2a=objj_msgSend(_27,"count");
for(var i=0;i<_2a;i++){
_28=_27[i];
if(!objj_msgSend(_28,"isKindOfClass:",SPRuleEditorRowView)){
continue;
}
objj_msgSend(_28,"setEditable:",_editable);
}
objj_msgSend(_24,"setNeedsLayout");
}
}),new objj_method(sel_getUid("setRowHeight:"),function(_2b,_2c,_2d){
with(_2b){
if(_rowHeight==_2d){
return;
}
_rowHeight=Math.max(_2d,SPRuleEditorRowViewMinHeight);
var _2e=objj_msgSend(_2b,"subviews");
var _2f;
var _30;
var _31=objj_msgSend(_2e,"count");
for(var i=0;i<_31;i++){
_2f=_2e[i];
if(!objj_msgSend(_2f,"isKindOfClass:",SPRuleEditorRowView)){
continue;
}
objj_msgSend(_2f,"setRowHeight:",_rowHeight);
}
objj_msgSend(_2b,"setNeedsLayout");
}
}),new objj_method(sel_getUid("rowViewWithItem:"),function(_32,_33,_34){
with(_32){
var _35=objj_msgSend(_32,"subviews");
var _36;
var _37;
var _38=objj_msgSend(_35,"count");
for(var i=0;i<_38;i++){
_36=_35[i];
if(!objj_msgSend(_36,"isKindOfClass:",SPRuleEditorRowView)){
continue;
}
_37=objj_msgSend(_36,"rowViewWithItem:",_34);
if(_37){
return _37;
}
}
return nil;
}
}),new objj_method(sel_getUid("rowViewAtPoint:"),function(_39,_3a,_3b){
with(_39){
var _3c=objj_msgSend(_39,"subviews");
var _3d;
var _3e;
var _3f=objj_msgSend(_3c,"count");
for(var i=0;i<_3f;i++){
_3d=_3c[i];
if(!objj_msgSend(_3d,"isKindOfClass:",SPRuleEditorRowView)){
continue;
}
_3e=objj_msgSend(_3d,"viewAtPoint:",_3b);
if(!_3e||!objj_msgSend(_3e,"isKindOfClass:",SPRuleEditorRowView)){
continue;
}
return _3e;
}
return nil;
}
}),new objj_method(sel_getUid("rowAdded:"),function(_40,_41,_42){
with(_40){
if(!_42){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_41+" : null notification");
}
var _43=objj_msgSend(_42,"userInfo");
if(!_43){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_41+" : notification userInfo is null");
}
var _44=objj_msgSend(_43,"valueForKey:","parentRow");
var _45=objj_msgSend(_43,"valueForKey:","index");
var row=objj_msgSend(_43,"valueForKey:","row");
objj_msgSend(_40,"row:addedAtIndex:withParentRow:",row,_45,_44);
}
}),new objj_method(sel_getUid("row:addedAtIndex:withParentRow:"),function(_46,_47,row,_48,_49){
with(_46){
objj_msgSend(_46,"_row:addedAtIndex:withParentRow:",row,_48,_49);
var _4a=objj_msgSend(row,"subrowsCount");
for(var i=0;i<_4a;i++){
objj_msgSend(_46,"row:addedAtIndex:withParentRow:",objj_msgSend(row,"childAtIndex:",i),i,row);
}
}
}),new objj_method(sel_getUid("_row:addedAtIndex:withParentRow:"),function(_4b,_4c,row,_4d,_4e){
with(_4b){
if(_4d<0||!row){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_4c+" : invalid SPRuleEditorModelRowAdded notification userInfo");
}
var _4f;
var _50=objj_msgSend(_4f,"subviews");
var _51;
if(!_4e){
_4f=_4b;
_50=objj_msgSend(_4b,"subviews");
_51=YES;
}else{
_4f=objj_msgSend(_4b,"rowViewWithItem:",_4e);
_50=objj_msgSend(objj_msgSend(_4f,"subrowsView"),"subviews");
_51=NO;
}
if(!_4f){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_4c+" : parent row view does not exist");
}
var _52=objj_msgSend(_50,"count");
if(_4d>_52){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_4c+" : invalid SPRuleEditorModelRowAdded notification userInfo");
}
var _53=objj_msgSend(objj_msgSend(SPRuleEditorRowView,"alloc"),"initWithFrame:",objj_msgSend(_4b,"initialFrameForItem:",row));
objj_msgSend(_53,"setDelegate:",_delegate);
objj_msgSend(_53,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_53,"setItem:",row);
objj_msgSend(_53,"setNestingMode:",objj_msgSend(_model,"nestingMode"));
objj_msgSend(_53,"setDelegate:",_delegate);
objj_msgSend(_53,"setEditable:",_editable);
if(!_52||_4d==_52){
if(_51){
objj_msgSend(_4b,"addSubview:",_53);
}else{
objj_msgSend(_4f,"addRowView:",_53);
}
}else{
var _54=objj_msgSend(_50,"objectAtIndex:",_4d);
if(_51){
objj_msgSend(_4b,"addSubview:positioned:relativeTo:",_53,CPWindowBelow,_54);
}else{
objj_msgSend(_4f,"addRowView:positioned:relativeTo:",_53,CPWindowBelow,_54);
}
}
objj_msgSend(objj_msgSend(_4b,"window"),"makeFirstResponder:",_53);
objj_msgSend(_4b,"setNeedsLayout");
}
}),new objj_method(sel_getUid("rowRemoved:"),function(_55,_56,_57){
with(_55){
if(!_57){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_56+" : null notification");
}
var _58=objj_msgSend(_57,"userInfo");
if(!_58){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_56+" : notification userInfo is null");
}
var row=objj_msgSend(_58,"valueForKey:","row");
if(!row){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_56+" : invalid SPRuleEditorModelRowAdded notification userInfo");
}
var _59=objj_msgSend(_58,"valueForKey:","parentRow");
var _5a=objj_msgSend(_55,"rowViewWithItem:",row);
if(!_5a){
return;
}
var _5b;
if(!_59){
objj_msgSend(_5a,"removeFromSuperview");
}else{
var _5b=objj_msgSend(_55,"rowViewWithItem:",_59);
if(!_5b){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_56+" : invalid SPRuleEditorModelRowRemoved notification userInfo");
}
objj_msgSend(_5b,"removeRowView:",_5a);
}
objj_msgSend(_55,"setNeedsLayout");
}
}),new objj_method(sel_getUid("allRowsRemoved:"),function(_5c,_5d,_5e){
with(_5c){
var _5f=objj_msgSend(_5c,"subviews");
var _60=objj_msgSend(_5f,"count");
for(var i=0;i<_60;i++){
objj_msgSend(_5f[i],"removeFromSuperview");
}
}
}),new objj_method(sel_getUid("rowModified:"),function(_61,_62,_63){
with(_61){
if(!_63){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_62+" : null notification");
}
var _64=objj_msgSend(_63,"userInfo");
if(!_64){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_62+" : notification userInfo is null");
}
var row=objj_msgSend(_64,"valueForKey:","row");
var _65=objj_msgSend(_61,"rowViewWithItem:",row);
if(!_65){
return;
}
objj_msgSend(_65,"setItem:",row);
objj_msgSend(_61,"setNeedsLayout");
}
}),new objj_method(sel_getUid("nestingModeWillChange:"),function(_66,_67,_68){
with(_66){
}
}),new objj_method(sel_getUid("nestingModeDidChange:"),function(_69,_6a,_6b){
with(_69){
if(!_6b){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_6a+" : null notification");
}
var _6c=objj_msgSend(_6b,"userInfo");
if(!_6c){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_6a+" : notification userInfo is null");
}
var _6d=objj_msgSend(_6c,"valueForKey:","newNestingMode");
var _6e=objj_msgSend(_69,"subviews");
var _6f;
var _70;
var _71=objj_msgSend(_6e,"count");
for(var i=0;i<_71;i++){
_6f=_6e[i];
if(!objj_msgSend(_6f,"isKindOfClass:",SPRuleEditorRowView)){
continue;
}
_70=objj_msgSend(_6f,"setNestingMode:",_6d);
if(_70){
return _70;
}
}
objj_msgSend(_69,"setNeedsLayout");
}
}),new objj_method(sel_getUid("drawRect:"),function(_72,_73,_74){
with(_72){
var _75=objj_msgSend(_72,"subviews");
var _76=objj_msgSend(_75,"count");
if(!_76){
return;
}
var _77;
var _78=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort");
if(!_78){
return;
}
var _79=objj_msgSend(_72,"frame");
for(var i=0;i<_76;i++){
_77=_75[i];
if(!objj_msgSend(_77,"isKindOfClass:",SPRuleEditorRowView)){
continue;
}
objj_msgSend(_77,"drawBordersInContext:verticalOffset:width:",_78,0,_79.size.width);
}
}
}),new objj_method(sel_getUid("forceRedrawForChromeBug"),function(_7a,_7b){
with(_7a){
var _7c=objj_msgSend(_7a,"frameSize");
_7a._DOMElement.style.height=(_7c.height+1)+"px";
_forcedRedraw=YES;
objj_msgSend(_7a,"setNeedsLayout");
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_7d,_7e){
with(_7d){
if(_forcedRedraw){
var _7f=objj_msgSend(_7d,"frameSize");
_7d._DOMElement.style.height=(_7f.height-1)+"px";
_forcedRedraw=NO;
return;
}
var _80=objj_msgSend(_7d,"subviews");
var _81=objj_msgSend(_80,"count");
var _82=objj_msgSend(_7d,"bounds");
var _83;
var _84=0;
var _85;
for(var i=0;i<_81;i++){
_83=_80[i];
if(!objj_msgSend(_83,"isKindOfClass:",SPRuleEditorRowView)){
continue;
}
objj_msgSend(_83,"_layoutSubviews");
_85=objj_msgSend(_83,"frame");
_85.origin.y=_84;
objj_msgSend(_83,"setFrame:",_85);
_84+=_85.size.height;
objj_msgSend(_83,"setFrame:",_85);
}
var _7f=objj_msgSend(_7d,"frameSize");
_7f.height=_84;
objj_msgSend(_7d,"setFrameSize:",_7f);
}
}),new objj_method(sel_getUid("initialFrameForItem:"),function(_86,_87,_88){
with(_86){
var _89=objj_msgSend(_88,"depth");
var _8a=!_89?0:SPRuleEditorRowViewIndent;
return CGRectMake(_8a,0,objj_msgSend(_86,"frame").size.width-(_8a*_89),_rowHeight);
}
}),new objj_method(sel_getUid("draggingEntered:"),function(_8b,_8c,_8d){
with(_8b){
if(_dragging){
return CPDragOperationNone;
}
var _8e=objj_msgSend(_8d,"draggingSource");
if(objj_msgSend(_8e,"isKindOfClass:",SPRuleEditorRowView)&&objj_msgSend(_8e,"delegate")==_delegate){
_dragging=YES;
return CPDragOperationMove;
}
_dragging=NO;
return CPDragOperationNone;
}
}),new objj_method(sel_getUid("draggingExited:"),function(_8f,_90,_91){
with(_8f){
_dragging=NO;
objj_msgSend(_8f,"updateDropTarget:",nil);
}
}),new objj_method(sel_getUid("draggingUpdated:"),function(_92,_93,_94){
with(_92){
if(!_dragging){
return;
}
var _95=objj_msgSend(_92,"rowViewAtPoint:",objj_msgSend(_94,"draggingLocation"));
var _96=objj_msgSend(_94,"draggingSource");
if(!objj_msgSend(_96,"isKindOfClass:",SPRuleEditorRowView)){
objj_msgSend(_92,"updateDropTarget:",nil);
return CPDragOperationNone;
}
if(!_95||_95==_96||objj_msgSend(_96,"hasSubrow:",_95)){
objj_msgSend(_92,"updateDropTarget:",nil);
return CPDragOperationNone;
}
var row=objj_msgSend(_96,"item");
var _97=objj_msgSend(_95,"item");
if(_delegate&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("canMoveRow:afterRow:"))&&!objj_msgSend(_delegate,"canMoveRow:afterRow:",row,_97)){
objj_msgSend(_92,"updateDropTarget:",nil);
return CPDragOperationNone;
}
objj_msgSend(_92,"updateDropTarget:",_95);
return CPDragOperationMove;
}
}),new objj_method(sel_getUid("performDragOperation:"),function(_98,_99,_9a){
with(_98){
var _9b=objj_msgSend(_98,"rowViewAtPoint:",objj_msgSend(_9a,"draggingLocation"));
var _9c=objj_msgSend(_9a,"draggingSource");
if(!objj_msgSend(_9c,"isKindOfClass:",SPRuleEditorRowView)){
objj_msgSend(_98,"updateDropTarget:",nil);
return CPDragOperationNone;
}
if(!_9b||_9b==_9c||objj_msgSend(_9c,"hasSubrow:",_9b)){
objj_msgSend(_98,"updateDropTarget:",nil);
return CPDragOperationNone;
}
var row=objj_msgSend(_9c,"item");
var _9d=objj_msgSend(_9b,"item");
if(_delegate&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("moveRow:afterRow:"))){
objj_msgSend(_delegate,"moveRow:afterRow:",row,_9d);
}
_dragging=NO;
objj_msgSend(_98,"updateDropTarget:",nil);
return YES;
}
}),new objj_method(sel_getUid("updateDropTarget:"),function(_9e,_9f,_a0){
with(_9e){
if(_currentDropTarget==_a0){
return;
}
objj_msgSend(_currentDropTarget,"setShowDragIndicator:",NO);
if(_a0){
_currentDropTarget=_a0;
objj_msgSend(_currentDropTarget,"setShowDragIndicator:",YES);
}
objj_msgSend(_9e,"layoutSubviews");
objj_msgSend(_9e,"setNeedsDisplay:",YES);
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("themeAttributes"),function(_a1,_a2){
with(_a1){
return objj_msgSend(SPRuleEditor,"themeAttributes");
}
})]);
e;