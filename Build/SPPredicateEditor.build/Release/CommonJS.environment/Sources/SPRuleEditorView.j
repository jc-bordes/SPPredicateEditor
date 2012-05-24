@STATIC;1.0;I;21;Foundation/CPObject.jI;15;AppKit/CPView.ji;21;SPRuleEditorRowView.jt;15348;
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
