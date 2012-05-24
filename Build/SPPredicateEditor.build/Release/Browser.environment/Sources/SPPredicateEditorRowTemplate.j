@STATIC;1.0;i;33;SPPredicateEditorFloatTextField.ji;35;SPPredicateEditorIntegerTextField.jt;26392;
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
