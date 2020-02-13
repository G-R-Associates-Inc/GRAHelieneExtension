/**
* Documentation Section
*   12/19/19 - Lina El Sadek, G.R. & Associates Inc. 
*   Added External Doc. No., Salesperson Code, and Salesperson Name fields
**/
pageextension 58008 ItemLedgerEntriesGRAExt extends "Item Ledger Entries"
{
    layout
    {
        addafter("Location Code")
        {
            field("Salesperson Code"; "Salesperson Code")
            {
                Caption = 'Salesperson Code';
            }

            field("Salesperson Name"; "Salesperson Name")
            {
                Caption = 'Salesperson Name';
            }

            field("External Document No."; "External Document No.")
            {
                Caption = 'External Document No.';
            }
        }
        
    }
}