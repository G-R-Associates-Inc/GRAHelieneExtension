/**
* Documentation Section
*   12/19/19 - Lina El Sadek, G.R. & Associates Inc. 
*   Added External Doc. No., Salesperson Code, and Salesperson Name fields
**/
tableextension 58003 ItemJournalLineGRAExt extends "Item Journal Line"
{
    fields
    {
        field(58000; "Salesperson Name"; Text[50])
        {
            Caption = 'Salesperson Name';
            FieldClass = Normal;
        }
    }

    trigger OnBeforeInsert();
    var
        SalespersonPurchaser_lRec:Record "Salesperson/Purchaser";
    begin
        if xRec."Salespers./Purch. Code" <> Rec."Salespers./Purch. Code" then
        begin
            if Rec."Salespers./Purch. Code" <> '' then
            begin
                SalespersonPurchaser_lRec.Reset;
                SalespersonPurchaser_lRec.SetRange(Code, "Salespers./Purch. Code");
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
        if xRec."Salespers./Purch. Code" <> Rec."Salespers./Purch. Code" then
        begin
            if Rec."Salespers./Purch. Code" <> '' then
            begin
                SalespersonPurchaser_lRec.Reset;
                SalespersonPurchaser_lRec.SetRange(Code, "Salespers./Purch. Code");
                if SalespersonPurchaser_lRec.FindFirst then
                    "Salesperson Name" := SalespersonPurchaser_lRec.Name
                else
                    "Salesperson Name" := '';    
            end else
                "Salesperson Name" := '';
        end;
    end;
}