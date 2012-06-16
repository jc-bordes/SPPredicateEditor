#SPPredicateEditor

## What 

* rewrite of CPRuleEditor and CPPredicateEditor Cappuccino original classes using an MVC pattern
* works in 4 modes : compound, simple, list and single with drag & drop
* CPTextField override classes for signed/unsigned integer/float textfields
* support for predicate options (case insensitive, diacritic insensitive)
* extensive ojtest of CPRuleEditorModel.j (see below)
* demos of the components visible here http://dev.globimages.com/capp/ruleeditor and there http://dev.globimages.com/capp/predicateeditor

## How

* CPRuleEditorModel is a tree-like collection of rows exposing both a flat index collection API and a tree like collection API (because of cocoa design). It posts notification whenever a row is added, removed or modified.

* CPRuleEditorView is a tree of SPRuleEditorRowView. It listens to CPRuleEditorModel notifications and update the UI consequently. It also delegates user actions execution (add, remove, drop) to CPRuleEditor.

* CPRuleEditor exposes a cocoa like API (NSRuleEditor). Its the controller, it creates CPRuleEditorModel and CPRuleEditorView, responds to CPRuleEditorView delegations by calling CPRuleEditorModel and ask its own delegate for how to create a row (ie criteria, see NSRuleEditor docs)

* CPPredicateEditor (which extends CPRuleEditor) has been rewritten in order to take advantage of the new CPRuleEditor design.

* CPPredicateEditorRowTemplate has been kept almost unchanged

## What's missing (compared to cocoa)

* KVO on CPRuleEditor : not much used I think, but should be easy to do listening to the new CPRuleEditorModel notifications

* row selection (highlighting) : though 2 methods are still present in cocoa API, this feature has been abandoned by Apple. They say in their forums that it was "confusing" for their users. I agree :)

* view animations

