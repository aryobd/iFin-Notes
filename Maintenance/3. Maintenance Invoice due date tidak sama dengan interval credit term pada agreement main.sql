BEGIN TRANSACTION 

-- calculate due date invoice (jika due date invoice tidak sama dengan jarak interval credit term pada agreement main)
-- 

exec dbo.xsp_mtn_invoice_due_date @p_agreement_no = N'' -- agreement no
								  ,@p_invoice_no = N''	-- invoice no
								  ,@p_mtn_remark = N''	-- nvarchar(4000)
								  ,@p_mtn_cre_by = N''	-- nvarchar(250)


ROLLBACK TRANSACTION 

