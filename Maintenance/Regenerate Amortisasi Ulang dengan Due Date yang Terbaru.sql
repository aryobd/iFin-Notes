-- regenerate amortisasi ulang dengan due date yang terbaru
 
-- sudah menjadi kontrak agreement.
begin transaction
 
declare @application_no_ext	nvarchar(50) = ''						-- applikasi dengan /
		,@application_no	nvarchar(50) = ''						-- applikasi dengan .
		,@agreement_no		nvarchar(50) = ''						-- agreement dengan .
		,@agreement_no_ext	nvarchar(50) = '0001540/4/01/09/2023'   -- agreement dengan /
		,@asset_no			nvarchar(50)
		,@due_date			datetime = '2023-11-06'			-- isi due date
		,@mod_by			nvarchar(15) = 'MAINTENANCE'
		,@mod_date			datetime = dbo.xfn_get_system_date()
		,@mod_ip_address	nvarchar(15) = '127.0.0.1'
 
 
select	@agreement_no = agreement_no		-- get kontrak agreement from application no .
from	dbo.agreement_main
where	application_no = @application_no
 
 
select	@agreement_no_ext = agreement_no		-- get kontrak agreement from application no /
from	dbo.agreement_main
where	application_no_external = @application_no_ext
 
set @agreement_no_ext = replace(@agreement_no_ext,'/','.')
 
select	'before',* 
from	dbo.agreement_asset_amortization 
where	agreement_no in (@agreement_no,@agreement_no_ext)
 
declare cur_schedule cursor fast_forward read_only for 
select	asset_no 
from	dbo.agreement_asset
where	agreement_no in (@agreement_no,@agreement_no_ext)
open cur_schedule
 
fetch next from cur_schedule 
into @asset_no
 
while @@fetch_status = 0
begin
    exec dbo.xsp_agreement_amortization_recalculate_due_date @p_asset_no = @asset_no
    														 ,@p_due_date = @due_date
    														 ,@p_mod_date = @mod_date
    														 ,@p_mod_by = @mod_by
    														 ,@p_mod_ip_address = @mod_ip_address

 
    fetch next from cur_schedule 
	into @asset_no
end
 
close cur_schedule
deallocate cur_schedule
 
select	'after',* 
from	dbo.agreement_asset_amortization 
where	agreement_no in (@agreement_no,@agreement_no_ext)
 
rollback transaction 