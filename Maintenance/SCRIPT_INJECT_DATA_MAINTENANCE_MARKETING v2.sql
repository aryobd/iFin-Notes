-- pengecekan data di tabel MTN_APPLICATION_RENTAL
begin
    select a.*
    from IFINOPL.dbo.MTN_APPLICATION_RENTAL a -- ini table data MAINTENANCE
    where a.APPLICATION_NO = replace('0000146/4/01/11/2023', '/', '.');
    
    select
    a.LEASE_ROUNDED_AMOUNT,
    a.ASSET_RV_PCT,
    a.ASSET_RV_AMOUNT,
    a.FA_REFF_NO_01,
    a.MARKET_VALUE,
    a.*
    from IFINOPL.dbo.APPLICATION_ASSET a -- ini table data ASSET
    where a.APPLICATION_NO = replace('0000146/4/01/11/2023', '/', '.');
end;

-- digunakan untuk update date di tabel MTN_APPLICATION_RENTAL
begin
    select a.*
    from IFINOPL.dbo.MTN_APPLICATION_RENTAL a
    where a.APPLICATION_NO = replace('0000146/4/01/11/2023', '/', '.');
    
    begin transaction; -- begin tran;
    
    -- digunakan untuk update main_contract_no ke tabel MTN_APPLICATION_RENTAL
    /*
    update IFINOPL.dbo.MTN_APPLICATION_RENTAL
    set
    MAIN_CONTRACT_NO = '135/WTR-SN/SG-DIPO/V/2022'
    where APPLICATION_NO = replace('0000166/4/10/11/2023', '/', '.');
    */
    
    -- digunakan untuk update RV_PCT & RV_AMOUNT ke tabel MTN_APPLICATION_RENTAL
    /*
    update IFINOPL.dbo.MTN_APPLICATION_RENTAL
    set
    LEASED_ROUNDED_AMOUNT = 3350000
    where APPLICATION_NO = replace('0000146/4/01/11/2023', '/', '.');
    */
    
    select a.*
    from IFINOPL.dbo.MTN_APPLICATION_RENTAL a
    where a.APPLICATION_NO = replace('0000146/4/01/11/2023', '/', '.');
    
    rollback transaction; -- rollback tran;
    -- commit transaction; -- commit tran;
end;

-- digunakan untuk insert data ke tabel MTN_APPLICATION_RENTAL
begin
    select a.*
    from IFINOPL.dbo.MTN_APPLICATION_RENTAL a
    where a.APPLICATION_NO = replace('0000146/4/01/11/2023', '/', '.');

    begin transaction; -- begin tran;
    
    insert into IFINOPL.dbo.MTN_APPLICATION_RENTAL
    (
        APPLICATION_NO,
        SKD_NO,
        LEASED_ROUNDED_AMOUNT,
        MAIN_CONTRACT_NO,
        RV_PCT,
        RV_AMOUNT
    )
    values
    (
        replace('0000146/4/01/11/2023', '/', '.'), ---- APPLICATION_NO - nvarchar(50)
        null, -- SKD_NO - nvarchar(50)
        2950000.00, -- LEASED_ROUNDED_AMOUNT - decimal(18, 2) --> EXCEL "HARGA SEWA PER UNIT"
        '000295/OPL-AGR/06/2022', -- MAIN_CONTRACT_NO - nvarchar(50) --> EXCEL "NO KONTRAK INDUK"
        66.000000, -- RV_PCT - decimal(9, 6)
        87410256.78 -- RV_AMOUNT - decimal(18, 2)
    );

    select a.*
    from IFINOPL.dbo.MTN_APPLICATION_RENTAL a
    where a.APPLICATION_NO = replace('0000146/4/01/11/2023', '/', '.');

    rollback transaction; -- rollback tran;
    -- commit transaction; -- commit tran;
end;

