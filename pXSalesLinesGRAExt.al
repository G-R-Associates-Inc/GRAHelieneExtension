/**
* Documentation Section
*   08/19/19 - Lina El Sadek, G.R. & Associates Inc. 
*   Added Watts, Salesperson Code, Salesperson Name, and Customer Name
*
*   12/13/19 - Lina El Sadek, G.R. & Associates Inc.
*   Added Requested Delivery Date, Promised Delivery Date, Planned Delviery Date
*   Planned Shipment Date
**/
pageextension 58000 SalesLinesGRAExt extends "Sales Lines"
{
    layout
    {
        // Add changes to page layout here
        addafter("SBR Production Order Remaining Qty")
        {

            field("Watts"; Watts)
            {
                Caption = 'Watts';
            }

            field("Salesperson Code"; "Salesperson Code")
            {
                Caption = 'Salesperson Code';
            }

            field("Salesperson Name"; "Salesperson Name")
            {
                Caption = 'Salesperson Name';
            }

            field("Customer Name"; "Customer Name")
            {
                Caption = 'Customer Name';
            }

            field("Requested Delivery Date";"Requested Delivery Date")
            {
                Caption = 'Requested Delivery Date';
            }

            field("Promised Delivery Date";"Promised Delivery Date")
            {
                Caption = 'Promised Delivery Date';
            }

            field("Planned Delivery Date";"Planned Delivery Date")
            {
                Caption = 'Planned Delivery Date';
            }

            field("Planned Shipment Date";"Planned Shipment Date")
            {
                Caption = 'Planned Sipment Date';
            }
        }
    }
    
    actions
    {
        // Add changes to page actions here
    }
    
}