pageextension 50503 PagExtFirmPlannedProdOrders extends "Firm Planned Prod. Orders"
{
    actions
    {
        addlast(reporting)
        {
            action("F1 - Production Order List")
            {
                Caption = 'Production Order List';
                ApplicationArea = All;
                Image = List;
                Promoted = true;
                PromotedCategory = Report;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    ProductionOrder: Record "Production Order";
                begin
                    if ProductionOrder.Get(Rec.Status, Rec."No.") then
                        Report.RunModal(50501, true, true, ProductionOrder);
                end;
            }
        }
    }
}