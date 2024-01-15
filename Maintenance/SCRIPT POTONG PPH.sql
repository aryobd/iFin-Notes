BEGIN TRANSACTION
 
-- script invoice potong / tidak potong pph dengan syarat : - pada menu cashier receipt status = NEW / HOLD
--															- nilai billing_amount / nilai ppn amount / nilai pph amount tidak bergerak (tidak berubah)
--															-

/*
PD MENU CASHIER RECEIVED STATUS = NEW/HOLD

*/
 
exec dbo.xsp_mtn_invoice_pph @p_invoice_no					= N'01744/INV/2038/11/2023'				-- nomor invoice
							 ,@p_is_invoice_deduct_pph		= N'0'									-- isi 1 jika invoice potong pph | isi 0 jika invoice tidak potong pph
							 ,@p_mtn_remark					= N'Issue #1717'	-- perubahan yg terjadi
							 ,@p_mtn_cre_by					= N'Aryo Budi D.P.'							-- PIC maintenance

  
ROLLBACK TRANSACTION

-- STLH COMMIT KIRA2 10 DETIK DATA AKAN DIPROSES OLEH JOB & BISA DICEK DI TABLE BERIKUT:

select top 10 a.*
from IFINFIN.dbo.CASHIER_RECEIVED_REQUEST a
where a.INVOICE_NO = replace('01744/INV/2038/11/2023', '/', '.')