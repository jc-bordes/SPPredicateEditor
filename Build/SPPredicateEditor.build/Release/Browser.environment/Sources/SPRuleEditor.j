@STATIC;1.0;I;24;Foundation/CPPredicate.jI;20;Foundation/CPArray.jI;25;Foundation/CPDictionary.jI;23;Foundation/CPIndexSet.jI;24;AppKit/CPViewAnimation.jI;15;AppKit/CPView.ji;19;SPRuleEditorModel.ji;18;SPRuleEditorView.ji;23;SPRuleEditorCriterion.jt;28841;
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
