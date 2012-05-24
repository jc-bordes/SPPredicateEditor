@STATIC;1.0;I;21;Foundation/CPObject.jI;15;AppKit/CPView.ji;21;SPRuleEditorRowView.jt;20092;objj_executeFile("Foundation/CPObject.j", NO);
objj_executeFile("AppKit/CPView.j", NO);
objj_executeFile("SPRuleEditorRowView.j", YES);
SPRuleEditorRowViewMinHeight=26;
SPRuleEditorRowViewIndent=30;
{var the_class = objj_allocateClassPair(CPView, "SPRuleEditorView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_delegate"), new objj_ivar("_editable"), new objj_ivar("_rowHeight"), new objj_ivar("_dragging"), new objj_ivar("_currentDropTarget"), new objj_ivar("_forcedRedraw")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("delegate"), function $SPRuleEditorView__delegate(self, _cmd)
{ with(self)
{
return _delegate;
}
},["id"]),
new objj_method(sel_getUid("setDelegate:"), function $SPRuleEditorView__setDelegate_(self, _cmd, newValue)
{ with(self)
{
_delegate = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("editable"), function $SPRuleEditorView__editable(self, _cmd)
{ with(self)
{
return _editable;
}
},["id"]),
new objj_method(sel_getUid("setEditable:"), function $SPRuleEditorView__setEditable_(self, _cmd, newValue)
{ with(self)
{
_editable = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("rowHeight"), function $SPRuleEditorView__rowHeight(self, _cmd)
{ with(self)
{
return _rowHeight;
}
},["id"]),
new objj_method(sel_getUid("setRowHeight:"), function $SPRuleEditorView__setRowHeight_(self, _cmd, newValue)
{ with(self)
{
_rowHeight = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("dragging"), function $SPRuleEditorView__dragging(self, _cmd)
{ with(self)
{
return _dragging;
}
},["id"]), new objj_method(sel_getUid("initWithFrame:"), function $SPRuleEditorView__initWithFrame_(self, _cmd, frame)
{ with(self)
{
    self=objj_msgSendSuper({ receiver:self, super_class:objj_getClass("SPRuleEditorView").super_class }, "initWithFrame:", frame);
    if(!self)
     return nil;
    _model=nil;
    _delegate=nil;
    _editable=YES;
    _rowHeight=SPRuleEditorRowViewMinHeight;
    _dragging=NO;
    _forcedRedraw=NO;
  objj_msgSend(self, "setThemeClass:", "rule-editor");
    objj_msgSend(self, "setBackgroundColor:", objj_msgSend(CPColor, "colorWithHexString:", "ededed"));
    objj_msgSend(self, "setPostsFrameChangedNotifications:", YES);
    objj_msgSend(self, "registerForDraggedTypes:", objj_msgSend(CPArray, "arrayWithObjects:", SPRuleEditorItemPBoardType,nil));
    return self;
}
},["id","CGRect"]), new objj_method(sel_getUid("removeFromSuperview"), function $SPRuleEditorView__removeFromSuperview(self, _cmd)
{ with(self)
{
 if(objj_msgSend(self, "superview"))
  objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "removeObserver:", self);
 objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "removeObserver:", self);
}
},["void"]), new objj_method(sel_getUid("setModel:"), function $SPRuleEditorView__setModel_(self, _cmd, model)
{ with(self)
{
 if(model==_model)
  return nil;
    var notificationCenter=objj_msgSend(CPNotificationCenter, "defaultCenter");
    if(_model)
    {
  objj_msgSend(notificationCenter, "removeObserver:name:object:", self, SPRuleEditorModelRowAdded, _model);
  objj_msgSend(notificationCenter, "removeObserver:name:object:", self, SPRuleEditorModelRowRemoved, _model);
  objj_msgSend(notificationCenter, "removeObserver:name:object:", self, SPRuleEditorModelRowModified, _model);
  objj_msgSend(notificationCenter, "removeObserver:name:object:", self, SPRuleEditorModelNestingModeWillChange, _model);
  objj_msgSend(notificationCenter, "removeObserver:name:object:", self, SPRuleEditorModelNestingModeDidChange, _model);
  objj_msgSend(notificationCenter, "removeObserver:name:object:", self, SPRuleEditorModelRemovedAllRows, _model);
    }
    _model=model;
    if(_model)
    {
  objj_msgSend(notificationCenter, "addObserver:selector:name:object:", self, sel_getUid("rowAdded:"), SPRuleEditorModelRowAdded, _model);
  objj_msgSend(notificationCenter, "addObserver:selector:name:object:", self, sel_getUid("rowRemoved:"), SPRuleEditorModelRowRemoved, _model);
  objj_msgSend(notificationCenter, "addObserver:selector:name:object:", self, sel_getUid("rowModified:"), SPRuleEditorModelRowModified, _model);
  objj_msgSend(notificationCenter, "addObserver:selector:name:object:", self, sel_getUid("nestingModeWillChange:"), SPRuleEditorModelNestingModeWillChange, _model);
  objj_msgSend(notificationCenter, "addObserver:selector:name:object:", self, sel_getUid("nestingModeDidChange:"), SPRuleEditorModelNestingModeDidChange, _model);
  objj_msgSend(notificationCenter, "addObserver:selector:name:object:", self, sel_getUid("allRowsRemoved:"), SPRuleEditorModelRemovedAllRows, _model);
    }
}
},["void","SPRuleEditorModel"]), new objj_method(sel_getUid("setDelegate:"), function $SPRuleEditorView__setDelegate_(self, _cmd, delegate)
{ with(self)
{
 if(delegate==_delegate)
  return;
 _delegate=delegate;
 var subviews=objj_msgSend(self, "subviews");
 var subview;
 var view;
 var count=objj_msgSend(subviews, "count");
 for(var i=0;i<count;i++)
 {
  subview=subviews[i];
  if(!objj_msgSend(subview, "isKindOfClass:", SPRuleEditorRowView))
   continue;
  objj_msgSend(subview, "setDelegate:", delegate);
 }
}
},["void","id"]), new objj_method(sel_getUid("setEditable:"), function $SPRuleEditorView__setEditable_(self, _cmd, editable)
{ with(self)
{
 if(_editable==editable)
  return;
 _editable=editable;
 var subviews=objj_msgSend(self, "subviews");
 var subview;
 var view;
 var count=objj_msgSend(subviews, "count");
 for(var i=0;i<count;i++)
 {
  subview=subviews[i];
  if(!objj_msgSend(subview, "isKindOfClass:", SPRuleEditorRowView))
   continue;
  objj_msgSend(subview, "setEditable:", _editable);
 }
 objj_msgSend(self, "setNeedsLayout");
}
},["void","BOOL"]), new objj_method(sel_getUid("setRowHeight:"), function $SPRuleEditorView__setRowHeight_(self, _cmd, rowHeight)
{ with(self)
{
 if(_rowHeight==rowHeight)
  return;
 _rowHeight=Math.max(rowHeight,SPRuleEditorRowViewMinHeight);
    var subviews=objj_msgSend(self, "subviews");
 var subview;
 var view;
 var count=objj_msgSend(subviews, "count");
 for(var i=0;i<count;i++)
 {
  subview=subviews[i];
  if(!objj_msgSend(subview, "isKindOfClass:", SPRuleEditorRowView))
   continue;
  objj_msgSend(subview, "setRowHeight:", _rowHeight);
 }
 objj_msgSend(self, "setNeedsLayout");
}
},["void","CGFloat"]), new objj_method(sel_getUid("rowViewWithItem:"), function $SPRuleEditorView__rowViewWithItem_(self, _cmd, item)
{ with(self)
{
 var subviews=objj_msgSend(self, "subviews");
 var subview;
 var view;
 var count=objj_msgSend(subviews, "count");
 for(var i=0;i<count;i++)
 {
  subview=subviews[i];
  if(!objj_msgSend(subview, "isKindOfClass:", SPRuleEditorRowView))
   continue;
  view=objj_msgSend(subview, "rowViewWithItem:", item);
  if(view)
   return view;
 }
 return nil;
}
},["SPRuleEditorRowView","SPRuleEditorModelItem"]), new objj_method(sel_getUid("rowViewAtPoint:"), function $SPRuleEditorView__rowViewAtPoint_(self, _cmd, aPoint)
{ with(self)
{
 var subviews=objj_msgSend(self, "subviews");
 var subview;
 var view;
 var count=objj_msgSend(subviews, "count");
 for(var i=0;i<count;i++)
 {
  subview=subviews[i];
  if(!objj_msgSend(subview, "isKindOfClass:", SPRuleEditorRowView))
   continue;
  view=objj_msgSend(subview, "viewAtPoint:", aPoint);
  if(!view||!objj_msgSend(view, "isKindOfClass:", SPRuleEditorRowView))
   continue;
  return view;
 }
 return nil;
}
},["CPView","CPPoint"]), new objj_method(sel_getUid("rowAdded:"), function $SPRuleEditorView__rowAdded_(self, _cmd, notification)
{ with(self)
{
 if(!notification)
  objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, _cmd+" : null notification");
 var userInfo=objj_msgSend(notification, "userInfo");
 if(!userInfo)
  objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, _cmd+" : notification userInfo is null");
 var parentRow=objj_msgSend(userInfo, "valueForKey:", "parentRow");
 var index=objj_msgSend(userInfo, "valueForKey:", "index");
 var row=objj_msgSend(userInfo, "valueForKey:", "row");
 objj_msgSend(self, "row:addedAtIndex:withParentRow:", row, index, parentRow);
}
},["void","CPNotification"]), new objj_method(sel_getUid("row:addedAtIndex:withParentRow:"), function $SPRuleEditorView__row_addedAtIndex_withParentRow_(self, _cmd, row, index, parentRow)
{ with(self)
{
 objj_msgSend(self, "_row:addedAtIndex:withParentRow:", row, index, parentRow);
 var count=objj_msgSend(row, "subrowsCount");
 for(var i=0;i<count;i++)
  objj_msgSend(self, "row:addedAtIndex:withParentRow:", objj_msgSend(row, "childAtIndex:", i), i, row);
}
},["void","SPRuleEditorModelItem","CPInteger","SPRuleEditorModelItem"]), new objj_method(sel_getUid("_row:addedAtIndex:withParentRow:"), function $SPRuleEditorView___row_addedAtIndex_withParentRow_(self, _cmd, row, index, parentRow)
{ with(self)
{
 if(index<0||!row)
  objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, _cmd+" : invalid SPRuleEditorModelRowAdded notification userInfo");
 var parentView;
 var subviews=objj_msgSend(parentView, "subviews");
 var parentViewIsSelf;
 if(!parentRow)
 {
  parentView=self;
  subviews=objj_msgSend(self, "subviews");
  parentViewIsSelf=YES;
 }
 else
 {
  parentView=objj_msgSend(self, "rowViewWithItem:", parentRow);
  subviews=objj_msgSend(objj_msgSend(parentView, "subrowsView"), "subviews");
  parentViewIsSelf=NO;
 }
 if(!parentView)
  objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, _cmd+" : parent row view does not exist");
 var count=objj_msgSend(subviews, "count");
 if(index>count)
  objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, _cmd+" : invalid SPRuleEditorModelRowAdded notification userInfo");
 var rowView=objj_msgSend(objj_msgSend(SPRuleEditorRowView, "alloc"), "initWithFrame:", objj_msgSend(self, "initialFrameForItem:", row));
 objj_msgSend(rowView, "setDelegate:", _delegate);
    objj_msgSend(rowView, "setAutoresizingMask:", CPViewWidthSizable);
 objj_msgSend(rowView, "setItem:", row);
 objj_msgSend(rowView, "setNestingMode:", objj_msgSend(_model, "nestingMode"));
 objj_msgSend(rowView, "setDelegate:", _delegate);
 objj_msgSend(rowView, "setEditable:", _editable);
 if(!count||index==count)
 {
  if(parentViewIsSelf)
   objj_msgSend(self, "addSubview:", rowView);
  else
   objj_msgSend(parentView, "addRowView:", rowView);
 }
 else
 {
  var siblingView=objj_msgSend(subviews, "objectAtIndex:", index);
  if(parentViewIsSelf)
   objj_msgSend(self, "addSubview:positioned:relativeTo:", rowView, CPWindowBelow, siblingView);
  else
   objj_msgSend(parentView, "addRowView:positioned:relativeTo:", rowView, CPWindowBelow, siblingView);
 }
 objj_msgSend(objj_msgSend(self, "window"), "makeFirstResponder:", rowView);
 objj_msgSend(self, "setNeedsLayout");
}
},["void","SPRuleEditorModelItem","CPInteger","SPRuleEditorModelItem"]), new objj_method(sel_getUid("rowRemoved:"), function $SPRuleEditorView__rowRemoved_(self, _cmd, notification)
{ with(self)
{
 if(!notification)
  objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, _cmd+" : null notification");
 var userInfo=objj_msgSend(notification, "userInfo");
 if(!userInfo)
  objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, _cmd+" : notification userInfo is null");
 var row=objj_msgSend(userInfo, "valueForKey:", "row");
 if(!row)
  objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, _cmd+" : invalid SPRuleEditorModelRowAdded notification userInfo");
 var parentRow=objj_msgSend(userInfo, "valueForKey:", "parentRow");
 var view=objj_msgSend(self, "rowViewWithItem:", row);
 if(!view)
  return;
 var parentView;
 if(!parentRow)
 {
  objj_msgSend(view, "removeFromSuperview");
 }
 else
 {
  var parentView=objj_msgSend(self, "rowViewWithItem:", parentRow);
  if(!parentView)
   objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, _cmd+" : invalid SPRuleEditorModelRowRemoved notification userInfo");
  objj_msgSend(parentView, "removeRowView:", view);
 }
 objj_msgSend(self, "setNeedsLayout");
}
},["void","CPNotification"]), new objj_method(sel_getUid("allRowsRemoved:"), function $SPRuleEditorView__allRowsRemoved_(self, _cmd, notification)
{ with(self)
{
 var subviews=objj_msgSend(self, "subviews");
 var count=objj_msgSend(subviews, "count");
 for(var i=0;i<count;i++)
 {
  objj_msgSend(subviews[i], "removeFromSuperview");
 }
}
},["void","CPNotification"]), new objj_method(sel_getUid("rowModified:"), function $SPRuleEditorView__rowModified_(self, _cmd, notification)
{ with(self)
{
 if(!notification)
  objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, _cmd+" : null notification");
 var userInfo=objj_msgSend(notification, "userInfo");
 if(!userInfo)
  objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, _cmd+" : notification userInfo is null");
 var row=objj_msgSend(userInfo, "valueForKey:", "row");
 var view=objj_msgSend(self, "rowViewWithItem:", row);
 if(!view)
  return;
 objj_msgSend(view, "setItem:", row);
 objj_msgSend(self, "setNeedsLayout");
}
},["void","CPNotification"]), new objj_method(sel_getUid("nestingModeWillChange:"), function $SPRuleEditorView__nestingModeWillChange_(self, _cmd, notification)
{ with(self)
{
}
},["void","CPNotification"]), new objj_method(sel_getUid("nestingModeDidChange:"), function $SPRuleEditorView__nestingModeDidChange_(self, _cmd, notification)
{ with(self)
{
 if(!notification)
  objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, _cmd+" : null notification");
 var userInfo=objj_msgSend(notification, "userInfo");
 if(!userInfo)
  objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, _cmd+" : notification userInfo is null");
 var nestingMode=objj_msgSend(userInfo, "valueForKey:", "newNestingMode");
 var subviews=objj_msgSend(self, "subviews");
 var subview;
 var view;
 var count=objj_msgSend(subviews, "count");
 for(var i=0;i<count;i++)
 {
  subview=subviews[i];
  if(!objj_msgSend(subview, "isKindOfClass:", SPRuleEditorRowView))
   continue;
  view=objj_msgSend(subview, "setNestingMode:", nestingMode);
  if(view)
   return view;
 }
 objj_msgSend(self, "setNeedsLayout");
}
},["void","CPNotification"]), new objj_method(sel_getUid("drawRect:"), function $SPRuleEditorView__drawRect_(self, _cmd, rect)
{ with(self)
{
 var subviews=objj_msgSend(self, "subviews");
 var count=objj_msgSend(subviews, "count");
 if(!count)
  return;
 var view;
    var context=objj_msgSend(objj_msgSend(CPGraphicsContext, "currentContext"), "graphicsPort");
    if(!context)
     return;
 var frame=objj_msgSend(self, "frame");
 for(var i=0;i<count;i++)
 {
  view=subviews[i];
  if(!objj_msgSend(view, "isKindOfClass:", SPRuleEditorRowView))
   continue;
  objj_msgSend(view, "drawBordersInContext:verticalOffset:width:", context, 0, frame.size.width);
 }
}
},["void","CPRect"]), new objj_method(sel_getUid("forceRedrawForChromeBug"), function $SPRuleEditorView__forceRedrawForChromeBug(self, _cmd)
{ with(self)
{
 var size=objj_msgSend(self, "frameSize");
 self._DOMElement.style.height=(size.height+1)+"px";
 _forcedRedraw=YES;
 objj_msgSend(self, "setNeedsLayout");
}
},["void"]), new objj_method(sel_getUid("layoutSubviews"), function $SPRuleEditorView__layoutSubviews(self, _cmd)
{ with(self)
{
 if(_forcedRedraw)
 {
  var size=objj_msgSend(self, "frameSize");
  self._DOMElement.style.height=(size.height-1)+"px";
  _forcedRedraw=NO;
  return;
 }
 var subviews=objj_msgSend(self, "subviews");
 var count=objj_msgSend(subviews, "count");
 var bounds=objj_msgSend(self, "bounds");
 var view;
 var deltaY=0;
 var frame;
 for(var i=0;i<count;i++)
 {
  view=subviews[i];
  if(!objj_msgSend(view, "isKindOfClass:", SPRuleEditorRowView))
   continue;
  objj_msgSend(view, "_layoutSubviews");
  frame=objj_msgSend(view, "frame");
  frame.origin.y=deltaY;
  objj_msgSend(view, "setFrame:", frame);
  deltaY+=frame.size.height;
  objj_msgSend(view, "setFrame:", frame);
 }
 var size=objj_msgSend(self, "frameSize");
 size.height=deltaY;
 objj_msgSend(self, "setFrameSize:", size);
}
},["void"]), new objj_method(sel_getUid("initialFrameForItem:"), function $SPRuleEditorView__initialFrameForItem_(self, _cmd, item)
{ with(self)
{
 var depth=objj_msgSend(item, "depth");
 var indentation=!depth?0:SPRuleEditorRowViewIndent;
 return CGRectMake(indentation,0,objj_msgSend(self, "frame").size.width-(indentation*depth),_rowHeight);
}
},["CGRect","SPRuleEditorModelItem"]), new objj_method(sel_getUid("draggingEntered:"), function $SPRuleEditorView__draggingEntered_(self, _cmd, sender)
{ with(self)
{
 if(_dragging)
  return CPDragOperationNone;
 var source=objj_msgSend(sender, "draggingSource");
    if(objj_msgSend(source, "isKindOfClass:", SPRuleEditorRowView)&&objj_msgSend(source, "delegate")==_delegate)
    {
  _dragging=YES;
        return CPDragOperationMove;
    }
 _dragging=NO;
    return CPDragOperationNone;
}
},["CPDragOperation","id<CPDraggingInfo>"]), new objj_method(sel_getUid("draggingExited:"), function $SPRuleEditorView__draggingExited_(self, _cmd, sender)
{ with(self)
{
 _dragging=NO;
 objj_msgSend(self, "updateDropTarget:", nil);
}
},["void","id"]), new objj_method(sel_getUid("draggingUpdated:"), function $SPRuleEditorView__draggingUpdated_(self, _cmd, sender)
{ with(self)
{
 if(!_dragging)
  return;
    var view=objj_msgSend(self, "rowViewAtPoint:", objj_msgSend(sender, "draggingLocation"));
    var source=objj_msgSend(sender, "draggingSource");
    if(!objj_msgSend(source, "isKindOfClass:", SPRuleEditorRowView))
    {
     objj_msgSend(self, "updateDropTarget:", nil);
        return CPDragOperationNone;
    }
    if(!view||view==source||objj_msgSend(source, "hasSubrow:", view))
    {
     objj_msgSend(self, "updateDropTarget:", nil);
        return CPDragOperationNone;
    }
    var row=objj_msgSend(source, "item");
    var anotherRow=objj_msgSend(view, "item");
    if(_delegate
     &&objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("canMoveRow:afterRow:"))
     &&!objj_msgSend(_delegate, "canMoveRow:afterRow:", row, anotherRow))
    {
     objj_msgSend(self, "updateDropTarget:", nil);
        return CPDragOperationNone;
    }
    objj_msgSend(self, "updateDropTarget:", view);
    return CPDragOperationMove;
}
},["CPDragOperation","id<CPDraggingInfo>"]), new objj_method(sel_getUid("performDragOperation:"), function $SPRuleEditorView__performDragOperation_(self, _cmd, sender)
{ with(self)
{
    var view=objj_msgSend(self, "rowViewAtPoint:", objj_msgSend(sender, "draggingLocation"));
    var source=objj_msgSend(sender, "draggingSource");
    if(!objj_msgSend(source, "isKindOfClass:", SPRuleEditorRowView))
    {
     objj_msgSend(self, "updateDropTarget:", nil);
        return CPDragOperationNone;
    }
    if(!view||view==source||objj_msgSend(source, "hasSubrow:", view))
    {
     objj_msgSend(self, "updateDropTarget:", nil);
        return CPDragOperationNone;
    }
    var row=objj_msgSend(source, "item");
    var anotherRow=objj_msgSend(view, "item");
    if(_delegate
     &&objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("moveRow:afterRow:")) )
    {
  objj_msgSend(_delegate, "moveRow:afterRow:", row, anotherRow);
 }
    _dragging=NO;
    objj_msgSend(self, "updateDropTarget:", nil);
    return YES;
}
},["BOOL","id<CPDraggingInfo>"]), new objj_method(sel_getUid("updateDropTarget:"), function $SPRuleEditorView__updateDropTarget_(self, _cmd, rowView)
{ with(self)
{
 if(_currentDropTarget==rowView)
  return;
 objj_msgSend(_currentDropTarget, "setShowDragIndicator:", NO);
 if(rowView)
 {
  _currentDropTarget=rowView;
  objj_msgSend(_currentDropTarget, "setShowDragIndicator:", YES);
 }
 objj_msgSend(self, "layoutSubviews");
 objj_msgSend(self, "setNeedsDisplay:", YES);
}
},["void","SPRuleEditorRowView"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("themeAttributes"), function $SPRuleEditorView__themeAttributes(self, _cmd)
{ with(self)
{
 return objj_msgSend(SPRuleEditor, "themeAttributes");
}
},["id"])]);
}

