pageextension 50502 PagExtItemCard extends "Item Card"
{
    layout
    {
        /* addlast(Purchase)
        {
            field("Preferible Vendor"; Rec."Preferible Vendor")
            {
                Caption = 'Preferible Vendor';
                ApplicationArea = All;
            }
        } */


        addafter("Vendor No.")
        {
            field("Vendor Name"; Rec."Vendor Name")
            {
                Caption = 'Vendor Name';
                ApplicationArea = All;
            }
        }
        /* addafter("Preferible Vendor")
        {
            field("F1 - Vendor No."; Rec."F1 - Vendor No.")
            {
                Caption = 'Preferible Vendor No.';
                ApplicationArea = All;
                Visible = true;
            }
        } */
    }
}