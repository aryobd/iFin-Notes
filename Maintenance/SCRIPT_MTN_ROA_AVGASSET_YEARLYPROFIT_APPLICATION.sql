exec  IFINOPL.dbo.XSP_MTN_APPLICATION_ROA    @p_application_no = N''        -- NOMOR APPLICATION
                                            ,@p_asset_no = N''              -- JIKA SEMUA ASSET MAKA ISI ALL, JIKA PER ASSET MAKA ISI NO ASSETNY
                                            ,@p_average_asset_amount = null -- AMOUNT AVERAGE ASSET
                                            ,@p_yearly_profit_amount = null -- AMOUNT YEARLY PROFIT
                                            ,@P_ROA_PCT = NULL              -- ROA
                                            ,@P_MTN_REMARK = N''            -- REMARK
                                            ,@P_MTN_CRE_BY = N''            -- CREBY
