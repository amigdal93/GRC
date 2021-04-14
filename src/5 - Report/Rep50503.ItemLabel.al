report 50503 "GRC - Item Label"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'src/5 - Report/layouts/Rep50503ItemLabel.rdl';
    ApplicationArea = All;
    Caption = 'Item Label';
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem(Item; Item)
        {
            DataItemTableView = SORTING("No.");
            RequestFilterFields = "No.";

            column(HeaderTxt1; HeaderTxt[1])
            {
            }
            column(HeaderTxt2; HeaderTxt[2])
            {
            }
            column(HeaderTxt3; HeaderTxt[3])
            {
            }
            column(HeaderTxt4; HeaderTxt[4])
            {
            }
            column(HeaderTxt5; HeaderTxt[5])
            {
            }
            column(CompanyLogo; CompInfo.Picture)
            {
            }
            column(CompAddr1; CompAddr[1])
            {
            }
            column(CompAddr2; CompAddr[2])
            {
            }
            column(CompAddr3; CompAddr[3])
            {
            }
            column(CompAddr4; CompAddr[4])
            {
            }
            column(CompAddr5; CompAddr[5])
            {
            }
            column(CompAddr; CompAddr)
            {
            }
            column(ShowSection; ColumnNo = 0)
            {
            }

            trigger OnAfterGetRecord()
            begin
                Item.Get("No.");
                CompInfo.Get();
                CompInfo.CalcFields(Picture);

                for i := 1 to 5 do begin
                    if Item.Description <> '' then begin
                        HeaderTxt[1] := Item.Description;
                    end;

                    if Item."No." <> '' then begin
                        HeaderTxt[2] := CodeLbl;
                        HeaderTxt[3] := Item."No.";
                    end;

                    HeaderTxt[4] := LocationLbl;
                    HeaderTxt[5] := Item."Location Filter";
                end;

                CompAddr := CompInfo.Address + ' ' + CompInfo."Address 2" + ' ' + CompInfo."Post Code" + ' ' + CompInfo.City + ' ' + CompInfo."Country/Region Code" + ' ' + CompInfo."Phone No." + ' ' + CompInfo."E-Mail";

                ItemLongDescription := Item.Description;

                RecordNo := RecordNo + 1;
                ColumnNo := ColumnNo + 1;
                if RecordNo = NoOfRecords then begin
                    for i := ColumnNo + 1 to NoOfColumns do
                        Clear(Addr[i]);
                    ColumnNo := 0;
                end else begin
                    if ColumnNo = NoOfColumns then
                        ColumnNo := 0;
                end;

                if ColumnNo = 0 then begin
                    if Counter = RecPerPageNum then begin
                        GroupNo := GroupNo + 1;
                        Counter := 0;
                    end;
                    Counter := Counter + 1;
                end;
            end;

            trigger OnPreDataItem()
            begin
                case LabelFormat of
                    LabelFormat::"36 x 70 mm (3 columns)", LabelFormat::"37 x 70 mm (3 columns)":
                        NoOfColumns := 3;
                    LabelFormat::"36 x 105 mm (2 columns)", LabelFormat::"37 x 105 mm (2 columns)":
                        NoOfColumns := 2;
                end;
                NoOfRecords := Count;
                RecordNo := 0;
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(LabelFormat; LabelFormat)
                    {
                        ApplicationArea = Suite;
                        Caption = 'Format';
                        OptionCaption = '36 x 70 mm (3 columns),37 x 70 mm (3 columns),36 x 105 mm (2 columns),37 x 105 mm (2 columns)';
                        ToolTip = 'Specifies the format of the label.';
                    }
                }
            }
        }
    }

    trigger OnPreReport()
    begin
        GroupNo := 1;
        RecPerPageNum := 4;
    end;

    var
        Addr: array[3, 4] of Text[250];
        HeaderTxt: array[5] of Text[100];
        CompAddr: Text[500];
        NoOfRecords: Integer;
        RecordNo: Integer;
        NoOfColumns: Integer;
        ColumnNo: Integer;
        i: Integer;
        CodeLbl: Label 'Code:';
        LocationLbl: Label 'Location:';
        ItemLongDescription: Text[500];
        CompInfo: Record "Company Information";
        Counter: Integer;
        RecPerPageNum: Integer;
        GroupNo: Integer;
        LabelFormat: Option "36 x 70 mm (3 columns)","37 x 70 mm (3 columns)","36 x 105 mm (2 columns)","37 x 105 mm (2 columns)";

    procedure InitializeRequest(SetLabelFormat: Option)
    begin
        LabelFormat := SetLabelFormat;
    end;
}