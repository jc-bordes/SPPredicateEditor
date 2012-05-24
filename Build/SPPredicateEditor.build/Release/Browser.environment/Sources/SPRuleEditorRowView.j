@STATIC;1.0;I;21;Foundation/CPObject.jI;15;AppKit/CPView.jI;17;AppKit/CPButton.jI;20;AppKit/CPTextField.jI;15;AppKit/CPMenu.jI;22;AppKit/CPPopUpButton.jI;17;AppKit/CPButton.ji;23;SPRuleEditorCriterion.ji;25;SPRuleEditorPopUpButton.ji;26;SPRuleEditorActionButton.jt;32101;
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
