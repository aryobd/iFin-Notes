BEGIN TRANSACTION 


DECLARE @code_handover		NVARCHAR(50)			= '2008.HNR.2312.000182'
		,@fa_code			NVARCHAR(50)			= '4120043967'
		,@asset_no			NVARCHAR(50)			= '2008.OPLAA.2312.000346'
		,@p_mtn_remark		NVARCHAR(4000)
		,@p_mtn_cre_by		NVARCHAR(250)
		,@msg				nvarchar(max)

if (isnull(@p_mtn_remark, '') = '')
begin
	set @msg = 'Harap diisi Maintenance Remark';
	raiserror(@msg, 16, 1) ;
	return
end

if (isnull(@p_mtn_cre_by, '') = '')
begin
	set @msg = 'Harap diisi Maintenance Cre By';
	raiserror(@msg, 16, 1) ;
	return
END

update dbo.handover_asset set fa_code = @fa_code where code = @code_handover
update ifinopl.dbo.application_asset set fa_code = @fa_code where ASSET_NO = @asset_no

--insert ke tabel maintenance log
INSERT INTO dbo.MTN_DATA_DSF_LOG
(
	MAINTENANCE_NAME
	,REMARK
	,TABEL_UTAMA
	,REFF_1
	,REFF_2
	,REFF_3
	,CRE_DATE
	,CRE_BY
)
values
(
	'MTN PERUBAHAN ASSET'
	,@p_mtn_remark
	,'HANDOVER_ASSET'
	,@code_handover
	,null -- REFF_2 - nvarchar(50)
	,null -- REFF_3 - nvarchar(50)
	,getdate()
	,@p_mtn_cre_by
)

INSERT INTO ifinopl.dbo.MTN_DATA_DSF_LOG
(
    MAINTENANCE_NAME,
    REMARK,
    TABEL_UTAMA,
    REFF_1,
    REFF_2,
    REFF_3,
    CRE_DATE,
    CRE_BY
)
values
(
	'MTN PERUBAHAN ASSET'
	,@p_mtn_remark
	,'APPLICATION_ASSET'
	,@asset_no
	,null -- REFF_2 - nvarchar(50)
	,null -- REFF_3 - nvarchar(50)
	,getdate()
	,@p_mtn_cre_by
)


SELECT * FROM dbo.MTN_DATA_DSF_LOG
IF @@ERROR > 0
BEGIN
	ROLLBACK TRANSACTION 
	SELECT 'Error'
END
ELSE
BEGIN
	ROLLBACK TRANSACTION 
	--COMMIT TRANSACTION
	SELECT 'sukses'
END