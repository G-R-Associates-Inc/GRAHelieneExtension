/**
* Documentation Section
*   GRALE01 - 09/18/19 - Lina El Sadek, G.R. & Associates Inc. 
*           - Added Total Quantity field for the Salesperson Web Portal
**/
tableextension 58001 SalesHeaderGRAExt extends "Sales Header"
{
    fields
    {
        field(58000; "Total Quantity"; Decimal)
        {
            Caption = 'Total Quantity';
            FieldClass = FlowField;
            CalcFormula=sum("Sales Line".Quantity where 
            ("Document Type"=field("Document Type"), "Document No."=field("No."), Type=const(Item)));
        }
    }
}