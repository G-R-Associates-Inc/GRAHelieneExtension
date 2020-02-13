pageextension 58001 UserSetupGRAExt extends "User Setup"
{

    layout
    {
        addafter(Email)
        {
            field("Web Portal Admin";"Web Portal Admin")
            {
                Caption = 'Web Portal Admin';
            }
        }
    }
}