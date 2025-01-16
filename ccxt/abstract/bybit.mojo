from ccxt.base.types import Entry


@value
struct ImplicitAPI:
    var spot_v3_public_symbols: Entry
    var spot_v3_public_quote_depth: Entry
    var spot_v3_public_quote_depth_merged: Entry
    var spot_v3_public_quote_trades: Entry
    var spot_v3_public_quote_kline: Entry
    var spot_v3_public_quote_ticker_24hr: Entry
    var spot_v3_public_quote_ticker_price: Entry
    var spot_v3_public_quote_ticker_bookticker: Entry
    var spot_v3_public_server_time: Entry
    var spot_v3_public_infos: Entry
    var spot_v3_public_margin_product_infos: Entry
    var spot_v3_public_margin_ensure_tokens: Entry
    var v3_public_time: Entry
    var contract_v3_public_copytrading_symbol_list: Entry
    var derivatives_v3_public_order_book_l2: Entry
    var derivatives_v3_public_kline: Entry
    var derivatives_v3_public_tickers: Entry
    var derivatives_v3_public_instruments_info: Entry
    var derivatives_v3_public_mark_price_kline: Entry
    var derivatives_v3_public_index_price_kline: Entry
    var derivatives_v3_public_funding_history_funding_rate: Entry
    var derivatives_v3_public_risk_limit_list: Entry
    var derivatives_v3_public_delivery_price: Entry
    var derivatives_v3_public_recent_trade: Entry
    var derivatives_v3_public_open_interest: Entry
    var derivatives_v3_public_insurance: Entry
    var v5_announcements_index: Entry
    var v5_market_time: Entry
    var v5_market_kline: Entry
    var v5_market_mark_price_kline: Entry
    var v5_market_index_price_kline: Entry
    var v5_market_premium_index_price_kline: Entry
    var v5_market_instruments_info: Entry
    var v5_market_orderbook: Entry
    var v5_market_tickers: Entry
    var v5_market_funding_history: Entry
    var v5_market_recent_trade: Entry
    var v5_market_open_interest: Entry
    var v5_market_historical_volatility: Entry
    var v5_market_insurance: Entry
    var v5_market_risk_limit: Entry
    var v5_market_delivery_price: Entry
    var v5_market_account_ratio: Entry
    var v5_spot_lever_token_info: Entry
    var v5_spot_lever_token_reference: Entry
    var v5_spot_margin_trade_data: Entry
    var v5_spot_cross_margin_trade_data: Entry
    var v5_spot_cross_margin_trade_pledge_token: Entry
    var v5_spot_cross_margin_trade_borrow_token: Entry
    var v5_ins_loan_product_infos: Entry
    var v5_ins_loan_ensure_tokens_convert: Entry
    var v5_market_instruments_info_private: Entry
    var v2_private_wallet_fund_records: Entry
    var spot_v3_private_order: Entry
    var spot_v3_private_open_orders: Entry
    var spot_v3_private_history_orders: Entry
    var spot_v3_private_my_trades: Entry
    var spot_v3_private_account: Entry
    var spot_v3_private_reference: Entry
    var spot_v3_private_record: Entry
    var spot_v3_private_cross_margin_orders: Entry
    var spot_v3_private_cross_margin_account: Entry
    var spot_v3_private_cross_margin_loan_info: Entry
    var spot_v3_private_cross_margin_repay_history: Entry
    var spot_v3_private_margin_loan_infos: Entry
    var spot_v3_private_margin_repaid_infos: Entry
    var spot_v3_private_margin_ltv: Entry
    var asset_v3_private_transfer_inter_transfer_list_query: Entry
    var asset_v3_private_transfer_sub_member_list_query: Entry
    var asset_v3_private_transfer_sub_member_transfer_list_query: Entry
    var asset_v3_private_transfer_universal_transfer_list_query: Entry
    var asset_v3_private_coin_info_query: Entry
    var asset_v3_private_deposit_address_query: Entry
    var contract_v3_private_copytrading_order_list: Entry
    var contract_v3_private_copytrading_position_list: Entry
    var contract_v3_private_copytrading_wallet_balance: Entry
    var contract_v3_private_position_limit_info: Entry
    var contract_v3_private_order_unfilled_orders: Entry
    var contract_v3_private_order_list: Entry
    var contract_v3_private_position_list: Entry
    var contract_v3_private_execution_list: Entry
    var contract_v3_private_position_closed_pnl: Entry
    var contract_v3_private_account_wallet_balance: Entry
    var contract_v3_private_account_fee_rate: Entry
    var contract_v3_private_account_wallet_fund_records: Entry
    var unified_v3_private_order_unfilled_orders: Entry
    var unified_v3_private_order_list: Entry
    var unified_v3_private_position_list: Entry
    var unified_v3_private_execution_list: Entry
    var unified_v3_private_delivery_record: Entry
    var unified_v3_private_settlement_record: Entry
    var unified_v3_private_account_wallet_balance: Entry
    var unified_v3_private_account_transaction_log: Entry
    var unified_v3_private_account_borrow_history: Entry
    var unified_v3_private_account_borrow_rate: Entry
    var unified_v3_private_account_info: Entry
    var user_v3_private_frozen_sub_member: Entry
    var user_v3_private_query_sub_members: Entry
    var user_v3_private_query_api: Entry
    var user_v3_private_get_member_type: Entry
    var asset_v3_private_transfer_transfer_coin_list_query: Entry
    var asset_v3_private_transfer_account_coin_balance_query: Entry
    var asset_v3_private_transfer_account_coins_balance_query: Entry
    var asset_v3_private_transfer_asset_info_query: Entry
    var asset_v3_public_deposit_allowed_deposit_list_query: Entry
    var asset_v3_private_deposit_record_query: Entry
    var asset_v3_private_withdraw_record_query: Entry
    var v5_order_realtime: Entry
    var v5_order_history: Entry
    var v5_order_spot_borrow_check: Entry
    var v5_position_list: Entry
    var v5_execution_list: Entry
    var v5_position_closed_pnl: Entry
    var v5_position_move_history: Entry
    var v5_pre_upgrade_order_history: Entry
    var v5_pre_upgrade_execution_list: Entry
    var v5_pre_upgrade_position_closed_pnl: Entry
    var v5_pre_upgrade_account_transaction_log: Entry
    var v5_pre_upgrade_asset_delivery_record: Entry
    var v5_pre_upgrade_asset_settlement_record: Entry
    var v5_account_wallet_balance: Entry
    var v5_account_borrow_history: Entry
    var v5_account_collateral_info: Entry
    var v5_asset_coin_greeks: Entry
    var v5_account_fee_rate: Entry
    var v5_account_info: Entry
    var v5_account_transaction_log: Entry
    var v5_account_contract_transaction_log: Entry
    var v5_account_smp_group: Entry
    var v5_account_mmp_state: Entry
    var v5_asset_exchange_query_coin_list: Entry
    var v5_asset_exchange_convert_result_query: Entry
    var v5_asset_exchange_query_convert_history: Entry
    var v5_asset_exchange_order_record: Entry
    var v5_asset_delivery_record: Entry
    var v5_asset_settlement_record: Entry
    var v5_asset_transfer_query_asset_info: Entry
    var v5_asset_transfer_query_account_coins_balance: Entry
    var v5_asset_transfer_query_account_coin_balance: Entry
    var v5_asset_transfer_query_transfer_coin_list: Entry
    var v5_asset_transfer_query_inter_transfer_list: Entry
    var v5_asset_transfer_query_sub_member_list: Entry
    var v5_asset_transfer_query_universal_transfer_list: Entry
    var v5_asset_deposit_query_allowed_list: Entry
    var v5_asset_deposit_query_record: Entry
    var v5_asset_deposit_query_sub_member_record: Entry
    var v5_asset_deposit_query_internal_record: Entry
    var v5_asset_deposit_query_address: Entry
    var v5_asset_deposit_query_sub_member_address: Entry
    var v5_asset_coin_query_info: Entry
    var v5_asset_withdraw_query_record: Entry
    var v5_asset_withdraw_withdrawable_amount: Entry
    var v5_asset_withdraw_vasp_list: Entry
    var v5_user_query_sub_members: Entry
    var v5_user_query_api: Entry
    var v5_user_sub_apikeys: Entry
    var v5_user_get_member_type: Entry
    var v5_user_aff_customer_info: Entry
    var v5_user_del_submember: Entry
    var v5_user_submembers: Entry
    var v5_spot_lever_token_order_record: Entry
    var v5_spot_margin_trade_interest_rate_history: Entry
    var v5_spot_margin_trade_state: Entry
    var v5_spot_cross_margin_trade_loan_info: Entry
    var v5_spot_cross_margin_trade_account: Entry
    var v5_spot_cross_margin_trade_orders: Entry
    var v5_spot_cross_margin_trade_repay_history: Entry
    var v5_ins_loan_product_infos_private: Entry
    var v5_ins_loan_ensure_tokens_convert_private: Entry
    var v5_ins_loan_loan_order: Entry
    var v5_ins_loan_repaid_history: Entry
    var v5_ins_loan_ltv_convert: Entry
    var v5_lending_info: Entry
    var v5_lending_history_order: Entry
    var v5_lending_account: Entry
    var v5_broker_earning_record: Entry
    var v5_broker_earnings_info: Entry
    var v5_broker_account_info: Entry
    var v5_broker_asset_query_sub_member_deposit_record: Entry
    var spot_v3_private_order_post: Entry
    var spot_v3_private_cancel_order: Entry
    var spot_v3_private_cancel_orders: Entry
    var spot_v3_private_cancel_orders_by_ids: Entry
    var spot_v3_private_purchase: Entry
    var spot_v3_private_redeem: Entry
    var spot_v3_private_cross_margin_loan: Entry
    var spot_v3_private_cross_margin_repay: Entry
    var asset_v3_private_transfer_inter_transfer: Entry
    var asset_v3_private_withdraw_create: Entry
    var asset_v3_private_withdraw_cancel: Entry
    var asset_v3_private_transfer_sub_member_transfer: Entry
    var asset_v3_private_transfer_transfer_sub_member_save: Entry
    var asset_v3_private_transfer_universal_transfer: Entry
    var user_v3_private_create_sub_member: Entry
    var user_v3_private_create_sub_api: Entry
    var user_v3_private_update_api: Entry
    var user_v3_private_delete_api: Entry
    var user_v3_private_update_sub_api: Entry
    var user_v3_private_delete_sub_api: Entry
    var contract_v3_private_copytrading_order_create: Entry
    var contract_v3_private_copytrading_order_cancel: Entry
    var contract_v3_private_copytrading_order_close: Entry
    var contract_v3_private_copytrading_position_close: Entry
    var contract_v3_private_copytrading_position_set_leverage: Entry
    var contract_v3_private_copytrading_wallet_transfer: Entry
    var contract_v3_private_copytrading_order_trading_stop: Entry
    var contract_v3_private_order_create: Entry
    var contract_v3_private_order_cancel: Entry
    var contract_v3_private_order_cancel_all: Entry
    var contract_v3_private_order_replace: Entry
    var contract_v3_private_position_set_auto_add_margin: Entry
    var contract_v3_private_position_switch_isolated: Entry
    var contract_v3_private_position_switch_mode: Entry
    var contract_v3_private_position_switch_tpsl_mode: Entry
    var contract_v3_private_position_set_leverage: Entry
    var contract_v3_private_position_trading_stop: Entry
    var contract_v3_private_position_set_risk_limit: Entry
    var contract_v3_private_account_setmarginmode: Entry
    var unified_v3_private_order_create: Entry
    var unified_v3_private_order_replace: Entry
    var unified_v3_private_order_cancel: Entry
    var unified_v3_private_order_create_batch: Entry
    var unified_v3_private_order_replace_batch: Entry
    var unified_v3_private_order_cancel_batch: Entry
    var unified_v3_private_order_cancel_all: Entry
    var unified_v3_private_position_set_leverage: Entry
    var unified_v3_private_position_tpsl_switch_mode: Entry
    var unified_v3_private_position_set_risk_limit: Entry
    var unified_v3_private_position_trading_stop: Entry
    var unified_v3_private_account_upgrade_unified_account: Entry
    var unified_v3_private_account_setmarginmode: Entry
    var fht_compliance_tax_v3_private_registertime: Entry
    var fht_compliance_tax_v3_private_create: Entry
    var fht_compliance_tax_v3_private_status: Entry
    var fht_compliance_tax_v3_private_url: Entry
    var v5_order_create: Entry
    var v5_order_amend: Entry
    var v5_order_cancel: Entry
    var v5_order_cancel_all: Entry
    var v5_order_create_batch: Entry
    var v5_order_amend_batch: Entry
    var v5_order_cancel_batch: Entry
    var v5_order_disconnected_cancel_all: Entry
    var v5_position_set_leverage: Entry
    var v5_position_switch_isolated: Entry
    var v5_position_set_tpsl_mode: Entry
    var v5_position_switch_mode: Entry
    var v5_position_set_risk_limit: Entry
    var v5_position_trading_stop: Entry
    var v5_position_set_auto_add_margin: Entry
    var v5_position_add_margin: Entry
    var v5_position_move_positions: Entry
    var v5_position_confirm_pending_mmr: Entry
    var v5_account_upgrade_to_uta: Entry
    var v5_account_quick_repayment: Entry
    var v5_account_set_margin_mode: Entry
    var v5_account_set_hedging_mode: Entry
    var v5_account_mmp_modify: Entry
    var v5_account_mmp_reset: Entry
    var v5_asset_exchange_quote_apply: Entry
    var v5_asset_exchange_convert_execute: Entry
    var v5_asset_transfer_inter_transfer: Entry
    var v5_asset_transfer_save_transfer_sub_member: Entry
    var v5_asset_transfer_universal_transfer: Entry
    var v5_asset_deposit_deposit_to_account: Entry
    var v5_asset_withdraw_create: Entry
    var v5_asset_withdraw_cancel: Entry
    var v5_user_create_sub_member: Entry
    var v5_user_create_sub_api: Entry
    var v5_user_frozen_sub_member: Entry
    var v5_user_update_api: Entry
    var v5_user_update_sub_api: Entry
    var v5_user_delete_api: Entry
    var v5_user_delete_sub_api: Entry
    var v5_spot_lever_token_purchase: Entry
    var v5_spot_lever_token_redeem: Entry
    var v5_spot_margin_trade_switch_mode: Entry
    var v5_spot_margin_trade_set_leverage: Entry
    var v5_spot_cross_margin_trade_loan: Entry
    var v5_spot_cross_margin_trade_repay: Entry
    var v5_spot_cross_margin_trade_switch: Entry
    var v5_ins_loan_association_uid: Entry
    var v5_lending_purchase: Entry
    var v5_lending_redeem: Entry
    var v5_lending_redeem_cancel: Entry
    var v5_account_set_collateral_switch: Entry
    var v5_account_set_collateral_switch_batch: Entry
    var v5_account_demo_apply_money: Entry

    fn __init__(out self):
        self.spot_v3_public_symbols = Entry(
            "spot/v3/public/symbols", "public", "GET", '{"cost": 1}'
        )
        self.spot_v3_public_quote_depth = Entry(
            "spot/v3/public/quote/depth", "public", "GET", '{"cost": 1}'
        )
        self.spot_v3_public_quote_depth_merged = Entry(
            "spot/v3/public/quote/depth/merged", "public", "GET", '{"cost": 1}'
        )
        self.spot_v3_public_quote_trades = Entry(
            "spot/v3/public/quote/trades", "public", "GET", '{"cost": 1}'
        )
        self.spot_v3_public_quote_kline = Entry(
            "spot/v3/public/quote/kline", "public", "GET", '{"cost": 1}'
        )
        self.spot_v3_public_quote_ticker_24hr = Entry(
            "spot/v3/public/quote/ticker/24hr", "public", "GET", '{"cost": 1}'
        )
        self.spot_v3_public_quote_ticker_price = Entry(
            "spot/v3/public/quote/ticker/price", "public", "GET", '{"cost": 1}'
        )
        self.spot_v3_public_quote_ticker_bookticker = Entry(
            "spot/v3/public/quote/ticker/bookTicker",
            "public",
            "GET",
            '{"cost": 1}',
        )
        self.spot_v3_public_server_time = Entry(
            "spot/v3/public/server-time", "public", "GET", '{"cost": 1}'
        )
        self.spot_v3_public_infos = Entry(
            "spot/v3/public/infos", "public", "GET", '{"cost": 1}'
        )
        self.spot_v3_public_margin_product_infos = Entry(
            "spot/v3/public/margin-product-infos", "public", "GET", '{"cost": 1}'
        )
        self.spot_v3_public_margin_ensure_tokens = Entry(
            "spot/v3/public/margin-ensure-tokens", "public", "GET", '{"cost": 1}'
        )
        self.v3_public_time = Entry(
            "v3/public/time", "public", "GET", '{"cost": 1}'
        )
        self.contract_v3_public_copytrading_symbol_list = Entry(
            "contract/v3/public/copytrading/symbol/list",
            "public",
            "GET",
            '{"cost": 1}',
        )
        self.derivatives_v3_public_order_book_l2 = Entry(
            "derivatives/v3/public/order-book/L2", "public", "GET", '{"cost": 1}'
        )
        self.derivatives_v3_public_kline = Entry(
            "derivatives/v3/public/kline", "public", "GET", '{"cost": 1}'
        )
        self.derivatives_v3_public_tickers = Entry(
            "derivatives/v3/public/tickers", "public", "GET", '{"cost": 1}'
        )
        self.derivatives_v3_public_instruments_info = Entry(
            "derivatives/v3/public/instruments-info",
            "public",
            "GET",
            '{"cost": 1}',
        )
        self.derivatives_v3_public_mark_price_kline = Entry(
            "derivatives/v3/public/mark-price-kline",
            "public",
            "GET",
            '{"cost": 1}',
        )
        self.derivatives_v3_public_index_price_kline = Entry(
            "derivatives/v3/public/index-price-kline",
            "public",
            "GET",
            '{"cost": 1}',
        )
        self.derivatives_v3_public_funding_history_funding_rate = Entry(
            "derivatives/v3/public/funding/history-funding-rate",
            "public",
            "GET",
            '{"cost": 1}',
        )
        self.derivatives_v3_public_risk_limit_list = Entry(
            "derivatives/v3/public/risk-limit/list",
            "public",
            "GET",
            '{"cost": 1}',
        )
        self.derivatives_v3_public_delivery_price = Entry(
            "derivatives/v3/public/delivery-price", "public", "GET", '{"cost": 1}'
        )
        self.derivatives_v3_public_recent_trade = Entry(
            "derivatives/v3/public/recent-trade", "public", "GET", '{"cost": 1}'
        )
        self.derivatives_v3_public_open_interest = Entry(
            "derivatives/v3/public/open-interest", "public", "GET", '{"cost": 1}'
        )
        self.derivatives_v3_public_insurance = Entry(
            "derivatives/v3/public/insurance", "public", "GET", '{"cost": 1}'
        )
        self.v5_announcements_index = Entry(
            "v5/announcements/index", "public", "GET", '{"cost": 5}'
        )
        self.v5_market_time = Entry(
            "v5/market/time", "public", "GET", '{"cost": 5}'
        )
        self.v5_market_kline = Entry(
            "v5/market/kline", "public", "GET", '{"cost": 5}'
        )
        self.v5_market_mark_price_kline = Entry(
            "v5/market/mark-price-kline", "public", "GET", '{"cost": 5}'
        )
        self.v5_market_index_price_kline = Entry(
            "v5/market/index-price-kline", "public", "GET", '{"cost": 5}'
        )
        self.v5_market_premium_index_price_kline = Entry(
            "v5/market/premium-index-price-kline", "public", "GET", '{"cost": 5}'
        )
        self.v5_market_instruments_info = Entry(
            "v5/market/instruments-info", "public", "GET", '{"cost": 5}'
        )
        self.v5_market_orderbook = Entry(
            "v5/market/orderbook", "public", "GET", '{"cost": 5}'
        )
        self.v5_market_tickers = Entry(
            "v5/market/tickers", "public", "GET", '{"cost": 5}'
        )
        self.v5_market_funding_history = Entry(
            "v5/market/funding/history", "public", "GET", '{"cost": 5}'
        )
        self.v5_market_recent_trade = Entry(
            "v5/market/recent-trade", "public", "GET", '{"cost": 5}'
        )
        self.v5_market_open_interest = Entry(
            "v5/market/open-interest", "public", "GET", '{"cost": 5}'
        )
        self.v5_market_historical_volatility = Entry(
            "v5/market/historical-volatility", "public", "GET", '{"cost": 5}'
        )
        self.v5_market_insurance = Entry(
            "v5/market/insurance", "public", "GET", '{"cost": 5}'
        )
        self.v5_market_risk_limit = Entry(
            "v5/market/risk-limit", "public", "GET", '{"cost": 5}'
        )
        self.v5_market_delivery_price = Entry(
            "v5/market/delivery-price", "public", "GET", '{"cost": 5}'
        )
        self.v5_market_account_ratio = Entry(
            "v5/market/account-ratio", "public", "GET", '{"cost": 5}'
        )
        self.v5_spot_lever_token_info = Entry(
            "v5/spot-lever-token/info", "public", "GET", '{"cost": 5}'
        )
        self.v5_spot_lever_token_reference = Entry(
            "v5/spot-lever-token/reference", "public", "GET", '{"cost": 5}'
        )
        self.v5_spot_margin_trade_data = Entry(
            "v5/spot-margin-trade/data", "public", "GET", '{"cost": 5}'
        )
        self.v5_spot_cross_margin_trade_data = Entry(
            "v5/spot-cross-margin-trade/data", "public", "GET", '{"cost": 5}'
        )
        self.v5_spot_cross_margin_trade_pledge_token = Entry(
            "v5/spot-cross-margin-trade/pledge-token",
            "public",
            "GET",
            '{"cost": 5}',
        )
        self.v5_spot_cross_margin_trade_borrow_token = Entry(
            "v5/spot-cross-margin-trade/borrow-token",
            "public",
            "GET",
            '{"cost": 5}',
        )
        self.v5_ins_loan_product_infos = Entry(
            "v5/ins-loan/product-infos", "public", "GET", '{"cost": 5}'
        )
        self.v5_ins_loan_ensure_tokens_convert = Entry(
            "v5/ins-loan/ensure-tokens-convert", "public", "GET", '{"cost": 5}'
        )
        self.v5_market_instruments_info_private = Entry(
            "v5/market/instruments-info", "private", "GET", '{"cost": 5}'
        )
        self.v2_private_wallet_fund_records = Entry(
            "v2/private/wallet/fund/records", "private", "GET", '{"cost": 25}'
        )
        self.spot_v3_private_order = Entry(
            "spot/v3/private/order", "private", "GET", '{"cost": 2.5}'
        )
        self.spot_v3_private_open_orders = Entry(
            "spot/v3/private/open-orders", "private", "GET", '{"cost": 2.5}'
        )
        self.spot_v3_private_history_orders = Entry(
            "spot/v3/private/history-orders", "private", "GET", '{"cost": 2.5}'
        )
        self.spot_v3_private_my_trades = Entry(
            "spot/v3/private/my-trades", "private", "GET", '{"cost": 2.5}'
        )
        self.spot_v3_private_account = Entry(
            "spot/v3/private/account", "private", "GET", '{"cost": 2.5}'
        )
        self.spot_v3_private_reference = Entry(
            "spot/v3/private/reference", "private", "GET", '{"cost": 2.5}'
        )
        self.spot_v3_private_record = Entry(
            "spot/v3/private/record", "private", "GET", '{"cost": 2.5}'
        )
        self.spot_v3_private_cross_margin_orders = Entry(
            "spot/v3/private/cross-margin-orders",
            "private",
            "GET",
            '{"cost": 10}',
        )
        self.spot_v3_private_cross_margin_account = Entry(
            "spot/v3/private/cross-margin-account",
            "private",
            "GET",
            '{"cost": 10}',
        )
        self.spot_v3_private_cross_margin_loan_info = Entry(
            "spot/v3/private/cross-margin-loan-info",
            "private",
            "GET",
            '{"cost": 10}',
        )
        self.spot_v3_private_cross_margin_repay_history = Entry(
            "spot/v3/private/cross-margin-repay-history",
            "private",
            "GET",
            '{"cost": 10}',
        )
        self.spot_v3_private_margin_loan_infos = Entry(
            "spot/v3/private/margin-loan-infos", "private", "GET", '{"cost": 10}'
        )
        self.spot_v3_private_margin_repaid_infos = Entry(
            "spot/v3/private/margin-repaid-infos",
            "private",
            "GET",
            '{"cost": 10}',
        )
        self.spot_v3_private_margin_ltv = Entry(
            "spot/v3/private/margin-ltv", "private", "GET", '{"cost": 10}'
        )
        self.asset_v3_private_transfer_inter_transfer_list_query = Entry(
            "asset/v3/private/transfer/inter-transfer/list/query",
            "private",
            "GET",
            '{"cost": 50}',
        )
        self.asset_v3_private_transfer_sub_member_list_query = Entry(
            "asset/v3/private/transfer/sub-member/list/query",
            "private",
            "GET",
            '{"cost": 50}',
        )
        self.asset_v3_private_transfer_sub_member_transfer_list_query = Entry(
            "asset/v3/private/transfer/sub-member-transfer/list/query",
            "private",
            "GET",
            '{"cost": 50}',
        )
        self.asset_v3_private_transfer_universal_transfer_list_query = Entry(
            "asset/v3/private/transfer/universal-transfer/list/query",
            "private",
            "GET",
            '{"cost": 25}',
        )
        self.asset_v3_private_coin_info_query = Entry(
            "asset/v3/private/coin-info/query", "private", "GET", '{"cost": 25}'
        )
        self.asset_v3_private_deposit_address_query = Entry(
            "asset/v3/private/deposit/address/query",
            "private",
            "GET",
            '{"cost": 10}',
        )
        self.contract_v3_private_copytrading_order_list = Entry(
            "contract/v3/private/copytrading/order/list",
            "private",
            "GET",
            '{"cost": 30}',
        )
        self.contract_v3_private_copytrading_position_list = Entry(
            "contract/v3/private/copytrading/position/list",
            "private",
            "GET",
            '{"cost": 40}',
        )
        self.contract_v3_private_copytrading_wallet_balance = Entry(
            "contract/v3/private/copytrading/wallet/balance",
            "private",
            "GET",
            '{"cost": 25}',
        )
        self.contract_v3_private_position_limit_info = Entry(
            "contract/v3/private/position/limit-info",
            "private",
            "GET",
            '{"cost": 25}',
        )
        self.contract_v3_private_order_unfilled_orders = Entry(
            "contract/v3/private/order/unfilled-orders",
            "private",
            "GET",
            '{"cost": 1}',
        )
        self.contract_v3_private_order_list = Entry(
            "contract/v3/private/order/list", "private", "GET", '{"cost": 1}'
        )
        self.contract_v3_private_position_list = Entry(
            "contract/v3/private/position/list", "private", "GET", '{"cost": 1}'
        )
        self.contract_v3_private_execution_list = Entry(
            "contract/v3/private/execution/list", "private", "GET", '{"cost": 1}'
        )
        self.contract_v3_private_position_closed_pnl = Entry(
            "contract/v3/private/position/closed-pnl",
            "private",
            "GET",
            '{"cost": 1}',
        )
        self.contract_v3_private_account_wallet_balance = Entry(
            "contract/v3/private/account/wallet/balance",
            "private",
            "GET",
            '{"cost": 1}',
        )
        self.contract_v3_private_account_fee_rate = Entry(
            "contract/v3/private/account/fee-rate",
            "private",
            "GET",
            '{"cost": 1}',
        )
        self.contract_v3_private_account_wallet_fund_records = Entry(
            "contract/v3/private/account/wallet/fund-records",
            "private",
            "GET",
            '{"cost": 1}',
        )
        self.unified_v3_private_order_unfilled_orders = Entry(
            "unified/v3/private/order/unfilled-orders",
            "private",
            "GET",
            '{"cost": 1}',
        )
        self.unified_v3_private_order_list = Entry(
            "unified/v3/private/order/list", "private", "GET", '{"cost": 1}'
        )
        self.unified_v3_private_position_list = Entry(
            "unified/v3/private/position/list", "private", "GET", '{"cost": 1}'
        )
        self.unified_v3_private_execution_list = Entry(
            "unified/v3/private/execution/list", "private", "GET", '{"cost": 1}'
        )
        self.unified_v3_private_delivery_record = Entry(
            "unified/v3/private/delivery-record", "private", "GET", '{"cost": 1}'
        )
        self.unified_v3_private_settlement_record = Entry(
            "unified/v3/private/settlement-record",
            "private",
            "GET",
            '{"cost": 1}',
        )
        self.unified_v3_private_account_wallet_balance = Entry(
            "unified/v3/private/account/wallet/balance",
            "private",
            "GET",
            '{"cost": 1}',
        )
        self.unified_v3_private_account_transaction_log = Entry(
            "unified/v3/private/account/transaction-log",
            "private",
            "GET",
            '{"cost": 1}',
        )
        self.unified_v3_private_account_borrow_history = Entry(
            "unified/v3/private/account/borrow-history",
            "private",
            "GET",
            '{"cost": 1}',
        )
        self.unified_v3_private_account_borrow_rate = Entry(
            "unified/v3/private/account/borrow-rate",
            "private",
            "GET",
            '{"cost": 1}',
        )
        self.unified_v3_private_account_info = Entry(
            "unified/v3/private/account/info", "private", "GET", '{"cost": 1}'
        )
        self.user_v3_private_frozen_sub_member = Entry(
            "user/v3/private/frozen-sub-member", "private", "GET", '{"cost": 10}'
        )
        self.user_v3_private_query_sub_members = Entry(
            "user/v3/private/query-sub-members", "private", "GET", '{"cost": 5}'
        )
        self.user_v3_private_query_api = Entry(
            "user/v3/private/query-api", "private", "GET", '{"cost": 5}'
        )
        self.user_v3_private_get_member_type = Entry(
            "user/v3/private/get-member-type", "private", "GET", '{"cost": 1}'
        )
        self.asset_v3_private_transfer_transfer_coin_list_query = Entry(
            "asset/v3/private/transfer/transfer-coin/list/query",
            "private",
            "GET",
            '{"cost": 50}',
        )
        self.asset_v3_private_transfer_account_coin_balance_query = Entry(
            "asset/v3/private/transfer/account-coin/balance/query",
            "private",
            "GET",
            '{"cost": 50}',
        )
        self.asset_v3_private_transfer_account_coins_balance_query = Entry(
            "asset/v3/private/transfer/account-coins/balance/query",
            "private",
            "GET",
            '{"cost": 25}',
        )
        self.asset_v3_private_transfer_asset_info_query = Entry(
            "asset/v3/private/transfer/asset-info/query",
            "private",
            "GET",
            '{"cost": 50}',
        )
        self.asset_v3_public_deposit_allowed_deposit_list_query = Entry(
            "asset/v3/public/deposit/allowed-deposit-list/query",
            "private",
            "GET",
            '{"cost": 0.17}',
        )
        self.asset_v3_private_deposit_record_query = Entry(
            "asset/v3/private/deposit/record/query",
            "private",
            "GET",
            '{"cost": 10}',
        )
        self.asset_v3_private_withdraw_record_query = Entry(
            "asset/v3/private/withdraw/record/query",
            "private",
            "GET",
            '{"cost": 10}',
        )
        self.v5_order_realtime = Entry(
            "v5/order/realtime", "private", "GET", '{"cost": 5}'
        )
        self.v5_order_history = Entry(
            "v5/order/history", "private", "GET", '{"cost": 5}'
        )
        self.v5_order_spot_borrow_check = Entry(
            "v5/order/spot-borrow-check", "private", "GET", '{"cost": 1}'
        )
        self.v5_position_list = Entry(
            "v5/position/list", "private", "GET", '{"cost": 5}'
        )
        self.v5_execution_list = Entry(
            "v5/execution/list", "private", "GET", '{"cost": 5}'
        )
        self.v5_position_closed_pnl = Entry(
            "v5/position/closed-pnl", "private", "GET", '{"cost": 5}'
        )
        self.v5_position_move_history = Entry(
            "v5/position/move-history", "private", "GET", '{"cost": 5}'
        )
        self.v5_pre_upgrade_order_history = Entry(
            "v5/pre-upgrade/order/history", "private", "GET", '{"cost": 5}'
        )
        self.v5_pre_upgrade_execution_list = Entry(
            "v5/pre-upgrade/execution/list", "private", "GET", '{"cost": 5}'
        )
        self.v5_pre_upgrade_position_closed_pnl = Entry(
            "v5/pre-upgrade/position/closed-pnl", "private", "GET", '{"cost": 5}'
        )
        self.v5_pre_upgrade_account_transaction_log = Entry(
            "v5/pre-upgrade/account/transaction-log",
            "private",
            "GET",
            '{"cost": 5}',
        )
        self.v5_pre_upgrade_asset_delivery_record = Entry(
            "v5/pre-upgrade/asset/delivery-record",
            "private",
            "GET",
            '{"cost": 5}',
        )
        self.v5_pre_upgrade_asset_settlement_record = Entry(
            "v5/pre-upgrade/asset/settlement-record",
            "private",
            "GET",
            '{"cost": 5}',
        )
        self.v5_account_wallet_balance = Entry(
            "v5/account/wallet-balance", "private", "GET", '{"cost": 1}'
        )
        self.v5_account_borrow_history = Entry(
            "v5/account/borrow-history", "private", "GET", '{"cost": 1}'
        )
        self.v5_account_collateral_info = Entry(
            "v5/account/collateral-info", "private", "GET", '{"cost": 1}'
        )
        self.v5_asset_coin_greeks = Entry(
            "v5/asset/coin-greeks", "private", "GET", '{"cost": 1}'
        )
        self.v5_account_fee_rate = Entry(
            "v5/account/fee-rate", "private", "GET", '{"cost": 10}'
        )
        self.v5_account_info = Entry(
            "v5/account/info", "private", "GET", '{"cost": 5}'
        )
        self.v5_account_transaction_log = Entry(
            "v5/account/transaction-log", "private", "GET", '{"cost": 1}'
        )
        self.v5_account_contract_transaction_log = Entry(
            "v5/account/contract-transaction-log", "private", "GET", '{"cost": 1}'
        )
        self.v5_account_smp_group = Entry(
            "v5/account/smp-group", "private", "GET", '{"cost": 1}'
        )
        self.v5_account_mmp_state = Entry(
            "v5/account/mmp-state", "private", "GET", '{"cost": 5}'
        )
        self.v5_asset_exchange_query_coin_list = Entry(
            "v5/asset/exchange/query-coin-list", "private", "GET", '{"cost": 0.5}'
        )
        self.v5_asset_exchange_convert_result_query = Entry(
            "v5/asset/exchange/convert-result-query",
            "private",
            "GET",
            '{"cost": 0.5}',
        )
        self.v5_asset_exchange_query_convert_history = Entry(
            "v5/asset/exchange/query-convert-history",
            "private",
            "GET",
            '{"cost": 0.5}',
        )
        self.v5_asset_exchange_order_record = Entry(
            "v5/asset/exchange/order-record", "private", "GET", '{"cost": 5}'
        )
        self.v5_asset_delivery_record = Entry(
            "v5/asset/delivery-record", "private", "GET", '{"cost": 5}'
        )
        self.v5_asset_settlement_record = Entry(
            "v5/asset/settlement-record", "private", "GET", '{"cost": 5}'
        )
        self.v5_asset_transfer_query_asset_info = Entry(
            "v5/asset/transfer/query-asset-info", "private", "GET", '{"cost": 50}'
        )
        self.v5_asset_transfer_query_account_coins_balance = Entry(
            "v5/asset/transfer/query-account-coins-balance",
            "private",
            "GET",
            '{"cost": 25}',
        )
        self.v5_asset_transfer_query_account_coin_balance = Entry(
            "v5/asset/transfer/query-account-coin-balance",
            "private",
            "GET",
            '{"cost": 50}',
        )
        self.v5_asset_transfer_query_transfer_coin_list = Entry(
            "v5/asset/transfer/query-transfer-coin-list",
            "private",
            "GET",
            '{"cost": 50}',
        )
        self.v5_asset_transfer_query_inter_transfer_list = Entry(
            "v5/asset/transfer/query-inter-transfer-list",
            "private",
            "GET",
            '{"cost": 50}',
        )
        self.v5_asset_transfer_query_sub_member_list = Entry(
            "v5/asset/transfer/query-sub-member-list",
            "private",
            "GET",
            '{"cost": 50}',
        )
        self.v5_asset_transfer_query_universal_transfer_list = Entry(
            "v5/asset/transfer/query-universal-transfer-list",
            "private",
            "GET",
            '{"cost": 25}',
        )
        self.v5_asset_deposit_query_allowed_list = Entry(
            "v5/asset/deposit/query-allowed-list", "private", "GET", '{"cost": 5}'
        )
        self.v5_asset_deposit_query_record = Entry(
            "v5/asset/deposit/query-record", "private", "GET", '{"cost": 10}'
        )
        self.v5_asset_deposit_query_sub_member_record = Entry(
            "v5/asset/deposit/query-sub-member-record",
            "private",
            "GET",
            '{"cost": 10}',
        )
        self.v5_asset_deposit_query_internal_record = Entry(
            "v5/asset/deposit/query-internal-record",
            "private",
            "GET",
            '{"cost": 5}',
        )
        self.v5_asset_deposit_query_address = Entry(
            "v5/asset/deposit/query-address", "private", "GET", '{"cost": 10}'
        )
        self.v5_asset_deposit_query_sub_member_address = Entry(
            "v5/asset/deposit/query-sub-member-address",
            "private",
            "GET",
            '{"cost": 10}',
        )
        self.v5_asset_coin_query_info = Entry(
            "v5/asset/coin/query-info", "private", "GET", '{"cost": 28}'
        )
        self.v5_asset_withdraw_query_record = Entry(
            "v5/asset/withdraw/query-record", "private", "GET", '{"cost": 10}'
        )
        self.v5_asset_withdraw_withdrawable_amount = Entry(
            "v5/asset/withdraw/withdrawable-amount",
            "private",
            "GET",
            '{"cost": 5}',
        )
        self.v5_asset_withdraw_vasp_list = Entry(
            "v5/asset/withdraw/vasp/list", "private", "GET", '{"cost": 5}'
        )
        self.v5_user_query_sub_members = Entry(
            "v5/user/query-sub-members", "private", "GET", '{"cost": 5}'
        )
        self.v5_user_query_api = Entry(
            "v5/user/query-api", "private", "GET", '{"cost": 5}'
        )
        self.v5_user_sub_apikeys = Entry(
            "v5/user/sub-apikeys", "private", "GET", '{"cost": 5}'
        )
        self.v5_user_get_member_type = Entry(
            "v5/user/get-member-type", "private", "GET", '{"cost": 5}'
        )
        self.v5_user_aff_customer_info = Entry(
            "v5/user/aff-customer-info", "private", "GET", '{"cost": 5}'
        )
        self.v5_user_del_submember = Entry(
            "v5/user/del-submember", "private", "GET", '{"cost": 5}'
        )
        self.v5_user_submembers = Entry(
            "v5/user/submembers", "private", "GET", '{"cost": 5}'
        )
        self.v5_spot_lever_token_order_record = Entry(
            "v5/spot-lever-token/order-record", "private", "GET", '{"cost": 1}'
        )
        self.v5_spot_margin_trade_interest_rate_history = Entry(
            "v5/spot-margin-trade/interest-rate-history",
            "private",
            "GET",
            '{"cost": 5}',
        )
        self.v5_spot_margin_trade_state = Entry(
            "v5/spot-margin-trade/state", "private", "GET", '{"cost": 5}'
        )
        self.v5_spot_cross_margin_trade_loan_info = Entry(
            "v5/spot-cross-margin-trade/loan-info",
            "private",
            "GET",
            '{"cost": 1}',
        )
        self.v5_spot_cross_margin_trade_account = Entry(
            "v5/spot-cross-margin-trade/account", "private", "GET", '{"cost": 1}'
        )
        self.v5_spot_cross_margin_trade_orders = Entry(
            "v5/spot-cross-margin-trade/orders", "private", "GET", '{"cost": 1}'
        )
        self.v5_spot_cross_margin_trade_repay_history = Entry(
            "v5/spot-cross-margin-trade/repay-history",
            "private",
            "GET",
            '{"cost": 1}',
        )
        self.v5_ins_loan_product_infos_private = Entry(
            "v5/ins-loan/product-infos", "private", "GET", '{"cost": 5}'
        )
        self.v5_ins_loan_ensure_tokens_convert_private = Entry(
            "v5/ins-loan/ensure-tokens-convert", "private", "GET", '{"cost": 5}'
        )
        self.v5_ins_loan_loan_order = Entry(
            "v5/ins-loan/loan-order", "private", "GET", '{"cost": 5}'
        )
        self.v5_ins_loan_repaid_history = Entry(
            "v5/ins-loan/repaid-history", "private", "GET", '{"cost": 5}'
        )
        self.v5_ins_loan_ltv_convert = Entry(
            "v5/ins-loan/ltv-convert", "private", "GET", '{"cost": 5}'
        )
        self.v5_lending_info = Entry(
            "v5/lending/info", "private", "GET", '{"cost": 5}'
        )
        self.v5_lending_history_order = Entry(
            "v5/lending/history-order", "private", "GET", '{"cost": 5}'
        )
        self.v5_lending_account = Entry(
            "v5/lending/account", "private", "GET", '{"cost": 5}'
        )
        self.v5_broker_earning_record = Entry(
            "v5/broker/earning-record", "private", "GET", '{"cost": 5}'
        )
        self.v5_broker_earnings_info = Entry(
            "v5/broker/earnings-info", "private", "GET", '{"cost": 5}'
        )
        self.v5_broker_account_info = Entry(
            "v5/broker/account-info", "private", "GET", '{"cost": 5}'
        )
        self.v5_broker_asset_query_sub_member_deposit_record = Entry(
            "v5/broker/asset/query-sub-member-deposit-record",
            "private",
            "GET",
            '{"cost": 10}',
        )
        self.spot_v3_private_order_post = Entry(
            "spot/v3/private/order", "private", "POST", '{"cost": 2.5}'
        )
        self.spot_v3_private_cancel_order = Entry(
            "spot/v3/private/cancel-order", "private", "POST", '{"cost": 2.5}'
        )
        self.spot_v3_private_cancel_orders = Entry(
            "spot/v3/private/cancel-orders", "private", "POST", '{"cost": 2.5}'
        )
        self.spot_v3_private_cancel_orders_by_ids = Entry(
            "spot/v3/private/cancel-orders-by-ids",
            "private",
            "POST",
            '{"cost": 2.5}',
        )
        self.spot_v3_private_purchase = Entry(
            "spot/v3/private/purchase", "private", "POST", '{"cost": 2.5}'
        )
        self.spot_v3_private_redeem = Entry(
            "spot/v3/private/redeem", "private", "POST", '{"cost": 2.5}'
        )
        self.spot_v3_private_cross_margin_loan = Entry(
            "spot/v3/private/cross-margin-loan", "private", "POST", '{"cost": 10}'
        )
        self.spot_v3_private_cross_margin_repay = Entry(
            "spot/v3/private/cross-margin-repay",
            "private",
            "POST",
            '{"cost": 10}',
        )
        self.asset_v3_private_transfer_inter_transfer = Entry(
            "asset/v3/private/transfer/inter-transfer",
            "private",
            "POST",
            '{"cost": 150}',
        )
        self.asset_v3_private_withdraw_create = Entry(
            "asset/v3/private/withdraw/create", "private", "POST", '{"cost": 300}'
        )
        self.asset_v3_private_withdraw_cancel = Entry(
            "asset/v3/private/withdraw/cancel", "private", "POST", '{"cost": 50}'
        )
        self.asset_v3_private_transfer_sub_member_transfer = Entry(
            "asset/v3/private/transfer/sub-member-transfer",
            "private",
            "POST",
            '{"cost": 150}',
        )
        self.asset_v3_private_transfer_transfer_sub_member_save = Entry(
            "asset/v3/private/transfer/transfer-sub-member-save",
            "private",
            "POST",
            '{"cost": 150}',
        )
        self.asset_v3_private_transfer_universal_transfer = Entry(
            "asset/v3/private/transfer/universal-transfer",
            "private",
            "POST",
            '{"cost": 10}',
        )
        self.user_v3_private_create_sub_member = Entry(
            "user/v3/private/create-sub-member", "private", "POST", '{"cost": 10}'
        )
        self.user_v3_private_create_sub_api = Entry(
            "user/v3/private/create-sub-api", "private", "POST", '{"cost": 10}'
        )
        self.user_v3_private_update_api = Entry(
            "user/v3/private/update-api", "private", "POST", '{"cost": 10}'
        )
        self.user_v3_private_delete_api = Entry(
            "user/v3/private/delete-api", "private", "POST", '{"cost": 10}'
        )
        self.user_v3_private_update_sub_api = Entry(
            "user/v3/private/update-sub-api", "private", "POST", '{"cost": 10}'
        )
        self.user_v3_private_delete_sub_api = Entry(
            "user/v3/private/delete-sub-api", "private", "POST", '{"cost": 10}'
        )
        self.contract_v3_private_copytrading_order_create = Entry(
            "contract/v3/private/copytrading/order/create",
            "private",
            "POST",
            '{"cost": 30}',
        )
        self.contract_v3_private_copytrading_order_cancel = Entry(
            "contract/v3/private/copytrading/order/cancel",
            "private",
            "POST",
            '{"cost": 30}',
        )
        self.contract_v3_private_copytrading_order_close = Entry(
            "contract/v3/private/copytrading/order/close",
            "private",
            "POST",
            '{"cost": 30}',
        )
        self.contract_v3_private_copytrading_position_close = Entry(
            "contract/v3/private/copytrading/position/close",
            "private",
            "POST",
            '{"cost": 40}',
        )
        self.contract_v3_private_copytrading_position_set_leverage = Entry(
            "contract/v3/private/copytrading/position/set-leverage",
            "private",
            "POST",
            '{"cost": 40}',
        )
        self.contract_v3_private_copytrading_wallet_transfer = Entry(
            "contract/v3/private/copytrading/wallet/transfer",
            "private",
            "POST",
            '{"cost": 25}',
        )
        self.contract_v3_private_copytrading_order_trading_stop = Entry(
            "contract/v3/private/copytrading/order/trading-stop",
            "private",
            "POST",
            '{"cost": 2.5}',
        )
        self.contract_v3_private_order_create = Entry(
            "contract/v3/private/order/create", "private", "POST", '{"cost": 1}'
        )
        self.contract_v3_private_order_cancel = Entry(
            "contract/v3/private/order/cancel", "private", "POST", '{"cost": 1}'
        )
        self.contract_v3_private_order_cancel_all = Entry(
            "contract/v3/private/order/cancel-all",
            "private",
            "POST",
            '{"cost": 1}',
        )
        self.contract_v3_private_order_replace = Entry(
            "contract/v3/private/order/replace", "private", "POST", '{"cost": 1}'
        )
        self.contract_v3_private_position_set_auto_add_margin = Entry(
            "contract/v3/private/position/set-auto-add-margin",
            "private",
            "POST",
            '{"cost": 1}',
        )
        self.contract_v3_private_position_switch_isolated = Entry(
            "contract/v3/private/position/switch-isolated",
            "private",
            "POST",
            '{"cost": 1}',
        )
        self.contract_v3_private_position_switch_mode = Entry(
            "contract/v3/private/position/switch-mode",
            "private",
            "POST",
            '{"cost": 1}',
        )
        self.contract_v3_private_position_switch_tpsl_mode = Entry(
            "contract/v3/private/position/switch-tpsl-mode",
            "private",
            "POST",
            '{"cost": 1}',
        )
        self.contract_v3_private_position_set_leverage = Entry(
            "contract/v3/private/position/set-leverage",
            "private",
            "POST",
            '{"cost": 1}',
        )
        self.contract_v3_private_position_trading_stop = Entry(
            "contract/v3/private/position/trading-stop",
            "private",
            "POST",
            '{"cost": 1}',
        )
        self.contract_v3_private_position_set_risk_limit = Entry(
            "contract/v3/private/position/set-risk-limit",
            "private",
            "POST",
            '{"cost": 1}',
        )
        self.contract_v3_private_account_setmarginmode = Entry(
            "contract/v3/private/account/setMarginMode",
            "private",
            "POST",
            '{"cost": 1}',
        )
        self.unified_v3_private_order_create = Entry(
            "unified/v3/private/order/create", "private", "POST", '{"cost": 30}'
        )
        self.unified_v3_private_order_replace = Entry(
            "unified/v3/private/order/replace", "private", "POST", '{"cost": 30}'
        )
        self.unified_v3_private_order_cancel = Entry(
            "unified/v3/private/order/cancel", "private", "POST", '{"cost": 30}'
        )
        self.unified_v3_private_order_create_batch = Entry(
            "unified/v3/private/order/create-batch",
            "private",
            "POST",
            '{"cost": 30}',
        )
        self.unified_v3_private_order_replace_batch = Entry(
            "unified/v3/private/order/replace-batch",
            "private",
            "POST",
            '{"cost": 30}',
        )
        self.unified_v3_private_order_cancel_batch = Entry(
            "unified/v3/private/order/cancel-batch",
            "private",
            "POST",
            '{"cost": 30}',
        )
        self.unified_v3_private_order_cancel_all = Entry(
            "unified/v3/private/order/cancel-all",
            "private",
            "POST",
            '{"cost": 30}',
        )
        self.unified_v3_private_position_set_leverage = Entry(
            "unified/v3/private/position/set-leverage",
            "private",
            "POST",
            '{"cost": 2.5}',
        )
        self.unified_v3_private_position_tpsl_switch_mode = Entry(
            "unified/v3/private/position/tpsl/switch-mode",
            "private",
            "POST",
            '{"cost": 2.5}',
        )
        self.unified_v3_private_position_set_risk_limit = Entry(
            "unified/v3/private/position/set-risk-limit",
            "private",
            "POST",
            '{"cost": 2.5}',
        )
        self.unified_v3_private_position_trading_stop = Entry(
            "unified/v3/private/position/trading-stop",
            "private",
            "POST",
            '{"cost": 2.5}',
        )
        self.unified_v3_private_account_upgrade_unified_account = Entry(
            "unified/v3/private/account/upgrade-unified-account",
            "private",
            "POST",
            '{"cost": 2.5}',
        )
        self.unified_v3_private_account_setmarginmode = Entry(
            "unified/v3/private/account/setMarginMode",
            "private",
            "POST",
            '{"cost": 2.5}',
        )
        self.fht_compliance_tax_v3_private_registertime = Entry(
            "fht/compliance/tax/v3/private/registertime",
            "private",
            "POST",
            '{"cost": 50}',
        )
        self.fht_compliance_tax_v3_private_create = Entry(
            "fht/compliance/tax/v3/private/create",
            "private",
            "POST",
            '{"cost": 50}',
        )
        self.fht_compliance_tax_v3_private_status = Entry(
            "fht/compliance/tax/v3/private/status",
            "private",
            "POST",
            '{"cost": 50}',
        )
        self.fht_compliance_tax_v3_private_url = Entry(
            "fht/compliance/tax/v3/private/url", "private", "POST", '{"cost": 50}'
        )
        self.v5_order_create = Entry(
            "v5/order/create", "private", "POST", '{"cost": 2.5}'
        )
        self.v5_order_amend = Entry(
            "v5/order/amend", "private", "POST", '{"cost": 5}'
        )
        self.v5_order_cancel = Entry(
            "v5/order/cancel", "private", "POST", '{"cost": 2.5}'
        )
        self.v5_order_cancel_all = Entry(
            "v5/order/cancel-all", "private", "POST", '{"cost": 50}'
        )
        self.v5_order_create_batch = Entry(
            "v5/order/create-batch", "private", "POST", '{"cost": 5}'
        )
        self.v5_order_amend_batch = Entry(
            "v5/order/amend-batch", "private", "POST", '{"cost": 5}'
        )
        self.v5_order_cancel_batch = Entry(
            "v5/order/cancel-batch", "private", "POST", '{"cost": 5}'
        )
        self.v5_order_disconnected_cancel_all = Entry(
            "v5/order/disconnected-cancel-all", "private", "POST", '{"cost": 5}'
        )
        self.v5_position_set_leverage = Entry(
            "v5/position/set-leverage", "private", "POST", '{"cost": 5}'
        )
        self.v5_position_switch_isolated = Entry(
            "v5/position/switch-isolated", "private", "POST", '{"cost": 5}'
        )
        self.v5_position_set_tpsl_mode = Entry(
            "v5/position/set-tpsl-mode", "private", "POST", '{"cost": 5}'
        )
        self.v5_position_switch_mode = Entry(
            "v5/position/switch-mode", "private", "POST", '{"cost": 5}'
        )
        self.v5_position_set_risk_limit = Entry(
            "v5/position/set-risk-limit", "private", "POST", '{"cost": 5}'
        )
        self.v5_position_trading_stop = Entry(
            "v5/position/trading-stop", "private", "POST", '{"cost": 5}'
        )
        self.v5_position_set_auto_add_margin = Entry(
            "v5/position/set-auto-add-margin", "private", "POST", '{"cost": 5}'
        )
        self.v5_position_add_margin = Entry(
            "v5/position/add-margin", "private", "POST", '{"cost": 5}'
        )
        self.v5_position_move_positions = Entry(
            "v5/position/move-positions", "private", "POST", '{"cost": 5}'
        )
        self.v5_position_confirm_pending_mmr = Entry(
            "v5/position/confirm-pending-mmr", "private", "POST", '{"cost": 5}'
        )
        self.v5_account_upgrade_to_uta = Entry(
            "v5/account/upgrade-to-uta", "private", "POST", '{"cost": 5}'
        )
        self.v5_account_quick_repayment = Entry(
            "v5/account/quick-repayment", "private", "POST", '{"cost": 5}'
        )
        self.v5_account_set_margin_mode = Entry(
            "v5/account/set-margin-mode", "private", "POST", '{"cost": 5}'
        )
        self.v5_account_set_hedging_mode = Entry(
            "v5/account/set-hedging-mode", "private", "POST", '{"cost": 5}'
        )
        self.v5_account_mmp_modify = Entry(
            "v5/account/mmp-modify", "private", "POST", '{"cost": 5}'
        )
        self.v5_account_mmp_reset = Entry(
            "v5/account/mmp-reset", "private", "POST", '{"cost": 5}'
        )
        self.v5_asset_exchange_quote_apply = Entry(
            "v5/asset/exchange/quote-apply", "private", "POST", '{"cost": 1}'
        )
        self.v5_asset_exchange_convert_execute = Entry(
            "v5/asset/exchange/convert-execute", "private", "POST", '{"cost": 1}'
        )
        self.v5_asset_transfer_inter_transfer = Entry(
            "v5/asset/transfer/inter-transfer", "private", "POST", '{"cost": 50}'
        )
        self.v5_asset_transfer_save_transfer_sub_member = Entry(
            "v5/asset/transfer/save-transfer-sub-member",
            "private",
            "POST",
            '{"cost": 150}',
        )
        self.v5_asset_transfer_universal_transfer = Entry(
            "v5/asset/transfer/universal-transfer",
            "private",
            "POST",
            '{"cost": 10}',
        )
        self.v5_asset_deposit_deposit_to_account = Entry(
            "v5/asset/deposit/deposit-to-account",
            "private",
            "POST",
            '{"cost": 5}',
        )
        self.v5_asset_withdraw_create = Entry(
            "v5/asset/withdraw/create", "private", "POST", '{"cost": 50}'
        )
        self.v5_asset_withdraw_cancel = Entry(
            "v5/asset/withdraw/cancel", "private", "POST", '{"cost": 50}'
        )
        self.v5_user_create_sub_member = Entry(
            "v5/user/create-sub-member", "private", "POST", '{"cost": 10}'
        )
        self.v5_user_create_sub_api = Entry(
            "v5/user/create-sub-api", "private", "POST", '{"cost": 10}'
        )
        self.v5_user_frozen_sub_member = Entry(
            "v5/user/frozen-sub-member", "private", "POST", '{"cost": 10}'
        )
        self.v5_user_update_api = Entry(
            "v5/user/update-api", "private", "POST", '{"cost": 10}'
        )
        self.v5_user_update_sub_api = Entry(
            "v5/user/update-sub-api", "private", "POST", '{"cost": 10}'
        )
        self.v5_user_delete_api = Entry(
            "v5/user/delete-api", "private", "POST", '{"cost": 10}'
        )
        self.v5_user_delete_sub_api = Entry(
            "v5/user/delete-sub-api", "private", "POST", '{"cost": 10}'
        )
        self.v5_spot_lever_token_purchase = Entry(
            "v5/spot-lever-token/purchase", "private", "POST", '{"cost": 2.5}'
        )
        self.v5_spot_lever_token_redeem = Entry(
            "v5/spot-lever-token/redeem", "private", "POST", '{"cost": 2.5}'
        )
        self.v5_spot_margin_trade_switch_mode = Entry(
            "v5/spot-margin-trade/switch-mode", "private", "POST", '{"cost": 5}'
        )
        self.v5_spot_margin_trade_set_leverage = Entry(
            "v5/spot-margin-trade/set-leverage", "private", "POST", '{"cost": 5}'
        )
        self.v5_spot_cross_margin_trade_loan = Entry(
            "v5/spot-cross-margin-trade/loan", "private", "POST", '{"cost": 2.5}'
        )
        self.v5_spot_cross_margin_trade_repay = Entry(
            "v5/spot-cross-margin-trade/repay", "private", "POST", '{"cost": 2.5}'
        )
        self.v5_spot_cross_margin_trade_switch = Entry(
            "v5/spot-cross-margin-trade/switch",
            "private",
            "POST",
            '{"cost": 2.5}',
        )
        self.v5_ins_loan_association_uid = Entry(
            "v5/ins-loan/association-uid", "private", "POST", '{"cost": 5}'
        )
        self.v5_lending_purchase = Entry(
            "v5/lending/purchase", "private", "POST", '{"cost": 5}'
        )
        self.v5_lending_redeem = Entry(
            "v5/lending/redeem", "private", "POST", '{"cost": 5}'
        )
        self.v5_lending_redeem_cancel = Entry(
            "v5/lending/redeem-cancel", "private", "POST", '{"cost": 5}'
        )
        self.v5_account_set_collateral_switch = Entry(
            "v5/account/set-collateral-switch", "private", "POST", '{"cost": 5}'
        )
        self.v5_account_set_collateral_switch_batch = Entry(
            "v5/account/set-collateral-switch-batch",
            "private",
            "POST",
            '{"cost": 5}',
        )
        self.v5_account_demo_apply_money = Entry(
            "v5/account/demo-apply-money", "private", "POST", '{"cost": 5}'
        )
