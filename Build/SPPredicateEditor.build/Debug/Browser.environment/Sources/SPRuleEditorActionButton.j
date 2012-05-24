@STATIC;1.0;I;17;AppKit/CPButton.jt;2826; objj_executeFile("AppKit/CPButton.j", NO);
var GRADIENT_NORMAL;
var GRADIENT_HIGHLIGHTED;
var IE_FILTER = "progid:DXImageTransform.Microsoft.gradient(startColorstr='#fcfcfc', endColorstr='#dfdfdf')";
{var the_class = objj_allocateClassPair(CPButton, "SPRuleEditorActionButton"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("radius")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $SPRuleEditorActionButton__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("SPRuleEditorActionButton").super_class }, "initWithFrame:", aFrame);
    if (self)
    {
        objj_msgSend(self, "setFont:", objj_msgSend(CPFont, "boldFontWithName:size:", "Apple Symbol", 12.0));
        objj_msgSend(self, "setTextColor:", objj_msgSend(CPColor, "colorWithWhite:alpha:", 150/255, 1));
        objj_msgSend(self, "setAlignment:", CPCenterTextAlignment);
        objj_msgSend(self, "setAutoresizingMask:", CPViewMinXMargin);
        objj_msgSend(self, "setImagePosition:", CPImageOnly);
        objj_msgSend(self, "setBordered:", NO);
        var style = _DOMElement.style;
        style.border = "1px solid rgb(189, 189, 189)";
        style.filter = IE_FILTER;
    }
    return self;
}
},["id","CGRect"]), new objj_method(sel_getUid("layoutSubviews"), function $SPRuleEditorActionButton__layoutSubviews(self, _cmd)
{ with(self)
{
    radius = FLOOR(CGRectGetHeight(objj_msgSend(self, "bounds"))/2);
    var style = _DOMElement.style,
        radiusCSS = radius + "px";
    style.borderRadius = radiusCSS;
    style.backgroundImage = (objj_msgSend(self, "isHighlighted")) ? GRADIENT_HIGHLIGHTED : GRADIENT_NORMAL;
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("SPRuleEditorActionButton").super_class }, "layoutSubviews");
}
},["void"]), new objj_method(sel_getUid("acceptsFirstResponder"), function $SPRuleEditorActionButton__acceptsFirstResponder(self, _cmd)
{ with(self)
{
    return NO;
}
},["BOOL"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function $SPRuleEditorActionButton__initialize(self, _cmd)
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

