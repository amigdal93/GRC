page 50501 "F1 - PagSalesPersonClientItem"
{
    Caption = 'Salesperson sum-up fees';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "F1 - TabSalesPersonClientItem";
    RefreshOnActivate = true;
    Editable = true;

    layout
    {
        area(Content)
        {
            repeater(Control1)
            {
                field(No; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field(ClientNo; Rec."Client No.")
                {
                    ApplicationArea = All;
                }
                field(ClientName; Rec."Client Name")
                {
                    ApplicationArea = All;
                }
                field(ItemNo; Rec."Item No.")
                {
                    ApplicationArea = All;
                }
                field(ItemDescription; Rec."Item Description")
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
                field(Fees; Rec."Fees")
                {
                    ApplicationArea = All;
                }
            }
        }
        /* area(factboxes)
        {
            part("Power BI Report FactBox"; "Power BI Report FactBox")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Power BI Reports';
                Visible = PowerBIVisible;
            }
        } */

    }
    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }

    }

    var
        myInt: Integer;
}