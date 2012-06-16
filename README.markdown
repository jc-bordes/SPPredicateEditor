#SPPredicateEditor

## What 

* rewrite of SPRuleEditor and SPPredicateteEditor Cappuccino original classes using an MVC pattern
* works in 4 modes : compound, simple, list and single with drag & drop
* CPTextField override classes for signed/unsigned integer/float textfields
* support for predicate options (case insensitive, diacritic insensitive)
* extensive ojtest of SPRuleEditorModel.j
* demos of the components visible here http://dev.globimages.com/capp/ruleeditor and there http://dev.globimages.com/capp/predicateeditor

## How

* SPRuleEditorModel is a tree-like collection of rows exposing both a flat index collection API and a tree like collection API (because of cocoa API design). It posts notification whenever a row is added, removed or modified.

* SPRuleEditorView is a tree of SPRuleEditorRowView. It listens to SPRuleEditorModel notifications and update the UI consequently. It also delegates user actions execution (add, remove, drop) to SPRuleEditor.

* SPRuleEditor exposes a cocoa like API (NSRuleEditor). Its the controller, it creates SPRuleEditorModel and SPRuleEditorView, responds to SPRuleEditorView delegations by calling SPRuleEditorModel and ask its own delegate for how to create a row (ie criteria, see NSRuleEditor docs)

* SPPredicateteEditor (which extends SPRuleEditor) has been rewritten in order to take advantage of the new SPRuleEditor design.

* SPPredicateteEditorRowTemplate has been kept almost unchanged

## What's missing (compared to cocoa)

* KVO on SPRuleEditor : not much used I think, but should be easy to do listening to the new SPRuleEditorModel notifications

* row selection (highlighting) : though 2 methods are still present in cocoa API, this feature has been abandoned by Apple. They say in their forums that it was "confusing" for their users. I agree :)

* view animations
