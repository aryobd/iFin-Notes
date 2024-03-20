begin transaction

select
FA_REFF_NO_02, -- chassis no
FA_CODE,       -- ASSET CODE --> RETURN
ASSET_STATUS
from IFINOPL.dbo.AGREEMENT_ASSET
where AGREEMENT_NO = '0000539.4.01.09.2020' -- agreement no
and FA_REFF_NO_01 = 'B9985PCQ' -- plat no

select
AGREEMENT_NO, --> BLANK
AGREEMENT_EXTERNAL_NO, --> BLANK
CLIENT_NO, --> BLANK
CLIENT_NAME, --> BLANK
[STATUS], --> STOCK/ REPLACEMENT
FISICAL_STATUS --> ON HAND
from IFINAMS.dbo.ASSET
where CODE = '4120036211' -- ASSET CODE

exec  IFINOPL.dbo.XSP_MTN_RETURN_RENTED_ASSET   @p_AGREEMENT_NO = N'0000539.4.01.09.2020' -- no agreement
                                               ,@p_plat_no = N'B9985PCQ'     -- plat no
                                               ,@p_chassis_no = N'MHKB3BA1JLK070884'  -- chassis no
                                               ,@p_mtn_remark = N'Perubahan [STATUS] Nopol B9985PCQ Return menjadi RENTED' 
                                               ,@p_mtn_cre_by = N'Ari Wibowo' 

select
AGREEMENT_NO,
AGREEMENT_EXTERNAL_NO,
CLIENT_NO,
CLIENT_NAME,
[STATUS],
FISICAL_STATUS --> ON CUSTOMER
from IFINAMS.dbo.ASSET
where CODE = '4120036211' -- ASSET CODE

select
FA_REFF_NO_02, -- chassis no
FA_CODE, -- ASSET CODE --> RENTED
ASSET_STATUS
from IFINOPL.dbo.AGREEMENT_ASSET
where AGREEMENT_NO = '0000539.4.01.09.2020' -- agreement no
and  FA_REFF_NO_01 = 'B9985PCQ' -- plat no

rollback transaction;