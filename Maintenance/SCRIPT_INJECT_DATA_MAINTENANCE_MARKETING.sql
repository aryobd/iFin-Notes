--pengecekan data di tabel MTN_APPLICATION_RENTAL
begin
    select    *
    from    dbo.MTN_APPLICATION_RENTAL --ini table data maintenance
    where    APPLICATION_NO in
    (
        replace('0000264/4/10/11/2023', '/', '.') --,replace('0000264/4/10/11/2023', '/', '.') , replace('0000164/4/10/11/2023', '/', '.') , replace('0000152/4/01/11/2023', '/', '.'), replace('0000165/4/10/11/2023', '/', '.')--, replace('0000127/4/01/11/2023', '/', '.'), replace('0000102/4/01/11/2023', '/', '.'), replace('0000133/4/01/11/2023', '/', '.')
    ) ;

    select    LEASE_ROUNDED_AMOUNT
            ,ASSET_RV_PCT
            ,ASSET_RV_AMOUNT
            ,FA_REFF_NO_01
            ,MARKET_VALUE
            ,*
    from    dbo.APPLICATION_ASSET --ini table data asset
    where    APPLICATION_NO in
    (
        replace('0000264/4/10/11/2023', '/', '.') --,replace('0000161/4/08/11/2023', '/', '.') , replace('0000164/4/10/11/2023', '/', '.') , replace('0000152/4/01/11/2023', '/', '.'), replace('0000165/4/10/11/2023', '/', '.')--replace('0000264/4/10/11/2023', '/', '.'),replace('0000078/4/08/11/2023', '/', '.')--replace('0000264/4/10/11/2023', '/', '.')--,replace('0000099/4/01/11/2023', '/', '.'), replace('0000140/4/34/11/2023', '/', '.'), replace('0000142/4/01/11/2023', '/', '.'), replace('0000126/4/01/11/2023', '/', '.'), replace('0000127/4/01/11/2023', '/', '.'), replace('0000102/4/01/11/2023', '/', '.'), replace('0000133/4/01/11/2023', '/', '.')
    ) ;
end ;

--digunakan untuk update date di tabel MTN_APPLICATION_RENTAL
begin
    begin transaction ;

    select    *
    from    dbo.MTN_APPLICATION_RENTAL
    where    APPLICATION_NO in
    (
        replace('0000264/4/10/11/2023', '/', '.') --,replace('0000264/4/10/11/2023', '/', '.') , replace('0000164/4/10/11/2023', '/', '.') , replace('0000152/4/01/11/2023', '/', '.'), replace('0000165/4/10/11/2023', '/', '.')--, replace('0000127/4/01/11/2023', '/', '.'), replace('0000102/4/01/11/2023', '/', '.'), replace('0000133/4/01/11/2023', '/', '.')
    ) ;

    --digunakan untuk update main_contract_no ke tabel MTN_APPLICATION_RENTAL
    --update dbo.MTN_APPLICATION_RENTAL set MAIN_CONTRACT_NO = '135/WTR-SN/SG-DIPO/V/2022' where APPLICATION_NO = replace('0000166/4/10/11/2023', '/', '.')

    --digunakan untuk update rv_pct & rv_amount ke tabel MTN_APPLICATION_RENTAL
    --update dbo.MTN_APPLICATION_RENTAL set  LEASED_ROUNDED_AMOUNT =    3350000    where APPLICATION_NO = replace('0000264/4/10/11/2023', '/', '.')
    select    *
    from    dbo.MTN_APPLICATION_RENTAL
    where    APPLICATION_NO in
    (
        replace('0000264/4/10/11/2023', '/', '.') --,replace('0000264/4/10/11/2023', '/', '.') , replace('0000164/4/10/11/2023', '/', '.') , replace('0000152/4/01/11/2023', '/', '.'), replace('0000165/4/10/11/2023', '/', '.')--, replace('0000127/4/01/11/2023', '/', '.'), replace('0000102/4/01/11/2023', '/', '.'), replace('0000133/4/01/11/2023', '/', '.')
    ) ;

    rollback transaction ;
end ;

--digunakan untuk insert data ke tabel MTN_APPLICATION_RENTAL
begin
    begin transaction ;

    select    *
    from    dbo.MTN_APPLICATION_RENTAL
    where    APPLICATION_NO in
    (
        replace('0000264/4/10/11/2023', '/', '.') --,replace('0000161/4/08/11/2023', '/', '.') , replace('0000164/4/10/11/2023', '/', '.') , replace('0000152/4/01/11/2023', '/', '.'), replace('0000165/4/10/11/2023', '/', '.')--replace('0000264/4/10/11/2023', '/', '.'),replace('0000078/4/08/11/2023', '/', '.')--replace('0000264/4/10/11/2023', '/', '.')--replace('0000134/4/01/11/2023', '/', '.'),replace('0000099/4/01/11/2023', '/', '.'), replace('0000140/4/34/11/2023', '/', '.'), replace('0000142/4/01/11/2023', '/', '.'), replace('0000126/4/01/11/2023', '/', '.'), replace('0000127/4/01/11/2023', '/', '.'), replace('0000102/4/01/11/2023', '/', '.'), replace('0000133/4/01/11/2023', '/', '.')
    ) ;

    insert into dbo.MTN_APPLICATION_RENTAL
    (
        APPLICATION_NO
        ,SKD_NO
        ,LEASED_ROUNDED_AMOUNT
        ,MAIN_CONTRACT_NO
        ,RV_PCT
        ,RV_AMOUNT
    )
    values
    (
        replace('0000264/4/10/11/2023', '/', '.') ---- APPLICATION_NO - nvarchar(50)
        ,null -- SKD_NO - nvarchar(50)
        ,2950000.00-- LEASED_ROUNDED_AMOUNT - decimal(18, 2)
        ,'000295/OPL-AGR/06/2022' -- MAIN_CONTRACT_NO - nvarchar(50)
        ,66.000000-- RV_PCT - decimal(9, 6)
        ,87410256.78 -- RV_AMOUNT - decimal(18, 2)
    ) ;

    select    *
    from    dbo.MTN_APPLICATION_RENTAL
    where    APPLICATION_NO in
    (
        replace('0000264/4/10/11/2023', '/', '.') --,replace('0000161/4/08/11/2023', '/', '.') , replace('0000164/4/10/11/2023', '/', '.') , replace('0000152/4/01/11/2023', '/', '.'), replace('0000165/4/10/11/2023', '/', '.')--replace('0000264/4/10/11/2023', '/', '.'),replace('0000078/4/08/11/2023', '/', '.')--replace('0000264/4/10/11/2023', '/', '.')--replace('0000134/4/01/11/2023', '/', '.'),replace('0000099/4/01/11/2023', '/', '.'), replace('0000140/4/34/11/2023', '/', '.'), replace('0000142/4/01/11/2023', '/', '.'), replace('0000126/4/01/11/2023', '/', '.'), replace('0000127/4/01/11/2023', '/', '.'), replace('0000102/4/01/11/2023', '/', '.'), replace('0000133/4/01/11/2023', '/', '.')
    ) ;

    rollback transaction ;
