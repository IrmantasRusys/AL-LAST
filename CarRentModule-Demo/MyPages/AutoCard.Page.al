page 50134 "Auto Card"
{
    Caption = 'Auto Card';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = Auto;
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ToolTip = 'No.';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Name';
                }
                field(Brand; Rec.Brand)
                {
                    ToolTip = 'Brand';
                }
                field(Model; Rec.Model)
                {
                    ToolTip = 'Model';
                }
                field("Manufacture Year"; Rec."Manufacture Year")
                {
                    ToolTip = 'Manufacture Year';
                }
                field("Civil Insurance"; Rec."Civil Insurance")
                {
                    ToolTip = 'Civil Insurance valid until';
                }
                field(TA; Rec.TA)
                {
                    ToolTip = 'TA valid until';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ToolTip = 'Location Code';
                }
                field("Rental Service"; Rec."Rental Service")
                {
                    ToolTip = 'Rental Service';
                }
                field("Rental Price"; Rec."Rental Price")
                {
                    ToolTip = 'Rental Price';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(ReservationList)
            {
                Caption = 'Reservation List';
                ToolTip = 'Reservation List';
                Image = Action;
                RunObject = Page "Auto Reservation List";
            }
        }
    }
}