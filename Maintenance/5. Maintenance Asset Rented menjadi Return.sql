begin transaction 


select	fa_reff_no_02 -- chassis no 
		,fa_code -- asset code
		,asset_status
from	dbo.agreement_asset
where	agreement_no = '0000539.4.01.09.2020' -- agreement no
and		fa_reff_no_01 = 'B9985PCQ' -- plat no

select	agreement_no
		,agreement_external_no
		,client_no
		,client_name
		,status
		,fisical_status 
from	ifinams.dbo.asset
where	code = '4120036211' -- asset code


exec dbo.xsp_mtn_rented_return_asset @p_agreement_no = N''	-- nvarchar(50)
									 ,@p_plat_no = N''		-- nvarchar(50)
									 ,@p_chassis_no = N''	-- nvarchar(50)
									 ,@p_mtn_remark = N''	-- nvarchar(4000)
									 ,@p_mtn_cre_by = N''	-- nvarchar(250)


select	agreement_no
		,agreement_external_no
		,client_no
		,client_name
		,status
		,fisical_status 
from	ifinams.dbo.asset
where	code = '4120036211' -- asset code

select	fa_reff_no_02 -- chassis no 
		,fa_code -- asset code
		,asset_status
from	dbo.agreement_asset
where	agreement_no = '0000539.4.01.09.2020' -- agreement no
and		fa_reff_no_01 = 'B9985PCQ' -- plat no

rollback transaction 