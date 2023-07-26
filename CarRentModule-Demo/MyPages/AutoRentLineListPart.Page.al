page 50142 "Auto Rent Line List Part"
{
    Caption = 'Auto Rent Line List Part';
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = "Auto Rent Line";
    AutoSplitKey = true;
    LinksAllowed = false;
    MultipleNewLines = true;
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                Caption = 'General';
                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Document No.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ToolTip = 'Line No.';
                }
                field(Type; Rec.Type)
                {
                    ToolTip = 'Type';
                }
                field("No."; Rec."No.")
                {
                    ToolTip = 'No.';
                    trigger OnValidate()
                    begin
                        FillDescription();
                        FillPrice();
                    end;
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
    local procedure FillDescription()
    var
        Item: Record Item;
        Resource: Record Resource;
    begin
        case Rec.Type of
            Rec.Type::Item:
                if Item.Get(Rec."No.") then
                    Rec.Description := Item.Description;
            Rec.Type::Resource:
                if Resource.Get(Rec."No.") then
                    Rec.Description := Resource.Name;
        end;
    end;

    local procedure FillPrice()
    var
        Item: Record Item;
        Resource: Record Resource;
    begin
        case Rec.Type of
            Rec.Type::Item:
                if Item.Get(Rec."No.") then
                    Rec.Price := Item."Unit Price";
            Rec.Type::Resource:
                if Resource.Get(Rec."No.") then
                    Rec.Price := Resource."Unit Price";
        end;
    end;
}