from ccxt.base.types import Entry


@value
struct ImplicitAPI:
    var sapi_get_copytrading_futures_userstatus: Entry
    var sapi_get_copytrading_futures_leadsymbol: Entry
    var sapi_get_system_status: Entry
    var sapi_get_accountsnapshot: Entry
    var sapi_get_account_info: Entry
    var sapi_get_margin_asset: Entry
    var sapi_get_margin_pair: Entry
    var sapi_get_margin_allassets: Entry
    var sapi_get_margin_allpairs: Entry
    var sapi_get_margin_priceindex: Entry
    var sapi_get_spot_delist_schedule: Entry
    var sapi_get_asset_assetdividend: Entry
    var sapi_get_asset_dribblet: Entry
    var sapi_get_asset_transfer: Entry
    var sapi_get_asset_assetdetail: Entry
    var sapi_get_asset_tradefee: Entry
    var sapi_get_asset_ledger_transfer_cloud_mining_querybypage: Entry
    var sapi_get_asset_convert_transfer_querybypage: Entry
    var sapi_get_asset_wallet_balance: Entry
    var sapi_get_asset_custody_transfer_history: Entry
    var sapi_get_margin_borrow_repay: Entry
    var sapi_get_margin_loan: Entry
    var sapi_get_margin_repay: Entry
    var sapi_get_margin_account: Entry
    var sapi_get_margin_transfer: Entry
    var sapi_get_margin_interesthistory: Entry
    var sapi_get_margin_forceliquidationrec: Entry
    var sapi_get_margin_order: Entry
    var sapi_get_margin_openorders: Entry
    var sapi_get_margin_allorders: Entry
    var sapi_get_margin_mytrades: Entry
    var sapi_get_margin_maxborrowable: Entry
    var sapi_get_margin_maxtransferable: Entry
    var sapi_get_margin_tradecoeff: Entry
    var sapi_get_margin_isolated_transfer: Entry
    var sapi_get_margin_isolated_account: Entry
    var sapi_get_margin_isolated_pair: Entry
    var sapi_get_margin_isolated_allpairs: Entry
    var sapi_get_margin_isolated_accountlimit: Entry
    var sapi_get_margin_interestratehistory: Entry
    var sapi_get_margin_orderlist: Entry
    var sapi_get_margin_allorderlist: Entry
    var sapi_get_margin_openorderlist: Entry
    var sapi_get_margin_crossmargindata: Entry
    var sapi_get_margin_isolatedmargindata: Entry
    var sapi_get_margin_isolatedmargintier: Entry
    var sapi_get_margin_ratelimit_order: Entry
    var sapi_get_margin_dribblet: Entry
    var sapi_get_margin_dust: Entry
    var sapi_get_margin_crossmargincollateralratio: Entry
    var sapi_get_margin_exchange_small_liability: Entry
    var sapi_get_margin_exchange_small_liability_history: Entry
    var sapi_get_margin_next_hourly_interest_rate: Entry
    var sapi_get_margin_capital_flow: Entry
    var sapi_get_margin_delist_schedule: Entry
    var sapi_get_margin_available_inventory: Entry
    var sapi_get_margin_leveragebracket: Entry
    var sapi_get_loan_vip_loanable_data: Entry
    var sapi_get_loan_vip_collateral_data: Entry
    var sapi_get_loan_vip_request_data: Entry
    var sapi_get_loan_vip_request_interestrate: Entry
    var sapi_get_loan_income: Entry
    var sapi_get_loan_ongoing_orders: Entry
    var sapi_get_loan_ltv_adjustment_history: Entry
    var sapi_get_loan_borrow_history: Entry
    var sapi_get_loan_repay_history: Entry
    var sapi_get_loan_loanable_data: Entry
    var sapi_get_loan_collateral_data: Entry
    var sapi_get_loan_repay_collateral_rate: Entry
    var sapi_get_loan_flexible_ongoing_orders: Entry
    var sapi_get_loan_flexible_borrow_history: Entry
    var sapi_get_loan_flexible_repay_history: Entry
    var sapi_get_loan_flexible_ltv_adjustment_history: Entry
    var sapi_get_loan_vip_ongoing_orders: Entry
    var sapi_get_loan_vip_repay_history: Entry
    var sapi_get_loan_vip_collateral_account: Entry
    var sapi_get_fiat_orders: Entry
    var sapi_get_fiat_payments: Entry
    var sapi_get_futures_transfer: Entry
    var sapi_get_futures_histdatalink: Entry
    var sapi_get_rebate_taxquery: Entry
    var sapi_get_capital_config_getall: Entry
    var sapi_get_capital_deposit_address: Entry
    var sapi_get_capital_deposit_address_list: Entry
    var sapi_get_capital_deposit_hisrec: Entry
    var sapi_get_capital_deposit_subaddress: Entry
    var sapi_get_capital_deposit_subhisrec: Entry
    var sapi_get_capital_withdraw_history: Entry
    var sapi_get_capital_withdraw_address_list: Entry
    var sapi_get_capital_contract_convertible_coins: Entry
    var sapi_get_convert_tradeflow: Entry
    var sapi_get_convert_exchangeinfo: Entry
    var sapi_get_convert_assetinfo: Entry
    var sapi_get_convert_orderstatus: Entry
    var sapi_get_convert_limit_queryopenorders: Entry
    var sapi_get_account_status: Entry
    var sapi_get_account_apitradingstatus: Entry
    var sapi_get_account_apirestrictions_iprestriction: Entry
    var sapi_get_bnbburn: Entry
    var sapi_get_sub_account_futures_account: Entry
    var sapi_get_sub_account_futures_accountsummary: Entry
    var sapi_get_sub_account_futures_positionrisk: Entry
    var sapi_get_sub_account_futures_internaltransfer: Entry
    var sapi_get_sub_account_list: Entry
    var sapi_get_sub_account_margin_account: Entry
    var sapi_get_sub_account_margin_accountsummary: Entry
    var sapi_get_sub_account_spotsummary: Entry
    var sapi_get_sub_account_status: Entry
    var sapi_get_sub_account_sub_transfer_history: Entry
    var sapi_get_sub_account_transfer_subuserhistory: Entry
    var sapi_get_sub_account_universaltransfer: Entry
    var sapi_get_sub_account_apirestrictions_iprestriction_thirdpartylist: Entry
    var sapi_get_sub_account_transaction_statistics: Entry
    var sapi_get_sub_account_subaccountapi_iprestriction: Entry
    var sapi_get_managed_subaccount_asset: Entry
    var sapi_get_managed_subaccount_accountsnapshot: Entry
    var sapi_get_managed_subaccount_querytranslogforinvestor: Entry
    var sapi_get_managed_subaccount_querytranslogfortradeparent: Entry
    var sapi_get_managed_subaccount_fetch_future_asset: Entry
    var sapi_get_managed_subaccount_marginasset: Entry
    var sapi_get_managed_subaccount_info: Entry
    var sapi_get_managed_subaccount_deposit_address: Entry
    var sapi_get_managed_subaccount_query_trans_log: Entry
    var sapi_get_lending_daily_product_list: Entry
    var sapi_get_lending_daily_userleftquota: Entry
    var sapi_get_lending_daily_userredemptionquota: Entry
    var sapi_get_lending_daily_token_position: Entry
    var sapi_get_lending_union_account: Entry
    var sapi_get_lending_union_purchaserecord: Entry
    var sapi_get_lending_union_redemptionrecord: Entry
    var sapi_get_lending_union_interesthistory: Entry
    var sapi_get_lending_project_list: Entry
    var sapi_get_lending_project_position_list: Entry
    var sapi_get_eth_staking_eth_history_stakinghistory: Entry
    var sapi_get_eth_staking_eth_history_redemptionhistory: Entry
    var sapi_get_eth_staking_eth_history_rewardshistory: Entry
    var sapi_get_eth_staking_eth_quota: Entry
    var sapi_get_eth_staking_eth_history_ratehistory: Entry
    var sapi_get_eth_staking_account: Entry
    var sapi_get_eth_staking_wbeth_history_wraphistory: Entry
    var sapi_get_eth_staking_wbeth_history_unwraphistory: Entry
    var sapi_get_eth_staking_eth_history_wbethrewardshistory: Entry
    var sapi_get_sol_staking_sol_history_stakinghistory: Entry
    var sapi_get_sol_staking_sol_history_redemptionhistory: Entry
    var sapi_get_sol_staking_sol_history_bnsolrewardshistory: Entry
    var sapi_get_sol_staking_sol_history_ratehistory: Entry
    var sapi_get_sol_staking_account: Entry
    var sapi_get_sol_staking_sol_quota: Entry
    var sapi_get_mining_pub_algolist: Entry
    var sapi_get_mining_pub_coinlist: Entry
    var sapi_get_mining_worker_detail: Entry
    var sapi_get_mining_worker_list: Entry
    var sapi_get_mining_payment_list: Entry
    var sapi_get_mining_statistics_user_status: Entry
    var sapi_get_mining_statistics_user_list: Entry
    var sapi_get_mining_payment_uid: Entry
    var sapi_get_bswap_pools: Entry
    var sapi_get_bswap_liquidity: Entry
    var sapi_get_bswap_liquidityops: Entry
    var sapi_get_bswap_quote: Entry
    var sapi_get_bswap_swap: Entry
    var sapi_get_bswap_poolconfigure: Entry
    var sapi_get_bswap_addliquiditypreview: Entry
    var sapi_get_bswap_removeliquiditypreview: Entry
    var sapi_get_bswap_unclaimedrewards: Entry
    var sapi_get_bswap_claimedhistory: Entry
    var sapi_get_blvt_tokeninfo: Entry
    var sapi_get_blvt_subscribe_record: Entry
    var sapi_get_blvt_redeem_record: Entry
    var sapi_get_blvt_userlimit: Entry
    var sapi_get_apireferral_ifnewuser: Entry
    var sapi_get_apireferral_customization: Entry
    var sapi_get_apireferral_usercustomization: Entry
    var sapi_get_apireferral_rebate_recentrecord: Entry
    var sapi_get_apireferral_rebate_historicalrecord: Entry
    var sapi_get_apireferral_kickback_recentrecord: Entry
    var sapi_get_apireferral_kickback_historicalrecord: Entry
    var sapi_get_broker_subaccountapi: Entry
    var sapi_get_broker_subaccount: Entry
    var sapi_get_broker_subaccountapi_commission_futures: Entry
    var sapi_get_broker_subaccountapi_commission_coinfutures: Entry
    var sapi_get_broker_info: Entry
    var sapi_get_broker_transfer: Entry
    var sapi_get_broker_transfer_futures: Entry
    var sapi_get_broker_rebate_recentrecord: Entry
    var sapi_get_broker_rebate_historicalrecord: Entry
    var sapi_get_broker_subaccount_bnbburn_status: Entry
    var sapi_get_broker_subaccount_deposithist: Entry
    var sapi_get_broker_subaccount_spotsummary: Entry
    var sapi_get_broker_subaccount_marginsummary: Entry
    var sapi_get_broker_subaccount_futuressummary: Entry
    var sapi_get_broker_rebate_futures_recentrecord: Entry
    var sapi_get_broker_subaccountapi_iprestriction: Entry
    var sapi_get_broker_universaltransfer: Entry
    var sapi_get_account_apirestrictions: Entry
    var sapi_get_c2c_ordermatch_listuserorderhistory: Entry
    var sapi_get_nft_history_transactions: Entry
    var sapi_get_nft_history_deposit: Entry
    var sapi_get_nft_history_withdraw: Entry
    var sapi_get_nft_user_getasset: Entry
    var sapi_get_pay_transactions: Entry
    var sapi_get_giftcard_verify: Entry
    var sapi_get_giftcard_cryptography_rsa_public_key: Entry
    var sapi_get_giftcard_buycode_token_limit: Entry
    var sapi_get_algo_spot_openorders: Entry
    var sapi_get_algo_spot_historicalorders: Entry
    var sapi_get_algo_spot_suborders: Entry
    var sapi_get_algo_futures_openorders: Entry
    var sapi_get_algo_futures_historicalorders: Entry
    var sapi_get_algo_futures_suborders: Entry
    var sapi_get_portfolio_account: Entry
    var sapi_get_portfolio_collateralrate: Entry
    var sapi_get_portfolio_pmloan: Entry
    var sapi_get_portfolio_interest_history: Entry
    var sapi_get_portfolio_asset_index_price: Entry
    var sapi_get_portfolio_repay_futures_switch: Entry
    var sapi_get_portfolio_margin_asset_leverage: Entry
    var sapi_get_portfolio_balance: Entry
    var sapi_get_staking_productlist: Entry
    var sapi_get_staking_position: Entry
    var sapi_get_staking_stakingrecord: Entry
    var sapi_get_staking_personalleftquota: Entry
    var sapi_get_lending_auto_invest_target_asset_list: Entry
    var sapi_get_lending_auto_invest_target_asset_roi_list: Entry
    var sapi_get_lending_auto_invest_all_asset: Entry
    var sapi_get_lending_auto_invest_source_asset_list: Entry
    var sapi_get_lending_auto_invest_plan_list: Entry
    var sapi_get_lending_auto_invest_plan_id: Entry
    var sapi_get_lending_auto_invest_history_list: Entry
    var sapi_get_lending_auto_invest_index_info: Entry
    var sapi_get_lending_auto_invest_index_user_summary: Entry
    var sapi_get_lending_auto_invest_one_off_status: Entry
    var sapi_get_lending_auto_invest_redeem_history: Entry
    var sapi_get_lending_auto_invest_rebalance_history: Entry
    var sapi_get_simple_earn_flexible_list: Entry
    var sapi_get_simple_earn_locked_list: Entry
    var sapi_get_simple_earn_flexible_personalleftquota: Entry
    var sapi_get_simple_earn_locked_personalleftquota: Entry
    var sapi_get_simple_earn_flexible_subscriptionpreview: Entry
    var sapi_get_simple_earn_locked_subscriptionpreview: Entry
    var sapi_get_simple_earn_flexible_history_ratehistory: Entry
    var sapi_get_simple_earn_flexible_position: Entry
    var sapi_get_simple_earn_locked_position: Entry
    var sapi_get_simple_earn_account: Entry
    var sapi_get_simple_earn_flexible_history_subscriptionrecord: Entry
    var sapi_get_simple_earn_locked_history_subscriptionrecord: Entry
    var sapi_get_simple_earn_flexible_history_redemptionrecord: Entry
    var sapi_get_simple_earn_locked_history_redemptionrecord: Entry
    var sapi_get_simple_earn_flexible_history_rewardsrecord: Entry
    var sapi_get_simple_earn_locked_history_rewardsrecord: Entry
    var sapi_get_simple_earn_flexible_history_collateralrecord: Entry
    var sapi_get_dci_product_list: Entry
    var sapi_get_dci_product_positions: Entry
    var sapi_get_dci_product_accounts: Entry
    var sapi_post_asset_dust: Entry
    var sapi_post_asset_dust_btc: Entry
    var sapi_post_asset_transfer: Entry
    var sapi_post_asset_get_funding_asset: Entry
    var sapi_post_asset_convert_transfer: Entry
    var sapi_post_account_disablefastwithdrawswitch: Entry
    var sapi_post_account_enablefastwithdrawswitch: Entry
    var sapi_post_capital_withdraw_apply: Entry
    var sapi_post_capital_contract_convertible_coins: Entry
    var sapi_post_capital_deposit_credit_apply: Entry
    var sapi_post_margin_borrow_repay: Entry
    var sapi_post_margin_transfer: Entry
    var sapi_post_margin_loan: Entry
    var sapi_post_margin_repay: Entry
    var sapi_post_margin_order: Entry
    var sapi_post_margin_order_oco: Entry
    var sapi_post_margin_dust: Entry
    var sapi_post_margin_exchange_small_liability: Entry
    var sapi_post_margin_isolated_transfer: Entry
    var sapi_post_margin_isolated_account: Entry
    var sapi_post_margin_max_leverage: Entry
    var sapi_post_bnbburn: Entry
    var sapi_post_sub_account_virtualsubaccount: Entry
    var sapi_post_sub_account_margin_transfer: Entry
    var sapi_post_sub_account_margin_enable: Entry
    var sapi_post_sub_account_futures_enable: Entry
    var sapi_post_sub_account_futures_transfer: Entry
    var sapi_post_sub_account_futures_internaltransfer: Entry
    var sapi_post_sub_account_transfer_subtosub: Entry
    var sapi_post_sub_account_transfer_subtomaster: Entry
    var sapi_post_sub_account_universaltransfer: Entry
    var sapi_post_sub_account_options_enable: Entry
    var sapi_post_managed_subaccount_deposit: Entry
    var sapi_post_managed_subaccount_withdraw: Entry
    var sapi_post_userdatastream: Entry
    var sapi_post_userdatastream_isolated: Entry
    var sapi_post_futures_transfer: Entry
    var sapi_post_lending_customizedfixed_purchase: Entry
    var sapi_post_lending_daily_purchase: Entry
    var sapi_post_lending_daily_redeem: Entry
    var sapi_post_bswap_liquidityadd: Entry
    var sapi_post_bswap_liquidityremove: Entry
    var sapi_post_bswap_swap: Entry
    var sapi_post_bswap_claimrewards: Entry
    var sapi_post_blvt_subscribe: Entry
    var sapi_post_blvt_redeem: Entry
    var sapi_post_apireferral_customization: Entry
    var sapi_post_apireferral_usercustomization: Entry
    var sapi_post_apireferral_rebate_historicalrecord: Entry
    var sapi_post_apireferral_kickback_historicalrecord: Entry
    var sapi_post_broker_subaccount: Entry
    var sapi_post_broker_subaccount_margin: Entry
    var sapi_post_broker_subaccount_futures: Entry
    var sapi_post_broker_subaccountapi: Entry
    var sapi_post_broker_subaccountapi_permission: Entry
    var sapi_post_broker_subaccountapi_commission: Entry
    var sapi_post_broker_subaccountapi_commission_futures: Entry
    var sapi_post_broker_subaccountapi_commission_coinfutures: Entry
    var sapi_post_broker_transfer: Entry
    var sapi_post_broker_transfer_futures: Entry
    var sapi_post_broker_rebate_historicalrecord: Entry
    var sapi_post_broker_subaccount_bnbburn_spot: Entry
    var sapi_post_broker_subaccount_bnbburn_margininterest: Entry
    var sapi_post_broker_subaccount_blvt: Entry
    var sapi_post_broker_subaccountapi_iprestriction: Entry
    var sapi_post_broker_subaccountapi_iprestriction_iplist: Entry
    var sapi_post_broker_universaltransfer: Entry
    var sapi_post_broker_subaccountapi_permission_universaltransfer: Entry
    var sapi_post_broker_subaccountapi_permission_vanillaoptions: Entry
    var sapi_post_giftcard_createcode: Entry
    var sapi_post_giftcard_redeemcode: Entry
    var sapi_post_giftcard_buycode: Entry
    var sapi_post_algo_spot_newordertwap: Entry
    var sapi_post_algo_futures_newordervp: Entry
    var sapi_post_algo_futures_newordertwap: Entry
    var sapi_post_staking_purchase: Entry
    var sapi_post_staking_redeem: Entry
    var sapi_post_staking_setautostaking: Entry
    var sapi_post_eth_staking_eth_stake: Entry
    var sapi_post_eth_staking_eth_redeem: Entry
    var sapi_post_eth_staking_wbeth_wrap: Entry
    var sapi_post_sol_staking_sol_stake: Entry
    var sapi_post_sol_staking_sol_redeem: Entry
    var sapi_post_mining_hash_transfer_config: Entry
    var sapi_post_mining_hash_transfer_config_cancel: Entry
    var sapi_post_portfolio_repay: Entry
    var sapi_post_loan_vip_renew: Entry
    var sapi_post_loan_vip_borrow: Entry
    var sapi_post_loan_borrow: Entry
    var sapi_post_loan_repay: Entry
    var sapi_post_loan_adjust_ltv: Entry
    var sapi_post_loan_customize_margin_call: Entry
    var sapi_post_loan_flexible_repay: Entry
    var sapi_post_loan_flexible_adjust_ltv: Entry
    var sapi_post_loan_vip_repay: Entry
    var sapi_post_convert_getquote: Entry
    var sapi_post_convert_acceptquote: Entry
    var sapi_post_convert_limit_placeorder: Entry
    var sapi_post_convert_limit_cancelorder: Entry
    var sapi_post_portfolio_auto_collection: Entry
    var sapi_post_portfolio_asset_collection: Entry
    var sapi_post_portfolio_bnb_transfer: Entry
    var sapi_post_portfolio_repay_futures_switch: Entry
    var sapi_post_portfolio_repay_futures_negative_balance: Entry
    var sapi_post_lending_auto_invest_plan_add: Entry
    var sapi_post_lending_auto_invest_plan_edit: Entry
    var sapi_post_lending_auto_invest_plan_edit_status: Entry
    var sapi_post_lending_auto_invest_one_off: Entry
    var sapi_post_lending_auto_invest_redeem: Entry
    var sapi_post_simple_earn_flexible_subscribe: Entry
    var sapi_post_simple_earn_locked_subscribe: Entry
    var sapi_post_simple_earn_flexible_redeem: Entry
    var sapi_post_simple_earn_locked_redeem: Entry
    var sapi_post_simple_earn_flexible_setautosubscribe: Entry
    var sapi_post_simple_earn_locked_setautosubscribe: Entry
    var sapi_post_simple_earn_locked_setredeemoption: Entry
    var sapi_post_dci_product_subscribe: Entry
    var sapi_post_dci_product_auto_compound_edit: Entry
    var sapi_put_userdatastream: Entry
    var sapi_put_userdatastream_isolated: Entry
    var sapi_delete_margin_openorders: Entry
    var sapi_delete_margin_order: Entry
    var sapi_delete_margin_orderlist: Entry
    var sapi_delete_margin_isolated_account: Entry
    var sapi_delete_userdatastream: Entry
    var sapi_delete_userdatastream_isolated: Entry
    var sapi_delete_broker_subaccountapi: Entry
    var sapi_delete_broker_subaccountapi_iprestriction_iplist: Entry
    var sapi_delete_algo_spot_order: Entry
    var sapi_delete_algo_futures_order: Entry
    var sapi_delete_sub_account_subaccountapi_iprestriction_iplist: Entry
    var sapiv2_get_eth_staking_account: Entry
    var sapiv2_get_sub_account_futures_account: Entry
    var sapiv2_get_sub_account_futures_accountsummary: Entry
    var sapiv2_get_sub_account_futures_positionrisk: Entry
    var sapiv2_get_loan_flexible_ongoing_orders: Entry
    var sapiv2_get_loan_flexible_borrow_history: Entry
    var sapiv2_get_loan_flexible_repay_history: Entry
    var sapiv2_get_loan_flexible_ltv_adjustment_history: Entry
    var sapiv2_get_loan_flexible_loanable_data: Entry
    var sapiv2_get_loan_flexible_collateral_data: Entry
    var sapiv2_get_portfolio_account: Entry
    var sapiv2_post_eth_staking_eth_stake: Entry
    var sapiv2_post_sub_account_subaccountapi_iprestriction: Entry
    var sapiv2_post_loan_flexible_borrow: Entry
    var sapiv2_post_loan_flexible_repay: Entry
    var sapiv2_post_loan_flexible_adjust_ltv: Entry
    var sapiv3_get_sub_account_assets: Entry
    var sapiv3_post_asset_getuserasset: Entry
    var sapiv4_get_sub_account_assets: Entry
    var dapipublic_get_ping: Entry
    var dapipublic_get_time: Entry
    var dapipublic_get_exchangeinfo: Entry
    var dapipublic_get_depth: Entry
    var dapipublic_get_trades: Entry
    var dapipublic_get_historicaltrades: Entry
    var dapipublic_get_aggtrades: Entry
    var dapipublic_get_premiumindex: Entry
    var dapipublic_get_fundingrate: Entry
    var dapipublic_get_klines: Entry
    var dapipublic_get_continuousklines: Entry
    var dapipublic_get_indexpriceklines: Entry
    var dapipublic_get_markpriceklines: Entry
    var dapipublic_get_premiumindexklines: Entry
    var dapipublic_get_ticker_24hr: Entry
    var dapipublic_get_ticker_price: Entry
    var dapipublic_get_ticker_bookticker: Entry
    var dapipublic_get_constituents: Entry
    var dapipublic_get_openinterest: Entry
    var dapipublic_get_fundinginfo: Entry
    var dapidata_get_delivery_price: Entry
    var dapidata_get_openinteresthist: Entry
    var dapidata_get_toplongshortaccountratio: Entry
    var dapidata_get_toplongshortpositionratio: Entry
    var dapidata_get_globallongshortaccountratio: Entry
    var dapidata_get_takerbuysellvol: Entry
    var dapidata_get_basis: Entry
    var dapiprivate_get_positionside_dual: Entry
    var dapiprivate_get_orderamendment: Entry
    var dapiprivate_get_order: Entry
    var dapiprivate_get_openorder: Entry
    var dapiprivate_get_openorders: Entry
    var dapiprivate_get_allorders: Entry
    var dapiprivate_get_balance: Entry
    var dapiprivate_get_account: Entry
    var dapiprivate_get_positionmargin_history: Entry
    var dapiprivate_get_positionrisk: Entry
    var dapiprivate_get_usertrades: Entry
    var dapiprivate_get_income: Entry
    var dapiprivate_get_leveragebracket: Entry
    var dapiprivate_get_forceorders: Entry
    var dapiprivate_get_adlquantile: Entry
    var dapiprivate_get_commissionrate: Entry
    var dapiprivate_get_income_asyn: Entry
    var dapiprivate_get_income_asyn_id: Entry
    var dapiprivate_get_trade_asyn: Entry
    var dapiprivate_get_trade_asyn_id: Entry
    var dapiprivate_get_order_asyn: Entry
    var dapiprivate_get_order_asyn_id: Entry
    var dapiprivate_get_pmexchangeinfo: Entry
    var dapiprivate_get_pmaccountinfo: Entry
    var dapiprivate_post_positionside_dual: Entry
    var dapiprivate_post_order: Entry
    var dapiprivate_post_batchorders: Entry
    var dapiprivate_post_countdowncancelall: Entry
    var dapiprivate_post_leverage: Entry
    var dapiprivate_post_margintype: Entry
    var dapiprivate_post_positionmargin: Entry
    var dapiprivate_post_listenkey: Entry
    var dapiprivate_put_listenkey: Entry
    var dapiprivate_put_order: Entry
    var dapiprivate_put_batchorders: Entry
    var dapiprivate_delete_order: Entry
    var dapiprivate_delete_allopenorders: Entry
    var dapiprivate_delete_batchorders: Entry
    var dapiprivate_delete_listenkey: Entry
    var dapiprivatev2_get_leveragebracket: Entry
    var fapipublic_get_ping: Entry
    var fapipublic_get_time: Entry
    var fapipublic_get_exchangeinfo: Entry
    var fapipublic_get_depth: Entry
    var fapipublic_get_trades: Entry
    var fapipublic_get_historicaltrades: Entry
    var fapipublic_get_aggtrades: Entry
    var fapipublic_get_klines: Entry
    var fapipublic_get_continuousklines: Entry
    var fapipublic_get_markpriceklines: Entry
    var fapipublic_get_indexpriceklines: Entry
    var fapipublic_get_premiumindexklines: Entry
    var fapipublic_get_fundingrate: Entry
    var fapipublic_get_fundinginfo: Entry
    var fapipublic_get_premiumindex: Entry
    var fapipublic_get_ticker_24hr: Entry
    var fapipublic_get_ticker_price: Entry
    var fapipublic_get_ticker_bookticker: Entry
    var fapipublic_get_openinterest: Entry
    var fapipublic_get_indexinfo: Entry
    var fapipublic_get_assetindex: Entry
    var fapipublic_get_constituents: Entry
    var fapipublic_get_apitradingstatus: Entry
    var fapipublic_get_lvtklines: Entry
    var fapipublic_get_convert_exchangeinfo: Entry
    var fapidata_get_delivery_price: Entry
    var fapidata_get_openinteresthist: Entry
    var fapidata_get_toplongshortaccountratio: Entry
    var fapidata_get_toplongshortpositionratio: Entry
    var fapidata_get_globallongshortaccountratio: Entry
    var fapidata_get_takerlongshortratio: Entry
    var fapidata_get_basis: Entry
    var fapiprivate_get_forceorders: Entry
    var fapiprivate_get_allorders: Entry
    var fapiprivate_get_openorder: Entry
    var fapiprivate_get_openorders: Entry
    var fapiprivate_get_order: Entry
    var fapiprivate_get_account: Entry
    var fapiprivate_get_balance: Entry
    var fapiprivate_get_leveragebracket: Entry
    var fapiprivate_get_positionmargin_history: Entry
    var fapiprivate_get_positionrisk: Entry
    var fapiprivate_get_positionside_dual: Entry
    var fapiprivate_get_usertrades: Entry
    var fapiprivate_get_income: Entry
    var fapiprivate_get_commissionrate: Entry
    var fapiprivate_get_ratelimit_order: Entry
    var fapiprivate_get_apitradingstatus: Entry
    var fapiprivate_get_multiassetsmargin: Entry
    var fapiprivate_get_apireferral_ifnewuser: Entry
    var fapiprivate_get_apireferral_customization: Entry
    var fapiprivate_get_apireferral_usercustomization: Entry
    var fapiprivate_get_apireferral_tradernum: Entry
    var fapiprivate_get_apireferral_overview: Entry
    var fapiprivate_get_apireferral_tradevol: Entry
    var fapiprivate_get_apireferral_rebatevol: Entry
    var fapiprivate_get_apireferral_tradersummary: Entry
    var fapiprivate_get_adlquantile: Entry
    var fapiprivate_get_pmaccountinfo: Entry
    var fapiprivate_get_orderamendment: Entry
    var fapiprivate_get_income_asyn: Entry
    var fapiprivate_get_income_asyn_id: Entry
    var fapiprivate_get_order_asyn: Entry
    var fapiprivate_get_order_asyn_id: Entry
    var fapiprivate_get_trade_asyn: Entry
    var fapiprivate_get_trade_asyn_id: Entry
    var fapiprivate_get_feeburn: Entry
    var fapiprivate_get_symbolconfig: Entry
    var fapiprivate_get_accountconfig: Entry
    var fapiprivate_get_convert_orderstatus: Entry
    var fapiprivate_post_batchorders: Entry
    var fapiprivate_post_positionside_dual: Entry
    var fapiprivate_post_positionmargin: Entry
    var fapiprivate_post_margintype: Entry
    var fapiprivate_post_order: Entry
    var fapiprivate_post_leverage: Entry
    var fapiprivate_post_listenkey: Entry
    var fapiprivate_post_countdowncancelall: Entry
    var fapiprivate_post_multiassetsmargin: Entry
    var fapiprivate_post_apireferral_customization: Entry
    var fapiprivate_post_apireferral_usercustomization: Entry
    var fapiprivate_post_feeburn: Entry
    var fapiprivate_post_convert_getquote: Entry
    var fapiprivate_post_convert_acceptquote: Entry
    var fapiprivate_put_listenkey: Entry
    var fapiprivate_put_order: Entry
    var fapiprivate_put_batchorders: Entry
    var fapiprivate_delete_batchorders: Entry
    var fapiprivate_delete_order: Entry
    var fapiprivate_delete_allopenorders: Entry
    var fapiprivate_delete_listenkey: Entry
    var fapipublicv2_get_ticker_price: Entry
    var fapiprivatev2_get_account: Entry
    var fapiprivatev2_get_balance: Entry
    var fapiprivatev2_get_positionrisk: Entry
    var fapiprivatev3_get_account: Entry
    var fapiprivatev3_get_balance: Entry
    var fapiprivatev3_get_positionrisk: Entry
    var eapipublic_get_ping: Entry
    var eapipublic_get_time: Entry
    var eapipublic_get_exchangeinfo: Entry
    var eapipublic_get_index: Entry
    var eapipublic_get_ticker: Entry
    var eapipublic_get_mark: Entry
    var eapipublic_get_depth: Entry
    var eapipublic_get_klines: Entry
    var eapipublic_get_trades: Entry
    var eapipublic_get_historicaltrades: Entry
    var eapipublic_get_exercisehistory: Entry
    var eapipublic_get_openinterest: Entry
    var eapiprivate_get_account: Entry
    var eapiprivate_get_position: Entry
    var eapiprivate_get_openorders: Entry
    var eapiprivate_get_historyorders: Entry
    var eapiprivate_get_usertrades: Entry
    var eapiprivate_get_exerciserecord: Entry
    var eapiprivate_get_bill: Entry
    var eapiprivate_get_income_asyn: Entry
    var eapiprivate_get_income_asyn_id: Entry
    var eapiprivate_get_marginaccount: Entry
    var eapiprivate_get_mmp: Entry
    var eapiprivate_get_countdowncancelall: Entry
    var eapiprivate_get_order: Entry
    var eapiprivate_get_block_order_orders: Entry
    var eapiprivate_get_block_order_execute: Entry
    var eapiprivate_get_block_user_trades: Entry
    var eapiprivate_post_order: Entry
    var eapiprivate_post_batchorders: Entry
    var eapiprivate_post_listenkey: Entry
    var eapiprivate_post_mmpset: Entry
    var eapiprivate_post_mmpreset: Entry
    var eapiprivate_post_countdowncancelall: Entry
    var eapiprivate_post_countdowncancelallheartbeat: Entry
    var eapiprivate_post_block_order_create: Entry
    var eapiprivate_post_block_order_execute: Entry
    var eapiprivate_put_listenkey: Entry
    var eapiprivate_put_block_order_create: Entry
    var eapiprivate_delete_order: Entry
    var eapiprivate_delete_batchorders: Entry
    var eapiprivate_delete_allopenorders: Entry
    var eapiprivate_delete_allopenordersbyunderlying: Entry
    var eapiprivate_delete_listenkey: Entry
    var eapiprivate_delete_block_order_create: Entry
    var public_get_ping: Entry
    var public_get_time: Entry
    var public_get_depth: Entry
    var public_get_trades: Entry
    var public_get_aggtrades: Entry
    var public_get_historicaltrades: Entry
    var public_get_klines: Entry
    var public_get_uiklines: Entry
    var public_get_ticker_24hr: Entry
    var public_get_ticker: Entry
    var public_get_ticker_tradingday: Entry
    var public_get_ticker_price: Entry
    var public_get_ticker_bookticker: Entry
    var public_get_exchangeinfo: Entry
    var public_get_avgprice: Entry
    var public_put_userdatastream: Entry
    var public_post_userdatastream: Entry
    var public_delete_userdatastream: Entry
    var private_get_allorderlist: Entry
    var private_get_openorderlist: Entry
    var private_get_orderlist: Entry
    var private_get_order: Entry
    var private_get_openorders: Entry
    var private_get_allorders: Entry
    var private_get_account: Entry
    var private_get_mytrades: Entry
    var private_get_ratelimit_order: Entry
    var private_get_mypreventedmatches: Entry
    var private_get_myallocations: Entry
    var private_get_account_commission: Entry
    var private_post_order_oco: Entry
    var private_post_orderlist_oco: Entry
    var private_post_orderlist_oto: Entry
    var private_post_orderlist_otoco: Entry
    var private_post_sor_order: Entry
    var private_post_sor_order_test: Entry
    var private_post_order: Entry
    var private_post_order_cancelreplace: Entry
    var private_post_order_test: Entry
    var private_delete_openorders: Entry
    var private_delete_orderlist: Entry
    var private_delete_order: Entry
    var papi_get_ping: Entry
    var papi_get_um_order: Entry
    var papi_get_um_openorder: Entry
    var papi_get_um_openorders: Entry
    var papi_get_um_allorders: Entry
    var papi_get_cm_order: Entry
    var papi_get_cm_openorder: Entry
    var papi_get_cm_openorders: Entry
    var papi_get_cm_allorders: Entry
    var papi_get_um_conditional_openorder: Entry
    var papi_get_um_conditional_openorders: Entry
    var papi_get_um_conditional_orderhistory: Entry
    var papi_get_um_conditional_allorders: Entry
    var papi_get_cm_conditional_openorder: Entry
    var papi_get_cm_conditional_openorders: Entry
    var papi_get_cm_conditional_orderhistory: Entry
    var papi_get_cm_conditional_allorders: Entry
    var papi_get_margin_order: Entry
    var papi_get_margin_openorders: Entry
    var papi_get_margin_allorders: Entry
    var papi_get_margin_orderlist: Entry
    var papi_get_margin_allorderlist: Entry
    var papi_get_margin_openorderlist: Entry
    var papi_get_margin_mytrades: Entry
    var papi_get_balance: Entry
    var papi_get_account: Entry
    var papi_get_margin_maxborrowable: Entry
    var papi_get_margin_maxwithdraw: Entry
    var papi_get_um_positionrisk: Entry
    var papi_get_cm_positionrisk: Entry
    var papi_get_um_positionside_dual: Entry
    var papi_get_cm_positionside_dual: Entry
    var papi_get_um_usertrades: Entry
    var papi_get_cm_usertrades: Entry
    var papi_get_um_leveragebracket: Entry
    var papi_get_cm_leveragebracket: Entry
    var papi_get_margin_forceorders: Entry
    var papi_get_um_forceorders: Entry
    var papi_get_cm_forceorders: Entry
    var papi_get_um_apitradingstatus: Entry
    var papi_get_um_commissionrate: Entry
    var papi_get_cm_commissionrate: Entry
    var papi_get_margin_marginloan: Entry
    var papi_get_margin_repayloan: Entry
    var papi_get_margin_margininteresthistory: Entry
    var papi_get_portfolio_interest_history: Entry
    var papi_get_um_income: Entry
    var papi_get_cm_income: Entry
    var papi_get_um_account: Entry
    var papi_get_cm_account: Entry
    var papi_get_repay_futures_switch: Entry
    var papi_get_um_adlquantile: Entry
    var papi_get_cm_adlquantile: Entry
    var papi_get_um_trade_asyn: Entry
    var papi_get_um_trade_asyn_id: Entry
    var papi_get_um_order_asyn: Entry
    var papi_get_um_order_asyn_id: Entry
    var papi_get_um_income_asyn: Entry
    var papi_get_um_income_asyn_id: Entry
    var papi_get_um_orderamendment: Entry
    var papi_get_cm_orderamendment: Entry
    var papi_get_um_feeburn: Entry
    var papi_get_um_accountconfig: Entry
    var papi_get_um_symbolconfig: Entry
    var papi_get_cm_accountconfig: Entry
    var papi_get_cm_symbolconfig: Entry
    var papi_post_um_order: Entry
    var papi_post_um_conditional_order: Entry
    var papi_post_cm_order: Entry
    var papi_post_cm_conditional_order: Entry
    var papi_post_margin_order: Entry
    var papi_post_marginloan: Entry
    var papi_post_repayloan: Entry
    var papi_post_margin_order_oco: Entry
    var papi_post_um_leverage: Entry
    var papi_post_cm_leverage: Entry
    var papi_post_um_positionside_dual: Entry
    var papi_post_cm_positionside_dual: Entry
    var papi_post_auto_collection: Entry
    var papi_post_bnb_transfer: Entry
    var papi_post_repay_futures_switch: Entry
    var papi_post_repay_futures_negative_balance: Entry
    var papi_post_listenkey: Entry
    var papi_post_asset_collection: Entry
    var papi_post_margin_repay_debt: Entry
    var papi_post_um_feeburn: Entry
    var papi_put_listenkey: Entry
    var papi_put_um_order: Entry
    var papi_put_cm_order: Entry
    var papi_delete_um_order: Entry
    var papi_delete_um_conditional_order: Entry
    var papi_delete_um_allopenorders: Entry
    var papi_delete_um_conditional_allopenorders: Entry
    var papi_delete_cm_order: Entry
    var papi_delete_cm_conditional_order: Entry
    var papi_delete_cm_allopenorders: Entry
    var papi_delete_cm_conditional_allopenorders: Entry
    var papi_delete_margin_order: Entry
    var papi_delete_margin_allopenorders: Entry
    var papi_delete_margin_orderlist: Entry
    var papi_delete_listenkey: Entry

    fn __init__(out self):
        self.sapi_get_copytrading_futures_userstatus = Entry(
            "copyTrading/futures/userStatus", "sapi", "GET", '{"cost": 2}'
        )
        self.sapi_get_copytrading_futures_leadsymbol = Entry(
            "copyTrading/futures/leadSymbol", "sapi", "GET", '{"cost": 2}'
        )
        self.sapi_get_system_status = Entry(
            "system/status", "sapi", "GET", '{"cost": 0.1}'
        )
        self.sapi_get_accountsnapshot = Entry(
            "accountSnapshot", "sapi", "GET", '{"cost": 240}'
        )
        self.sapi_get_account_info = Entry(
            "account/info", "sapi", "GET", '{"cost": 0.1}'
        )
        self.sapi_get_margin_asset = Entry(
            "margin/asset", "sapi", "GET", '{"cost": 1}'
        )
        self.sapi_get_margin_pair = Entry(
            "margin/pair", "sapi", "GET", '{"cost": 1}'
        )
        self.sapi_get_margin_allassets = Entry(
            "margin/allAssets", "sapi", "GET", '{"cost": 0.1}'
        )
        self.sapi_get_margin_allpairs = Entry(
            "margin/allPairs", "sapi", "GET", '{"cost": 0.1}'
        )
        self.sapi_get_margin_priceindex = Entry(
            "margin/priceIndex", "sapi", "GET", '{"cost": 1}'
        )
        self.sapi_get_spot_delist_schedule = Entry(
            "spot/delist-schedule", "sapi", "GET", '{"cost": 10}'
        )
        self.sapi_get_asset_assetdividend = Entry(
            "asset/assetDividend", "sapi", "GET", '{"cost": 1}'
        )
        self.sapi_get_asset_dribblet = Entry(
            "asset/dribblet", "sapi", "GET", '{"cost": 0.1}'
        )
        self.sapi_get_asset_transfer = Entry(
            "asset/transfer", "sapi", "GET", '{"cost": 0.1}'
        )
        self.sapi_get_asset_assetdetail = Entry(
            "asset/assetDetail", "sapi", "GET", '{"cost": 0.1}'
        )
        self.sapi_get_asset_tradefee = Entry(
            "asset/tradeFee", "sapi", "GET", '{"cost": 0.1}'
        )
        self.sapi_get_asset_ledger_transfer_cloud_mining_querybypage = Entry(
            "asset/ledger-transfer/cloud-mining/queryByPage",
            "sapi",
            "GET",
            '{"cost": 4.0002}',
        )
        self.sapi_get_asset_convert_transfer_querybypage = Entry(
            "asset/convert-transfer/queryByPage",
            "sapi",
            "GET",
            '{"cost": 0.033335}',
        )
        self.sapi_get_asset_wallet_balance = Entry(
            "asset/wallet/balance", "sapi", "GET", '{"cost": 6}'
        )
        self.sapi_get_asset_custody_transfer_history = Entry(
            "asset/custody/transfer-history", "sapi", "GET", '{"cost": 6}'
        )
        self.sapi_get_margin_borrow_repay = Entry(
            "margin/borrow-repay", "sapi", "GET", '{"cost": 1}'
        )
        self.sapi_get_margin_loan = Entry(
            "margin/loan", "sapi", "GET", '{"cost": 1}'
        )
        self.sapi_get_margin_repay = Entry(
            "margin/repay", "sapi", "GET", '{"cost": 1}'
        )
        self.sapi_get_margin_account = Entry(
            "margin/account", "sapi", "GET", '{"cost": 1}'
        )
        self.sapi_get_margin_transfer = Entry(
            "margin/transfer", "sapi", "GET", '{"cost": 0.1}'
        )
        self.sapi_get_margin_interesthistory = Entry(
            "margin/interestHistory", "sapi", "GET", '{"cost": 0.1}'
        )
        self.sapi_get_margin_forceliquidationrec = Entry(
            "margin/forceLiquidationRec", "sapi", "GET", '{"cost": 0.1}'
        )
        self.sapi_get_margin_order = Entry(
            "margin/order", "sapi", "GET", '{"cost": 1}'
        )
        self.sapi_get_margin_openorders = Entry(
            "margin/openOrders", "sapi", "GET", '{"cost": 1}'
        )
        self.sapi_get_margin_allorders = Entry(
            "margin/allOrders", "sapi", "GET", '{"cost": 20}'
        )
        self.sapi_get_margin_mytrades = Entry(
            "margin/myTrades", "sapi", "GET", '{"cost": 1}'
        )
        self.sapi_get_margin_maxborrowable = Entry(
            "margin/maxBorrowable", "sapi", "GET", '{"cost": 5}'
        )
        self.sapi_get_margin_maxtransferable = Entry(
            "margin/maxTransferable", "sapi", "GET", '{"cost": 5}'
        )
        self.sapi_get_margin_tradecoeff = Entry(
            "margin/tradeCoeff", "sapi", "GET", '{"cost": 1}'
        )
        self.sapi_get_margin_isolated_transfer = Entry(
            "margin/isolated/transfer", "sapi", "GET", '{"cost": 0.1}'
        )
        self.sapi_get_margin_isolated_account = Entry(
            "margin/isolated/account", "sapi", "GET", '{"cost": 1}'
        )
        self.sapi_get_margin_isolated_pair = Entry(
            "margin/isolated/pair", "sapi", "GET", '{"cost": 1}'
        )
        self.sapi_get_margin_isolated_allpairs = Entry(
            "margin/isolated/allPairs", "sapi", "GET", '{"cost": 1}'
        )
        self.sapi_get_margin_isolated_accountlimit = Entry(
            "margin/isolated/accountLimit", "sapi", "GET", '{"cost": 0.1}'
        )
        self.sapi_get_margin_interestratehistory = Entry(
            "margin/interestRateHistory", "sapi", "GET", '{"cost": 0.1}'
        )
        self.sapi_get_margin_orderlist = Entry(
            "margin/orderList", "sapi", "GET", '{"cost": 1}'
        )
        self.sapi_get_margin_allorderlist = Entry(
            "margin/allOrderList", "sapi", "GET", '{"cost": 20}'
        )
        self.sapi_get_margin_openorderlist = Entry(
            "margin/openOrderList", "sapi", "GET", '{"cost": 1}'
        )
        self.sapi_get_margin_crossmargindata = Entry(
            "margin/crossMarginData",
            "sapi",
            "GET",
            '{"cost": 0.1, "noCoin": 0.5}',
        )
        self.sapi_get_margin_isolatedmargindata = Entry(
            "margin/isolatedMarginData",
            "sapi",
            "GET",
            '{"cost": 0.1, "noCoin": 1}',
        )
        self.sapi_get_margin_isolatedmargintier = Entry(
            "margin/isolatedMarginTier", "sapi", "GET", '{"cost": 0.1}'
        )
        self.sapi_get_margin_ratelimit_order = Entry(
            "margin/rateLimit/order", "sapi", "GET", '{"cost": 2}'
        )
        self.sapi_get_margin_dribblet = Entry(
            "margin/dribblet", "sapi", "GET", '{"cost": 0.1}'
        )
        self.sapi_get_margin_dust = Entry(
            "margin/dust", "sapi", "GET", '{"cost": 20.001}'
        )
        self.sapi_get_margin_crossmargincollateralratio = Entry(
            "margin/crossMarginCollateralRatio", "sapi", "GET", '{"cost": 10}'
        )
        self.sapi_get_margin_exchange_small_liability = Entry(
            "margin/exchange-small-liability", "sapi", "GET", '{"cost": 0.6667}'
        )
        self.sapi_get_margin_exchange_small_liability_history = Entry(
            "margin/exchange-small-liability-history",
            "sapi",
            "GET",
            '{"cost": 0.6667}',
        )
        self.sapi_get_margin_next_hourly_interest_rate = Entry(
            "margin/next-hourly-interest-rate",
            "sapi",
            "GET",
            '{"cost": 0.6667}',
        )
        self.sapi_get_margin_capital_flow = Entry(
            "margin/capital-flow", "sapi", "GET", '{"cost": 10}'
        )
        self.sapi_get_margin_delist_schedule = Entry(
            "margin/delist-schedule", "sapi", "GET", '{"cost": 10}'
        )
        self.sapi_get_margin_available_inventory = Entry(
            "margin/available-inventory", "sapi", "GET", '{"cost": 0.3334}'
        )
        self.sapi_get_margin_leveragebracket = Entry(
            "margin/leverageBracket", "sapi", "GET", '{"cost": 0.1}'
        )
        self.sapi_get_loan_vip_loanable_data = Entry(
            "loan/vip/loanable/data", "sapi", "GET", '{"cost": 40}'
        )
        self.sapi_get_loan_vip_collateral_data = Entry(
            "loan/vip/collateral/data", "sapi", "GET", '{"cost": 40}'
        )
        self.sapi_get_loan_vip_request_data = Entry(
            "loan/vip/request/data", "sapi", "GET", '{"cost": 2.6668}'
        )
        self.sapi_get_loan_vip_request_interestrate = Entry(
            "loan/vip/request/interestRate", "sapi", "GET", '{"cost": 2.6668}'
        )
        self.sapi_get_loan_income = Entry(
            "loan/income", "sapi", "GET", '{"cost": 40.002}'
        )
        self.sapi_get_loan_ongoing_orders = Entry(
            "loan/ongoing/orders", "sapi", "GET", '{"cost": 40}'
        )
        self.sapi_get_loan_ltv_adjustment_history = Entry(
            "loan/ltv/adjustment/history", "sapi", "GET", '{"cost": 40}'
        )
        self.sapi_get_loan_borrow_history = Entry(
            "loan/borrow/history", "sapi", "GET", '{"cost": 40}'
        )
        self.sapi_get_loan_repay_history = Entry(
            "loan/repay/history", "sapi", "GET", '{"cost": 40}'
        )
        self.sapi_get_loan_loanable_data = Entry(
            "loan/loanable/data", "sapi", "GET", '{"cost": 40}'
        )
        self.sapi_get_loan_collateral_data = Entry(
            "loan/collateral/data", "sapi", "GET", '{"cost": 40}'
        )
        self.sapi_get_loan_repay_collateral_rate = Entry(
            "loan/repay/collateral/rate", "sapi", "GET", '{"cost": 600}'
        )
        self.sapi_get_loan_flexible_ongoing_orders = Entry(
            "loan/flexible/ongoing/orders", "sapi", "GET", '{"cost": 30}'
        )
        self.sapi_get_loan_flexible_borrow_history = Entry(
            "loan/flexible/borrow/history", "sapi", "GET", '{"cost": 40}'
        )
        self.sapi_get_loan_flexible_repay_history = Entry(
            "loan/flexible/repay/history", "sapi", "GET", '{"cost": 40}'
        )
        self.sapi_get_loan_flexible_ltv_adjustment_history = Entry(
            "loan/flexible/ltv/adjustment/history",
            "sapi",
            "GET",
            '{"cost": 40}',
        )
        self.sapi_get_loan_vip_ongoing_orders = Entry(
            "loan/vip/ongoing/orders", "sapi", "GET", '{"cost": 40}'
        )
        self.sapi_get_loan_vip_repay_history = Entry(
            "loan/vip/repay/history", "sapi", "GET", '{"cost": 40}'
        )
        self.sapi_get_loan_vip_collateral_account = Entry(
            "loan/vip/collateral/account", "sapi", "GET", '{"cost": 600}'
        )
        self.sapi_get_fiat_orders = Entry(
            "fiat/orders", "sapi", "GET", '{"cost": 600.03}'
        )
        self.sapi_get_fiat_payments = Entry(
            "fiat/payments", "sapi", "GET", '{"cost": 0.1}'
        )
        self.sapi_get_futures_transfer = Entry(
            "futures/transfer", "sapi", "GET", '{"cost": 1}'
        )
        self.sapi_get_futures_histdatalink = Entry(
            "futures/histDataLink", "sapi", "GET", '{"cost": 0.1}'
        )
        self.sapi_get_rebate_taxquery = Entry(
            "rebate/taxQuery", "sapi", "GET", '{"cost": 80.004}'
        )
        self.sapi_get_capital_config_getall = Entry(
            "capital/config/getall", "sapi", "GET", '{"cost": 1}'
        )
        self.sapi_get_capital_deposit_address = Entry(
            "capital/deposit/address", "sapi", "GET", '{"cost": 1}'
        )
        self.sapi_get_capital_deposit_address_list = Entry(
            "capital/deposit/address/list", "sapi", "GET", '{"cost": 1}'
        )
        self.sapi_get_capital_deposit_hisrec = Entry(
            "capital/deposit/hisrec", "sapi", "GET", '{"cost": 0.1}'
        )
        self.sapi_get_capital_deposit_subaddress = Entry(
            "capital/deposit/subAddress", "sapi", "GET", '{"cost": 0.1}'
        )
        self.sapi_get_capital_deposit_subhisrec = Entry(
            "capital/deposit/subHisrec", "sapi", "GET", '{"cost": 0.1}'
        )
        self.sapi_get_capital_withdraw_history = Entry(
            "capital/withdraw/history", "sapi", "GET", '{"cost": 2}'
        )
        self.sapi_get_capital_withdraw_address_list = Entry(
            "capital/withdraw/address/list", "sapi", "GET", '{"cost": 10}'
        )
        self.sapi_get_capital_contract_convertible_coins = Entry(
            "capital/contract/convertible-coins",
            "sapi",
            "GET",
            '{"cost": 4.0002}',
        )
        self.sapi_get_convert_tradeflow = Entry(
            "convert/tradeFlow", "sapi", "GET", '{"cost": 20.001}'
        )
        self.sapi_get_convert_exchangeinfo = Entry(
            "convert/exchangeInfo", "sapi", "GET", '{"cost": 50}'
        )
        self.sapi_get_convert_assetinfo = Entry(
            "convert/assetInfo", "sapi", "GET", '{"cost": 10}'
        )
        self.sapi_get_convert_orderstatus = Entry(
            "convert/orderStatus", "sapi", "GET", '{"cost": 0.6667}'
        )
        self.sapi_get_convert_limit_queryopenorders = Entry(
            "convert/limit/queryOpenOrders", "sapi", "GET", '{"cost": 20.001}'
        )
        self.sapi_get_account_status = Entry(
            "account/status", "sapi", "GET", '{"cost": 0.1}'
        )
        self.sapi_get_account_apitradingstatus = Entry(
            "account/apiTradingStatus", "sapi", "GET", '{"cost": 0.1}'
        )
        self.sapi_get_account_apirestrictions_iprestriction = Entry(
            "account/apiRestrictions/ipRestriction",
            "sapi",
            "GET",
            '{"cost": 0.1}',
        )
        self.sapi_get_bnbburn = Entry("bnbBurn", "sapi", "GET", '{"cost": 0.1}')
        self.sapi_get_sub_account_futures_account = Entry(
            "sub-account/futures/account", "sapi", "GET", '{"cost": 1}'
        )
        self.sapi_get_sub_account_futures_accountsummary = Entry(
            "sub-account/futures/accountSummary", "sapi", "GET", '{"cost": 0.1}'
        )
        self.sapi_get_sub_account_futures_positionrisk = Entry(
            "sub-account/futures/positionRisk", "sapi", "GET", '{"cost": 1}'
        )
        self.sapi_get_sub_account_futures_internaltransfer = Entry(
            "sub-account/futures/internalTransfer",
            "sapi",
            "GET",
            '{"cost": 0.1}',
        )
        self.sapi_get_sub_account_list = Entry(
            "sub-account/list", "sapi", "GET", '{"cost": 0.1}'
        )
        self.sapi_get_sub_account_margin_account = Entry(
            "sub-account/margin/account", "sapi", "GET", '{"cost": 1}'
        )
        self.sapi_get_sub_account_margin_accountsummary = Entry(
            "sub-account/margin/accountSummary", "sapi", "GET", '{"cost": 1}'
        )
        self.sapi_get_sub_account_spotsummary = Entry(
            "sub-account/spotSummary", "sapi", "GET", '{"cost": 0.1}'
        )
        self.sapi_get_sub_account_status = Entry(
            "sub-account/status", "sapi", "GET", '{"cost": 1}'
        )
        self.sapi_get_sub_account_sub_transfer_history = Entry(
            "sub-account/sub/transfer/history", "sapi", "GET", '{"cost": 0.1}'
        )
        self.sapi_get_sub_account_transfer_subuserhistory = Entry(
            "sub-account/transfer/subUserHistory",
            "sapi",
            "GET",
            '{"cost": 0.1}',
        )
        self.sapi_get_sub_account_universaltransfer = Entry(
            "sub-account/universalTransfer", "sapi", "GET", '{"cost": 0.1}'
        )
        self.sapi_get_sub_account_apirestrictions_iprestriction_thirdpartylist = Entry(
            "sub-account/apiRestrictions/ipRestriction/thirdPartyList",
            "sapi",
            "GET",
            '{"cost": 1}',
        )
        self.sapi_get_sub_account_transaction_statistics = Entry(
            "sub-account/transaction-statistics",
            "sapi",
            "GET",
            '{"cost": 0.40002}',
        )
        self.sapi_get_sub_account_subaccountapi_iprestriction = Entry(
            "sub-account/subAccountApi/ipRestriction",
            "sapi",
            "GET",
            '{"cost": 20.001}',
        )
        self.sapi_get_managed_subaccount_asset = Entry(
            "managed-subaccount/asset", "sapi", "GET", '{"cost": 0.1}'
        )
        self.sapi_get_managed_subaccount_accountsnapshot = Entry(
            "managed-subaccount/accountSnapshot", "sapi", "GET", '{"cost": 240}'
        )
        self.sapi_get_managed_subaccount_querytranslogforinvestor = Entry(
            "managed-subaccount/queryTransLogForInvestor",
            "sapi",
            "GET",
            '{"cost": 0.1}',
        )
        self.sapi_get_managed_subaccount_querytranslogfortradeparent = Entry(
            "managed-subaccount/queryTransLogForTradeParent",
            "sapi",
            "GET",
            '{"cost": 0.40002}',
        )
        self.sapi_get_managed_subaccount_fetch_future_asset = Entry(
            "managed-subaccount/fetch-future-asset",
            "sapi",
            "GET",
            '{"cost": 0.40002}',
        )
        self.sapi_get_managed_subaccount_marginasset = Entry(
            "managed-subaccount/marginAsset", "sapi", "GET", '{"cost": 0.1}'
        )
        self.sapi_get_managed_subaccount_info = Entry(
            "managed-subaccount/info", "sapi", "GET", '{"cost": 0.40002}'
        )
        self.sapi_get_managed_subaccount_deposit_address = Entry(
            "managed-subaccount/deposit/address",
            "sapi",
            "GET",
            '{"cost": 0.006667}',
        )
        self.sapi_get_managed_subaccount_query_trans_log = Entry(
            "managed-subaccount/query-trans-log",
            "sapi",
            "GET",
            '{"cost": 0.40002}',
        )
        self.sapi_get_lending_daily_product_list = Entry(
            "lending/daily/product/list", "sapi", "GET", '{"cost": 0.1}'
        )
        self.sapi_get_lending_daily_userleftquota = Entry(
            "lending/daily/userLeftQuota", "sapi", "GET", '{"cost": 0.1}'
        )
        self.sapi_get_lending_daily_userredemptionquota = Entry(
            "lending/daily/userRedemptionQuota", "sapi", "GET", '{"cost": 0.1}'
        )
        self.sapi_get_lending_daily_token_position = Entry(
            "lending/daily/token/position", "sapi", "GET", '{"cost": 0.1}'
        )
        self.sapi_get_lending_union_account = Entry(
            "lending/union/account", "sapi", "GET", '{"cost": 0.1}'
        )
        self.sapi_get_lending_union_purchaserecord = Entry(
            "lending/union/purchaseRecord", "sapi", "GET", '{"cost": 0.1}'
        )
        self.sapi_get_lending_union_redemptionrecord = Entry(
            "lending/union/redemptionRecord", "sapi", "GET", '{"cost": 0.1}'
        )
        self.sapi_get_lending_union_interesthistory = Entry(
            "lending/union/interestHistory", "sapi", "GET", '{"cost": 0.1}'
        )
        self.sapi_get_lending_project_list = Entry(
            "lending/project/list", "sapi", "GET", '{"cost": 0.1}'
        )
        self.sapi_get_lending_project_position_list = Entry(
            "lending/project/position/list", "sapi", "GET", '{"cost": 0.1}'
        )
        self.sapi_get_eth_staking_eth_history_stakinghistory = Entry(
            "eth-staking/eth/history/stakingHistory",
            "sapi",
            "GET",
            '{"cost": 15}',
        )
        self.sapi_get_eth_staking_eth_history_redemptionhistory = Entry(
            "eth-staking/eth/history/redemptionHistory",
            "sapi",
            "GET",
            '{"cost": 15}',
        )
        self.sapi_get_eth_staking_eth_history_rewardshistory = Entry(
            "eth-staking/eth/history/rewardsHistory",
            "sapi",
            "GET",
            '{"cost": 15}',
        )
        self.sapi_get_eth_staking_eth_quota = Entry(
            "eth-staking/eth/quota", "sapi", "GET", '{"cost": 15}'
        )
        self.sapi_get_eth_staking_eth_history_ratehistory = Entry(
            "eth-staking/eth/history/rateHistory", "sapi", "GET", '{"cost": 15}'
        )
        self.sapi_get_eth_staking_account = Entry(
            "eth-staking/account", "sapi", "GET", '{"cost": 15}'
        )
        self.sapi_get_eth_staking_wbeth_history_wraphistory = Entry(
            "eth-staking/wbeth/history/wrapHistory",
            "sapi",
            "GET",
            '{"cost": 15}',
        )
        self.sapi_get_eth_staking_wbeth_history_unwraphistory = Entry(
            "eth-staking/wbeth/history/unwrapHistory",
            "sapi",
            "GET",
            '{"cost": 15}',
        )
        self.sapi_get_eth_staking_eth_history_wbethrewardshistory = Entry(
            "eth-staking/eth/history/wbethRewardsHistory",
            "sapi",
            "GET",
            '{"cost": 15}',
        )
        self.sapi_get_sol_staking_sol_history_stakinghistory = Entry(
            "sol-staking/sol/history/stakingHistory",
            "sapi",
            "GET",
            '{"cost": 15}',
        )
        self.sapi_get_sol_staking_sol_history_redemptionhistory = Entry(
            "sol-staking/sol/history/redemptionHistory",
            "sapi",
            "GET",
            '{"cost": 15}',
        )
        self.sapi_get_sol_staking_sol_history_bnsolrewardshistory = Entry(
            "sol-staking/sol/history/bnsolRewardsHistory",
            "sapi",
            "GET",
            '{"cost": 15}',
        )
        self.sapi_get_sol_staking_sol_history_ratehistory = Entry(
            "sol-staking/sol/history/rateHistory", "sapi", "GET", '{"cost": 15}'
        )
        self.sapi_get_sol_staking_account = Entry(
            "sol-staking/account", "sapi", "GET", '{"cost": 15}'
        )
        self.sapi_get_sol_staking_sol_quota = Entry(
            "sol-staking/sol/quota", "sapi", "GET", '{"cost": 15}'
        )
        self.sapi_get_mining_pub_algolist = Entry(
            "mining/pub/algoList", "sapi", "GET", '{"cost": 0.1}'
        )
        self.sapi_get_mining_pub_coinlist = Entry(
            "mining/pub/coinList", "sapi", "GET", '{"cost": 0.1}'
        )
        self.sapi_get_mining_worker_detail = Entry(
            "mining/worker/detail", "sapi", "GET", '{"cost": 0.5}'
        )
        self.sapi_get_mining_worker_list = Entry(
            "mining/worker/list", "sapi", "GET", '{"cost": 0.5}'
        )
        self.sapi_get_mining_payment_list = Entry(
            "mining/payment/list", "sapi", "GET", '{"cost": 0.5}'
        )
        self.sapi_get_mining_statistics_user_status = Entry(
            "mining/statistics/user/status", "sapi", "GET", '{"cost": 0.5}'
        )
        self.sapi_get_mining_statistics_user_list = Entry(
            "mining/statistics/user/list", "sapi", "GET", '{"cost": 0.5}'
        )
        self.sapi_get_mining_payment_uid = Entry(
            "mining/payment/uid", "sapi", "GET", '{"cost": 0.5}'
        )
        self.sapi_get_bswap_pools = Entry(
            "bswap/pools", "sapi", "GET", '{"cost": 0.1}'
        )
        self.sapi_get_bswap_liquidity = Entry(
            "bswap/liquidity", "sapi", "GET", '{"cost": 0.1, "noPoolId": 1}'
        )
        self.sapi_get_bswap_liquidityops = Entry(
            "bswap/liquidityOps", "sapi", "GET", '{"cost": 20.001}'
        )
        self.sapi_get_bswap_quote = Entry(
            "bswap/quote", "sapi", "GET", '{"cost": 1.00005}'
        )
        self.sapi_get_bswap_swap = Entry(
            "bswap/swap", "sapi", "GET", '{"cost": 20.001}'
        )
        self.sapi_get_bswap_poolconfigure = Entry(
            "bswap/poolConfigure", "sapi", "GET", '{"cost": 1.00005}'
        )
        self.sapi_get_bswap_addliquiditypreview = Entry(
            "bswap/addLiquidityPreview", "sapi", "GET", '{"cost": 1.00005}'
        )
        self.sapi_get_bswap_removeliquiditypreview = Entry(
            "bswap/removeLiquidityPreview", "sapi", "GET", '{"cost": 1.00005}'
        )
        self.sapi_get_bswap_unclaimedrewards = Entry(
            "bswap/unclaimedRewards", "sapi", "GET", '{"cost": 6.667}'
        )
        self.sapi_get_bswap_claimedhistory = Entry(
            "bswap/claimedHistory", "sapi", "GET", '{"cost": 6.667}'
        )
        self.sapi_get_blvt_tokeninfo = Entry(
            "blvt/tokenInfo", "sapi", "GET", '{"cost": 0.1}'
        )
        self.sapi_get_blvt_subscribe_record = Entry(
            "blvt/subscribe/record", "sapi", "GET", '{"cost": 0.1}'
        )
        self.sapi_get_blvt_redeem_record = Entry(
            "blvt/redeem/record", "sapi", "GET", '{"cost": 0.1}'
        )
        self.sapi_get_blvt_userlimit = Entry(
            "blvt/userLimit", "sapi", "GET", '{"cost": 0.1}'
        )
        self.sapi_get_apireferral_ifnewuser = Entry(
            "apiReferral/ifNewUser", "sapi", "GET", '{"cost": 1}'
        )
        self.sapi_get_apireferral_customization = Entry(
            "apiReferral/customization", "sapi", "GET", '{"cost": 1}'
        )
        self.sapi_get_apireferral_usercustomization = Entry(
            "apiReferral/userCustomization", "sapi", "GET", '{"cost": 1}'
        )
        self.sapi_get_apireferral_rebate_recentrecord = Entry(
            "apiReferral/rebate/recentRecord", "sapi", "GET", '{"cost": 1}'
        )
        self.sapi_get_apireferral_rebate_historicalrecord = Entry(
            "apiReferral/rebate/historicalRecord", "sapi", "GET", '{"cost": 1}'
        )
        self.sapi_get_apireferral_kickback_recentrecord = Entry(
            "apiReferral/kickback/recentRecord", "sapi", "GET", '{"cost": 1}'
        )
        self.sapi_get_apireferral_kickback_historicalrecord = Entry(
            "apiReferral/kickback/historicalRecord",
            "sapi",
            "GET",
            '{"cost": 1}',
        )
        self.sapi_get_broker_subaccountapi = Entry(
            "broker/subAccountApi", "sapi", "GET", '{"cost": 1}'
        )
        self.sapi_get_broker_subaccount = Entry(
            "broker/subAccount", "sapi", "GET", '{"cost": 1}'
        )
        self.sapi_get_broker_subaccountapi_commission_futures = Entry(
            "broker/subAccountApi/commission/futures",
            "sapi",
            "GET",
            '{"cost": 1}',
        )
        self.sapi_get_broker_subaccountapi_commission_coinfutures = Entry(
            "broker/subAccountApi/commission/coinFutures",
            "sapi",
            "GET",
            '{"cost": 1}',
        )
        self.sapi_get_broker_info = Entry(
            "broker/info", "sapi", "GET", '{"cost": 1}'
        )
        self.sapi_get_broker_transfer = Entry(
            "broker/transfer", "sapi", "GET", '{"cost": 1}'
        )
        self.sapi_get_broker_transfer_futures = Entry(
            "broker/transfer/futures", "sapi", "GET", '{"cost": 1}'
        )
        self.sapi_get_broker_rebate_recentrecord = Entry(
            "broker/rebate/recentRecord", "sapi", "GET", '{"cost": 1}'
        )
        self.sapi_get_broker_rebate_historicalrecord = Entry(
            "broker/rebate/historicalRecord", "sapi", "GET", '{"cost": 1}'
        )
        self.sapi_get_broker_subaccount_bnbburn_status = Entry(
            "broker/subAccount/bnbBurn/status", "sapi", "GET", '{"cost": 1}'
        )
        self.sapi_get_broker_subaccount_deposithist = Entry(
            "broker/subAccount/depositHist", "sapi", "GET", '{"cost": 1}'
        )
        self.sapi_get_broker_subaccount_spotsummary = Entry(
            "broker/subAccount/spotSummary", "sapi", "GET", '{"cost": 1}'
        )
        self.sapi_get_broker_subaccount_marginsummary = Entry(
            "broker/subAccount/marginSummary", "sapi", "GET", '{"cost": 1}'
        )
        self.sapi_get_broker_subaccount_futuressummary = Entry(
            "broker/subAccount/futuresSummary", "sapi", "GET", '{"cost": 1}'
        )
        self.sapi_get_broker_rebate_futures_recentrecord = Entry(
            "broker/rebate/futures/recentRecord", "sapi", "GET", '{"cost": 1}'
        )
        self.sapi_get_broker_subaccountapi_iprestriction = Entry(
            "broker/subAccountApi/ipRestriction", "sapi", "GET", '{"cost": 1}'
        )
        self.sapi_get_broker_universaltransfer = Entry(
            "broker/universalTransfer", "sapi", "GET", '{"cost": 1}'
        )
        self.sapi_get_account_apirestrictions = Entry(
            "account/apiRestrictions", "sapi", "GET", '{"cost": 0.1}'
        )
        self.sapi_get_c2c_ordermatch_listuserorderhistory = Entry(
            "c2c/orderMatch/listUserOrderHistory",
            "sapi",
            "GET",
            '{"cost": 0.1}',
        )
        self.sapi_get_nft_history_transactions = Entry(
            "nft/history/transactions", "sapi", "GET", '{"cost": 20.001}'
        )
        self.sapi_get_nft_history_deposit = Entry(
            "nft/history/deposit", "sapi", "GET", '{"cost": 20.001}'
        )
        self.sapi_get_nft_history_withdraw = Entry(
            "nft/history/withdraw", "sapi", "GET", '{"cost": 20.001}'
        )
        self.sapi_get_nft_user_getasset = Entry(
            "nft/user/getAsset", "sapi", "GET", '{"cost": 20.001}'
        )
        self.sapi_get_pay_transactions = Entry(
            "pay/transactions", "sapi", "GET", '{"cost": 20.001}'
        )
        self.sapi_get_giftcard_verify = Entry(
            "giftcard/verify", "sapi", "GET", '{"cost": 0.1}'
        )
        self.sapi_get_giftcard_cryptography_rsa_public_key = Entry(
            "giftcard/cryptography/rsa-public-key",
            "sapi",
            "GET",
            '{"cost": 0.1}',
        )
        self.sapi_get_giftcard_buycode_token_limit = Entry(
            "giftcard/buyCode/token-limit", "sapi", "GET", '{"cost": 0.1}'
        )
        self.sapi_get_algo_spot_openorders = Entry(
            "algo/spot/openOrders", "sapi", "GET", '{"cost": 0.1}'
        )
        self.sapi_get_algo_spot_historicalorders = Entry(
            "algo/spot/historicalOrders", "sapi", "GET", '{"cost": 0.1}'
        )
        self.sapi_get_algo_spot_suborders = Entry(
            "algo/spot/subOrders", "sapi", "GET", '{"cost": 0.1}'
        )
        self.sapi_get_algo_futures_openorders = Entry(
            "algo/futures/openOrders", "sapi", "GET", '{"cost": 0.1}'
        )
        self.sapi_get_algo_futures_historicalorders = Entry(
            "algo/futures/historicalOrders", "sapi", "GET", '{"cost": 0.1}'
        )
        self.sapi_get_algo_futures_suborders = Entry(
            "algo/futures/subOrders", "sapi", "GET", '{"cost": 0.1}'
        )
        self.sapi_get_portfolio_account = Entry(
            "portfolio/account", "sapi", "GET", '{"cost": 0.1}'
        )
        self.sapi_get_portfolio_collateralrate = Entry(
            "portfolio/collateralRate", "sapi", "GET", '{"cost": 5}'
        )
        self.sapi_get_portfolio_pmloan = Entry(
            "portfolio/pmLoan", "sapi", "GET", '{"cost": 3.3335}'
        )
        self.sapi_get_portfolio_interest_history = Entry(
            "portfolio/interest-history", "sapi", "GET", '{"cost": 0.6667}'
        )
        self.sapi_get_portfolio_asset_index_price = Entry(
            "portfolio/asset-index-price", "sapi", "GET", '{"cost": 0.1}'
        )
        self.sapi_get_portfolio_repay_futures_switch = Entry(
            "portfolio/repay-futures-switch", "sapi", "GET", '{"cost": 3}'
        )
        self.sapi_get_portfolio_margin_asset_leverage = Entry(
            "portfolio/margin-asset-leverage", "sapi", "GET", '{"cost": 5}'
        )
        self.sapi_get_portfolio_balance = Entry(
            "portfolio/balance", "sapi", "GET", '{"cost": 2}'
        )
        self.sapi_get_staking_productlist = Entry(
            "staking/productList", "sapi", "GET", '{"cost": 0.1}'
        )
        self.sapi_get_staking_position = Entry(
            "staking/position", "sapi", "GET", '{"cost": 0.1}'
        )
        self.sapi_get_staking_stakingrecord = Entry(
            "staking/stakingRecord", "sapi", "GET", '{"cost": 0.1}'
        )
        self.sapi_get_staking_personalleftquota = Entry(
            "staking/personalLeftQuota", "sapi", "GET", '{"cost": 0.1}'
        )
        self.sapi_get_lending_auto_invest_target_asset_list = Entry(
            "lending/auto-invest/target-asset/list",
            "sapi",
            "GET",
            '{"cost": 0.1}',
        )
        self.sapi_get_lending_auto_invest_target_asset_roi_list = Entry(
            "lending/auto-invest/target-asset/roi/list",
            "sapi",
            "GET",
            '{"cost": 0.1}',
        )
        self.sapi_get_lending_auto_invest_all_asset = Entry(
            "lending/auto-invest/all/asset", "sapi", "GET", '{"cost": 0.1}'
        )
        self.sapi_get_lending_auto_invest_source_asset_list = Entry(
            "lending/auto-invest/source-asset/list",
            "sapi",
            "GET",
            '{"cost": 0.1}',
        )
        self.sapi_get_lending_auto_invest_plan_list = Entry(
            "lending/auto-invest/plan/list", "sapi", "GET", '{"cost": 0.1}'
        )
        self.sapi_get_lending_auto_invest_plan_id = Entry(
            "lending/auto-invest/plan/id", "sapi", "GET", '{"cost": 0.1}'
        )
        self.sapi_get_lending_auto_invest_history_list = Entry(
            "lending/auto-invest/history/list", "sapi", "GET", '{"cost": 0.1}'
        )
        self.sapi_get_lending_auto_invest_index_info = Entry(
            "lending/auto-invest/index/info", "sapi", "GET", '{"cost": 0.1}'
        )
        self.sapi_get_lending_auto_invest_index_user_summary = Entry(
            "lending/auto-invest/index/user-summary",
            "sapi",
            "GET",
            '{"cost": 0.1}',
        )
        self.sapi_get_lending_auto_invest_one_off_status = Entry(
            "lending/auto-invest/one-off/status", "sapi", "GET", '{"cost": 0.1}'
        )
        self.sapi_get_lending_auto_invest_redeem_history = Entry(
            "lending/auto-invest/redeem/history", "sapi", "GET", '{"cost": 0.1}'
        )
        self.sapi_get_lending_auto_invest_rebalance_history = Entry(
            "lending/auto-invest/rebalance/history",
            "sapi",
            "GET",
            '{"cost": 0.1}',
        )
        self.sapi_get_simple_earn_flexible_list = Entry(
            "simple-earn/flexible/list", "sapi", "GET", '{"cost": 15}'
        )
        self.sapi_get_simple_earn_locked_list = Entry(
            "simple-earn/locked/list", "sapi", "GET", '{"cost": 15}'
        )
        self.sapi_get_simple_earn_flexible_personalleftquota = Entry(
            "simple-earn/flexible/personalLeftQuota",
            "sapi",
            "GET",
            '{"cost": 15}',
        )
        self.sapi_get_simple_earn_locked_personalleftquota = Entry(
            "simple-earn/locked/personalLeftQuota",
            "sapi",
            "GET",
            '{"cost": 15}',
        )
        self.sapi_get_simple_earn_flexible_subscriptionpreview = Entry(
            "simple-earn/flexible/subscriptionPreview",
            "sapi",
            "GET",
            '{"cost": 15}',
        )
        self.sapi_get_simple_earn_locked_subscriptionpreview = Entry(
            "simple-earn/locked/subscriptionPreview",
            "sapi",
            "GET",
            '{"cost": 15}',
        )
        self.sapi_get_simple_earn_flexible_history_ratehistory = Entry(
            "simple-earn/flexible/history/rateHistory",
            "sapi",
            "GET",
            '{"cost": 15}',
        )
        self.sapi_get_simple_earn_flexible_position = Entry(
            "simple-earn/flexible/position", "sapi", "GET", '{"cost": 15}'
        )
        self.sapi_get_simple_earn_locked_position = Entry(
            "simple-earn/locked/position", "sapi", "GET", '{"cost": 15}'
        )
        self.sapi_get_simple_earn_account = Entry(
            "simple-earn/account", "sapi", "GET", '{"cost": 15}'
        )
        self.sapi_get_simple_earn_flexible_history_subscriptionrecord = Entry(
            "simple-earn/flexible/history/subscriptionRecord",
            "sapi",
            "GET",
            '{"cost": 15}',
        )
        self.sapi_get_simple_earn_locked_history_subscriptionrecord = Entry(
            "simple-earn/locked/history/subscriptionRecord",
            "sapi",
            "GET",
            '{"cost": 15}',
        )
        self.sapi_get_simple_earn_flexible_history_redemptionrecord = Entry(
            "simple-earn/flexible/history/redemptionRecord",
            "sapi",
            "GET",
            '{"cost": 15}',
        )
        self.sapi_get_simple_earn_locked_history_redemptionrecord = Entry(
            "simple-earn/locked/history/redemptionRecord",
            "sapi",
            "GET",
            '{"cost": 15}',
        )
        self.sapi_get_simple_earn_flexible_history_rewardsrecord = Entry(
            "simple-earn/flexible/history/rewardsRecord",
            "sapi",
            "GET",
            '{"cost": 15}',
        )
        self.sapi_get_simple_earn_locked_history_rewardsrecord = Entry(
            "simple-earn/locked/history/rewardsRecord",
            "sapi",
            "GET",
            '{"cost": 15}',
        )
        self.sapi_get_simple_earn_flexible_history_collateralrecord = Entry(
            "simple-earn/flexible/history/collateralRecord",
            "sapi",
            "GET",
            '{"cost": 0.1}',
        )
        self.sapi_get_dci_product_list = Entry(
            "dci/product/list", "sapi", "GET", '{"cost": 0.1}'
        )
        self.sapi_get_dci_product_positions = Entry(
            "dci/product/positions", "sapi", "GET", '{"cost": 0.1}'
        )
        self.sapi_get_dci_product_accounts = Entry(
            "dci/product/accounts", "sapi", "GET", '{"cost": 0.1}'
        )
        self.sapi_post_asset_dust = Entry(
            "asset/dust", "sapi", "POST", '{"cost": 0.06667}'
        )
        self.sapi_post_asset_dust_btc = Entry(
            "asset/dust-btc", "sapi", "POST", '{"cost": 0.1}'
        )
        self.sapi_post_asset_transfer = Entry(
            "asset/transfer", "sapi", "POST", '{"cost": 6.0003}'
        )
        self.sapi_post_asset_get_funding_asset = Entry(
            "asset/get-funding-asset", "sapi", "POST", '{"cost": 0.1}'
        )
        self.sapi_post_asset_convert_transfer = Entry(
            "asset/convert-transfer", "sapi", "POST", '{"cost": 0.033335}'
        )
        self.sapi_post_account_disablefastwithdrawswitch = Entry(
            "account/disableFastWithdrawSwitch", "sapi", "POST", '{"cost": 0.1}'
        )
        self.sapi_post_account_enablefastwithdrawswitch = Entry(
            "account/enableFastWithdrawSwitch", "sapi", "POST", '{"cost": 0.1}'
        )
        self.sapi_post_capital_withdraw_apply = Entry(
            "capital/withdraw/apply", "sapi", "POST", '{"cost": 4.0002}'
        )
        self.sapi_post_capital_contract_convertible_coins = Entry(
            "capital/contract/convertible-coins",
            "sapi",
            "POST",
            '{"cost": 4.0002}',
        )
        self.sapi_post_capital_deposit_credit_apply = Entry(
            "capital/deposit/credit-apply", "sapi", "POST", '{"cost": 0.1}'
        )
        self.sapi_post_margin_borrow_repay = Entry(
            "margin/borrow-repay", "sapi", "POST", '{"cost": 20.001}'
        )
        self.sapi_post_margin_transfer = Entry(
            "margin/transfer", "sapi", "POST", '{"cost": 4.0002}'
        )
        self.sapi_post_margin_loan = Entry(
            "margin/loan", "sapi", "POST", '{"cost": 20.001}'
        )
        self.sapi_post_margin_repay = Entry(
            "margin/repay", "sapi", "POST", '{"cost": 20.001}'
        )
        self.sapi_post_margin_order = Entry(
            "margin/order", "sapi", "POST", '{"cost": 0.040002}'
        )
        self.sapi_post_margin_order_oco = Entry(
            "margin/order/oco", "sapi", "POST", '{"cost": 0.040002}'
        )
        self.sapi_post_margin_dust = Entry(
            "margin/dust", "sapi", "POST", '{"cost": 20.001}'
        )
        self.sapi_post_margin_exchange_small_liability = Entry(
            "margin/exchange-small-liability",
            "sapi",
            "POST",
            '{"cost": 20.001}',
        )
        self.sapi_post_margin_isolated_transfer = Entry(
            "margin/isolated/transfer", "sapi", "POST", '{"cost": 4.0002}'
        )
        self.sapi_post_margin_isolated_account = Entry(
            "margin/isolated/account", "sapi", "POST", '{"cost": 2.0001}'
        )
        self.sapi_post_margin_max_leverage = Entry(
            "margin/max-leverage", "sapi", "POST", '{"cost": 300}'
        )
        self.sapi_post_bnbburn = Entry(
            "bnbBurn", "sapi", "POST", '{"cost": 0.1}'
        )
        self.sapi_post_sub_account_virtualsubaccount = Entry(
            "sub-account/virtualSubAccount", "sapi", "POST", '{"cost": 0.1}'
        )
        self.sapi_post_sub_account_margin_transfer = Entry(
            "sub-account/margin/transfer", "sapi", "POST", '{"cost": 4.0002}'
        )
        self.sapi_post_sub_account_margin_enable = Entry(
            "sub-account/margin/enable", "sapi", "POST", '{"cost": 0.1}'
        )
        self.sapi_post_sub_account_futures_enable = Entry(
            "sub-account/futures/enable", "sapi", "POST", '{"cost": 0.1}'
        )
        self.sapi_post_sub_account_futures_transfer = Entry(
            "sub-account/futures/transfer", "sapi", "POST", '{"cost": 0.1}'
        )
        self.sapi_post_sub_account_futures_internaltransfer = Entry(
            "sub-account/futures/internalTransfer",
            "sapi",
            "POST",
            '{"cost": 0.1}',
        )
        self.sapi_post_sub_account_transfer_subtosub = Entry(
            "sub-account/transfer/subToSub", "sapi", "POST", '{"cost": 0.1}'
        )
        self.sapi_post_sub_account_transfer_subtomaster = Entry(
            "sub-account/transfer/subToMaster", "sapi", "POST", '{"cost": 0.1}'
        )
        self.sapi_post_sub_account_universaltransfer = Entry(
            "sub-account/universalTransfer", "sapi", "POST", '{"cost": 0.1}'
        )
        self.sapi_post_sub_account_options_enable = Entry(
            "sub-account/options/enable", "sapi", "POST", '{"cost": 0.1}'
        )
        self.sapi_post_managed_subaccount_deposit = Entry(
            "managed-subaccount/deposit", "sapi", "POST", '{"cost": 0.1}'
        )
        self.sapi_post_managed_subaccount_withdraw = Entry(
            "managed-subaccount/withdraw", "sapi", "POST", '{"cost": 0.1}'
        )
        self.sapi_post_userdatastream = Entry(
            "userDataStream", "sapi", "POST", '{"cost": 0.1}'
        )
        self.sapi_post_userdatastream_isolated = Entry(
            "userDataStream/isolated", "sapi", "POST", '{"cost": 0.1}'
        )
        self.sapi_post_futures_transfer = Entry(
            "futures/transfer", "sapi", "POST", '{"cost": 0.1}'
        )
        self.sapi_post_lending_customizedfixed_purchase = Entry(
            "lending/customizedFixed/purchase", "sapi", "POST", '{"cost": 0.1}'
        )
        self.sapi_post_lending_daily_purchase = Entry(
            "lending/daily/purchase", "sapi", "POST", '{"cost": 0.1}'
        )
        self.sapi_post_lending_daily_redeem = Entry(
            "lending/daily/redeem", "sapi", "POST", '{"cost": 0.1}'
        )
        self.sapi_post_bswap_liquidityadd = Entry(
            "bswap/liquidityAdd", "sapi", "POST", '{"cost": 60}'
        )
        self.sapi_post_bswap_liquidityremove = Entry(
            "bswap/liquidityRemove", "sapi", "POST", '{"cost": 60}'
        )
        self.sapi_post_bswap_swap = Entry(
            "bswap/swap", "sapi", "POST", '{"cost": 60}'
        )
        self.sapi_post_bswap_claimrewards = Entry(
            "bswap/claimRewards", "sapi", "POST", '{"cost": 6.667}'
        )
        self.sapi_post_blvt_subscribe = Entry(
            "blvt/subscribe", "sapi", "POST", '{"cost": 0.1}'
        )
        self.sapi_post_blvt_redeem = Entry(
            "blvt/redeem", "sapi", "POST", '{"cost": 0.1}'
        )
        self.sapi_post_apireferral_customization = Entry(
            "apiReferral/customization", "sapi", "POST", '{"cost": 1}'
        )
        self.sapi_post_apireferral_usercustomization = Entry(
            "apiReferral/userCustomization", "sapi", "POST", '{"cost": 1}'
        )
        self.sapi_post_apireferral_rebate_historicalrecord = Entry(
            "apiReferral/rebate/historicalRecord", "sapi", "POST", '{"cost": 1}'
        )
        self.sapi_post_apireferral_kickback_historicalrecord = Entry(
            "apiReferral/kickback/historicalRecord",
            "sapi",
            "POST",
            '{"cost": 1}',
        )
        self.sapi_post_broker_subaccount = Entry(
            "broker/subAccount", "sapi", "POST", '{"cost": 1}'
        )
        self.sapi_post_broker_subaccount_margin = Entry(
            "broker/subAccount/margin", "sapi", "POST", '{"cost": 1}'
        )
        self.sapi_post_broker_subaccount_futures = Entry(
            "broker/subAccount/futures", "sapi", "POST", '{"cost": 1}'
        )
        self.sapi_post_broker_subaccountapi = Entry(
            "broker/subAccountApi", "sapi", "POST", '{"cost": 1}'
        )
        self.sapi_post_broker_subaccountapi_permission = Entry(
            "broker/subAccountApi/permission", "sapi", "POST", '{"cost": 1}'
        )
        self.sapi_post_broker_subaccountapi_commission = Entry(
            "broker/subAccountApi/commission", "sapi", "POST", '{"cost": 1}'
        )
        self.sapi_post_broker_subaccountapi_commission_futures = Entry(
            "broker/subAccountApi/commission/futures",
            "sapi",
            "POST",
            '{"cost": 1}',
        )
        self.sapi_post_broker_subaccountapi_commission_coinfutures = Entry(
            "broker/subAccountApi/commission/coinFutures",
            "sapi",
            "POST",
            '{"cost": 1}',
        )
        self.sapi_post_broker_transfer = Entry(
            "broker/transfer", "sapi", "POST", '{"cost": 1}'
        )
        self.sapi_post_broker_transfer_futures = Entry(
            "broker/transfer/futures", "sapi", "POST", '{"cost": 1}'
        )
        self.sapi_post_broker_rebate_historicalrecord = Entry(
            "broker/rebate/historicalRecord", "sapi", "POST", '{"cost": 1}'
        )
        self.sapi_post_broker_subaccount_bnbburn_spot = Entry(
            "broker/subAccount/bnbBurn/spot", "sapi", "POST", '{"cost": 1}'
        )
        self.sapi_post_broker_subaccount_bnbburn_margininterest = Entry(
            "broker/subAccount/bnbBurn/marginInterest",
            "sapi",
            "POST",
            '{"cost": 1}',
        )
        self.sapi_post_broker_subaccount_blvt = Entry(
            "broker/subAccount/blvt", "sapi", "POST", '{"cost": 1}'
        )
        self.sapi_post_broker_subaccountapi_iprestriction = Entry(
            "broker/subAccountApi/ipRestriction", "sapi", "POST", '{"cost": 1}'
        )
        self.sapi_post_broker_subaccountapi_iprestriction_iplist = Entry(
            "broker/subAccountApi/ipRestriction/ipList",
            "sapi",
            "POST",
            '{"cost": 1}',
        )
        self.sapi_post_broker_universaltransfer = Entry(
            "broker/universalTransfer", "sapi", "POST", '{"cost": 1}'
        )
        self.sapi_post_broker_subaccountapi_permission_universaltransfer = (
            Entry(
                "broker/subAccountApi/permission/universalTransfer",
                "sapi",
                "POST",
                '{"cost": 1}',
            )
        )
        self.sapi_post_broker_subaccountapi_permission_vanillaoptions = Entry(
            "broker/subAccountApi/permission/vanillaOptions",
            "sapi",
            "POST",
            '{"cost": 1}',
        )
        self.sapi_post_giftcard_createcode = Entry(
            "giftcard/createCode", "sapi", "POST", '{"cost": 0.1}'
        )
        self.sapi_post_giftcard_redeemcode = Entry(
            "giftcard/redeemCode", "sapi", "POST", '{"cost": 0.1}'
        )
        self.sapi_post_giftcard_buycode = Entry(
            "giftcard/buyCode", "sapi", "POST", '{"cost": 0.1}'
        )
        self.sapi_post_algo_spot_newordertwap = Entry(
            "algo/spot/newOrderTwap", "sapi", "POST", '{"cost": 20.001}'
        )
        self.sapi_post_algo_futures_newordervp = Entry(
            "algo/futures/newOrderVp", "sapi", "POST", '{"cost": 20.001}'
        )
        self.sapi_post_algo_futures_newordertwap = Entry(
            "algo/futures/newOrderTwap", "sapi", "POST", '{"cost": 20.001}'
        )
        self.sapi_post_staking_purchase = Entry(
            "staking/purchase", "sapi", "POST", '{"cost": 0.1}'
        )
        self.sapi_post_staking_redeem = Entry(
            "staking/redeem", "sapi", "POST", '{"cost": 0.1}'
        )
        self.sapi_post_staking_setautostaking = Entry(
            "staking/setAutoStaking", "sapi", "POST", '{"cost": 0.1}'
        )
        self.sapi_post_eth_staking_eth_stake = Entry(
            "eth-staking/eth/stake", "sapi", "POST", '{"cost": 15}'
        )
        self.sapi_post_eth_staking_eth_redeem = Entry(
            "eth-staking/eth/redeem", "sapi", "POST", '{"cost": 15}'
        )
        self.sapi_post_eth_staking_wbeth_wrap = Entry(
            "eth-staking/wbeth/wrap", "sapi", "POST", '{"cost": 15}'
        )
        self.sapi_post_sol_staking_sol_stake = Entry(
            "sol-staking/sol/stake", "sapi", "POST", '{"cost": 15}'
        )
        self.sapi_post_sol_staking_sol_redeem = Entry(
            "sol-staking/sol/redeem", "sapi", "POST", '{"cost": 15}'
        )
        self.sapi_post_mining_hash_transfer_config = Entry(
            "mining/hash-transfer/config", "sapi", "POST", '{"cost": 0.5}'
        )
        self.sapi_post_mining_hash_transfer_config_cancel = Entry(
            "mining/hash-transfer/config/cancel",
            "sapi",
            "POST",
            '{"cost": 0.5}',
        )
        self.sapi_post_portfolio_repay = Entry(
            "portfolio/repay", "sapi", "POST", '{"cost": 20.001}'
        )
        self.sapi_post_loan_vip_renew = Entry(
            "loan/vip/renew", "sapi", "POST", '{"cost": 40.002}'
        )
        self.sapi_post_loan_vip_borrow = Entry(
            "loan/vip/borrow", "sapi", "POST", '{"cost": 40.002}'
        )
        self.sapi_post_loan_borrow = Entry(
            "loan/borrow", "sapi", "POST", '{"cost": 40.002}'
        )
        self.sapi_post_loan_repay = Entry(
            "loan/repay", "sapi", "POST", '{"cost": 40.002}'
        )
        self.sapi_post_loan_adjust_ltv = Entry(
            "loan/adjust/ltv", "sapi", "POST", '{"cost": 40.002}'
        )
        self.sapi_post_loan_customize_margin_call = Entry(
            "loan/customize/margin_call", "sapi", "POST", '{"cost": 40.002}'
        )
        self.sapi_post_loan_flexible_repay = Entry(
            "loan/flexible/repay", "sapi", "POST", '{"cost": 40.002}'
        )
        self.sapi_post_loan_flexible_adjust_ltv = Entry(
            "loan/flexible/adjust/ltv", "sapi", "POST", '{"cost": 40.002}'
        )
        self.sapi_post_loan_vip_repay = Entry(
            "loan/vip/repay", "sapi", "POST", '{"cost": 40.002}'
        )
        self.sapi_post_convert_getquote = Entry(
            "convert/getQuote", "sapi", "POST", '{"cost": 1.3334}'
        )
        self.sapi_post_convert_acceptquote = Entry(
            "convert/acceptQuote", "sapi", "POST", '{"cost": 3.3335}'
        )
        self.sapi_post_convert_limit_placeorder = Entry(
            "convert/limit/placeOrder", "sapi", "POST", '{"cost": 3.3335}'
        )
        self.sapi_post_convert_limit_cancelorder = Entry(
            "convert/limit/cancelOrder", "sapi", "POST", '{"cost": 1.3334}'
        )
        self.sapi_post_portfolio_auto_collection = Entry(
            "portfolio/auto-collection", "sapi", "POST", '{"cost": 150}'
        )
        self.sapi_post_portfolio_asset_collection = Entry(
            "portfolio/asset-collection", "sapi", "POST", '{"cost": 6}'
        )
        self.sapi_post_portfolio_bnb_transfer = Entry(
            "portfolio/bnb-transfer", "sapi", "POST", '{"cost": 150}'
        )
        self.sapi_post_portfolio_repay_futures_switch = Entry(
            "portfolio/repay-futures-switch", "sapi", "POST", '{"cost": 150}'
        )
        self.sapi_post_portfolio_repay_futures_negative_balance = Entry(
            "portfolio/repay-futures-negative-balance",
            "sapi",
            "POST",
            '{"cost": 150}',
        )
        self.sapi_post_lending_auto_invest_plan_add = Entry(
            "lending/auto-invest/plan/add", "sapi", "POST", '{"cost": 0.1}'
        )
        self.sapi_post_lending_auto_invest_plan_edit = Entry(
            "lending/auto-invest/plan/edit", "sapi", "POST", '{"cost": 0.1}'
        )
        self.sapi_post_lending_auto_invest_plan_edit_status = Entry(
            "lending/auto-invest/plan/edit-status",
            "sapi",
            "POST",
            '{"cost": 0.1}',
        )
        self.sapi_post_lending_auto_invest_one_off = Entry(
            "lending/auto-invest/one-off", "sapi", "POST", '{"cost": 0.1}'
        )
        self.sapi_post_lending_auto_invest_redeem = Entry(
            "lending/auto-invest/redeem", "sapi", "POST", '{"cost": 0.1}'
        )
        self.sapi_post_simple_earn_flexible_subscribe = Entry(
            "simple-earn/flexible/subscribe", "sapi", "POST", '{"cost": 0.1}'
        )
        self.sapi_post_simple_earn_locked_subscribe = Entry(
            "simple-earn/locked/subscribe", "sapi", "POST", '{"cost": 0.1}'
        )
        self.sapi_post_simple_earn_flexible_redeem = Entry(
            "simple-earn/flexible/redeem", "sapi", "POST", '{"cost": 0.1}'
        )
        self.sapi_post_simple_earn_locked_redeem = Entry(
            "simple-earn/locked/redeem", "sapi", "POST", '{"cost": 0.1}'
        )
        self.sapi_post_simple_earn_flexible_setautosubscribe = Entry(
            "simple-earn/flexible/setAutoSubscribe",
            "sapi",
            "POST",
            '{"cost": 15}',
        )
        self.sapi_post_simple_earn_locked_setautosubscribe = Entry(
            "simple-earn/locked/setAutoSubscribe",
            "sapi",
            "POST",
            '{"cost": 15}',
        )
        self.sapi_post_simple_earn_locked_setredeemoption = Entry(
            "simple-earn/locked/setRedeemOption", "sapi", "POST", '{"cost": 5}'
        )
        self.sapi_post_dci_product_subscribe = Entry(
            "dci/product/subscribe", "sapi", "POST", '{"cost": 0.1}'
        )
        self.sapi_post_dci_product_auto_compound_edit = Entry(
            "dci/product/auto_compound/edit", "sapi", "POST", '{"cost": 0.1}'
        )
        self.sapi_put_userdatastream = Entry(
            "userDataStream", "sapi", "PUT", '{"cost": 0.1}'
        )
        self.sapi_put_userdatastream_isolated = Entry(
            "userDataStream/isolated", "sapi", "PUT", '{"cost": 0.1}'
        )
        self.sapi_delete_margin_openorders = Entry(
            "margin/openOrders", "sapi", "DELETE", '{"cost": 0.1}'
        )
        self.sapi_delete_margin_order = Entry(
            "margin/order", "sapi", "DELETE", '{"cost": 0.006667}'
        )
        self.sapi_delete_margin_orderlist = Entry(
            "margin/orderList", "sapi", "DELETE", '{"cost": 0.006667}'
        )
        self.sapi_delete_margin_isolated_account = Entry(
            "margin/isolated/account", "sapi", "DELETE", '{"cost": 2.0001}'
        )
        self.sapi_delete_userdatastream = Entry(
            "userDataStream", "sapi", "DELETE", '{"cost": 0.1}'
        )
        self.sapi_delete_userdatastream_isolated = Entry(
            "userDataStream/isolated", "sapi", "DELETE", '{"cost": 0.1}'
        )
        self.sapi_delete_broker_subaccountapi = Entry(
            "broker/subAccountApi", "sapi", "DELETE", '{"cost": 1}'
        )
        self.sapi_delete_broker_subaccountapi_iprestriction_iplist = Entry(
            "broker/subAccountApi/ipRestriction/ipList",
            "sapi",
            "DELETE",
            '{"cost": 1}',
        )
        self.sapi_delete_algo_spot_order = Entry(
            "algo/spot/order", "sapi", "DELETE", '{"cost": 0.1}'
        )
        self.sapi_delete_algo_futures_order = Entry(
            "algo/futures/order", "sapi", "DELETE", '{"cost": 0.1}'
        )
        self.sapi_delete_sub_account_subaccountapi_iprestriction_iplist = Entry(
            "sub-account/subAccountApi/ipRestriction/ipList",
            "sapi",
            "DELETE",
            '{"cost": 20.001}',
        )
        self.sapiv2_get_eth_staking_account = Entry(
            "eth-staking/account", "sapiV2", "GET", '{"cost": 15}'
        )
        self.sapiv2_get_sub_account_futures_account = Entry(
            "sub-account/futures/account", "sapiV2", "GET", '{"cost": 0.1}'
        )
        self.sapiv2_get_sub_account_futures_accountsummary = Entry(
            "sub-account/futures/accountSummary", "sapiV2", "GET", '{"cost": 1}'
        )
        self.sapiv2_get_sub_account_futures_positionrisk = Entry(
            "sub-account/futures/positionRisk", "sapiV2", "GET", '{"cost": 0.1}'
        )
        self.sapiv2_get_loan_flexible_ongoing_orders = Entry(
            "loan/flexible/ongoing/orders", "sapiV2", "GET", '{"cost": 30}'
        )
        self.sapiv2_get_loan_flexible_borrow_history = Entry(
            "loan/flexible/borrow/history", "sapiV2", "GET", '{"cost": 40}'
        )
        self.sapiv2_get_loan_flexible_repay_history = Entry(
            "loan/flexible/repay/history", "sapiV2", "GET", '{"cost": 40}'
        )
        self.sapiv2_get_loan_flexible_ltv_adjustment_history = Entry(
            "loan/flexible/ltv/adjustment/history",
            "sapiV2",
            "GET",
            '{"cost": 40}',
        )
        self.sapiv2_get_loan_flexible_loanable_data = Entry(
            "loan/flexible/loanable/data", "sapiV2", "GET", '{"cost": 40}'
        )
        self.sapiv2_get_loan_flexible_collateral_data = Entry(
            "loan/flexible/collateral/data", "sapiV2", "GET", '{"cost": 40}'
        )
        self.sapiv2_get_portfolio_account = Entry(
            "portfolio/account", "sapiV2", "GET", '{"cost": 2}'
        )
        self.sapiv2_post_eth_staking_eth_stake = Entry(
            "eth-staking/eth/stake", "sapiV2", "POST", '{"cost": 15}'
        )
        self.sapiv2_post_sub_account_subaccountapi_iprestriction = Entry(
            "sub-account/subAccountApi/ipRestriction",
            "sapiV2",
            "POST",
            '{"cost": 20.001}',
        )
        self.sapiv2_post_loan_flexible_borrow = Entry(
            "loan/flexible/borrow", "sapiV2", "POST", '{"cost": 40.002}'
        )
        self.sapiv2_post_loan_flexible_repay = Entry(
            "loan/flexible/repay", "sapiV2", "POST", '{"cost": 40.002}'
        )
        self.sapiv2_post_loan_flexible_adjust_ltv = Entry(
            "loan/flexible/adjust/ltv", "sapiV2", "POST", '{"cost": 40.002}'
        )
        self.sapiv3_get_sub_account_assets = Entry(
            "sub-account/assets", "sapiV3", "GET", '{"cost": 0.40002}'
        )
        self.sapiv3_post_asset_getuserasset = Entry(
            "asset/getUserAsset", "sapiV3", "POST", '{"cost": 0.5}'
        )
        self.sapiv4_get_sub_account_assets = Entry(
            "sub-account/assets", "sapiV4", "GET", '{"cost": 0.40002}'
        )
        self.dapipublic_get_ping = Entry(
            "ping", "dapiPublic", "GET", '{"cost": 1}'
        )
        self.dapipublic_get_time = Entry(
            "time", "dapiPublic", "GET", '{"cost": 1}'
        )
        self.dapipublic_get_exchangeinfo = Entry(
            "exchangeInfo", "dapiPublic", "GET", '{"cost": 1}'
        )
        self.dapipublic_get_depth = Entry(
            "depth",
            "dapiPublic",
            "GET",
            (
                '{"cost": 2, "byLimit": [[50, 2], [100, 5], [500, 10], [1000,'
                " 20]]}"
            ),
        )
        self.dapipublic_get_trades = Entry(
            "trades", "dapiPublic", "GET", '{"cost": 5}'
        )
        self.dapipublic_get_historicaltrades = Entry(
            "historicalTrades", "dapiPublic", "GET", '{"cost": 20}'
        )
        self.dapipublic_get_aggtrades = Entry(
            "aggTrades", "dapiPublic", "GET", '{"cost": 20}'
        )
        self.dapipublic_get_premiumindex = Entry(
            "premiumIndex", "dapiPublic", "GET", '{"cost": 10}'
        )
        self.dapipublic_get_fundingrate = Entry(
            "fundingRate", "dapiPublic", "GET", '{"cost": 1}'
        )
        self.dapipublic_get_klines = Entry(
            "klines",
            "dapiPublic",
            "GET",
            (
                '{"cost": 1, "byLimit": [[99, 1], [499, 2], [1000, 5], [10000,'
                " 10]]}"
            ),
        )
        self.dapipublic_get_continuousklines = Entry(
            "continuousKlines",
            "dapiPublic",
            "GET",
            (
                '{"cost": 1, "byLimit": [[99, 1], [499, 2], [1000, 5], [10000,'
                " 10]]}"
            ),
        )
        self.dapipublic_get_indexpriceklines = Entry(
            "indexPriceKlines",
            "dapiPublic",
            "GET",
            (
                '{"cost": 1, "byLimit": [[99, 1], [499, 2], [1000, 5], [10000,'
                " 10]]}"
            ),
        )
        self.dapipublic_get_markpriceklines = Entry(
            "markPriceKlines",
            "dapiPublic",
            "GET",
            (
                '{"cost": 1, "byLimit": [[99, 1], [499, 2], [1000, 5], [10000,'
                " 10]]}"
            ),
        )
        self.dapipublic_get_premiumindexklines = Entry(
            "premiumIndexKlines",
            "dapiPublic",
            "GET",
            (
                '{"cost": 1, "byLimit": [[99, 1], [499, 2], [1000, 5], [10000,'
                " 10]]}"
            ),
        )
        self.dapipublic_get_ticker_24hr = Entry(
            "ticker/24hr", "dapiPublic", "GET", '{"cost": 1, "noSymbol": 40}'
        )
        self.dapipublic_get_ticker_price = Entry(
            "ticker/price", "dapiPublic", "GET", '{"cost": 1, "noSymbol": 2}'
        )
        self.dapipublic_get_ticker_bookticker = Entry(
            "ticker/bookTicker",
            "dapiPublic",
            "GET",
            '{"cost": 2, "noSymbol": 5}',
        )
        self.dapipublic_get_constituents = Entry(
            "constituents", "dapiPublic", "GET", '{"cost": 2}'
        )
        self.dapipublic_get_openinterest = Entry(
            "openInterest", "dapiPublic", "GET", '{"cost": 1}'
        )
        self.dapipublic_get_fundinginfo = Entry(
            "fundingInfo", "dapiPublic", "GET", '{"cost": 1}'
        )
        self.dapidata_get_delivery_price = Entry(
            "delivery-price", "dapiData", "GET", '{"cost": 1}'
        )
        self.dapidata_get_openinteresthist = Entry(
            "openInterestHist", "dapiData", "GET", '{"cost": 1}'
        )
        self.dapidata_get_toplongshortaccountratio = Entry(
            "topLongShortAccountRatio", "dapiData", "GET", '{"cost": 1}'
        )
        self.dapidata_get_toplongshortpositionratio = Entry(
            "topLongShortPositionRatio", "dapiData", "GET", '{"cost": 1}'
        )
        self.dapidata_get_globallongshortaccountratio = Entry(
            "globalLongShortAccountRatio", "dapiData", "GET", '{"cost": 1}'
        )
        self.dapidata_get_takerbuysellvol = Entry(
            "takerBuySellVol", "dapiData", "GET", '{"cost": 1}'
        )
        self.dapidata_get_basis = Entry(
            "basis", "dapiData", "GET", '{"cost": 1}'
        )
        self.dapiprivate_get_positionside_dual = Entry(
            "positionSide/dual", "dapiPrivate", "GET", '{"cost": 30}'
        )
        self.dapiprivate_get_orderamendment = Entry(
            "orderAmendment", "dapiPrivate", "GET", '{"cost": 1}'
        )
        self.dapiprivate_get_order = Entry(
            "order", "dapiPrivate", "GET", '{"cost": 1}'
        )
        self.dapiprivate_get_openorder = Entry(
            "openOrder", "dapiPrivate", "GET", '{"cost": 1}'
        )
        self.dapiprivate_get_openorders = Entry(
            "openOrders", "dapiPrivate", "GET", '{"cost": 1, "noSymbol": 5}'
        )
        self.dapiprivate_get_allorders = Entry(
            "allOrders", "dapiPrivate", "GET", '{"cost": 20, "noSymbol": 40}'
        )
        self.dapiprivate_get_balance = Entry(
            "balance", "dapiPrivate", "GET", '{"cost": 1}'
        )
        self.dapiprivate_get_account = Entry(
            "account", "dapiPrivate", "GET", '{"cost": 5}'
        )
        self.dapiprivate_get_positionmargin_history = Entry(
            "positionMargin/history", "dapiPrivate", "GET", '{"cost": 1}'
        )
        self.dapiprivate_get_positionrisk = Entry(
            "positionRisk", "dapiPrivate", "GET", '{"cost": 1}'
        )
        self.dapiprivate_get_usertrades = Entry(
            "userTrades", "dapiPrivate", "GET", '{"cost": 20, "noSymbol": 40}'
        )
        self.dapiprivate_get_income = Entry(
            "income", "dapiPrivate", "GET", '{"cost": 20}'
        )
        self.dapiprivate_get_leveragebracket = Entry(
            "leverageBracket", "dapiPrivate", "GET", '{"cost": 1}'
        )
        self.dapiprivate_get_forceorders = Entry(
            "forceOrders", "dapiPrivate", "GET", '{"cost": 20, "noSymbol": 50}'
        )
        self.dapiprivate_get_adlquantile = Entry(
            "adlQuantile", "dapiPrivate", "GET", '{"cost": 5}'
        )
        self.dapiprivate_get_commissionrate = Entry(
            "commissionRate", "dapiPrivate", "GET", '{"cost": 20}'
        )
        self.dapiprivate_get_income_asyn = Entry(
            "income/asyn", "dapiPrivate", "GET", '{"cost": 5}'
        )
        self.dapiprivate_get_income_asyn_id = Entry(
            "income/asyn/id", "dapiPrivate", "GET", '{"cost": 5}'
        )
        self.dapiprivate_get_trade_asyn = Entry(
            "trade/asyn", "dapiPrivate", "GET", '{"cost": 0.5}'
        )
        self.dapiprivate_get_trade_asyn_id = Entry(
            "trade/asyn/id", "dapiPrivate", "GET", '{"cost": 0.5}'
        )
        self.dapiprivate_get_order_asyn = Entry(
            "order/asyn", "dapiPrivate", "GET", '{"cost": 0.5}'
        )
        self.dapiprivate_get_order_asyn_id = Entry(
            "order/asyn/id", "dapiPrivate", "GET", '{"cost": 0.5}'
        )
        self.dapiprivate_get_pmexchangeinfo = Entry(
            "pmExchangeInfo", "dapiPrivate", "GET", '{"cost": 0.5}'
        )
        self.dapiprivate_get_pmaccountinfo = Entry(
            "pmAccountInfo", "dapiPrivate", "GET", '{"cost": 0.5}'
        )
        self.dapiprivate_post_positionside_dual = Entry(
            "positionSide/dual", "dapiPrivate", "POST", '{"cost": 1}'
        )
        self.dapiprivate_post_order = Entry(
            "order", "dapiPrivate", "POST", '{"cost": 4}'
        )
        self.dapiprivate_post_batchorders = Entry(
            "batchOrders", "dapiPrivate", "POST", '{"cost": 5}'
        )
        self.dapiprivate_post_countdowncancelall = Entry(
            "countdownCancelAll", "dapiPrivate", "POST", '{"cost": 10}'
        )
        self.dapiprivate_post_leverage = Entry(
            "leverage", "dapiPrivate", "POST", '{"cost": 1}'
        )
        self.dapiprivate_post_margintype = Entry(
            "marginType", "dapiPrivate", "POST", '{"cost": 1}'
        )
        self.dapiprivate_post_positionmargin = Entry(
            "positionMargin", "dapiPrivate", "POST", '{"cost": 1}'
        )
        self.dapiprivate_post_listenkey = Entry(
            "listenKey", "dapiPrivate", "POST", '{"cost": 1}'
        )
        self.dapiprivate_put_listenkey = Entry(
            "listenKey", "dapiPrivate", "PUT", '{"cost": 1}'
        )
        self.dapiprivate_put_order = Entry(
            "order", "dapiPrivate", "PUT", '{"cost": 1}'
        )
        self.dapiprivate_put_batchorders = Entry(
            "batchOrders", "dapiPrivate", "PUT", '{"cost": 5}'
        )
        self.dapiprivate_delete_order = Entry(
            "order", "dapiPrivate", "DELETE", '{"cost": 1}'
        )
        self.dapiprivate_delete_allopenorders = Entry(
            "allOpenOrders", "dapiPrivate", "DELETE", '{"cost": 1}'
        )
        self.dapiprivate_delete_batchorders = Entry(
            "batchOrders", "dapiPrivate", "DELETE", '{"cost": 5}'
        )
        self.dapiprivate_delete_listenkey = Entry(
            "listenKey", "dapiPrivate", "DELETE", '{"cost": 1}'
        )
        self.dapiprivatev2_get_leveragebracket = Entry(
            "leverageBracket", "dapiPrivateV2", "GET", '{"cost": 1}'
        )
        self.fapipublic_get_ping = Entry(
            "ping", "fapiPublic", "GET", '{"cost": 1}'
        )
        self.fapipublic_get_time = Entry(
            "time", "fapiPublic", "GET", '{"cost": 1}'
        )
        self.fapipublic_get_exchangeinfo = Entry(
            "exchangeInfo", "fapiPublic", "GET", '{"cost": 1}'
        )
        self.fapipublic_get_depth = Entry(
            "depth",
            "fapiPublic",
            "GET",
            (
                '{"cost": 2, "byLimit": [[50, 2], [100, 5], [500, 10], [1000,'
                " 20]]}"
            ),
        )
        self.fapipublic_get_trades = Entry(
            "trades", "fapiPublic", "GET", '{"cost": 5}'
        )
        self.fapipublic_get_historicaltrades = Entry(
            "historicalTrades", "fapiPublic", "GET", '{"cost": 20}'
        )
        self.fapipublic_get_aggtrades = Entry(
            "aggTrades", "fapiPublic", "GET", '{"cost": 20}'
        )
        self.fapipublic_get_klines = Entry(
            "klines",
            "fapiPublic",
            "GET",
            (
                '{"cost": 1, "byLimit": [[99, 1], [499, 2], [1000, 5], [10000,'
                " 10]]}"
            ),
        )
        self.fapipublic_get_continuousklines = Entry(
            "continuousKlines",
            "fapiPublic",
            "GET",
            (
                '{"cost": 1, "byLimit": [[99, 1], [499, 2], [1000, 5], [10000,'
                " 10]]}"
            ),
        )
        self.fapipublic_get_markpriceklines = Entry(
            "markPriceKlines",
            "fapiPublic",
            "GET",
            (
                '{"cost": 1, "byLimit": [[99, 1], [499, 2], [1000, 5], [10000,'
                " 10]]}"
            ),
        )
        self.fapipublic_get_indexpriceklines = Entry(
            "indexPriceKlines",
            "fapiPublic",
            "GET",
            (
                '{"cost": 1, "byLimit": [[99, 1], [499, 2], [1000, 5], [10000,'
                " 10]]}"
            ),
        )
        self.fapipublic_get_premiumindexklines = Entry(
            "premiumIndexKlines",
            "fapiPublic",
            "GET",
            (
                '{"cost": 1, "byLimit": [[99, 1], [499, 2], [1000, 5], [10000,'
                " 10]]}"
            ),
        )
        self.fapipublic_get_fundingrate = Entry(
            "fundingRate", "fapiPublic", "GET", '{"cost": 1}'
        )
        self.fapipublic_get_fundinginfo = Entry(
            "fundingInfo", "fapiPublic", "GET", '{"cost": 1}'
        )
        self.fapipublic_get_premiumindex = Entry(
            "premiumIndex", "fapiPublic", "GET", '{"cost": 1}'
        )
        self.fapipublic_get_ticker_24hr = Entry(
            "ticker/24hr", "fapiPublic", "GET", '{"cost": 1, "noSymbol": 40}'
        )
        self.fapipublic_get_ticker_price = Entry(
            "ticker/price", "fapiPublic", "GET", '{"cost": 1, "noSymbol": 2}'
        )
        self.fapipublic_get_ticker_bookticker = Entry(
            "ticker/bookTicker",
            "fapiPublic",
            "GET",
            '{"cost": 1, "noSymbol": 2}',
        )
        self.fapipublic_get_openinterest = Entry(
            "openInterest", "fapiPublic", "GET", '{"cost": 1}'
        )
        self.fapipublic_get_indexinfo = Entry(
            "indexInfo", "fapiPublic", "GET", '{"cost": 1}'
        )
        self.fapipublic_get_assetindex = Entry(
            "assetIndex", "fapiPublic", "GET", '{"cost": 1, "noSymbol": 10}'
        )
        self.fapipublic_get_constituents = Entry(
            "constituents", "fapiPublic", "GET", '{"cost": 2}'
        )
        self.fapipublic_get_apitradingstatus = Entry(
            "apiTradingStatus",
            "fapiPublic",
            "GET",
            '{"cost": 1, "noSymbol": 10}',
        )
        self.fapipublic_get_lvtklines = Entry(
            "lvtKlines", "fapiPublic", "GET", '{"cost": 1}'
        )
        self.fapipublic_get_convert_exchangeinfo = Entry(
            "convert/exchangeInfo", "fapiPublic", "GET", '{"cost": 4}'
        )
        self.fapidata_get_delivery_price = Entry(
            "delivery-price", "fapiData", "GET", '{"cost": 1}'
        )
        self.fapidata_get_openinteresthist = Entry(
            "openInterestHist", "fapiData", "GET", '{"cost": 1}'
        )
        self.fapidata_get_toplongshortaccountratio = Entry(
            "topLongShortAccountRatio", "fapiData", "GET", '{"cost": 1}'
        )
        self.fapidata_get_toplongshortpositionratio = Entry(
            "topLongShortPositionRatio", "fapiData", "GET", '{"cost": 1}'
        )
        self.fapidata_get_globallongshortaccountratio = Entry(
            "globalLongShortAccountRatio", "fapiData", "GET", '{"cost": 1}'
        )
        self.fapidata_get_takerlongshortratio = Entry(
            "takerlongshortRatio", "fapiData", "GET", '{"cost": 1}'
        )
        self.fapidata_get_basis = Entry(
            "basis", "fapiData", "GET", '{"cost": 1}'
        )
        self.fapiprivate_get_forceorders = Entry(
            "forceOrders", "fapiPrivate", "GET", '{"cost": 20, "noSymbol": 50}'
        )
        self.fapiprivate_get_allorders = Entry(
            "allOrders", "fapiPrivate", "GET", '{"cost": 5}'
        )
        self.fapiprivate_get_openorder = Entry(
            "openOrder", "fapiPrivate", "GET", '{"cost": 1}'
        )
        self.fapiprivate_get_openorders = Entry(
            "openOrders", "fapiPrivate", "GET", '{"cost": 1, "noSymbol": 40}'
        )
        self.fapiprivate_get_order = Entry(
            "order", "fapiPrivate", "GET", '{"cost": 1}'
        )
        self.fapiprivate_get_account = Entry(
            "account", "fapiPrivate", "GET", '{"cost": 5}'
        )
        self.fapiprivate_get_balance = Entry(
            "balance", "fapiPrivate", "GET", '{"cost": 5}'
        )
        self.fapiprivate_get_leveragebracket = Entry(
            "leverageBracket", "fapiPrivate", "GET", '{"cost": 1}'
        )
        self.fapiprivate_get_positionmargin_history = Entry(
            "positionMargin/history", "fapiPrivate", "GET", '{"cost": 1}'
        )
        self.fapiprivate_get_positionrisk = Entry(
            "positionRisk", "fapiPrivate", "GET", '{"cost": 5}'
        )
        self.fapiprivate_get_positionside_dual = Entry(
            "positionSide/dual", "fapiPrivate", "GET", '{"cost": 30}'
        )
        self.fapiprivate_get_usertrades = Entry(
            "userTrades", "fapiPrivate", "GET", '{"cost": 5}'
        )
        self.fapiprivate_get_income = Entry(
            "income", "fapiPrivate", "GET", '{"cost": 30}'
        )
        self.fapiprivate_get_commissionrate = Entry(
            "commissionRate", "fapiPrivate", "GET", '{"cost": 20}'
        )
        self.fapiprivate_get_ratelimit_order = Entry(
            "rateLimit/order", "fapiPrivate", "GET", '{"cost": 1}'
        )
        self.fapiprivate_get_apitradingstatus = Entry(
            "apiTradingStatus", "fapiPrivate", "GET", '{"cost": 1}'
        )
        self.fapiprivate_get_multiassetsmargin = Entry(
            "multiAssetsMargin", "fapiPrivate", "GET", '{"cost": 30}'
        )
        self.fapiprivate_get_apireferral_ifnewuser = Entry(
            "apiReferral/ifNewUser", "fapiPrivate", "GET", '{"cost": 1}'
        )
        self.fapiprivate_get_apireferral_customization = Entry(
            "apiReferral/customization", "fapiPrivate", "GET", '{"cost": 1}'
        )
        self.fapiprivate_get_apireferral_usercustomization = Entry(
            "apiReferral/userCustomization", "fapiPrivate", "GET", '{"cost": 1}'
        )
        self.fapiprivate_get_apireferral_tradernum = Entry(
            "apiReferral/traderNum", "fapiPrivate", "GET", '{"cost": 1}'
        )
        self.fapiprivate_get_apireferral_overview = Entry(
            "apiReferral/overview", "fapiPrivate", "GET", '{"cost": 1}'
        )
        self.fapiprivate_get_apireferral_tradevol = Entry(
            "apiReferral/tradeVol", "fapiPrivate", "GET", '{"cost": 1}'
        )
        self.fapiprivate_get_apireferral_rebatevol = Entry(
            "apiReferral/rebateVol", "fapiPrivate", "GET", '{"cost": 1}'
        )
        self.fapiprivate_get_apireferral_tradersummary = Entry(
            "apiReferral/traderSummary", "fapiPrivate", "GET", '{"cost": 1}'
        )
        self.fapiprivate_get_adlquantile = Entry(
            "adlQuantile", "fapiPrivate", "GET", '{"cost": 5}'
        )
        self.fapiprivate_get_pmaccountinfo = Entry(
            "pmAccountInfo", "fapiPrivate", "GET", '{"cost": 5}'
        )
        self.fapiprivate_get_orderamendment = Entry(
            "orderAmendment", "fapiPrivate", "GET", '{"cost": 1}'
        )
        self.fapiprivate_get_income_asyn = Entry(
            "income/asyn", "fapiPrivate", "GET", '{"cost": 1000}'
        )
        self.fapiprivate_get_income_asyn_id = Entry(
            "income/asyn/id", "fapiPrivate", "GET", '{"cost": 10}'
        )
        self.fapiprivate_get_order_asyn = Entry(
            "order/asyn", "fapiPrivate", "GET", '{"cost": 1000}'
        )
        self.fapiprivate_get_order_asyn_id = Entry(
            "order/asyn/id", "fapiPrivate", "GET", '{"cost": 10}'
        )
        self.fapiprivate_get_trade_asyn = Entry(
            "trade/asyn", "fapiPrivate", "GET", '{"cost": 1000}'
        )
        self.fapiprivate_get_trade_asyn_id = Entry(
            "trade/asyn/id", "fapiPrivate", "GET", '{"cost": 10}'
        )
        self.fapiprivate_get_feeburn = Entry(
            "feeBurn", "fapiPrivate", "GET", '{"cost": 1}'
        )
        self.fapiprivate_get_symbolconfig = Entry(
            "symbolConfig", "fapiPrivate", "GET", '{"cost": 5}'
        )
        self.fapiprivate_get_accountconfig = Entry(
            "accountConfig", "fapiPrivate", "GET", '{"cost": 5}'
        )
        self.fapiprivate_get_convert_orderstatus = Entry(
            "convert/orderStatus", "fapiPrivate", "GET", '{"cost": 5}'
        )
        self.fapiprivate_post_batchorders = Entry(
            "batchOrders", "fapiPrivate", "POST", '{"cost": 5}'
        )
        self.fapiprivate_post_positionside_dual = Entry(
            "positionSide/dual", "fapiPrivate", "POST", '{"cost": 1}'
        )
        self.fapiprivate_post_positionmargin = Entry(
            "positionMargin", "fapiPrivate", "POST", '{"cost": 1}'
        )
        self.fapiprivate_post_margintype = Entry(
            "marginType", "fapiPrivate", "POST", '{"cost": 1}'
        )
        self.fapiprivate_post_order = Entry(
            "order", "fapiPrivate", "POST", '{"cost": 4}'
        )
        self.fapiprivate_post_leverage = Entry(
            "leverage", "fapiPrivate", "POST", '{"cost": 1}'
        )
        self.fapiprivate_post_listenkey = Entry(
            "listenKey", "fapiPrivate", "POST", '{"cost": 1}'
        )
        self.fapiprivate_post_countdowncancelall = Entry(
            "countdownCancelAll", "fapiPrivate", "POST", '{"cost": 10}'
        )
        self.fapiprivate_post_multiassetsmargin = Entry(
            "multiAssetsMargin", "fapiPrivate", "POST", '{"cost": 1}'
        )
        self.fapiprivate_post_apireferral_customization = Entry(
            "apiReferral/customization", "fapiPrivate", "POST", '{"cost": 1}'
        )
        self.fapiprivate_post_apireferral_usercustomization = Entry(
            "apiReferral/userCustomization",
            "fapiPrivate",
            "POST",
            '{"cost": 1}',
        )
        self.fapiprivate_post_feeburn = Entry(
            "feeBurn", "fapiPrivate", "POST", '{"cost": 1}'
        )
        self.fapiprivate_post_convert_getquote = Entry(
            "convert/getQuote", "fapiPrivate", "POST", '{"cost": 200}'
        )
        self.fapiprivate_post_convert_acceptquote = Entry(
            "convert/acceptQuote", "fapiPrivate", "POST", '{"cost": 20}'
        )
        self.fapiprivate_put_listenkey = Entry(
            "listenKey", "fapiPrivate", "PUT", '{"cost": 1}'
        )
        self.fapiprivate_put_order = Entry(
            "order", "fapiPrivate", "PUT", '{"cost": 1}'
        )
        self.fapiprivate_put_batchorders = Entry(
            "batchOrders", "fapiPrivate", "PUT", '{"cost": 5}'
        )
        self.fapiprivate_delete_batchorders = Entry(
            "batchOrders", "fapiPrivate", "DELETE", '{"cost": 1}'
        )
        self.fapiprivate_delete_order = Entry(
            "order", "fapiPrivate", "DELETE", '{"cost": 1}'
        )
        self.fapiprivate_delete_allopenorders = Entry(
            "allOpenOrders", "fapiPrivate", "DELETE", '{"cost": 1}'
        )
        self.fapiprivate_delete_listenkey = Entry(
            "listenKey", "fapiPrivate", "DELETE", '{"cost": 1}'
        )
        self.fapipublicv2_get_ticker_price = Entry(
            "ticker/price", "fapiPublicV2", "GET", '{"cost": 0}'
        )
        self.fapiprivatev2_get_account = Entry(
            "account", "fapiPrivateV2", "GET", '{"cost": 1}'
        )
        self.fapiprivatev2_get_balance = Entry(
            "balance", "fapiPrivateV2", "GET", '{"cost": 1}'
        )
        self.fapiprivatev2_get_positionrisk = Entry(
            "positionRisk", "fapiPrivateV2", "GET", '{"cost": 1}'
        )
        self.fapiprivatev3_get_account = Entry(
            "account", "fapiPrivateV3", "GET", '{"cost": 1}'
        )
        self.fapiprivatev3_get_balance = Entry(
            "balance", "fapiPrivateV3", "GET", '{"cost": 1}'
        )
        self.fapiprivatev3_get_positionrisk = Entry(
            "positionRisk", "fapiPrivateV3", "GET", '{"cost": 1}'
        )
        self.eapipublic_get_ping = Entry(
            "ping", "eapiPublic", "GET", '{"cost": 1}'
        )
        self.eapipublic_get_time = Entry(
            "time", "eapiPublic", "GET", '{"cost": 1}'
        )
        self.eapipublic_get_exchangeinfo = Entry(
            "exchangeInfo", "eapiPublic", "GET", '{"cost": 1}'
        )
        self.eapipublic_get_index = Entry(
            "index", "eapiPublic", "GET", '{"cost": 1}'
        )
        self.eapipublic_get_ticker = Entry(
            "ticker", "eapiPublic", "GET", '{"cost": 5}'
        )
        self.eapipublic_get_mark = Entry(
            "mark", "eapiPublic", "GET", '{"cost": 5}'
        )
        self.eapipublic_get_depth = Entry(
            "depth", "eapiPublic", "GET", '{"cost": 1}'
        )
        self.eapipublic_get_klines = Entry(
            "klines", "eapiPublic", "GET", '{"cost": 1}'
        )
        self.eapipublic_get_trades = Entry(
            "trades", "eapiPublic", "GET", '{"cost": 5}'
        )
        self.eapipublic_get_historicaltrades = Entry(
            "historicalTrades", "eapiPublic", "GET", '{"cost": 20}'
        )
        self.eapipublic_get_exercisehistory = Entry(
            "exerciseHistory", "eapiPublic", "GET", '{"cost": 3}'
        )
        self.eapipublic_get_openinterest = Entry(
            "openInterest", "eapiPublic", "GET", '{"cost": 3}'
        )
        self.eapiprivate_get_account = Entry(
            "account", "eapiPrivate", "GET", '{"cost": 3}'
        )
        self.eapiprivate_get_position = Entry(
            "position", "eapiPrivate", "GET", '{"cost": 5}'
        )
        self.eapiprivate_get_openorders = Entry(
            "openOrders", "eapiPrivate", "GET", '{"cost": 1, "noSymbol": 40}'
        )
        self.eapiprivate_get_historyorders = Entry(
            "historyOrders", "eapiPrivate", "GET", '{"cost": 3}'
        )
        self.eapiprivate_get_usertrades = Entry(
            "userTrades", "eapiPrivate", "GET", '{"cost": 5}'
        )
        self.eapiprivate_get_exerciserecord = Entry(
            "exerciseRecord", "eapiPrivate", "GET", '{"cost": 5}'
        )
        self.eapiprivate_get_bill = Entry(
            "bill", "eapiPrivate", "GET", '{"cost": 1}'
        )
        self.eapiprivate_get_income_asyn = Entry(
            "income/asyn", "eapiPrivate", "GET", '{"cost": 5}'
        )
        self.eapiprivate_get_income_asyn_id = Entry(
            "income/asyn/id", "eapiPrivate", "GET", '{"cost": 5}'
        )
        self.eapiprivate_get_marginaccount = Entry(
            "marginAccount", "eapiPrivate", "GET", '{"cost": 3}'
        )
        self.eapiprivate_get_mmp = Entry(
            "mmp", "eapiPrivate", "GET", '{"cost": 1}'
        )
        self.eapiprivate_get_countdowncancelall = Entry(
            "countdownCancelAll", "eapiPrivate", "GET", '{"cost": 1}'
        )
        self.eapiprivate_get_order = Entry(
            "order", "eapiPrivate", "GET", '{"cost": 1}'
        )
        self.eapiprivate_get_block_order_orders = Entry(
            "block/order/orders", "eapiPrivate", "GET", '{"cost": 5}'
        )
        self.eapiprivate_get_block_order_execute = Entry(
            "block/order/execute", "eapiPrivate", "GET", '{"cost": 5}'
        )
        self.eapiprivate_get_block_user_trades = Entry(
            "block/user-trades", "eapiPrivate", "GET", '{"cost": 5}'
        )
        self.eapiprivate_post_order = Entry(
            "order", "eapiPrivate", "POST", '{"cost": 1}'
        )
        self.eapiprivate_post_batchorders = Entry(
            "batchOrders", "eapiPrivate", "POST", '{"cost": 5}'
        )
        self.eapiprivate_post_listenkey = Entry(
            "listenKey", "eapiPrivate", "POST", '{"cost": 1}'
        )
        self.eapiprivate_post_mmpset = Entry(
            "mmpSet", "eapiPrivate", "POST", '{"cost": 1}'
        )
        self.eapiprivate_post_mmpreset = Entry(
            "mmpReset", "eapiPrivate", "POST", '{"cost": 1}'
        )
        self.eapiprivate_post_countdowncancelall = Entry(
            "countdownCancelAll", "eapiPrivate", "POST", '{"cost": 1}'
        )
        self.eapiprivate_post_countdowncancelallheartbeat = Entry(
            "countdownCancelAllHeartBeat", "eapiPrivate", "POST", '{"cost": 10}'
        )
        self.eapiprivate_post_block_order_create = Entry(
            "block/order/create", "eapiPrivate", "POST", '{"cost": 5}'
        )
        self.eapiprivate_post_block_order_execute = Entry(
            "block/order/execute", "eapiPrivate", "POST", '{"cost": 5}'
        )
        self.eapiprivate_put_listenkey = Entry(
            "listenKey", "eapiPrivate", "PUT", '{"cost": 1}'
        )
        self.eapiprivate_put_block_order_create = Entry(
            "block/order/create", "eapiPrivate", "PUT", '{"cost": 5}'
        )
        self.eapiprivate_delete_order = Entry(
            "order", "eapiPrivate", "DELETE", '{"cost": 1}'
        )
        self.eapiprivate_delete_batchorders = Entry(
            "batchOrders", "eapiPrivate", "DELETE", '{"cost": 1}'
        )
        self.eapiprivate_delete_allopenorders = Entry(
            "allOpenOrders", "eapiPrivate", "DELETE", '{"cost": 1}'
        )
        self.eapiprivate_delete_allopenordersbyunderlying = Entry(
            "allOpenOrdersByUnderlying", "eapiPrivate", "DELETE", '{"cost": 1}'
        )
        self.eapiprivate_delete_listenkey = Entry(
            "listenKey", "eapiPrivate", "DELETE", '{"cost": 1}'
        )
        self.eapiprivate_delete_block_order_create = Entry(
            "block/order/create", "eapiPrivate", "DELETE", '{"cost": 5}'
        )
        self.public_get_ping = Entry("ping", "public", "GET", '{"cost": 0.2}')
        self.public_get_time = Entry("time", "public", "GET", '{"cost": 0.2}')
        self.public_get_depth = Entry(
            "depth",
            "public",
            "GET",
            (
                '{"cost": 1, "byLimit": [[100, 1], [500, 5], [1000, 10], [5000,'
                " 50]]}"
            ),
        )
        self.public_get_trades = Entry("trades", "public", "GET", '{"cost": 2}')
        self.public_get_aggtrades = Entry(
            "aggTrades", "public", "GET", '{"cost": 0.4}'
        )
        self.public_get_historicaltrades = Entry(
            "historicalTrades", "public", "GET", '{"cost": 2}'
        )
        self.public_get_klines = Entry(
            "klines", "public", "GET", '{"cost": 0.4}'
        )
        self.public_get_uiklines = Entry(
            "uiKlines", "public", "GET", '{"cost": 0.4}'
        )
        self.public_get_ticker_24hr = Entry(
            "ticker/24hr", "public", "GET", '{"cost": 0.4, "noSymbol": 16}'
        )
        self.public_get_ticker = Entry(
            "ticker", "public", "GET", '{"cost": 0.4, "noSymbol": 16}'
        )
        self.public_get_ticker_tradingday = Entry(
            "ticker/tradingDay", "public", "GET", '{"cost": 0.8}'
        )
        self.public_get_ticker_price = Entry(
            "ticker/price", "public", "GET", '{"cost": 0.4, "noSymbol": 0.8}'
        )
        self.public_get_ticker_bookticker = Entry(
            "ticker/bookTicker",
            "public",
            "GET",
            '{"cost": 0.4, "noSymbol": 0.8}',
        )
        self.public_get_exchangeinfo = Entry(
            "exchangeInfo", "public", "GET", '{"cost": 4}'
        )
        self.public_get_avgprice = Entry(
            "avgPrice", "public", "GET", '{"cost": 0.4}'
        )
        self.public_put_userdatastream = Entry(
            "userDataStream", "public", "PUT", '{"cost": 0.4}'
        )
        self.public_post_userdatastream = Entry(
            "userDataStream", "public", "POST", '{"cost": 0.4}'
        )
        self.public_delete_userdatastream = Entry(
            "userDataStream", "public", "DELETE", '{"cost": 0.4}'
        )
        self.private_get_allorderlist = Entry(
            "allOrderList", "private", "GET", '{"cost": 4}'
        )
        self.private_get_openorderlist = Entry(
            "openOrderList", "private", "GET", '{"cost": 1.2}'
        )
        self.private_get_orderlist = Entry(
            "orderList", "private", "GET", '{"cost": 0.8}'
        )
        self.private_get_order = Entry(
            "order", "private", "GET", '{"cost": 0.8}'
        )
        self.private_get_openorders = Entry(
            "openOrders", "private", "GET", '{"cost": 1.2, "noSymbol": 16}'
        )
        self.private_get_allorders = Entry(
            "allOrders", "private", "GET", '{"cost": 4}'
        )
        self.private_get_account = Entry(
            "account", "private", "GET", '{"cost": 4}'
        )
        self.private_get_mytrades = Entry(
            "myTrades", "private", "GET", '{"cost": 4}'
        )
        self.private_get_ratelimit_order = Entry(
            "rateLimit/order", "private", "GET", '{"cost": 8}'
        )
        self.private_get_mypreventedmatches = Entry(
            "myPreventedMatches", "private", "GET", '{"cost": 4}'
        )
        self.private_get_myallocations = Entry(
            "myAllocations", "private", "GET", '{"cost": 4}'
        )
        self.private_get_account_commission = Entry(
            "account/commission", "private", "GET", '{"cost": 4}'
        )
        self.private_post_order_oco = Entry(
            "order/oco", "private", "POST", '{"cost": 0.2}'
        )
        self.private_post_orderlist_oco = Entry(
            "orderList/oco", "private", "POST", '{"cost": 0.2}'
        )
        self.private_post_orderlist_oto = Entry(
            "orderList/oto", "private", "POST", '{"cost": 0.2}'
        )
        self.private_post_orderlist_otoco = Entry(
            "orderList/otoco", "private", "POST", '{"cost": 0.2}'
        )
        self.private_post_sor_order = Entry(
            "sor/order", "private", "POST", '{"cost": 0.2}'
        )
        self.private_post_sor_order_test = Entry(
            "sor/order/test", "private", "POST", '{"cost": 0.2}'
        )
        self.private_post_order = Entry(
            "order", "private", "POST", '{"cost": 0.2}'
        )
        self.private_post_order_cancelreplace = Entry(
            "order/cancelReplace", "private", "POST", '{"cost": 0.2}'
        )
        self.private_post_order_test = Entry(
            "order/test", "private", "POST", '{"cost": 0.2}'
        )
        self.private_delete_openorders = Entry(
            "openOrders", "private", "DELETE", '{"cost": 0.2}'
        )
        self.private_delete_orderlist = Entry(
            "orderList", "private", "DELETE", '{"cost": 0.2}'
        )
        self.private_delete_order = Entry(
            "order", "private", "DELETE", '{"cost": 0.2}'
        )
        self.papi_get_ping = Entry("ping", "papi", "GET", '{"cost": 0.2}')
        self.papi_get_um_order = Entry("um/order", "papi", "GET", '{"cost": 1}')
        self.papi_get_um_openorder = Entry(
            "um/openOrder", "papi", "GET", '{"cost": 1}'
        )
        self.papi_get_um_openorders = Entry(
            "um/openOrders", "papi", "GET", '{"cost": 1, "noSymbol": 40}'
        )
        self.papi_get_um_allorders = Entry(
            "um/allOrders", "papi", "GET", '{"cost": 5}'
        )
        self.papi_get_cm_order = Entry("cm/order", "papi", "GET", '{"cost": 1}')
        self.papi_get_cm_openorder = Entry(
            "cm/openOrder", "papi", "GET", '{"cost": 1}'
        )
        self.papi_get_cm_openorders = Entry(
            "cm/openOrders", "papi", "GET", '{"cost": 1, "noSymbol": 40}'
        )
        self.papi_get_cm_allorders = Entry(
            "cm/allOrders", "papi", "GET", '{"cost": 20}'
        )
        self.papi_get_um_conditional_openorder = Entry(
            "um/conditional/openOrder", "papi", "GET", '{"cost": 1}'
        )
        self.papi_get_um_conditional_openorders = Entry(
            "um/conditional/openOrders",
            "papi",
            "GET",
            '{"cost": 1, "noSymbol": 40}',
        )
        self.papi_get_um_conditional_orderhistory = Entry(
            "um/conditional/orderHistory", "papi", "GET", '{"cost": 1}'
        )
        self.papi_get_um_conditional_allorders = Entry(
            "um/conditional/allOrders",
            "papi",
            "GET",
            '{"cost": 1, "noSymbol": 40}',
        )
        self.papi_get_cm_conditional_openorder = Entry(
            "cm/conditional/openOrder", "papi", "GET", '{"cost": 1}'
        )
        self.papi_get_cm_conditional_openorders = Entry(
            "cm/conditional/openOrders",
            "papi",
            "GET",
            '{"cost": 1, "noSymbol": 40}',
        )
        self.papi_get_cm_conditional_orderhistory = Entry(
            "cm/conditional/orderHistory", "papi", "GET", '{"cost": 1}'
        )
        self.papi_get_cm_conditional_allorders = Entry(
            "cm/conditional/allOrders", "papi", "GET", '{"cost": 40}'
        )
        self.papi_get_margin_order = Entry(
            "margin/order", "papi", "GET", '{"cost": 10}'
        )
        self.papi_get_margin_openorders = Entry(
            "margin/openOrders", "papi", "GET", '{"cost": 5}'
        )
        self.papi_get_margin_allorders = Entry(
            "margin/allOrders", "papi", "GET", '{"cost": 100}'
        )
        self.papi_get_margin_orderlist = Entry(
            "margin/orderList", "papi", "GET", '{"cost": 5}'
        )
        self.papi_get_margin_allorderlist = Entry(
            "margin/allOrderList", "papi", "GET", '{"cost": 100}'
        )
        self.papi_get_margin_openorderlist = Entry(
            "margin/openOrderList", "papi", "GET", '{"cost": 5}'
        )
        self.papi_get_margin_mytrades = Entry(
            "margin/myTrades", "papi", "GET", '{"cost": 5}'
        )
        self.papi_get_balance = Entry("balance", "papi", "GET", '{"cost": 4}')
        self.papi_get_account = Entry("account", "papi", "GET", '{"cost": 4}')
        self.papi_get_margin_maxborrowable = Entry(
            "margin/maxBorrowable", "papi", "GET", '{"cost": 1}'
        )
        self.papi_get_margin_maxwithdraw = Entry(
            "margin/maxWithdraw", "papi", "GET", '{"cost": 1}'
        )
        self.papi_get_um_positionrisk = Entry(
            "um/positionRisk", "papi", "GET", '{"cost": 1}'
        )
        self.papi_get_cm_positionrisk = Entry(
            "cm/positionRisk", "papi", "GET", '{"cost": 0.2}'
        )
        self.papi_get_um_positionside_dual = Entry(
            "um/positionSide/dual", "papi", "GET", '{"cost": 6}'
        )
        self.papi_get_cm_positionside_dual = Entry(
            "cm/positionSide/dual", "papi", "GET", '{"cost": 6}'
        )
        self.papi_get_um_usertrades = Entry(
            "um/userTrades", "papi", "GET", '{"cost": 5}'
        )
        self.papi_get_cm_usertrades = Entry(
            "cm/userTrades", "papi", "GET", '{"cost": 20}'
        )
        self.papi_get_um_leveragebracket = Entry(
            "um/leverageBracket", "papi", "GET", '{"cost": 0.2}'
        )
        self.papi_get_cm_leveragebracket = Entry(
            "cm/leverageBracket", "papi", "GET", '{"cost": 0.2}'
        )
        self.papi_get_margin_forceorders = Entry(
            "margin/forceOrders", "papi", "GET", '{"cost": 1}'
        )
        self.papi_get_um_forceorders = Entry(
            "um/forceOrders", "papi", "GET", '{"cost": 20, "noSymbol": 50}'
        )
        self.papi_get_cm_forceorders = Entry(
            "cm/forceOrders", "papi", "GET", '{"cost": 20, "noSymbol": 50}'
        )
        self.papi_get_um_apitradingstatus = Entry(
            "um/apiTradingStatus", "papi", "GET", '{"cost": 0.2, "noSymbol": 2}'
        )
        self.papi_get_um_commissionrate = Entry(
            "um/commissionRate", "papi", "GET", '{"cost": 4}'
        )
        self.papi_get_cm_commissionrate = Entry(
            "cm/commissionRate", "papi", "GET", '{"cost": 4}'
        )
        self.papi_get_margin_marginloan = Entry(
            "margin/marginLoan", "papi", "GET", '{"cost": 2}'
        )
        self.papi_get_margin_repayloan = Entry(
            "margin/repayLoan", "papi", "GET", '{"cost": 2}'
        )
        self.papi_get_margin_margininteresthistory = Entry(
            "margin/marginInterestHistory", "papi", "GET", '{"cost": 0.2}'
        )
        self.papi_get_portfolio_interest_history = Entry(
            "portfolio/interest-history", "papi", "GET", '{"cost": 10}'
        )
        self.papi_get_um_income = Entry(
            "um/income", "papi", "GET", '{"cost": 6}'
        )
        self.papi_get_cm_income = Entry(
            "cm/income", "papi", "GET", '{"cost": 6}'
        )
        self.papi_get_um_account = Entry(
            "um/account", "papi", "GET", '{"cost": 1}'
        )
        self.papi_get_cm_account = Entry(
            "cm/account", "papi", "GET", '{"cost": 1}'
        )
        self.papi_get_repay_futures_switch = Entry(
            "repay-futures-switch", "papi", "GET", '{"cost": 6}'
        )
        self.papi_get_um_adlquantile = Entry(
            "um/adlQuantile", "papi", "GET", '{"cost": 5}'
        )
        self.papi_get_cm_adlquantile = Entry(
            "cm/adlQuantile", "papi", "GET", '{"cost": 5}'
        )
        self.papi_get_um_trade_asyn = Entry(
            "um/trade/asyn", "papi", "GET", '{"cost": 300}'
        )
        self.papi_get_um_trade_asyn_id = Entry(
            "um/trade/asyn/id", "papi", "GET", '{"cost": 2}'
        )
        self.papi_get_um_order_asyn = Entry(
            "um/order/asyn", "papi", "GET", '{"cost": 300}'
        )
        self.papi_get_um_order_asyn_id = Entry(
            "um/order/asyn/id", "papi", "GET", '{"cost": 2}'
        )
        self.papi_get_um_income_asyn = Entry(
            "um/income/asyn", "papi", "GET", '{"cost": 300}'
        )
        self.papi_get_um_income_asyn_id = Entry(
            "um/income/asyn/id", "papi", "GET", '{"cost": 2}'
        )
        self.papi_get_um_orderamendment = Entry(
            "um/orderAmendment", "papi", "GET", '{"cost": 1}'
        )
        self.papi_get_cm_orderamendment = Entry(
            "cm/orderAmendment", "papi", "GET", '{"cost": 1}'
        )
        self.papi_get_um_feeburn = Entry(
            "um/feeBurn", "papi", "GET", '{"cost": 30}'
        )
        self.papi_get_um_accountconfig = Entry(
            "um/accountConfig", "papi", "GET", '{"cost": 1}'
        )
        self.papi_get_um_symbolconfig = Entry(
            "um/symbolConfig", "papi", "GET", '{"cost": 1}'
        )
        self.papi_get_cm_accountconfig = Entry(
            "cm/accountConfig", "papi", "GET", '{"cost": 1}'
        )
        self.papi_get_cm_symbolconfig = Entry(
            "cm/symbolConfig", "papi", "GET", '{"cost": 1}'
        )
        self.papi_post_um_order = Entry(
            "um/order", "papi", "POST", '{"cost": 1}'
        )
        self.papi_post_um_conditional_order = Entry(
            "um/conditional/order", "papi", "POST", '{"cost": 1}'
        )
        self.papi_post_cm_order = Entry(
            "cm/order", "papi", "POST", '{"cost": 1}'
        )
        self.papi_post_cm_conditional_order = Entry(
            "cm/conditional/order", "papi", "POST", '{"cost": 1}'
        )
        self.papi_post_margin_order = Entry(
            "margin/order", "papi", "POST", '{"cost": 1}'
        )
        self.papi_post_marginloan = Entry(
            "marginLoan", "papi", "POST", '{"cost": 100}'
        )
        self.papi_post_repayloan = Entry(
            "repayLoan", "papi", "POST", '{"cost": 100}'
        )
        self.papi_post_margin_order_oco = Entry(
            "margin/order/oco", "papi", "POST", '{"cost": 1}'
        )
        self.papi_post_um_leverage = Entry(
            "um/leverage", "papi", "POST", '{"cost": 0.2}'
        )
        self.papi_post_cm_leverage = Entry(
            "cm/leverage", "papi", "POST", '{"cost": 0.2}'
        )
        self.papi_post_um_positionside_dual = Entry(
            "um/positionSide/dual", "papi", "POST", '{"cost": 0.2}'
        )
        self.papi_post_cm_positionside_dual = Entry(
            "cm/positionSide/dual", "papi", "POST", '{"cost": 0.2}'
        )
        self.papi_post_auto_collection = Entry(
            "auto-collection", "papi", "POST", '{"cost": 150}'
        )
        self.papi_post_bnb_transfer = Entry(
            "bnb-transfer", "papi", "POST", '{"cost": 150}'
        )
        self.papi_post_repay_futures_switch = Entry(
            "repay-futures-switch", "papi", "POST", '{"cost": 150}'
        )
        self.papi_post_repay_futures_negative_balance = Entry(
            "repay-futures-negative-balance", "papi", "POST", '{"cost": 150}'
        )
        self.papi_post_listenkey = Entry(
            "listenKey", "papi", "POST", '{"cost": 0.2}'
        )
        self.papi_post_asset_collection = Entry(
            "asset-collection", "papi", "POST", '{"cost": 6}'
        )
        self.papi_post_margin_repay_debt = Entry(
            "margin/repay-debt", "papi", "POST", '{"cost": 3000}'
        )
        self.papi_post_um_feeburn = Entry(
            "um/feeBurn", "papi", "POST", '{"cost": 1}'
        )
        self.papi_put_listenkey = Entry(
            "listenKey", "papi", "PUT", '{"cost": 0.2}'
        )
        self.papi_put_um_order = Entry("um/order", "papi", "PUT", '{"cost": 1}')
        self.papi_put_cm_order = Entry("cm/order", "papi", "PUT", '{"cost": 1}')
        self.papi_delete_um_order = Entry(
            "um/order", "papi", "DELETE", '{"cost": 1}'
        )
        self.papi_delete_um_conditional_order = Entry(
            "um/conditional/order", "papi", "DELETE", '{"cost": 1}'
        )
        self.papi_delete_um_allopenorders = Entry(
            "um/allOpenOrders", "papi", "DELETE", '{"cost": 1}'
        )
        self.papi_delete_um_conditional_allopenorders = Entry(
            "um/conditional/allOpenOrders", "papi", "DELETE", '{"cost": 1}'
        )
        self.papi_delete_cm_order = Entry(
            "cm/order", "papi", "DELETE", '{"cost": 1}'
        )
        self.papi_delete_cm_conditional_order = Entry(
            "cm/conditional/order", "papi", "DELETE", '{"cost": 1}'
        )
        self.papi_delete_cm_allopenorders = Entry(
            "cm/allOpenOrders", "papi", "DELETE", '{"cost": 1}'
        )
        self.papi_delete_cm_conditional_allopenorders = Entry(
            "cm/conditional/allOpenOrders", "papi", "DELETE", '{"cost": 1}'
        )
        self.papi_delete_margin_order = Entry(
            "margin/order", "papi", "DELETE", '{"cost": 2}'
        )
        self.papi_delete_margin_allopenorders = Entry(
            "margin/allOpenOrders", "papi", "DELETE", '{"cost": 5}'
        )
        self.papi_delete_margin_orderlist = Entry(
            "margin/orderList", "papi", "DELETE", '{"cost": 2}'
        )
        self.papi_delete_listenkey = Entry(
            "listenKey", "papi", "DELETE", '{"cost": 0.2}'
        )
