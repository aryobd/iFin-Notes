begin transaction

exec  IFINOPL.dbo.XSP_MTN_CHANGE_ASSET_GTS_TO_ASSET_UTAMA   @p_agreement_no   = N'0001518/4/01/09/2023' -- AGREEMENT NO
                                                           ,@p_asset_code_new = N'2001.AST.2312.00072'  -- CODE ASSET UTAMA 
                                                           ,@p_asset_code_gts = N'4120036129'           -- CODE ASSET GTS 
                                                           ,@p_mtn_remark     = N'Issue #1721'          -- KETERANGAN MAINTENANCE 
                                                           ,@p_mtn_cre_by     = N'Aryo Budi'            -- PIC MAINTENANCE  

rollback transaction
--------------------------------------------------------------------------------------------------------------------------------

select a.CHASSIS_NO, a.ASSET_CODE, a.BUILT_YEAR, a.*
from IFINAMS.dbo.ASSET_VEHICLE a
where a.CHASSIS_NO in (
'MHKB3BA1JPK094809'
);

select a.AGREEMENT_EXTERNAL_NO, a.AGREEMENT_NO, a.*
from IFINAMS.dbo.ASSET a
where a.CODE = '2001.AST.2312.00072' --> CEK ASSET SDH DIPAKAI DI AGREEMENT/TDK

select a.AGREEMENT_EXTERNAL_NO, a.AGREEMENT_NO, a.*
from IFINAMS.dbo.ASSET a
where a.CODE = '4120036129' --> CEK ASSET GTS ADA/TDK

select a.ASSET_STATUS, a.*
from IFINOPL.dbo.AGREEMENT_ASSET a
where a.AGREEMENT_NO = '0001518.4.01.09.2023'
