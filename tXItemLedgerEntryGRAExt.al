/**
* Documentation Section
*   12/19/19 - Lina El Sadek, G.R. & Associates Inc. 
*   Added External Doc. No., Salesperson Code, and Salesperson Name fields
**/
tableextension 58004 ItemLedgerEntryGRAExt extends "Item Ledger Entry"
{
    fields
    {
        field(58000; "Salesperson Code"; Code[20])
        {
            Caption = 'Salesperson Code';
            FieldClass = Normal;
        }

        field(58001; "Salesperson Name"; Text[50])
        {
            Caption = 'Salesperson Name';
            FieldClass = Normal;
        }
    }

    trigger OnBeforeInsert();
    var
        SalespersonPurchaser_lRec:Record "Salesperson/Purchaser";
    begin
        if xRec."Salesperson Code" <> Rec."Salesperson Code" then
        begin
            if Rec."Salesperson Code" <> '' then
            begin
                SalespersonPurchaser_lRec.Reset;
                SalespersonPurchaser_lRec.SetRange(Code, "Salesperson Code");
                if SalespersonPurchaser_lRec.FindFirst then
                    "Salesperson Name" := SalespersonPurchaser_lRec.Name
                else
                    "Salesperson Name" := '';    
            end else
                "Salesperson Name" := '';
        end;
    end;
    
    trigger OnBeforeModify();
    var
        SalespersonPurchaser_lRec:Record "Salesperson/Purchaser";
    begin
        if xRec."Salesperson Code" <> Rec."Salesperson Code" then
        begin
            if Rec."Salesperson Code" <> '' then
            begin
                SalespersonPurchaser_lRec.Reset;
                SalespersonPurchaser_lRec.SetRange(Code, "Salesperson Code");
                if SalespersonPurchaser_lRec.FindFirst then
                    "Salesperson Name" := SalespersonPurchaser_lRec.Name
                else
                    "Salesperson Name" := '';    
            end else
                "Salesperson Name" := '';
        end;
    end;
}