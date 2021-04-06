page 50502 "F1 - Salespersons List"
{
    Caption = 'Salespersons list';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "F1 - Salespersons List";
    layout
    {
        area(Content)
        {
            repeater(Control1)
            {
                field(No; Rec."No.")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field(CustomerNo; Rec."Customer No.")
                {
                    ApplicationArea = All;
                }
                field(SalespersonCode; Rec."Salesperson Code")
                {
                    ApplicationArea = All;
                }
                field(SalespersonName; Rec."Salesperson Name")
                {
                    ApplicationArea = All;
                }
                field(RoleDescription; Rec."Role Description")
                {
                    ApplicationArea = All;
                }
                field(Commission; Rec."Fees")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}