end ;

----------------
--digunakan untuk inject ke realization
begin
    select    *
    from    dbo.REALIZATION
    where    AGREEMENT_NO = replace('0000129/4/38/11/2023', '/', '.') ;

    select    *
    from    dbo.REALIZATION
    where    APPLICATION_NO = replace('0000129/4/38/11/2023', '/', '.') ;

    begin transaction ;

    select    *
    from    dbo.MTN_REALIZATION_CONTRACT
    where    REALIZATION_NO = '2001.OPLRLZ.2311.000016' ;

    insert into dbo.MTN_REALIZATION_CONTRACT
    (
        REALIZATION_NO
        ,AGREEMENT_NO
    )
    values
    (
        '2001.OPLRLZ.2311.000016' -- REALIZATION_NO - nvarchar(50)
        ,'0000124/4/38/11/2023' -- AGREEMENT_NO - nvarchar(50)
    ) ;

    select    *
    from    dbo.MTN_REALIZATION_CONTRACT
    where    REALIZATION_NO = '2001.OPLRLZ.2311.000016' ;

    rollback transaction ;
end ;

--digunakan untuk update rv_pct dan rv_amount
begin
    begin transaction ;

    select    LEASE_ROUNDED_AMOUNT
            ,ASSET_RV_PCT
            ,ASSET_RV_AMOUNT
            ,FA_REFF_NO_01
            ,INITIAL_PRICE_AMOUNT
            ,MARKET_VALUE
            ,*
    from    dbo.APPLICATION_ASSET
    where    APPLICATION_NO = replace('0000264/4/10/11/2023', '/', '.') ;

    update    dbo.APPLICATION_ASSET
    set        ASSET_RV_PCT = 58
            ,ASSET_RV_AMOUNT =      250810811     
    where    APPLICATION_NO = replace('0000264/4/10/11/2023', '/', '.') ;

    select    LEASE_ROUNDED_AMOUNT
            ,ASSET_RV_PCT
            ,ASSET_RV_AMOUNT
            ,FA_REFF_NO_01
            ,*
    from    dbo.APPLICATION_ASSET
    where    APPLICATION_NO = replace('0000264/4/10/11/2023', '/', '.') ;

    rollback transaction ;
end ;


--digunakan untuk inject ke table MTN_REALIZATION_CONTRACT
begin
    begin transaction ;

    declare @tempTable table
    (
        agreement_no nvarchar(50)
    ) ;

    insert into @tempTable
    (
        agreement_no
    )
    values
    (
        '0000812/4/10/10/2023'
    )
    ,(
         '0001189/4/08/11/2023'
     )
    ,(
         '0001181/4/08/10/2023'
     )
    ,(
         '0001109/4/08/08/2023'
     )
    ,(
         '0001543/4/01/10/2023'
     )
    ,(
         '0000701/4/10/06/2023'
     )
    ,(
         '0001184/4/08/10/2023'
     ) ;

    select    *
    from    @tempTable
    where    agreement_no not in
            (
                select    AGREEMENT_NO
                from    dbo.MTN_REALIZATION_CONTRACT
            ) ;

    select    *
    from    dbo.REALIZATION
    where    APPLICATION_NO = replace('0000051/4/10/11/2023', '/', '.') ;

    select    *
    from    dbo.REALIZATION
    where    AGREEMENT_NO = replace('0000051/4/10/11/2023', '/', '.') ;

    insert into dbo.MTN_REALIZATION_CONTRACT
    (
        REALIZATION_NO
        ,AGREEMENT_NO
    )
    values
    (
        '2010.OPLRLZ.2311.000012' -- REALIZATION_NO - nvarchar(50)
        ,'0000775/4/10/09/2023' -- AGREEMENT_NO - nvarchar(50)
    ) ;

    rollback transaction ;
end ;



---------------------------- 
-- UPDATE REALIZATION MTN --
---------------------------- 
select a.*
from IFINOPL.dbo.REALIZATION a
where a.APPLICATION_NO = replace('0000168/4/10/11/2023', '/', '.') ;

select a.*
from IFINOPL.dbo.REALIZATION a
Where a.AGREEMENT_NO = replace('0000059/4/10/11/2023', '/', '.') ; --> DARI EXCEL "NOMOR REALISASI DI IFIN"

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
