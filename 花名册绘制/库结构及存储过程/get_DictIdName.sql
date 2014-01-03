alter FUNCTION get_DictIdName
(@DictId varchar(20),@DictIdValue varchar(50))
returns varchar(100)
as

begin
declare @name varchar(100)
declare @value varchar(100)
declare @len int

set @name = ''
set @value = ''
set @len = len(@DictIdValue)

DECLARE    @SourceString   VARCHAR(4000) 
DECLARE    @FirstWord      VARCHAR(4000)
set @SourceString = @DictIdValue
set @FirstWord = @value

WHILE @len > 0
begin
 	--EXECUTE @len = flxp_PopFirstWord @DictIdValue OUTPUT, @value OUTPUT


    DECLARE @Oldword        VARCHAR(4000)
    DECLARE @Length         INT
    DECLARE @CommaLocation  INT

    SELECT @Oldword = @SourceString
    IF NOT @Oldword IS NULL  
    BEGIN
        SELECT @CommaLocation = CHARINDEX(',',@Oldword)
        SELECT @Length = DATALENGTH(@Oldword)
	       IF @CommaLocation = 0
	        BEGIN
	            SELECT @FirstWord = @Oldword
	            SELECT @SourceString = NULL
	            set @len = 0
	        END
		else
		begin
		        SELECT @FirstWord = SUBSTRING(@Oldword, 1, @CommaLocation -1)
		        SELECT @SourceString = SUBSTRING(@Oldword, @CommaLocation + 1, @Length - @CommaLocation)
		        set @len =  @Length - @CommaLocation
		end
    END
	set @name=@name+ ',' +(select description from gs_dictitem where dictid=@Dictid and dictvalue=@FirstWord)

end
if(@FirstWord is null)
	set @FirstWord = ''
if(@name='' or @name is null)
 set @name=','+@FirstWord
if(@name=',' or @name is null)
 set @name=','

 return substring(@name,2,len(@name))
end






