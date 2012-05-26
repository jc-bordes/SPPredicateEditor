@STATIC;1.0;i;14;SPRuleEditor.ji;30;SPPredicateEditorRowTemplate.jt;23853;
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
if(!_18||!objj_msgSend(_18,"isKindOfClass:",CPMenuItem)){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_17+" : invalid compound template view");
}
var _19=objj_msgSend(_16,"mappedTemplateForObject:",_18);
if(!_19){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_17+" : invalid compound template view");
}
var _1a=objj_msgSend(_19,"compoundTypes");
if(!_1a||!objj_msgSend(_1a,"count")){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_17+" : invalid compound template");
}
return _1a[0];
}
}),new objj_method(sel_getUid("templateForPredicate:"),function(_1b,_1c,_1d){
with(_1b){
if(!_1d){
return nil;
}
var _1e;
var _1f=0;
var _20=CPNotFound;
var _21;
var _22=_rowTemplates?objj_msgSend(_rowTemplates,"count"):0;
for(var i=0;i<_22;i++){
_21=_rowTemplates[i];
_1e=objj_msgSend(_21,"matchForPredicate:",_1d);
if(_1e>_1f){
_1f=_1e;
_20=i;
}
}
if(_20==CPNotFound){
return nil;
}
return objj_msgSend(_rowTemplates,"objectAtIndex:",_20);
}
}),new objj_method(sel_getUid("createRowForPredicate:"),function(_23,_24,_25){
with(_23){
if(!_25){
return nil;
}
var _26=objj_msgSend(_23,"templateForPredicate:",_25);
if(!_26){
return nil;
}
var _27=objj_msgSend(_23,"criteriaForPredicate:usingTemplate:",_25,_26);
_27=objj_msgSend(_26,"preProcessCriteria:",_27);
var _28=objj_msgSend(_25,"isKindOfClass:",CPCompoundPredicate)?SPRuleEditorRowTypeCompound:SPRuleEditorRowTypeSimple;
var row=objj_msgSend(objj_msgSend(SPRuleEditorModelItem,"alloc"),"initWithType:criteria:data:",_28,_27,_26);
var _29=objj_msgSend(_26,"displayableSubpredicatesOfPredicate:",_25);
if(!_29){
return row;
}
var _2a;
var _2b;
var _2c=objj_msgSend(_29,"count");
for(var i=0;i<_2c;i++){
_2b=_29[i];
_26=objj_msgSend(_23,"templateForPredicate:",_2b);
_2a=objj_msgSend(_23,"createRowForPredicate:",_2b);
if(_2a){
objj_msgSend(row,"addChild:context:",_2a,nil);
}
}
return row;
}
}),new objj_method(sel_getUid("criteriaForPredicate:usingTemplate:"),function(_2d,_2e,_2f,_30){
with(_2d){
if(objj_msgSend(_2f,"isKindOfClass:",CPCompoundPredicate)){
return objj_msgSend(_2d,"criteriaForCompoundPredicate:usingTemplate:",_2f,_30);
}
if(objj_msgSend(_2f,"isKindOfClass:",CPComparisonPredicate)){
return objj_msgSend(_2d,"criteriaForComparisonPredicate:usingTemplate:",_2f,_30);
}
return nil;
}
}),new objj_method(sel_getUid("criteriaForCompoundPredicate:usingTemplate:"),function(_31,_32,_33,_34){
with(_31){
if(!_compoundCriteriaRoot||!_34||!_33||!objj_msgSend(_33,"isKindOfClass:",CPCompoundPredicate)){
return nil;
}
var _35=objj_msgSend(_33,"compoundPredicateType");
var _36=objj_msgSend(_compoundCriteriaRoot,"count");
var _37=nil;
var _38;
var _39;
for(var i=0;i<_36;i++){
_38=objj_msgSend(_compoundCriteriaRoot,"objectAtIndex:",i);
if(!objj_msgSend(_38,"isKindOfClass:",CPMenuItem)||objj_msgSend(_38,"representedObject")!==_35){
continue;
}
_39=objj_msgSend(_31,"mappedTemplateForObject:",_38);
if(_39!=_34){
continue;
}
_37=_38;
break;
}
if(!_37){
return nil;
}
var _3a=objj_msgSend(objj_msgSend(SPRuleEditorCriterion,"alloc"),"initWithItems:displayValue:",_compoundCriteriaRoot,_37);
var _3b=objj_msgSend(CPMutableArray,"arrayWithObject:",_3a);
var _3c=_37;
var _3d;
while((_3d=objj_msgSend(_3c,"target"))!=nil){
_3a=objj_msgSend(_31,"createCriterionFromView:",_3d);
if(objj_msgSend(_3d,"isKindOfClass:",CPPopUpButton)){
_3c=objj_msgSend(_3a,"displayValue");
objj_msgSend(_3b,"addObject:",_3a);
continue;
}
if(objj_msgSend(_3d,"isKindOfClass:",CPView)){
_3c=_3d;
objj_msgSend(_3b,"addObject:",_3a);
continue;
}
break;
}
return _3b;
}
}),new objj_method(sel_getUid("criteriaForComparisonPredicate:usingTemplate:"),function(_3e,_3f,_40,_41){
with(_3e){
if(!_simpleCriteriaRoot||!_41||!_40||!objj_msgSend(_40,"isKindOfClass:",CPComparisonPredicate)){
return nil;
}
var _42=objj_msgSend(_40,"leftExpression");
if(!_42){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_3f+" : invalid predicate");
}
var _43;
var _44;
var _45=objj_msgSend(_42,"keyPath");
var _46=objj_msgSend(_simpleCriteriaRoot,"count");
for(var i=0;i<_46;i++){
_44=objj_msgSend(_simpleCriteriaRoot,"objectAtIndex:",i);
if(!objj_msgSend(_44,"isKindOfClass:",CPMenuItem)||objj_msgSend(_44,"title")!==_45){
continue;
}
_43=objj_msgSend(_3e,"mappedTemplateForObject:",_44);
if(_43!=_41){
continue;
}
rootItem=_44;
break;
}
var _47=objj_msgSend(objj_msgSend(SPRuleEditorCriterion,"alloc"),"initWithItems:displayValue:",_simpleCriteriaRoot,rootItem);
var _48=objj_msgSend(CPMutableArray,"arrayWithObject:",_47);
var _49=objj_msgSend(rootItem,"target");
var _4a=objj_msgSend(_40,"predicateOperatorType");
_47=objj_msgSend(_3e,"createCriterionFromView:representedObject:",_49,_4a);
if(!_47){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_3f+" : invalid predicate");
}
objj_msgSend(_48,"addObject:",_47);
_49=objj_msgSend(objj_msgSend(_47,"displayValue"),"target");
_42=objj_msgSend(_40,"rightExpression");
if(!_42){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_3f+" : invalid predicate");
}
_45=objj_msgSend(_42,"keyPath");
_47=objj_msgSend(_3e,"createCriterionFromView:representedObject:",_49,_45);
if(!_47){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_3f+" : invalid predicate");
}
objj_msgSend(_48,"addObject:",_47);
if(objj_msgSend(_41,"options")){
_49=objj_msgSend(objj_msgSend(_47,"displayValue"),"target");
_47=objj_msgSend(_3e,"createCriterionFromView:representedObject:",_49,objj_msgSend(_40,"options"));
if(!_47){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_3f+" : invalid predicate");
}
objj_msgSend(_48,"addObject:",_47);
}
var _4b=objj_msgSend(objj_msgSend(_47,"displayValue"),"target");
while((_49=objj_msgSend(_4b,"target"))!=nil){
_47=objj_msgSend(_3e,"createCriterionFromView:",_49);
if(objj_msgSend(_49,"isKindOfClass:",CPPopUpButton)){
_4b=objj_msgSend(_47,"displayValue");
objj_msgSend(_48,"addObject:",_47);
continue;
}
if(objj_msgSend(_49,"isKindOfClass:",CPView)){
_4b=_49;
objj_msgSend(_48,"addObject:",_47);
continue;
}
break;
}
return _48;
}
}),new objj_method(sel_getUid("createCriterionFromView:"),function(_4c,_4d,_4e){
with(_4c){
var _4f;
var _50;
if(objj_msgSend(_4e,"isKindOfClass:",CPPopUpButton)){
_4f=objj_msgSend(_4e,"itemArray");
_50=_4f&&objj_msgSend(_4f,"count")?_4f[0]:nil;
return objj_msgSend(objj_msgSend(SPRuleEditorCriterion,"alloc"),"initWithItems:displayValue:",_4f,_50);
}
if(objj_msgSend(_4e,"isKindOfClass:",CPView)){
_4f=objj_msgSend(CPMutableArray,"arrayWithObject:",_4e);
_50=objj_msgSend(CPKeyedUnarchiver,"unarchiveObjectWithData:",objj_msgSend(CPKeyedArchiver,"archivedDataWithRootObject:",_4e));
objj_msgSend(_50,"setTarget:",objj_msgSend(_4e,"target"));
return objj_msgSend(objj_msgSend(SPRuleEditorCriterion,"alloc"),"initWithItems:displayValue:",_4f,_50);
}
return nil;
}
}),new objj_method(sel_getUid("createCriterionFromView:representedObject:"),function(_51,_52,_53,_54){
with(_51){
var _55;
var _56;
if(objj_msgSend(_53,"isKindOfClass:",CPPopUpButton)){
_55=objj_msgSend(_53,"itemArray");
if(objj_msgSend(_54,"isKindOfClass:",CPString)){
_56=objj_msgSend(_53,"itemWithTitle:",_54);
}else{
var _57=objj_msgSend(_53,"indexOfItemWithRepresentedObject:",_54);
if(_57==CPNotFound){
return nil;
}
_56=objj_msgSend(_53,"itemAtIndex:",_57);
}
return objj_msgSend(objj_msgSend(SPRuleEditorCriterion,"alloc"),"initWithItems:displayValue:",_55,_56);
}
if(objj_msgSend(_53,"isKindOfClass:",CPView)){
_55=objj_msgSend(CPMutableArray,"arrayWithObject:",_53);
_56=objj_msgSend(CPKeyedUnarchiver,"unarchiveObjectWithData:",objj_msgSend(CPKeyedArchiver,"archivedDataWithRootObject:",_53));
objj_msgSend(_56,"setTarget:",objj_msgSend(_53,"target"));
if(objj_msgSend(_54,"isKindOfClass:",CPString)&&objj_msgSend(_53,"respondsToSelector:",sel_getUid("setStringValue:"))){
objj_msgSend(_53,"setStringValue:",_54);
}else{
if(objj_msgSend(_53,"respondsToSelector:",sel_getUid("setObjectValue:"))){
objj_msgSend(_53,"setObjectValue:",_54);
}
}
return objj_msgSend(objj_msgSend(SPRuleEditorCriterion,"alloc"),"initWithItems:displayValue:",_55,_56);
}
return nil;
}
}),new objj_method(sel_getUid("setupRowTemplates"),function(_58,_59){
with(_58){
if(!_rowTemplates||!objj_msgSend(_rowTemplates,"count")){
_simpleCriteriaRoot=nil;
_compoundCriteriaRoot=nil;
return;
}
var _5a;
var _5b;
var _5c=objj_msgSend(_rowTemplates,"count");
for(var i=0;i<_5c;i++){
objj_msgSend(_58,"setupCriteriaForTemplate:",objj_msgSend(_rowTemplates,"objectAtIndex:",i));
}
}
}),new objj_method(sel_getUid("setupCriteriaForTemplate:"),function(_5d,_5e,_5f){
with(_5d){
if(!_5f){
return;
}
var _60=objj_msgSend(_5f,"templateViews");
if(!_60||!objj_msgSend(_60,"count")){
return;
}
var _61;
var _62=objj_msgSend(_5f,"_rowType");
if(_62==SPRuleEditorRowTypeSimple){
if(!_simpleCriteriaRoot){
_simpleCriteriaRoot=objj_msgSend(CPMutableArray,"array");
}
_61=_simpleCriteriaRoot;
}else{
if(_62==SPRuleEditorRowTypeCompound){
if(!_compoundCriteriaRoot){
_compoundCriteriaRoot=objj_msgSend(CPMutableArray,"array");
}
_61=_compoundCriteriaRoot;
}else{
return;
}
}
var _63;
var _64=nil;
var _65=objj_msgSend(_60,"count");
for(var i=0;i<_65;i++){
_63=objj_msgSend(_60,"objectAtIndex:",i);
_64=(i<_65-1)?objj_msgSend(_60,"objectAtIndex:",i+1):nil;
objj_msgSend(_5d,"setTarget:forView:",_64,_63);
if(i==0){
objj_msgSend(_5d,"retainItemsOfView:inRoot:forTemplate:",_63,_61,_5f);
}
}
}
}),new objj_method(sel_getUid("setTarget:forView:"),function(_66,_67,_68,_69){
with(_66){
if(!_69){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,_67+" : template views must not be nil.");
}
if(!objj_msgSend(_69,"isKindOfClass:",CPControl)){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,_67+" : template views must extend CPControl");
}
if(objj_msgSend(_69,"isKindOfClass:",CPPopUpButton)){
var _6a=objj_msgSend(_69,"itemArray");
var _6b=objj_msgSend(_6a,"count");
var _6c;
for(var i=0;i<_6b;i++){
_6c=objj_msgSend(_6a,"objectAtIndex:",i);
if(objj_msgSend(_6c,"isSeparatorItem")){
continue;
}
objj_msgSend(_6c,"setTarget:",_68);
}
return;
}
objj_msgSend(_69,"setTarget:",_68);
}
}),new objj_method(sel_getUid("retainItemsOfView:inRoot:forTemplate:"),function(_6d,_6e,_6f,_70,_71){
with(_6d){
if(!_6f){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,_6e+" : template views must not be nil.");
}
if(!objj_msgSend(_6f,"isKindOfClass:",CPPopUpButton)){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,_6e+" : template root (the first view) must extend CPPopUpButton");
}
var _72=objj_msgSend(_6f,"itemArray");
var _73=objj_msgSend(_72,"count");
var _74;
for(var i=0;i<_73;i++){
_74=objj_msgSend(_72,"objectAtIndex:",i);
if(objj_msgSend(_74,"isSeparatorItem")){
continue;
}
objj_msgSend(_70,"addObject:",_74);
objj_msgSend(_6d,"mapObject:withTemplate:protect:",_74,_71,YES);
}
}
}),new objj_method(sel_getUid("ruleEditor:numberOfChildrenForCriterion:withRowType:"),function(_75,_76,_77,_78,_79){
with(_75){
if(!_78){
if(_79==SPRuleEditorRowTypeSimple){
return objj_msgSend(_simpleCriteriaRoot,"count");
}
return objj_msgSend(_compoundCriteriaRoot,"count");
}
if(!objj_msgSend(_78,"respondsToSelector:",sel_getUid("target"))){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_76+" : invalid criterion");
}
var _7a=objj_msgSend(_78,"target");
if(!_7a||_7a==_78){
return 0;
}
if(objj_msgSend(_7a,"isKindOfClass:",CPPopUpButton)){
return objj_msgSend(_7a,"numberOfItems");
}else{
if(objj_msgSend(_7a,"isKindOfClass:",CPControl)){
return 1;
}
}
return 0;
}
}),new objj_method(sel_getUid("ruleEditor:child:forCriterion:withRowType:"),function(_7b,_7c,_7d,_7e,_7f,_80){
with(_7b){
if(!_7f){
if(_80==SPRuleEditorRowTypeSimple){
return objj_msgSend(_simpleCriteriaRoot,"objectAtIndex:",_7e);
}
return objj_msgSend(_compoundCriteriaRoot,"objectAtIndex:",_7e);
}
var _81=objj_msgSend(_7f,"target");
if(objj_msgSend(_81,"isKindOfClass:",objj_msgSend(CPPopUpButton,"class"))){
return objj_msgSend(_81,"itemAtIndex:",_7e);
}
if(objj_msgSend(_81,"isKindOfClass:",objj_msgSend(CPView,"class"))){
var _82=objj_msgSend(CPKeyedUnarchiver,"unarchiveObjectWithData:",objj_msgSend(CPKeyedArchiver,"archivedDataWithRootObject:",_81));
objj_msgSend(_82,"setTarget:",objj_msgSend(_81,"target"));
return _82;
}
return nil;
}
}),new objj_method(sel_getUid("ruleEditor:displayValueForCriterion:inRow:"),function(_83,_84,_85,_86,row){
with(_83){
if(objj_msgSend(_86,"isKindOfClass:",objj_msgSend(CPMenuItem,"class"))){
if(objj_msgSend(_86,"isSeparatorItem")){
return objj_msgSend(CPMenuItem,"separatorItem");
}
return _86;
}
return objj_msgSend(CPKeyedUnarchiver,"unarchiveObjectWithData:",objj_msgSend(CPKeyedArchiver,"archivedDataWithRootObject:",_86));
}
}),new objj_method(sel_getUid("predicateForRow:"),function(_87,_88,_89){
with(_87){
var row=objj_msgSend(_model,"rowAtIndex:",_89);
if(!row){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_88+" : invalid row index");
}
var _8a=objj_msgSend(row,"data");
if(!_8a||!objj_msgSend(_8a,"isKindOfClass:",SPPredicateEditorRowTemplate)){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_88+" : invalid row data, no template ref");
}
var _8b=objj_msgSend(_8a,"templateViews");
if(!_8b){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_88+" : invalid template, no views");
}
var _8c=objj_msgSend(row,"criteria");
if(!_8c){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_88+" : invalid row, missing criteria");
}
var _8d=objj_msgSend(_8b,"count");
if(objj_msgSend(_8c,"count")<_8d){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_88+" : invalid row or template, criteria and views number do not match");
}
var _8e;
var _8f;
var _90;
var _91=objj_msgSend(_87,"subpredicatesForRow:",row);
for(var i=0;i<_8d;i++){
_8e=objj_msgSend(_8b,"objectAtIndex:",i);
_90=objj_msgSend(_8c,"objectAtIndex:",i);
_8f=objj_msgSend(_90,"displayValue");
objj_msgSend(_87,"selectValue:inCriterionView:",_8f,_8e);
}
return objj_msgSend(_8a,"predicateWithSubpredicates:",_91);
}
}),new objj_method(sel_getUid("subpredicatesForRow:"),function(_92,_93,row){
with(_92){
if(!row||objj_msgSend(row,"rowType")!=SPRuleEditorRowTypeCompound){
return objj_msgSend(CPMutableArray,"array");
}
var _94;
var _95;
var _96=objj_msgSend(CPMutableArray,"array");
var _97=objj_msgSend(row,"subrowsCount");
for(var i=0;i<_97;i++){
_94=objj_msgSend(row,"childAtIndex:",i);
_95=objj_msgSend(_92,"predicateForRow:",objj_msgSend(_model,"indexOfRow:",_94));
if(!_95){
continue;
}
objj_msgSend(_96,"addObject:",_95);
}
return _96;
}
}),new objj_method(sel_getUid("selectValue:inCriterionView:"),function(_98,_99,_9a,_9b){
with(_98){
if(!_9a){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_99+" : invalid display value for criterion, must not be nil");
}
if(!_9b){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_99+" : invalid view in template, must not be nil");
}
if(objj_msgSend(_9a,"isKindOfClass:",CPMenuItem)){
if(!objj_msgSend(_9b,"isKindOfClass:",CPPopUpButton)){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_99+" : invalid display value for criterion, does not match template view class");
}
objj_msgSend(_9b,"selectItemWithTitle:",objj_msgSend(_9a,"title"));
return;
}
if(objj_msgSend(_9a,"isKindOfClass:",CPString)){
if(objj_msgSend(_9b,"isKindOfClass:",CPPopUpButton)){
objj_msgSend(_9b,"selectItemWithTitle:",_9a);
return;
}
if(objj_msgSend(_9b,"respondsToSelector:",sel_getUid("setStringValue:"))){
objj_msgSend(_9b,"setStringValue:",_9a);
return;
}
if(objj_msgSend(_9b,"respondsToSelector:",sel_getUid("setObjectValue:"))){
objj_msgSend(_9b,"setObjectValue:",objectValue);
return;
}
}
if(objj_msgSend(_9a,"isKindOfClass:",CPControl)){
if(objj_msgSend(_9b,"isKindOfClass:",CPPopUpButton)||!objj_msgSend(_9b,"isKindOfClass:",CPControl)){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_99+" : invalid display value for criterion, does not match template view class");
}
if(objj_msgSend(_9a,"respondsToSelector:",sel_getUid("color"))){
if(!objj_msgSend(_9b,"respondsToSelector:",sel_getUid("setColor:"))){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_99+" : invalid display value for criterion, does not match template view class");
}
objj_msgSend(_9b,"setColor:",objj_msgSend(_9a,"color"));
return;
}
if(objj_msgSend(_9a,"respondsToSelector:",sel_getUid("stringValue"))){
if(!objj_msgSend(_9b,"respondsToSelector:",sel_getUid("setStringValue:"))){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_99+" : invalid display value for criterion, does not match template view class");
}
objj_msgSend(_9b,"setStringValue:",objj_msgSend(_9a,"stringValue"));
return;
}
if(objj_msgSend(_9a,"respondsToSelector:",sel_getUid("objectValue"))){
if(!objj_msgSend(_9b,"respondsToSelector:",sel_getUid("setObjectValue:"))){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_99+" : invalid display value for criterion, does not match template view class");
}
objj_msgSend(_9b,"setObjectValue:",objj_msgSend(_9a,"objectValue"));
return;
}
}
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_99+" : failed to set display value on criterion, classes do not match");
}
}),new objj_method(sel_getUid("setDelegate"),function(_9c,_9d){
with(_9c){
}
}),new objj_method(sel_getUid("willInsertNewRowWithCriteria:atIndex:"),function(_9e,_9f,_a0,_a1){
with(_9e){
var _a2=objj_msgSend(_9e,"templateRefFromCriteria:",_a0);
if(_a2){
return objj_msgSend(_a2,"preProcessCriteria:",_a0);
}
return _a0;
}
}),new objj_method(sel_getUid("didAddRow:"),function(_a3,_a4,row){
with(_a3){
objj_msgSend(_a3,"updateTemplateRefForRow:",row);
}
}),new objj_method(sel_getUid("willModifyRow:"),function(_a5,_a6,row){
with(_a5){
var _a7=objj_msgSend(_a5,"updateTemplateRefForRow:",row);
var _a8=objj_msgSend(row,"criteria");
if(!_a8||!_a7){
return;
}
objj_msgSend(_a7,"preProcessCriteria:",_a8);
}
}),new objj_method(sel_getUid("criterionItemCopy:"),function(_a9,_aa,_ab){
with(_a9){
var _ac=objj_msgSend(_a9,"mappedTemplateForObject:",_ab);
var _ad=objj_msgSend(_ab,"copy");
objj_msgSend(_a9,"mapObject:withTemplate:",_ad,_ac);
return _ad;
}
}),new objj_method(sel_getUid("updateTemplateRefForRow:"),function(_ae,_af,row){
with(_ae){
if(!row){
return nil;
}
var _b0=objj_msgSend(_ae,"templateRefFromCriteria:",objj_msgSend(row,"criteria"));
objj_msgSend(row,"setData:",_b0);
return _b0;
}
}),new objj_method(sel_getUid("templateRefFromCriteria:"),function(_b1,_b2,_b3){
with(_b1){
if(!_b3||!objj_msgSend(_b3,"count")){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_b2+" : invalid criterion array, must not be empty");
}
var _b4=objj_msgSend(_b3,"objectAtIndex:",0);
var _b5=objj_msgSend(_b1,"mappedTemplateForObject:",objj_msgSend(_b4,"displayValue"));
if(!_b5){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_b2+" : orphan row, no template found");
}
return _b5;
}
}),new objj_method(sel_getUid("mapObject:withTemplate:"),function(_b6,_b7,_b8,_b9){
with(_b6){
objj_msgSend(_b6,"mapObject:withTemplate:protect:",_b8,_b9,NO);
}
}),new objj_method(sel_getUid("mapObject:withTemplate:protect:"),function(_ba,_bb,_bc,_bd,_be){
with(_ba){
if(!_bc||!_bd){
return;
}
_bc[":)"]=_bd;
}
}),new objj_method(sel_getUid("mappedTemplateForObject:"),function(_bf,_c0,_c1){
with(_bf){
if(!_c1){
return nil;
}
return _c1[":)"];
}
})]);
var _c2="CPPredicateTemplates";
var _1=objj_getClass("SPPredicateEditor");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"SPPredicateEditor\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_c3,_c4,_c5){
with(_c3){
_c3=objj_msgSendSuper({receiver:_c3,super_class:objj_getClass("SPPredicateEditor").super_class},"initWithCoder:",_c5);
if(_c3!=nil){
objj_msgSend(_c3,"setRowTemplates:",objj_msgSend(_c5,"decodeObjectForKey:",_c2));
}
return _c3;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_c6,_c7,_c8){
with(_c6){
objj_msgSendSuper({receiver:_c6,super_class:objj_getClass("SPPredicateEditor").super_class},"encodeWithCoder:",_c8);
objj_msgSend(_c8,"encodeObject:forKey:",_rowTemplates,_c2);
}
})]);
