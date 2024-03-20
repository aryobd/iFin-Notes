begin transaction

select
FA_REFF_NO_02, -- chassis no
FA_CODE,       -- asset code
ASSET_STATUS
from IFINOPL.dbo.AGREEMENT_ASSET
where AGREEMENT_NO = '0000539.4.01.09.2020' -- agreement no
and  FA_REFF_NO_01 = 'B9985PCQ' -- plat no

select
AGREEMENT_NO,
AGREEMENT_EXTERNAL_NO,
CLIENT_NO,
CLIENT_NAME,
STATUS,
FISICAL_STATUS
from IFINAMS.dbo.ASSET
where CODE = '4120036211' -- asset code


exec  IFINOPL.dbo.XSP_MTN_RENTED_RETURN_ASSET   @p_AGREEMENT_NO = N'' -- nvarchar(50)
                                               ,@p_plat_no      = N''  -- nvarchar(50)
                                               ,@p_chassis_no   = N'' -- nvarchar(50)
                                               ,@p_mtn_remark   = N'' -- nvarchar(4000)
                                               ,@p_mtn_cre_by   = N'' -- nvarchar(250)


select
AGREEMENT_NO,
AGREEMENT_EXTERNAL_NO,
CLIENT_NO,
CLIENT_NAME,
STATUS,
FISICAL_STATUS
from IFINAMS.dbo.ASSET
where CODE = '4120036211' -- asset code

select FA_REFF_NO_02 select
FA_REFF_NO_02, -- chassis no
FA_CODE,       -- asset code
ASSET_STATUS
from IFINOPL.dbo.AGREEMENT_ASSET
where AGREEMENT_NO = '0000539.4.01.09.2020' -- agreement no
and  FA_REFF_NO_01 = 'B9985PCQ' -- plat no

rollback transaction 