/**
* Documentation Section
*   12/16/2019 - Lina El Sadek, G.R. & Associates Inc.
*              - Create Order Processor Role Center extension page 
*/ 

pageextension 58005 OrderProcessorRoleCenterGRAExt extends "Order Processor Role Center"
{
   actions
    {
        modify("Customer/Item Statistics")
        {
            Visible = false;
        }
        
        addafter("Customer/Item Statistics")
        {
            action("GRA Customer/Item Statistics")
            {
                ApplicationArea=All;
                RunObject=report "GRA Customer/Item Statistics";
                Image=Report;
                CaptionML=ENU='Customer/Item Statistics';
                ToolTipML=ENU='View statistics about what items have been purchased by which customers.';
            }

            action("GRA Customer/Item Statistics 2")
            {
                ApplicationArea=All;
                RunObject=report "GRA Customer/Item Statistics 2";
                Image=Report;
                CaptionML=ENU='Customer/Item Statistics 2';
                ToolTipML=ENU='View statistics about what items have been purchased by which customers. Grouping is by Customer, Sales Order, and then Item No.';
            }
        }
    } 
}