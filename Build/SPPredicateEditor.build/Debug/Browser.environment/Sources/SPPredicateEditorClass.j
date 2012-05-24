@STATIC;1.0;I;21;Foundation/CPObject.jt;510;objj_executeFile("Foundation/CPObject.j", NO);
{var the_class = objj_allocateClassPair(CPObject, "SPPredicateEditor"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(meta_class, [new objj_method(sel_getUid("version"), function $SPPredicateEditor__version(self, _cmd)
{ with(self)
{
    var bundle = objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(self, "class"));
    return objj_msgSend(bundle, "objectForInfoDictionaryKey:", "CPBundleVersion");
}
},["CPString"])]);
}

