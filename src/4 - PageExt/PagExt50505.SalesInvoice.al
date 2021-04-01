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
}