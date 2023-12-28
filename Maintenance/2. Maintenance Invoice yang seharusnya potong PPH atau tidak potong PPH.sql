BEGIN TRANSACTION
 
-- script invoice potong / tidak potong pph dengan syarat : - pada menu cashier receipt status = NEW / HOLD
--															- nilai billing_amount / nilai ppn amount / nilai pph amount tidak bergerak (tidak berubah)
--															-

/*
PD MENU CASHIER RECEIVED STATUS = NEW/HOLD

*/
 
exec dbo.xsp_mtn_invoice_pph @p_invoice_no					= N''				-- nomor invoice
							 ,@p_is_invoice_deduct_pph		= N''									-- isi 1 jika invoice potong pph | isi 0 jika invoice tidak potong pph
							 ,@p_mtn_remark					= N''	-- perubahan yg terjadi
							 ,@p_mtn_cre_by					= N''							-- PIC maintenance
 
 
ROLLBACK TRANSACTION