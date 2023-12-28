begin transaction 

select	fa_reff_no_02 -- chassis no 
		,fa_code -- asset code --> RETURN
		,asset_status
from	dbo.agreement_asset
where	agreement_no = '0000539.4.01.09.2020' -- agreement no
and		fa_reff_no_01 = 'B9985PCQ' -- plat no

select	agreement_no --> BLANK
		,agreement_external_no --> BLANK
		,client_no --> BLANK
		,client_name --> BLANK
		,status --> STOCK/ REPLACEMENT
		,fisical_status --> ON HAND
from	ifinams.dbo.asset
where	code = '4120036211' -- asset code

exec dbo.xsp_mtn_return_rented_asset @p_agreement_no = N'0000539.4.01.09.2020'	-- no agreement
									 ,@p_plat_no = N'B9985PCQ'					-- plat no
									 ,@p_chassis_no = N'MHKB3BA1JLK070884'		-- chassis no
									 ,@p_mtn_remark = N'Perubahan Status Nopol B9985PCQ Return menjadi RENTED'	
									 ,@p_mtn_cre_by = N'Ari Wibowo'	


select	agreement_no
		,agreement_external_no
		,client_no
		,client_name
		,status
		,fisical_status --> ON CUSTOMER
from	ifinams.dbo.asset
where	code = '4120036211' -- asset code

select	fa_reff_no_02 -- chassis no 
		,fa_code -- asset code --> RENTED
		,asset_status
from	dbo.agreement_asset
where	agreement_no = '0000539.4.01.09.2020' -- agreement no
and		fa_reff_no_01 = 'B9985PCQ' -- plat no

rollback transaction 