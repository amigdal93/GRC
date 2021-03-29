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
                    ApplicationArea = Basic, Suite;
                    Visible = false;
                }
                field(ClientNo; Rec."Client No.")
                {
                    ApplicationArea = Basic, Suite;
                }
                field(ClientName; Rec."Client Name")
                {
                    ApplicationArea = Basic, Suite;
                }
                field(ItemNo; Rec."Item No.")
                {
                    ApplicationArea = Basic, Suite;
                }
                field(ItemDescription; Rec."Item Description")
                {
                    ApplicationArea = Basic, Suite;
                }
                field(SalespersonCode; Rec."Salesperson Code")
                {
                    ApplicationArea = Basic, Suite;
                }
                field(SalespersonName; Rec."Salesperson Name")
                {
                    ApplicationArea = Basic, Suite;
                }
                field(Fees; Rec."Fees")
                {
                    ApplicationArea = Basic, Suite;
                }
                field(LineNo; Rec."Line No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the line number.';
                    Visible = false;
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