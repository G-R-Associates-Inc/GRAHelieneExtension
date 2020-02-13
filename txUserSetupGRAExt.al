/**
* Documentation Section
*   09/18/19 - Lina El Sadek, G.R. & Associates Inc. 
*   Added Web Portal Admin field for the Salesperson Web Portal
**/
tableextension 58002 UserSetupGRAExt extends "User Setup"
{
    fields
    {
        field(58000; "Web Portal Admin"; Boolean)
        {
            Caption = 'Web Portal Admin';
            DataClassification = ToBeClassified;
        }

    }


}