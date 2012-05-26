@STATIC;1.0;I;21;Foundation/CPObject.jI;15;AppKit/CPView.jI;17;AppKit/CPButton.jI;20;AppKit/CPTextField.jI;15;AppKit/CPMenu.jI;22;AppKit/CPPopUpButton.jI;17;AppKit/CPButton.ji;23;SPRuleEditorCriterion.ji;25;SPRuleEditorPopUpButton.ji;26;SPRuleEditorActionButton.jt;32221;
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
var _8a=CGSizeMake(_89.size.width,_88);
objj_msgSend(_83,"setFrameSize:",_8a);
_89=objj_msgSend(_83,"frame");
var _8b=CGPointMake(_87,(_rowHeight-_89.size.height)/2);
objj_msgSend(_83,"setFrameOrigin:",_8b);
objj_msgSend(_contentView,"addSubview:",_83);
}
}),new objj_method(sel_getUid("bindCriterionViewItem:"),function(_8c,_8d,_8e){
with(_8c){
if(!_8e){
return;
}
if(objj_msgSend(_8e,"isKindOfClass:",CPMenuItem)){
objj_msgSend(_8e,"setTarget:",_8c);
objj_msgSend(_8e,"setAction:",sel_getUid("criterionChanged:"));
return;
}
if(objj_msgSend(_8e,"isKindOfClass:",CPTextField)){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_8c,sel_getUid("criterionChangedNotification:"),CPControlTextDidEndEditingNotification,_8e);
return;
}
if(!objj_msgSend(_8e,"isKindOfClass:",CPControl)){
return;
}
if(objj_msgSend(_8e,"respondsToSelector:",sel_getUid("objectValue"))){
objj_msgSend(_8e,"addObserver:forKeyPath:options:context:",_8c,"objectValue",CPKeyValueObservingOptionNew|CPKeyValueObservingOptionOld,nil);
}
if(objj_msgSend(_8e,"respondsToSelector:",sel_getUid("stringValue"))){
objj_msgSend(_8e,"addObserver:forKeyPath:options:context:",_8c,"stringValue",CPKeyValueObservingOptionNew|CPKeyValueObservingOptionOld,nil);
}
if(objj_msgSend(_8e,"respondsToSelector:",sel_getUid("color"))){
objj_msgSend(_8e,"addObserver:forKeyPath:options:context:",_8c,"color",CPKeyValueObservingOptionNew|CPKeyValueObservingOptionOld,nil);
}
}
}),new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"),function(_8f,_90,_91,_92,_93,_94){
with(_8f){
objj_msgSend(_8f,"criterionChanged:",_92);
}
}),new objj_method(sel_getUid("addViewForCriterion:withValue:atIndex:afterCriterionView:"),function(_95,_96,_97,_98,_99,_9a){
with(_95){
if(!objj_msgSend(_97,"isStandaloneView")){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_96+" : Invalid SPRuleEditorCriterion");
}
var _9b;
if(objj_msgSend(_98,"isKindOfClass:",CPView)){
_9b=objj_msgSend(_delegate,"criterionItemCopy:",_98);
objj_msgSend(_9b,"setHidden:",objj_msgSend(_97,"hidden"));
objj_msgSend(_95,"addCriterionView:afterCriterionView:",_9b,_9a);
objj_msgSend(_95,"bindCriterionViewItem:",_9b);
return _9b;
}
_9b=objj_msgSend(_delegate,"criterionItemCopy:",objj_msgSend(_97,"standaloneView"));
if(!_98){
objj_msgSend(_9b,"setHidden:",objj_msgSend(_97,"hidden"));
objj_msgSend(_95,"addCriterionView:afterCriterionView:",_9b,_9a);
objj_msgSend(_95,"bindCriterionViewItem:",_9b);
return _9b;
}
if(objj_msgSend(_98,"isKindOfClass:",CPString)){
if(objj_msgSend(_9b,"respondsToSelector:",sel_getUid("setStringValue:"))){
objj_msgSend(_9b,"setStringValue:",_98);
}else{
if(objj_msgSend(_9b,"respondsToSelector:",sel_getUid("setObjectValue:"))){
objj_msgSend(_9b,"setObjectValue:",_98);
}
}
objj_msgSend(_9b,"setHidden:",objj_msgSend(_97,"hidden"));
objj_msgSend(_95,"addCriterionView:afterCriterionView:",_9b,_9a);
objj_msgSend(_95,"bindCriterionViewItem:",_9b);
return _9b;
}
if(objj_msgSend(_97,"respondsToSelector:",sel_getUid("setObjectValue:"))){
objj_msgSend(_97,"setObjectValue:",_98);
}
objj_msgSend(_9b,"setHidden:",objj_msgSend(_97,"hidden"));
objj_msgSend(_95,"addCriterionView:afterCriterionView:",_9b,_9a);
objj_msgSend(_95,"bindCriterionViewItem:",_9b);
return _9b;
}
}),new objj_method(sel_getUid("addMenuForCriterion:withValue:atIndex:afterCriterionView:"),function(_9c,_9d,_9e,_9f,_a0,_a1){
with(_9c){
if(!objj_msgSend(_9e,"isMenu")){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_9d+" : Invalid SPRuleEditorCriterion");
}
var _a2=objj_msgSend(CPArray,"arrayWithArray:",objj_msgSend(_9e,"items"));
var _a3=objj_msgSend(_a2,"count");
if(_a3==1){
return objj_msgSend(_9c,"addStaticTextForCriterion:afterCriterionView:",_9e,_a1);
}
var _a4;
var _a5=CPNotFound;
var _a6=nil;
if(_9f){
if(objj_msgSend(_9f,"isKindOfClass:",CPNumber)){
_a5=objj_msgSend(_9f,"intValue");
}else{
if(objj_msgSend(_9f,"isKindOfClass:",CPString)){
_a6=_9f;
}else{
if(!isNaN(_9f)){
_a5=objj_msgSend(_9f,"intValue");
}else{
if(objj_msgSend(_9f,"isKindOfClass:",CPMenuItem)){
_a6=objj_msgSend(_9f,"title");
}else{
if(objj_msgSend(_9f,"respondsToSelector:",sel_getUid("description"))){
_a6=objj_msgSend(_9f,"description");
}
}
}
}
}
}
for(var i=0;i<_a3;i++){
_a4=_a2[i];
if(!_a4){
_a2[i]=objj_msgSend(CPMenuItem,"separatorItem");
continue;
}
if(objj_msgSend(_a4,"isKindOfClass:",CPString)){
if(objj_msgSend(_a4,"length")==0){
_a2[i]=objj_msgSend(CPMenuItem,"separatorItem");
continue;
}
_a2[i]=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:",_a4,sel_getUid("criterionChanged:"),"");
objj_msgSend(_9c,"bindCriterionViewItem:",_a2[i]);
continue;
}
_a4=objj_msgSend(_delegate,"criterionItemCopy:",_a4);
objj_msgSend(_a4,"setState:",CPOffState);
if(objj_msgSend(_a4,"menu")){
objj_msgSend(objj_msgSend(_a4,"menu"),"removeItem:",_a4);
}
_a2[i]=_a4;
objj_msgSend(_9c,"bindCriterionViewItem:",_a2[i]);
}
var _a7=nil;
if(_a5!=CPNotFound&&_a5<objj_msgSend(_a2,"count")){
_a7=objj_msgSend(_a2,"objectAtIndex:",_a5);
}else{
if(_a6){
var idx=objj_msgSend(_a2,"indexOfObjectPassingTest:",function(obj,_a8){
return objj_msgSend(obj,"title")==_a6;
});
if(idx!=CPNotFound){
_a7=_a2[idx];
}
}else{
var idx=_a7=objj_msgSend(_a2,"indexOfObjectPassingTest:",function(obj,_a9){
return !objj_msgSend(obj,"isSeparatorItem");
});
if(idx!=CPNotFound){
_a7=_a2[idx];
}
}
}
if(!_a7){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_9d+" : Invalid SPRuleEditorCriterion");
}
var _aa=objj_msgSend(_a7,"title");
var _ab=objj_msgSend(_9c,"valueForThemeAttribute:","font");
var _ac=objj_msgSend(_aa,"sizeWithFont:",_ab).width+25;
var _ad=CGRectMake(0,0,_ac+((_ac%25)?25:0),SPRuleEditorRowViewButtonHeight);
var _ae=objj_msgSend(objj_msgSend(SPRuleEditorPopUpButton,"alloc"),"initWithFrame:",_ad);
objj_msgSend(_ae,"setValue:forThemeAttribute:",_ab,"font");
objj_msgSend(_ae,"setValue:forThemeAttribute:",CGSizeMake(0,SPRuleEditorRowViewCriterionHeight),"min-size");
for(var i=0;i<_a3;i++){
_a4=objj_msgSend(_a2,"objectAtIndex:",i);
if(!objj_msgSend(_a4,"isSeparatorItem")){
_aa=objj_msgSend(_a4,"title");
objj_msgSend(_a4,"setTitle:",objj_msgSend(_9c,"localizedString:",_aa));
}
objj_msgSend(_ae,"addItem:",_a4);
}
objj_msgSend(_ae,"selectItemWithTitle:",objj_msgSend(_a7,"title"));
objj_msgSend(_ae,"setHidden:",objj_msgSend(_9e,"hidden"));
objj_msgSend(_9c,"addCriterionView:afterCriterionView:",_ae,_a1);
return _ae;
}
}),new objj_method(sel_getUid("addStaticTextForCriterion:afterCriterionView:"),function(_af,_b0,_b1,_b2){
with(_af){
if(!objj_msgSend(_b1,"isMenu")){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_b0+" : Invalid SPRuleEditorCriterion");
}
var _b3=objj_msgSend(CPArray,"arrayWithArray:",objj_msgSend(_b1,"items"));
var _b4;
_b4=_b3[0];
if(!_b4||(objj_msgSend(_b4,"isKindOfClass:",CPString)&&objj_msgSend(_b4,"length")==0)){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,_b0+" : Invalid SPRuleEditorCriterion");
}
var _b5;
if(objj_msgSend(_b4,"isKindOfClass:",CPMenuItem)){
_b5=objj_msgSend(_b4,"title");
}else{
_b5=_b4;
}
var _b6=CGRectMake(0,0,100,_rowHeight);
var _b7=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",_b6);
objj_msgSend(_b7,"setStaticWithFont:",objj_msgSend(_af,"valueForThemeAttribute:","font"));
objj_msgSend(_b7,"setStringValue:",objj_msgSend(_af,"localizedString:",_b5));
objj_msgSend(_b7,"sizeToFit");
objj_msgSend(_af,"addCriterionView:afterCriterionView:",_b7,_b2);
return _b7;
}
}),new objj_method(sel_getUid("removeFromSuperview"),function(_b8,_b9){
with(_b8){
if(objj_msgSend(_b8,"superview")){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"removeObserver:",_b8);
}
objj_msgSendSuper({receiver:_b8,super_class:objj_getClass("SPRuleEditorRowView").super_class},"removeFromSuperview");
}
}),new objj_method(sel_getUid("addRowView:"),function(_ba,_bb,_bc){
with(_ba){
objj_msgSend(_subrowsView,"addSubview:",_bc);
}
}),new objj_method(sel_getUid("removeRowView:"),function(_bd,_be,_bf){
with(_bd){
objj_msgSend(_bf,"removeFromSuperview");
}
}),new objj_method(sel_getUid("addRowView:positioned:relativeTo:"),function(_c0,_c1,_c2,_c3,_c4){
with(_c0){
objj_msgSend(_subrowsView,"addSubview:positioned:relativeTo:",_c2,_c3,_c4);
}
}),new objj_method(sel_getUid("_layoutSubviews"),function(_c5,_c6){
with(_c5){
var _c7=objj_msgSend(_subrowsView,"subviews");
var _c8=objj_msgSend(_c7,"count");
var _c9;
var _ca;
var _cb=0;
for(var i=0;i<_c8;i++){
_c9=_c7[i];
if(!objj_msgSend(_c9,"isKindOfClass:",SPRuleEditorRowView)){
continue;
}
objj_msgSend(_c9,"_layoutSubviews");
_ca=objj_msgSend(_c9,"frame");
_ca.origin.y=_cb;
objj_msgSend(_c9,"setFrame:",_ca);
_cb+=_ca.size.height;
objj_msgSend(_c9,"setFrame:",_ca);
}
var _cc=_showDragIndicator?SPRuleEditorRowViewDragIndicatorHeight:0;
_ca=objj_msgSend(_subrowsView,"frame");
_ca.origin.y=_rowHeight+_cc;
_ca.size.height=_cb;
objj_msgSend(_subrowsView,"setFrame:",_ca);
_ca=objj_msgSend(_addButton,"frame");
_ca.origin.y=((_rowHeight-SPRuleEditorRowViewButtonHeight)/2)-1;
objj_msgSend(_addButton,"setFrame:",_ca);
objj_msgSend(_addButton,"setHidden:",(!_editable||(_delegate&&objj_msgSend(_delegate,"nestingMode")==SPRuleEditorNestingModeSingle)));
_ca=objj_msgSend(_removeButton,"frame");
_ca.origin.y=((_rowHeight-SPRuleEditorRowViewButtonHeight)/2)-1;
objj_msgSend(_removeButton,"setFrame:",_ca);
objj_msgSend(_removeButton,"setHidden:",(!_editable||(_delegate&&(!objj_msgSend(_delegate,"isRowRemoveable:",_item)||objj_msgSend(_delegate,"nestingMode")==SPRuleEditorNestingModeSingle))));
subviews=objj_msgSend(_contentView,"subviews");
_c8=objj_msgSend(subviews,"count");
for(var i=0;i<_c8;i++){
_c9=subviews[i];
_ca=objj_msgSend(_c9,"frame");
_ca.origin.y=objj_msgSend(_c9,"isKindOfClass:",CPButton)?((_rowHeight-_ca.size.height)/2)-1:((_rowHeight-_ca.size.height)/2);
objj_msgSend(_c9,"setFrame:",_ca);
}
var _cd=objj_msgSend(_contentView,"frameSize");
_cd.height=_rowHeight;
objj_msgSend(_contentView,"setFrameSize:",_cd);
_cd=objj_msgSend(_c5,"frameSize");
_cd.height=_cb+_rowHeight+_cc;
objj_msgSend(_c5,"setFrameSize:",_cd);
}
}),new objj_method(sel_getUid("rowViewWithItem:"),function(_ce,_cf,_d0){
with(_ce){
if(_item==_d0){
return _ce;
}
var _d1=objj_msgSend(_subrowsView,"subviews");
var _d2;
var _d3;
var _d4=objj_msgSend(_d1,"count");
for(var i=0;i<_d4;i++){
_d2=_d1[i];
if(!objj_msgSend(_d2,"isKindOfClass:",SPRuleEditorRowView)){
continue;
}
_d3=objj_msgSend(_d2,"rowViewWithItem:",_d0);
if(_d3){
return _d3;
}
}
return nil;
}
}),new objj_method(sel_getUid("drawBordersInContext:verticalOffset:width:"),function(_d5,_d6,_d7,_d8,_d9){
with(_d5){
var _da=objj_msgSend(_d5,"frame");
CGContextSaveGState(_d7);
CGContextBeginPath(_d7);
CGContextMoveToPoint(_d7,0,_da.origin.y+_d8+0.5);
CGContextAddLineToPoint(_d7,_d9,_da.origin.y+_d8+0.5);
CGContextClosePath(_d7);
CGContextSetStrokeColor(_d7,objj_msgSend(CPColor,"whiteColor"));
CGContextSetLineWidth(1);
CGContextStrokePath(_d7);
var _db=_showDragIndicator?SPRuleEditorRowViewDragIndicatorHeight:0;
if(_db){
indent=objj_msgSend(_item,"rowType")==SPRuleEditorRowTypeSimple?SPRuleEditorRowViewIndent*objj_msgSend(_item,"depth"):SPRuleEditorRowViewIndent*(objj_msgSend(_item,"depth")+1);
CGContextBeginPath(_d7);
CGContextMoveToPoint(_d7,indent,_d8+_da.origin.y+_rowHeight+(_db/2)+-0.5);
CGContextAddLineToPoint(_d7,_d9,_d8+_da.origin.y+_rowHeight+(_db/2)-0.5);
CGContextSetLineWidth(SPRuleEditorRowViewDragIndicatorHeight);
CGContextClosePath(_d7);
CGContextSetStrokeColor(_d7,objj_msgSend(CPColor,"grayColor"));
CGContextStrokePath(_d7);
}
CGContextBeginPath(_d7);
CGContextMoveToPoint(_d7,0,_d8+_da.origin.y+_rowHeight+_db+-0.5);
CGContextAddLineToPoint(_d7,_d9,_d8+_da.origin.y+_rowHeight+_db-0.5);
CGContextSetLineWidth(1);
CGContextClosePath(_d7);
CGContextSetStrokeColor(_d7,objj_msgSend(_d5,"valueForThemeAttribute:","slice-bottom-border-color"));
CGContextStrokePath(_d7);
CGContextRestoreGState(_d7);
var _dc=objj_msgSend(_subrowsView,"subviews");
var _dd=objj_msgSend(_dc,"count");
var _de;
_d8+=_da.origin.y+_rowHeight+_db;
for(var i=0;i<_dd;i++){
_de=_dc[i];
if(!objj_msgSend(_de,"isKindOfClass:",SPRuleEditorRowView)){
continue;
}
objj_msgSend(_de,"drawBordersInContext:verticalOffset:width:",_d7,_d8,_d9);
}
}
}),new objj_method(sel_getUid("addClicked:"),function(_df,_e0,_e1){
with(_df){
objj_msgSend(objj_msgSend(_df,"window"),"makeFirstResponder:",_df);
if(_frozenActions||!_delegate||!_e1||!objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("insertNewRowOfType:afterRow:"))){
return;
}
var _e2=objj_msgSend(objj_msgSend(CPApp,"currentEvent"),"modifierFlags")&CPAlternateKeyMask;
var _e3=(_e2&&_delegate&&objj_msgSend(_delegate,"nestingMode")==SPRuleEditorNestingModeCompound)?SPRuleEditorRowTypeCompound:SPRuleEditorRowTypeSimple;
objj_msgSend(_delegate,"insertNewRowOfType:afterRow:",_e3,_item);
}
}),new objj_method(sel_getUid("removeClicked:"),function(_e4,_e5,_e6){
with(_e4){
objj_msgSend(objj_msgSend(_e4,"window"),"makeFirstResponder:",_e4);
if(_frozenActions||!_delegate||!_e6||!objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("removeRow:"))){
return;
}
objj_msgSend(_delegate,"removeRow:",_item);
}
}),new objj_method(sel_getUid("criterionChangedNotification:"),function(_e7,_e8,_e9){
with(_e7){
if(!_e9){
return;
}
var _ea=objj_msgSend(_e9,"object");
if(!_ea){
return;
}
objj_msgSend(_e7,"criterionChanged:",_ea);
}
}),new objj_method(sel_getUid("criterionChanged:"),function(_eb,_ec,_ed){
with(_eb){
if(_updating){
return;
}
_updating=YES;
objj_msgSend(objj_msgSend(_eb,"window"),"makeFirstResponder:",_eb);
_updating=NO;
if(_frozenActions||!_delegate||!_ed||!objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("valueChanged:criterionIndex:valueIndex:inRow:"))){
return;
}
var _ee=nil;
var _ef=CPNotFound;
var _f0=0;
if(objj_msgSend(_ed,"isKindOfClass:",CPMenuItem)){
_f0=objj_msgSend(objj_msgSend(_ed,"menu"),"indexOfItem:",_ed);
_ee=_ed;
_ef=objj_msgSend(_eb,"indexOfCriterion:",_ed);
}else{
_ee=_ed;
_ef=objj_msgSend(_eb,"indexOfCriterion:",_ed);
}
if(_ef==CPNotFound){
return;
}
objj_msgSend(_delegate,"valueChanged:criterionIndex:valueIndex:inRow:",_ee,_ef,_f0,_item);
}
}),new objj_method(sel_getUid("localizedString:"),function(_f1,_f2,str){
with(_f1){
if(_delegate&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("localizedString:"))){
return objj_msgSend(_delegate,"localizedString:",str);
}
return str;
}
}),new objj_method(sel_getUid("hitTest:"),function(_f3,_f4,_f5){
with(_f3){
var res=objj_msgSendSuper({receiver:_f3,super_class:objj_getClass("SPRuleEditorRowView").super_class},"hitTest:",_f5);
if(res==_contentView){
return _f3;
}
return res;
}
}),new objj_method(sel_getUid("viewAtPoint:"),function(_f6,_f7,_f8){
with(_f6){
var _f9=objj_msgSend(_f6,"convertPoint:fromView:",_f8,nil);
var _fa=objj_msgSend(_contentView,"frame");
if(CPRectContainsPoint(_fa,_f9)){
return _f6;
}
var _fb;
var _fc;
var _fd=objj_msgSend(_subrowsView,"subviews");
var _fe=objj_msgSend(_fd,"count");
for(var i=0;i<_fe;i++){
_fc=_fd[i];
if(!objj_msgSend(_fc,"isKindOfClass:",SPRuleEditorRowView)){
continue;
}
_fb=objj_msgSend(_fc,"viewAtPoint:",_f8);
if(_fb){
return _fb;
}
}
return nil;
}
}),new objj_method(sel_getUid("hasSubrow:"),function(_ff,_100,_101){
with(_ff){
if(!_101||_101==_ff){
return NO;
}
var view;
var _102;
var _103=objj_msgSend(_subrowsView,"subviews");
var _104=objj_msgSend(_103,"count");
for(var i=0;i<_104;i++){
_102=_103[i];
if(!objj_msgSend(_102,"isKindOfClass:",SPRuleEditorRowView)){
continue;
}
if(_102==_101){
return YES;
}
if(objj_msgSend(_102,"hasSubrow:",_101)){
return YES;
}
}
return NO;
}
}),new objj_method(sel_getUid("isOpaque"),function(self,_105){
with(self){
return YES;
}
}),new objj_method(sel_getUid("mouseDragged:"),function(self,_106,_107){
with(self){
if(!_editable){
return;
}
var _108=objj_msgSend(CPPasteboard,"pasteboardWithName:",CPDragPboard);
objj_msgSend(_108,"declareTypes:owner:",objj_msgSend(CPArray,"arrayWithObjects:",SPRuleEditorItemPBoardType,nil),self);
var _109=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",objj_msgSend(self,"frame"));
var html=self._DOMElement.innerHTML;
_109._DOMElement.innerHTML=objj_msgSend(html,"copy");
objj_msgSend(_109,"setAlphaValue:",0.7);
objj_msgSend(_109,"setBackgroundColor:",objj_msgSend(CPColor,"whiteColor"));
objj_msgSend(self,"dragView:at:offset:event:pasteboard:source:slideBack:",_109,CPPointMake(0,0),CPPointMake(0,0),_107,_108,self,YES);
}
}),new objj_method(sel_getUid("acceptsFirstResponder"),function(self,_10a){
with(self){
return YES;
}
}),new objj_method(sel_getUid("resignFirstResponder"),function(self,_10b){
with(self){
return objj_msgSendSuper({receiver:self,super_class:objj_getClass("SPRuleEditorRowView").super_class},"resignFirstResponder");
}
}),new objj_method(sel_getUid("flagsChanged:"),function(self,_10c,_10d){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("SPRuleEditorRowView").super_class},"flagsChanged:",_10d);
if(_delegate&&objj_msgSend(_delegate,"nestingMode")==SPRuleEditorNestingModeCompound){
if(objj_msgSend(_10d,"modifierFlags")&CPAlternateKeyMask){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",SPRuleEditorViewAltKeyDown,_delegate,nil);
}else{
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",SPRuleEditorViewAltKeyUp,_delegate,nil);
}
}
}
}),new objj_method(sel_getUid("altKeyDown:"),function(self,_10e,_10f){
with(self){
objj_msgSend(_addButton,"setImage:",_alternateAddButtonImage);
objj_msgSend(_addButton,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("altKeyUp:"),function(self,_110,_111){
with(self){
objj_msgSend(_addButton,"setImage:",objj_msgSend(self,"valueForThemeAttribute:","add-image"));
objj_msgSend(_addButton,"setNeedsDisplay:",YES);
}
})]);
class_addMethods(_4,[new objj_method(sel_getUid("themeAttributes"),function(self,_112){
with(self){
return objj_msgSend(SPRuleEditor,"themeAttributes");
}
}),new objj_method(sel_getUid("initialize"),function(self,_113){
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
class_addMethods(_3,[new objj_method(sel_getUid("setSmallSize"),function(self,_114){
with(self){
objj_msgSend(self,"setValue:forThemeAttribute:inState:",objj_msgSend(CPFont,"systemFontOfSize:",11),"font",CPThemeStateBezeled);
objj_msgSend(self,"setValue:forThemeAttribute:inState:",CGInsetMake(3,7,0,8),"content-inset",CPThemeStateBezeled);
objj_msgSend(self,"setValue:forThemeAttribute:inState:",CGInsetMake(2,6,0,8),"content-inset",CPThemeStateBezeled|CPThemeStateEditing);
objj_msgSend(self,"setValue:forThemeAttribute:inState:",CGInsetMake(0,4,0,4),"bezel-inset",CPThemeStateBezeled);
objj_msgSend(self,"setValue:forThemeAttribute:inState:",CGInsetMake(-2,0,-2,0),"bezel-inset",CPThemeStateBezeled|CPThemeStateEditing);
}
}),new objj_method(sel_getUid("setStaticWithFont:"),function(self,_115,font){
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
