page 50130 "Auto Setup Card"
{
    Caption = 'Auto Setup Card';
    PageType = Card;
    ApplicationArea = All;  // Puslapis bendrojo naudojimo. Pasiekiamas vartotojui per paieska (jei butu pvz finance, tai sandelyje neatidarytum)
    UsageCategory = Administration;
    SourceTable = "Auto Setup";  // siejam su AutoSetup Table

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("Car NoS"; Rec."Car NoS") // atvaizduojant ir redaguojant reiksmes fieldas. Record vardas
                {
                    ToolTip = 'Car No. Series';  // uzvedus pele paaiskinimas
                }
                field("Car Rental NoS"; Rec."Car Rental NoS")
                {
                    ToolTip = 'Car Rental No. Series';
                }
                field("Attachment location"; Rec."Attachment location")
                {
                    ToolTip = 'Attachment location';
                }
            }
        }
    }
}