BEGIN TRANSACTION

DECLARE @code NVARCHAR(50) = 'K1239.4120037437'

IF EXISTS(SELECT 1 FROM dbo.PAYMENT_REQUEST WHERE PAYMENT_SOURCE_NO = @code AND PAYMENT_STATUS = 'POST') --> TABLE STLH REALISASI
BEGIN
    SELECT 'Data Sudah Dibayarkan, dan harus di cancel proses pembayarannya.'
END
ELSE
BEGIN
    UPDATE dbo.REGISTER_MAIN SET PAYMENT_STATUS = 'HOLD' WHERE CODE = @code
END

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


--SELECT * FROM dbo.PAYMENT_REQUEST WHERE PAYMENT_SOURCE_NO = 'S556.4120036000'
--SELECT * FROM dbo.REGISTER_MAIN WHERE CODE = 'S556.4120036000'

/*
MIGRASI REALISASI BIRO JASA YG SEHRSNYA BLM PAID - TP NAIK JD PAID
QUERY INI BIKIN JD UNPAID LG
*/