pageextension 50505 PagExtSalesInvoice extends "Sales Invoice"
{
    layout
    {
        modify("Salesperson Code")
        {
            Visible = false;
        }
        addafter("Salesperson Code")
        {
            field(Salespersons; Rec.Salespersons)
            {
                ApplicationArea = All;

                trigger OnDrillDown()
                begin
                    Rec.OpenSalespersonListEntries();
                end;
            }
        }
    }

    actions
    {
        addafter("F&unctions")
        {
            group(Commissions)
            {
                /* action("Addition Salespersons/Purchasers")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Addition Salespersons/Purchasers';
                    Image = SalesPurchaseTeam;
                    RunObject = Page PagAdditionSalespersPurchaser;

                    trigger OnAction()
                    begin

                    end;
                } */
                action("Show Commissions")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Show Commissions';
                    Image = Percentage;
                    //RunObject = Page PagAdditionSalespersPurchaser;

                    trigger OnAction()
                    begin

                    end;
                }
            }
        }

    }
}