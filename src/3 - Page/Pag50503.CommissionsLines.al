page 50503 "F1 - Commissions Lines"
{
    Caption = 'Commissions Lines';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "F1 - TabSalesInv_CommissLines";

    layout
    {
        area(Content)
        {
            repeater(Control1)
            {
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                }
                field("Salesperson Code"; Rec."Salesperson Code")
                {
                    ApplicationArea = All;
                }
                field("Salesperson Name"; Rec."Salesperson Name")
                {
                    ApplicationArea = All;
                }
                field("Role Description"; Rec."Role Description")
                {
                    ApplicationArea = All;
                }
                field("Amount (Commission Base)"; Rec."Amount (Commission Base)")
                {
                    ApplicationArea = All;
                }
                field("% Commission"; Rec."Fees")
                {
                    ApplicationArea = All;
                }
                field("Commission (Amount)"; Rec."Commission (Amount)")
                {
                    ApplicationArea = All;
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
            }
        }
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
        CUCommissionCalculation: Codeunit CommissionCalcSub;
        SalesLine: Record "Sales Line";
        Salesperson: Record "F1 - Salespersons list";

    trigger OnInit()
    begin
        //SalesLine.Get(Rec.Type, Rec."No.");
    end;

    trigger OnOpenPage()
    begin
        CUCommissionCalculation.ValidateCommissionLinesFields(SalesLine, Salesperson);
    end;
}