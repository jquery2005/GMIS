CREATE PROCEDURE Zwd_SyncOrgLevel

AS
BEGIN

    declare @tempLevel1   int;

    Update AB01 Set Level1 =
        (
            Case When IsNull(ZA9996, '') = '' Then 1
                Else -1
            End
        );

    set @tempLevel1 = 1;
    while Exists
        (
            Select * From AB01
            Where (Level1 = -1)
                and
                ( ZA9996 In
                    (
                        Select ZA0100 From AB01
                        Where (Level1 = @tempLevel1)
                    )
                )
        )
    begin
        Update AB01 Set Level1 = @tempLevel1 + 1
        Where
            ( ZA0100 In
                (
                    Select ZA0100 From AB01
                    Where (Level1 = -1)
                        and
                        ( ZA9996 In
                            (
                                Select ZA0100 From AB01
                                Where (Level1 = @tempLevel1)
                            )
                        )
                )
            );

        set @tempLevel1 = @tempLevel1 + 1;
    end;

END

