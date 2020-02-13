/**
* Documentation Section
*   12/19/19 - Lina El Sadek, G.R. & Associates Inc. 
*   Added External Doc. No., Salesperson Code, and Salesperson Name fields
**/
pageextension 58009 ItemJournalGRAExt extends "Item Journal"
{
    layout
    {
        addafter("Location Code")
        {
            field("Salesperson Code"; "Salespers./Purch. Code")
            {
                Caption = 'Salesperson Code'; 
            }
            field("Salesperson Name"; "Salesperson Name")
            {
                Caption = 'Salesperson Name';
            }
        }
        
    }
}