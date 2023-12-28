begin transaction 

--0000750/4/08/08/2022

declare @tmp_table TABLE (
    fa_code     nvarchar(50),
    plat_no     nvarchar(20),
    chassis_no  nvarchar(50)
);

insert into @tmp_table
select a.FA_CODE, a.FA_REFF_NO_01, a.FA_REFF_NO_02 from AGREEMENT_ASSET a where a.AGREEMENT_NO = REPLACE('0000750/4/08/08/2022', '/', '.') and a.ASSET_STATUS = 'RENTED';

declare @fa_code		nvarchar(50)
		,@plat_no		nvarchar(20)
		,@chassis_no	nvarchar(50)
        ,@agreement_no  nvarchar(50) = REPLACE('0000750/4/08/08/2022', '/', '.')

select	fa_reff_no_02 -- chassis no 
		,fa_code -- asset code
		,asset_status
from	dbo.agreement_asset
where	agreement_no = @agreement_no -- agreement no
--and		fa_reff_no_01 = 'B9135UDH' -- plat no

select	agreement_no
		,agreement_external_no
		,client_no
		,client_name
		,status
		,fisical_status 
from	ifinams.dbo.asset
where	code in (select a.FA_CODE from AGREEMENT_ASSET a where a.AGREEMENT_NO = REPLACE('0000750/4/08/08/2022', '/', '.') and a.ASSET_STATUS = 'RENTED')
 
declare curr_return cursor fast_forward read_only for

select a.fa_code, a.plat_no, a.chassis_no from @tmp_table a
 
open curr_return
 
fetch next from curr_return into @fa_code, @plat_no, @chassis_no
 
while @@fetch_status = 0
begin
        
    exec dbo.xsp_mtn_rented_return_asset @p_agreement_no = @agreement_no
									     ,@p_plat_no = @plat_no
									     ,@p_chassis_no = @chassis_no
									     ,@p_mtn_remark = 'Issue #1668 - data maintenance status pada seluruh nopol menjadi return di agreement 0000750/4/08/08/2022'
									     ,@p_mtn_cre_by = 'Aryo Budi D.P.'	-- nvarchar(250)
 
    fetch next from curr_return into @fa_code, @plat_no, @chassis_no
end
 
close curr_return
deallocate curr_return




--select a.* from AGREEMENT_ASSET a where a.AGREEMENT_NO = REPLACE('0000750/4/08/08/2022', '/', '.') and a.ASSET_STATUS = 'RENTED';




select	fa_reff_no_02 -- chassis no 
		,fa_code -- asset code
		,asset_status
from	dbo.agreement_asset
where	agreement_no = @agreement_no -- agreement no
--and		fa_reff_no_01 = 'B9135UDH' -- plat no

select	agreement_no
		,agreement_external_no
		,client_no
		,client_name
		,status
		,fisical_status 
from	ifinams.dbo.asset
where	code in (select a.FA_CODE from AGREEMENT_ASSET a where a.AGREEMENT_NO = REPLACE('0000750/4/08/08/2022', '/', '.') and a.ASSET_STATUS = 'RENTED')
 

rollback transaction 