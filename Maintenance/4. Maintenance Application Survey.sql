BEGIN TRANSACTION 

declare	@code				nvarchar(50)
		,@application_no	nvarchar(50) = '' -- application_no

set @application_no = replace(@application_no,'/','.')

-- diaktifkan jika application survey sudah terbentuk dan ingin di lakukan generate kembali, jika tidak perlu maka jalankan sp mtn saja
--select	@code = code	 
--from	dbo.application_survey 
--where	application_no = @application_no -- application_no

--delete	dbo.application_survey_bank 
--where	application_survey_code = @code

--delete	application_survey 
--where	application_no = @application_no


exec dbo.xsp_mtn_application_survey @p_application_no = @application_no -- application_no
									,@p_mtn_remark = N''	-- nvarchar(4000)
									,@p_mtn_cre_by = N''	-- nvarchar(250)



ROLLBACK TRANSACTION 