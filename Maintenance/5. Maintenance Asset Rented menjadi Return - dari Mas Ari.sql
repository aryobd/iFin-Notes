-- DARI MAS ARI --

begin transaction
 
select	FA_CODE,FA_REFF_NO_01,* 
from	dbo.AGREEMENT_ASSET where AGREEMENT_NO = '0000750.4.08.08.2022' and ASSET_STATUS = 'RENTED'
 
 
select	fa_reff_no_02 -- chassis no 
		,fa_code -- asset code
		,asset_status
from	dbo.agreement_asset
where	agreement_no = '0000750.4.08.08.2022' -- agreement no
and		fa_reff_no_01 = 'B9135UDH' -- plat no
 
select	agreement_no
		,agreement_external_no
		,client_no
		,client_name
		,status
		,fisical_status 
from	ifinams.dbo.asset
where	code = '4120041815' -- asset code
 
 
exec dbo.xsp_mtn_rented_return_asset @p_agreement_no = N'0000750.4.08.08.2022'	-- nvarchar(50)
									 ,@p_plat_no = N'B9135UDH'		-- nvarchar(50)
									 ,@p_chassis_no = N'MHMFE74EJNK001504'	-- nvarchar(50)
									 ,@p_mtn_remark = N'test'	-- nvarchar(4000)
									 ,@p_mtn_cre_by = N'1'	-- nvarchar(250)
 
 
select	agreement_no
		,agreement_external_no
		,client_no
		,client_name
		,status
		,fisical_status 
from	ifinams.dbo.asset
where	code = '4120041815' -- asset code
 
select	fa_reff_no_02 -- chassis no 
		,fa_code -- asset code
		,asset_status
from	dbo.agreement_asset
where	agreement_no = '0000750.4.08.08.2022' -- agreement no
and		fa_reff_no_01 = 'B9135UDH' -- plat no
 
rollback transaction
 