----------------
-- digunakan untuk inject ke REALIZATION
begin
    select a.*
    from IFINOPL.dbo.REALIZATION a
    where a.AGREEMENT_NO = replace('0000166/4/10/11/2023', '/', '.');
    
    select a.*
    from IFINOPL.dbo.REALIZATION a
    where a.APPLICATION_NO = replace('0000166/4/10/11/2023', '/', '.');
    
    select a.*
    from IFINOPL.dbo.MTN_REALIZATION_CONTRACT a
    where a.REALIZATION_NO = '2001.OPLRLZ.2311.000016';
    
    begin transaction; -- begin tran;
    
    insert into IFINOPL.dbo.MTN_REALIZATION_CONTRACT
    (
        REALIZATION_NO,
        AGREEMENT_NO
    )
    values
    (
        '2001.OPLRLZ.2311.000016', -- REALIZATION_NO - nvarchar(50)
        '0000124/4/38/11/2023' -- AGREEMENT_NO - nvarchar(50) --> EXCEL "NO KONTRAK PELAKSANA" --> JIKA NULL JANGAN DI-INSERT...!!!
    );
    
    select a.*
    from IFINOPL.dbo.MTN_REALIZATION_CONTRACT a
    where a.REALIZATION_NO = '2001.OPLRLZ.2311.000016';
    
    rollback transaction; -- rollback tran;
    -- commit transaction; -- commit tran;
end;

-- CHECK --
select
a.APPLICATION_NO, a.CODE,
b.REALIZATION_NO, b.AGREEMENT_NO
from IFINOPL.dbo.REALIZATION a
join IFINOPL.dbo.MTN_REALIZATION_CONTRACT b
on a.CODE = b.REALIZATION_NO
where a.APPLICATION_NO = replace('0000166/4/10/11/2023', '/', '.');


-- digunakan untuk update RV_PCT dan RV_AMOUNT
begin
    select
    a.LEASE_ROUNDED_AMOUNT,
    a.ASSET_RV_PCT,
    a.ASSET_RV_AMOUNT,
    a.FA_REFF_NO_01,
    a.INITIAL_PRICE_AMOUNT,
    a.MARKET_VALUE,
    a.*
    from IFINOPL.dbo.APPLICATION_ASSET a
    where a.APPLICATION_NO = replace('0000146/4/01/11/2023', '/', '.');
    
    begin transaction; -- begin tran;
    
    update IFINOPL.dbo.APPLICATION_ASSET
    set
    ASSET_RV_PCT = 58,
    ASSET_RV_AMOUNT = 250810811     
    where APPLICATION_NO = replace('0000146/4/01/11/2023', '/', '.');
    
    select
    a.LEASE_ROUNDED_AMOUNT,
    a.ASSET_RV_PCT,
    a.ASSET_RV_AMOUNT,
    a.FA_REFF_NO_01,
    a.INITIAL_PRICE_AMOUNT,
    a.MARKET_VALUE,
    a.*
    from IFINOPL.dbo.APPLICATION_ASSET a
    where a.APPLICATION_NO = replace('0000146/4/01/11/2023', '/', '.');
    
    rollback transaction; -- rollback tran;
    --commit transaction; -- commit tran;
end;

