page 50135 "Auto Reservation List"
{
    Caption = 'Auto Reservation List';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Auto Reservation";
    AutoSplitKey = true;
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                Caption = 'General';
                field("Line No."; Rec."Line No.")
                {
                    ToolTip = 'Line No.';
                }
                field("Car No."; Rec."Car No.")
                {
                    ToolTip = 'Car No.';
                    trigger OnValidate()
                    begin
                        CheckReservationDateOverlap();
                    end;
                }
                field("Client No."; Rec."Client No.")
                {
                    ToolTip = 'Client No.';
                }
                field("Reserved From"; Rec."Reserved From")
                {
                    ToolTip = 'Reserved From';
                    trigger OnValidate()
                    begin
                        CheckReservationDateOverlap();
                    end;
                }
                field("Reserved Until"; Rec."Reserved Until")
                {
                    ToolTip = 'Reserved Until';
                    trigger OnValidate()
                    begin
                        CheckReservationDateOverlap();
                    end;
                }
            }
        }
    }
    local procedure CheckReservationDateOverlap()
    var
        AutoReservation: Record "Auto Reservation"; // kintamasis esamom rezervacijom perziureti
        ReservationDateOverlapErr: Label 'This car is already reserved at this time';  // etikete klaidos pranesimui
    begin
        AutoReservation.SetCurrentKey("Car No."); // nustatomas raktas AR irasui pagal lauka (CN) auto nr.
        AutoReservation.SetFilter("Car No.", Rec."Car No.");  // filtras AR irasams su tokiu paciu Car No kaip ir naujai irasomas irasas Rec Car No
                                                              // tikrinama ar uzpildyti laukai RF ir RU
        if (Format(Rec."Reserved From", 0) = '') or (Format(Rec."Reserved Until", 0) = '') then
            exit;   // exit jei bent vienas laukas tuscias
                    // ciklas perziureti visiem irasam, kurie atitinka filtra
        if AutoReservation.FindSet() then
            repeat
                // tikrina ar einamojo iraso rec numeris nesutampa su tuo paciu irasu, per kuri einama
                if not (AutoReservation."Line No." = Rec."Line No.") then
                    // tikrinama, ar rezervacijos datos susiduria
                        if (Rec."Reserved From" <= AutoReservation."Reserved Until") and (Rec."Reserved From" >= AutoReservation."Reserved From") then
                        Error(ReservationDateOverlapErr);  // jei susiduriama su kitu rezervacijos laikotarpiu, isvedam klaidos pranesima
            until AutoReservation.Next() = 0;  // ciklas kartojamas, kol visi atitinkantys filtra irasai yra tikrinami
    end;
}