alter FUNCTION GetOrgValue(
    @OrgValue	VARCHAR	(100),
    @Level		INTEGER
  )
  RETURNS VARCHAR(100)

AS
BEGIN

    declare @Result      varchar (100);

    set @Result = IsNull
      (
        (
          Select Top 1 ZA0100 From AB01
            Where
              (CharIndex(ZA0100, @OrgValue) = 1)
		and
              (
                Level1
                  =
                (
                  Case
                  When
                    (Select Max(Level1) From AB01)
                      -
                    @Level
                      > 1
                  Then
                    (Select Max(Level1) From AB01)
                      -
                    @Level
                  Else
                    1
                  End
                )
              )
        ), ''
      );

    RETURN @Result;
END
