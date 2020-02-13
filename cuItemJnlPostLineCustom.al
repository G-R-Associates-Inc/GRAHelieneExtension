/**
* Documentation Section
*   12/19/19 - Lina El Sadek, G.R. & Associates Inc.
*   Created codeunit to map custom fields added for posting
*/
codeunit 58002 "Item Jnl Post Line Custom" 
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", 'OnBeforeInsertItemLedgEntry', '', false, false)]
    local procedure OnBeforeInsertItemLedgEntry(VAR ItemLedgerEntry : Record "Item Ledger Entry";ItemJournalLine : Record "Item Journal Line")
    begin
        ItemLedgerEntry."External Document No." := ItemJournalLine."External Document No.";
        ItemLedgerEntry."Salesperson Code" := ItemJournalLine."Salespers./Purch. Code";
        ItemLedgerEntry."Salesperson Name" := ItemJournalLine."Salesperson Name";
    end;
}