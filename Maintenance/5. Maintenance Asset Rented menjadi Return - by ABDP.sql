-- BY ABDP --

/*
select a.FA_CODE, a.FA_REFF_NO_01, a.FA_REFF_NO_02, a.ASSET_STATUS
from AGREEMENT_ASSET a
where a.AGREEMENT_NO = REPLACE('0000750/4/08/08/2022', '/', '.')
and a.ASSET_STATUS = 'RENTED';
*/

begin transaction

select	fa_reff_no_02 -- chassis no 
		,fa_code -- asset code
		,asset_status
from	dbo.agreement_asset
where	agreement_no = REPLACE('0000750/4/08/08/2022', '/', '.') -- agreement no
and		fa_reff_no_01 = 'B9126UDH' -- plat no

select	agreement_no
		,agreement_external_no
		,client_no
		,client_name
		,status
		,fisical_status 
from	ifinams.dbo.asset
where	code = '4120041814' -- asset code


exec dbo.xsp_mtn_rented_return_asset @p_agreement_no = '0000750.4.08.08.2022'	-- nvarchar(50)
									 ,@p_plat_no = 'B9126UDH'		-- nvarchar(50)
									 ,@p_chassis_no = 'MHMFE74EJNK001502'	-- nvarchar(50)
									 ,@p_mtn_remark = 'Issue #1668 - data maintenance status pada seluruh nopol menjadi return di agreement 0000750/4/08/08/2022'	-- nvarchar(4000)
									 ,@p_mtn_cre_by = 'Aryo Budi D.P.'	-- nvarchar(250)


select	agreement_no
		,agreement_external_no
		,client_no
		,client_name
		,status
		,fisical_status 
from	ifinams.dbo.asset
where	code = '4120041814' -- asset code

select	fa_reff_no_02 -- chassis no 
		,fa_code -- asset code
		,asset_status
from	dbo.agreement_asset
where	agreement_no = REPLACE('0000750/4/08/08/2022', '/', '.') -- agreement no
and		fa_reff_no_01 = 'B9126UDH' -- plat no

rollback transaction