-- digunakan untuk inject ke table MTN_REALIZATION_CONTRACT
begin
    begin transaction;
    
    declare @tempTable table
    (
        agreement_no nvarchar(50)
    );
    
    insert into @tempTable
    ( agreement_no )
    values
    ( '0000812/4/10/10/2023' ),
    ( '0001189/4/08/11/2023' ),
    ( '0001181/4/08/10/2023' ),
    ( '0001109/4/08/08/2023' ),
    ( '0001543/4/01/10/2023' ),
    ( '0000701/4/10/06/2023' ),
    ( '0001184/4/08/10/2023' );
    
    select a.*
    from @tempTable a
    where a.agreement_no not in
    (
        select b.AGREEMENT_NO
        from IFINOPL.dbo.MTN_REALIZATION_CONTRACT b
    );
    
    select a.*
    from IFINOPL.dbo.REALIZATION a
    where a.APPLICATION_NO = replace('0000051/4/10/11/2023', '/', '.');
    
    select a.*
    from IFINOPL.dbo.REALIZATION a
    where a.AGREEMENT_NO = replace('0000051/4/10/11/2023', '/', '.');
    
    insert into IFINOPL.dbo.MTN_REALIZATION_CONTRACT
    (
        REALIZATION_NO,
        AGREEMENT_NO
    )
    values
    (
        '2010.OPLRLZ.2311.000012', -- REALIZATION_NO - nvarchar(50)
        '0000775/4/10/09/2023' -- AGREEMENT_NO - nvarchar(50)
    );
    
    rollback transaction; -- rollback tran;
end;



---------------------------- 
-- UPDATE REALIZATION MTN --
---------------------------- 
select a.*
from IFINOPL.dbo.REALIZATION a
where a.APPLICATION_NO = replace('0000166/4/10/11/2023', '/', '.');

select a.*
from IFINOPL.dbo.REALIZATION a
Where a.AGREEMENT_NO = replace('0000166/4/10/11/2023', '/', '.'); --> DARI EXCEL "NOMOR REALISASI DI IFIN"

/*
begin transaction

select a.*
from IFINOPL.dbo.MTN_REALIZATION_CONTRACT a
where a.REALIZATION_NO = '2010.OPLRLZ.2311.000014'--'2010.OPLRLZ.2311.000014';

update IFINOPL.dbo.MTN_REALIZATION_CONTRACT
set
AGREEMENT_NO = '0000059/4/10/11/2023'
where REALIZATION_NO = '2010.OPLRLZ.2311.000014';

select a.*
from IFINOPL.dbo.MTN_REALIZATION_CONTRACT a
where a.REALIZATION_NO = '2010.OPLRLZ.2311.000014';

-- rollback transaction;
-- commit transaction;
*/




------------
-- UPDATE --
------------
begin
    select top 3
    a.LEASE_ROUNDED_AMOUNT, a.ASSET_RV_PCT, a.ASSET_RV_AMOUNT, a.*
    from IFINOPL.dbo.APPLICATION_ASSET a
    where a.APPLICATION_NO = replace('0000407/4/08/12/2023', '/', '.');
    
    select top 3
    a.BILLING_AMOUNT, a.*
    from IFINOPL.dbo.APPLICATION_AMORTIZATION a
    where a.APPLICATION_NO = replace('0000407/4/08/12/2023', '/', '.')
    order by a.ASSET_NO, a.BILLING_DATE;
    
    begin tran;
    
    --update IFINOPL.dbo.APPLICATION_ASSET
    --set
    --LEASE_ROUNDED_AMOUNT = 6780000 -- 2950000.00
    --where APPLICATION_NO = replace('0000407/4/08/12/2023', '/', '.');
    
    --update IFINOPL.dbo.APPLICATION_AMORTIZATION
    --set
    --BILLING_AMOUNT = 6780000 -- 2950000.00
    --where APPLICATION_NO = replace('0000407/4/08/12/2023', '/', '.')
    
    select top 3
    a.LEASE_ROUNDED_AMOUNT, a.ASSET_RV_PCT, a.ASSET_RV_AMOUNT, a.*
    from IFINOPL.dbo.APPLICATION_ASSET a
    where a.APPLICATION_NO = replace('0000407/4/08/12/2023', '/', '.');
    
    select top 3
    a.BILLING_AMOUNT, a.*
    from IFINOPL.dbo.APPLICATION_AMORTIZATION a
    where a.APPLICATION_NO = replace('0000407/4/08/12/2023', '/', '.')
    order by a.ASSET_NO, a.BILLING_DATE;
    
    rollback tran;
end;
