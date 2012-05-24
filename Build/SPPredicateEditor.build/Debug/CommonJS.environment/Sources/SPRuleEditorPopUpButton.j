@STATIC;1.0;t;4864;var GRADIENT_NORMAL,
    GRADIENT_HIGHLIGHTED,
    IE_FILTER = "progid:DXImageTransform.Microsoft.gradient(startColorstr='#fcfcfc', endColorstr='#dfdfdf')";
{var the_class = objj_allocateClassPair(CPPopUpButton, "SPRuleEditorPopUpButton"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_radius"), new objj_ivar("_isEditable")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("editable"), function $SPRuleEditorPopUpButton__editable(self, _cmd)
{ with(self)
{
return _isEditable;
}
},["id"]),
new objj_method(sel_getUid("setEditable:"), function $SPRuleEditorPopUpButton__setEditable_(self, _cmd, newValue)
{ with(self)
{
_isEditable = newValue;
}
},["void","id"]), new objj_method(sel_getUid("initWithFrame:"), function $SPRuleEditorPopUpButton__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("SPRuleEditorPopUpButton").super_class }, "initWithFrame:", aFrame))
    {
        var style = _DOMElement.style;
        style.backgroundImage = GRADIENT_NORMAL;
        style.border = "1px solid rgb(189, 189, 189)";
        style.filter = IE_FILTER;
        _radius=9.0;
        _isEditable=YES;
        objj_msgSend(self, "setTextColor:", objj_msgSend(CPColor, "colorWithWhite:alpha:", 0, 1));
        objj_msgSend(self, "setBordered:", NO);
     }
    return self;
}
},["id","CGRect"]), new objj_method(sel_getUid("editable"), function $SPRuleEditorPopUpButton__editable(self, _cmd)
{ with(self)
{
 return objj_msgSend(self, "enabled");
}
},["BOOL"]), new objj_method(sel_getUid("setEditable:"), function $SPRuleEditorPopUpButton__setEditable_(self, _cmd, isEditable)
{ with(self)
{
 objj_msgSend(self, "setEnabled:", isEditable);
}
},["void","BOOL"]), new objj_method(sel_getUid("setHighlighted:"), function $SPRuleEditorPopUpButton__setHighlighted_(self, _cmd, shouldHighlight)
{ with(self)
{
    _DOMElement.style.backgroundImage = (shouldHighlight) ? GRADIENT_HIGHLIGHTED : GRADIENT_NORMAL;
}
},["void","BOOL"]), new objj_method(sel_getUid("contentRectForBounds:"), function $SPRuleEditorPopUpButton__contentRectForBounds_(self, _cmd, bounds)
{ with(self)
{
    var contentRect = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("SPRuleEditorPopUpButton").super_class }, "contentRectForBounds:", bounds);
    contentRect.origin.x += _radius;
    contentRect.size.width -= 2 * _radius;
    return contentRect;
}
},["CGRect","CGRect"]), new objj_method(sel_getUid("layoutSubviews"), function $SPRuleEditorPopUpButton__layoutSubviews(self, _cmd)
{ with(self)
{
    _radius = FLOOR(CGRectGetHeight(objj_msgSend(self, "bounds"))/2);
    var style = _DOMElement.style,
        radiusCSS = _radius + "px";
    style.borderRadius=radiusCSS;
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("SPRuleEditorPopUpButton").super_class }, "layoutSubviews");
}
},["void"]), new objj_method(sel_getUid("drawRect:"), function $SPRuleEditorPopUpButton__drawRect_(self, _cmd, aRect)
{ with(self)
{
    var bounds = objj_msgSend(self, "bounds"),
        context = objj_msgSend(objj_msgSend(CPGraphicsContext, "currentContext"), "graphicsPort");
    var arrow_width = FLOOR(CGRectGetHeight(bounds)/3.5);
    CGContextTranslateCTM(context, CGRectGetWidth(bounds) - _radius - arrow_width, CGRectGetHeight(bounds) / 2);
    var arrowsPath = objj_msgSend(CPBezierPath, "bezierPath");
    objj_msgSend(arrowsPath, "moveToPoint:", CGPointMake(0, 1));
    objj_msgSend(arrowsPath, "lineToPoint:", CGPointMake(arrow_width, 1));
    objj_msgSend(arrowsPath, "lineToPoint:", CGPointMake(arrow_width/2, arrow_width + 1));
    objj_msgSend(arrowsPath, "closePath");
    CGContextSetFillColor(context, objj_msgSend(CPColor, "colorWithWhite:alpha:", 101/255, 1));
    objj_msgSend(arrowsPath, "fill");
    CGContextScaleCTM(context, 1 , -1);
    objj_msgSend(arrowsPath, "fill");
}
},["void","CGRect"]), new objj_method(sel_getUid("acceptsFirstResponder"), function $SPRuleEditorPopUpButton__acceptsFirstResponder(self, _cmd)
{ with(self)
{
    return NO;
}
},["BOOL"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function $SPRuleEditorPopUpButton__initialize(self, _cmd)
{ with(self)
{
    if (CPBrowserIsEngine(CPWebKitBrowserEngine))
    {
        GRADIENT_NORMAL = "-webkit-gradient(linear, left top, left bottom, from(rgb(252, 252, 252)), to(rgb(223, 223, 223)))";
        GRADIENT_HIGHLIGHTED = "-webkit-gradient(linear, left top, left bottom, from(rgb(223, 223, 223)), to(rgb(252, 252, 252)))";
    }
    else if (CPBrowserIsEngine(CPGeckoBrowserEngine))
    {
        GRADIENT_NORMAL = "-moz-linear-gradient(top,  rgb(252, 252, 252),  rgb(223, 223, 223))";
        GRADIENT_HIGHLIGHTED = "-moz-linear-gradient(top,  rgb(223, 223, 223),  rgb(252, 252, 252))";
    }
}
},["void"])]);
}

