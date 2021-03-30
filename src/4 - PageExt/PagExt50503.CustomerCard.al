pageextension 50503 PagExtCustomerCard extends "Customer Card"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addafter("&Customer")
        {
            action("Salespersons List")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Salespersons list';
                Image = Entry;
                Description = 'Assign salespersons and choose the percentage of their commission.';
                //RunObject = Page "F1 - Salespersons List";

                trigger OnAction()
                var
                    SalespersonsPag: Page "F1 - Salespersons List";
                    SalespersonsTab: Record "F1 - Salespersons list";
                    Customer: Record Customer;
                begin
                    SalespersonsTab.SetCurrentKey("Customer No.");
                    SalespersonsTab.SetRange("Customer No.", Rec."No.");
                    SalespersonsPag.SetTableView(SalespersonsTab);
                    Page.Run(Page::"F1 - Salespersons List", SalespersonsTab);
                end;
            }
        }
    }
}