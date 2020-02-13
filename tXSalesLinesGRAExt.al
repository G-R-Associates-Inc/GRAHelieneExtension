/**
* Documentation Section
*   GRALE01 - 08/19/19 - Lina El Sadek, G.R. & Associates Inc. 
*           - Added Salesperson Code, Salesperson Name, and Customer Name fields
**/
tableextension 58000 SalesLinesGRAExt extends "Sales Line"
{
    fields
    {

        field(58000;"Salesperson Code"; Code[20])
        {
            Caption = 'Salesperson Code';
            DataClassification = ToBeClassified;
        }

        field(58001; "Salesperson Name"; Text[50])
        {
            Caption = 'Salesperson Name';
            DataClassification = ToBeClassified;
        }

        field(58002; "Customer Name"; Text[50])
        {
            Caption = 'Customer Name';
            DataClassification = ToBeClassified;
        }
    }

}