page 50144 "Finished Auto Rent List Part"
{
    Caption = 'Finished Auto Rent Line List Part';
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = "Finished Auto Rent Line";
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                Caption = 'General';
                field(Type; Rec.Type)
                {
                    ToolTip = 'Type';
                }
                field("No."; Rec."No.")
                {
                    ToolTip = 'No.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Description';
                }
                field(Amount; Rec.Amount)
                {
                    ToolTip = 'Amount';
                }
                field(Price; Rec.Price)
                {
                    ToolTip = 'Price';
                }
                field(Sum; Rec.Sum)
                {
                    ToolTip = 'Sum';
                }
            }
        }
    }
}