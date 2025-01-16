from ccxt.base.types import Entry


@value
struct ImplicitAPI:
    var wallet_get_currency_chains: Entry
    var spot_get_currencies: Entry
    var spot_get_currencies_currency: Entry
    var spot_get_currency_pairs: Entry
    var spot_get_currency_pairs_currency_pair: Entry
    var spot_get_tickers: Entry
    var spot_get_order_book: Entry
    var spot_get_trades: Entry
    var spot_get_candlesticks: Entry
    var spot_get_time: Entry
    var margin_get_currency_pairs: Entry
    var margin_get_currency_pairs_currency_pair: Entry
    var margin_get_funding_book: Entry
    var margin_get_cross_currencies: Entry
    var margin_get_cross_currencies_currency: Entry
    var margin_get_uni_currency_pairs: Entry
    var margin_get_uni_currency_pairs_currency_pair: Entry
    var flash_swap_get_currencies: Entry
    var futures_get_settle_contracts: Entry
    var futures_get_settle_contracts_contract: Entry
    var futures_get_settle_order_book: Entry
    var futures_get_settle_trades: Entry
    var futures_get_settle_candlesticks: Entry
    var futures_get_settle_premium_index: Entry
    var futures_get_settle_tickers: Entry
    var futures_get_settle_funding_rate: Entry
    var futures_get_settle_insurance: Entry
    var futures_get_settle_contract_stats: Entry
    var futures_get_settle_index_constituents_index: Entry
    var futures_get_settle_liq_orders: Entry
    var delivery_get_settle_contracts: Entry
    var delivery_get_settle_contracts_contract: Entry
    var delivery_get_settle_order_book: Entry
    var delivery_get_settle_trades: Entry
    var delivery_get_settle_candlesticks: Entry
    var delivery_get_settle_tickers: Entry
    var delivery_get_settle_insurance: Entry
    var options_get_underlyings: Entry
    var options_get_expirations: Entry
    var options_get_contracts: Entry
    var options_get_contracts_contract: Entry
    var options_get_settlements: Entry
    var options_get_settlements_contract: Entry
    var options_get_order_book: Entry
    var options_get_tickers: Entry
    var options_get_underlying_tickers_underlying: Entry
    var options_get_candlesticks: Entry
    var options_get_underlying_candlesticks: Entry
    var options_get_trades: Entry
    var earn_get_uni_currencies: Entry
    var earn_get_uni_currencies_currency: Entry
    var withdrawals_post_withdrawals: Entry
    var withdrawals_delete_withdrawals_withdrawal_id: Entry
    var wallet_get_deposit_address: Entry
    var wallet_get_withdrawals: Entry
    var wallet_get_deposits: Entry
    var wallet_get_sub_account_transfers: Entry
    var wallet_get_withdraw_status: Entry
    var wallet_get_sub_account_balances: Entry
    var wallet_get_sub_account_margin_balances: Entry
    var wallet_get_sub_account_futures_balances: Entry
    var wallet_get_sub_account_cross_margin_balances: Entry
    var wallet_get_saved_address: Entry
    var wallet_get_fee: Entry
    var wallet_get_total_balance: Entry
    var wallet_get_small_balance: Entry
    var wallet_get_small_balance_history: Entry
    var wallet_post_transfers: Entry
    var wallet_post_sub_account_transfers: Entry
    var wallet_post_sub_account_to_sub_account: Entry
    var wallet_post_small_balance: Entry
    var subaccounts_get_sub_accounts: Entry
    var subaccounts_get_sub_accounts_user_id: Entry
    var subaccounts_get_sub_accounts_user_id_keys: Entry
    var subaccounts_get_sub_accounts_user_id_keys_key: Entry
    var subaccounts_post_sub_accounts: Entry
    var subaccounts_post_sub_accounts_user_id_keys: Entry
    var subaccounts_post_sub_accounts_user_id_lock: Entry
    var subaccounts_post_sub_accounts_user_id_unlock: Entry
    var subaccounts_put_sub_accounts_user_id_keys_key: Entry
    var subaccounts_delete_sub_accounts_user_id_keys_key: Entry
    var unified_get_accounts: Entry
    var unified_get_account_mode: Entry
    var unified_get_borrowable: Entry
    var unified_get_transferable: Entry
    var unified_get_loans: Entry
    var unified_get_loan_records: Entry
    var unified_get_interest_records: Entry
    var unified_get_estimate_rate: Entry
    var unified_get_currency_discount_tiers: Entry
    var unified_get_risk_units: Entry
    var unified_get_unified_mode: Entry
    var unified_get_loan_margin_tiers: Entry
    var unified_post_account_mode: Entry
    var unified_post_loans: Entry
    var unified_post_portfolio_calculator: Entry
    var unified_put_unified_mode: Entry
    var spot_get_fee: Entry
    var spot_get_batch_fee: Entry
    var spot_get_accounts: Entry
    var spot_get_account_book: Entry
    var spot_get_open_orders: Entry
    var spot_get_orders: Entry
    var spot_get_orders_order_id: Entry
    var spot_get_my_trades: Entry
    var spot_get_price_orders: Entry
    var spot_get_price_orders_order_id: Entry
    var spot_post_batch_orders: Entry
    var spot_post_cross_liquidate_orders: Entry
    var spot_post_orders: Entry
    var spot_post_cancel_batch_orders: Entry
    var spot_post_countdown_cancel_all: Entry
    var spot_post_amend_batch_orders: Entry
    var spot_post_price_orders: Entry
    var spot_delete_orders: Entry
    var spot_delete_orders_order_id: Entry
    var spot_delete_price_orders: Entry
    var spot_delete_price_orders_order_id: Entry
    var spot_patch_orders_order_id: Entry
    var margin_get_accounts: Entry
    var margin_get_account_book: Entry
    var margin_get_funding_accounts: Entry
    var margin_get_auto_repay: Entry
    var margin_get_transferable: Entry
    var margin_get_loans: Entry
    var margin_get_loans_loan_id: Entry
    var margin_get_loans_loan_id_repayment: Entry
    var margin_get_loan_records: Entry
    var margin_get_loan_records_loan_record_id: Entry
    var margin_get_borrowable: Entry
    var margin_get_cross_accounts: Entry
    var margin_get_cross_account_book: Entry
    var margin_get_cross_loans: Entry
    var margin_get_cross_loans_loan_id: Entry
    var margin_get_cross_repayments: Entry
    var margin_get_cross_interest_records: Entry
    var margin_get_cross_transferable: Entry
    var margin_get_cross_estimate_rate: Entry
    var margin_get_cross_borrowable: Entry
    var margin_get_uni_estimate_rate: Entry
    var margin_get_uni_loans: Entry
    var margin_get_uni_loan_records: Entry
    var margin_get_uni_interest_records: Entry
    var margin_get_uni_borrowable: Entry
    var margin_post_auto_repay: Entry
    var margin_post_loans: Entry
    var margin_post_merged_loans: Entry
    var margin_post_loans_loan_id_repayment: Entry
    var margin_post_cross_loans: Entry
    var margin_post_cross_repayments: Entry
    var margin_post_uni_loans: Entry
    var margin_patch_loans_loan_id: Entry
    var margin_patch_loan_records_loan_record_id: Entry
    var margin_delete_loans_loan_id: Entry
    var flash_swap_get_currencies_private: Entry
    var flash_swap_get_currency_pairs: Entry
    var flash_swap_get_orders: Entry
    var flash_swap_get_orders_order_id: Entry
    var flash_swap_post_orders: Entry
    var flash_swap_post_orders_preview: Entry
    var futures_get_settle_accounts: Entry
    var futures_get_settle_account_book: Entry
    var futures_get_settle_positions: Entry
    var futures_get_settle_positions_contract: Entry
    var futures_get_settle_dual_comp_positions_contract: Entry
    var futures_get_settle_orders: Entry
    var futures_get_settle_orders_timerange: Entry
    var futures_get_settle_orders_order_id: Entry
    var futures_get_settle_my_trades: Entry
    var futures_get_settle_my_trades_timerange: Entry
    var futures_get_settle_position_close: Entry
    var futures_get_settle_liquidates: Entry
    var futures_get_settle_auto_deleverages: Entry
    var futures_get_settle_fee: Entry
    var futures_get_settle_risk_limit_tiers: Entry
    var futures_get_settle_price_orders: Entry
    var futures_get_settle_price_orders_order_id: Entry
    var futures_post_settle_positions_contract_margin: Entry
    var futures_post_settle_positions_contract_leverage: Entry
    var futures_post_settle_positions_contract_risk_limit: Entry
    var futures_post_settle_dual_mode: Entry
    var futures_post_settle_dual_comp_positions_contract_margin: Entry
    var futures_post_settle_dual_comp_positions_contract_leverage: Entry
    var futures_post_settle_dual_comp_positions_contract_risk_limit: Entry
    var futures_post_settle_orders: Entry
    var futures_post_settle_batch_orders: Entry
    var futures_post_settle_countdown_cancel_all: Entry
    var futures_post_settle_batch_cancel_orders: Entry
    var futures_post_settle_price_orders: Entry
    var futures_put_settle_orders_order_id: Entry
    var futures_delete_settle_orders: Entry
    var futures_delete_settle_orders_order_id: Entry
    var futures_delete_settle_price_orders: Entry
    var futures_delete_settle_price_orders_order_id: Entry
    var delivery_get_settle_accounts: Entry
    var delivery_get_settle_account_book: Entry
    var delivery_get_settle_positions: Entry
    var delivery_get_settle_positions_contract: Entry
    var delivery_get_settle_orders: Entry
    var delivery_get_settle_orders_order_id: Entry
    var delivery_get_settle_my_trades: Entry
    var delivery_get_settle_position_close: Entry
    var delivery_get_settle_liquidates: Entry
    var delivery_get_settle_settlements: Entry
    var delivery_get_settle_price_orders: Entry
    var delivery_get_settle_price_orders_order_id: Entry
    var delivery_post_settle_positions_contract_margin: Entry
    var delivery_post_settle_positions_contract_leverage: Entry
    var delivery_post_settle_positions_contract_risk_limit: Entry
    var delivery_post_settle_orders: Entry
    var delivery_post_settle_price_orders: Entry
    var delivery_delete_settle_orders: Entry
    var delivery_delete_settle_orders_order_id: Entry
    var delivery_delete_settle_price_orders: Entry
    var delivery_delete_settle_price_orders_order_id: Entry
    var options_get_my_settlements: Entry
    var options_get_accounts: Entry
    var options_get_account_book: Entry
    var options_get_positions: Entry
    var options_get_positions_contract: Entry
    var options_get_position_close: Entry
    var options_get_orders: Entry
    var options_get_orders_order_id: Entry
    var options_get_my_trades: Entry
    var options_post_orders: Entry
    var options_delete_orders: Entry
    var options_delete_orders_order_id: Entry
    var earn_get_uni_currencies_private: Entry
    var earn_get_uni_currencies_currency_private: Entry
    var earn_get_uni_lends: Entry
    var earn_get_uni_lend_records: Entry
    var earn_get_uni_interests_currency: Entry
    var earn_get_uni_interest_records: Entry
    var earn_get_uni_interest_status_currency: Entry
    var earn_post_uni_lends: Entry
    var earn_put_uni_interest_reinvest: Entry
    var earn_patch_uni_lends: Entry
    var loan_get_collateral_orders: Entry
    var loan_get_collateral_orders_order_id: Entry
    var loan_get_collateral_repay_records: Entry
    var loan_get_collateral_collaterals: Entry
    var loan_get_collateral_total_amount: Entry
    var loan_get_collateral_ltv: Entry
    var loan_get_collateral_currencies: Entry
    var loan_get_multi_collateral_orders: Entry
    var loan_get_multi_collateral_orders_order_id: Entry
    var loan_get_multi_collateral_repay: Entry
    var loan_get_multi_collateral_mortgage: Entry
    var loan_get_multi_collateral_currency_quota: Entry
    var loan_get_multi_collateral_currencies: Entry
    var loan_get_multi_collateral_ltv: Entry
    var loan_get_multi_collateral_fixed_rate: Entry
    var loan_post_collateral_orders: Entry
    var loan_post_collateral_repay: Entry
    var loan_post_collateral_collaterals: Entry
    var loan_post_multi_collateral_orders: Entry
    var loan_post_multi_collateral_repay: Entry
    var loan_post_multi_collateral_mortgage: Entry
    var account_get_detail: Entry
    var account_get_stp_groups: Entry
    var account_get_stp_groups_stp_id_users: Entry
    var account_post_stp_groups: Entry
    var account_post_stp_groups_stp_id_users: Entry
    var account_delete_stp_groups_stp_id_users: Entry
    var rebate_get_agency_transaction_history: Entry
    var rebate_get_agency_commission_history: Entry

    fn __init__(out self):
        self.wallet_get_currency_chains = Entry(
            "currency_chains", '["public", "wallet"]', "GET", '{"cost": 1}'
        )
        self.spot_get_currencies = Entry(
            "currencies", '["public", "spot"]', "GET", '{"cost": 1}'
        )
        self.spot_get_currencies_currency = Entry(
            "currencies/{currency}", '["public", "spot"]', "GET", '{"cost": 1}'
        )
        self.spot_get_currency_pairs = Entry(
            "currency_pairs", '["public", "spot"]', "GET", '{"cost": 1}'
        )
        self.spot_get_currency_pairs_currency_pair = Entry(
            "currency_pairs/{currency_pair}",
            '["public", "spot"]',
            "GET",
            '{"cost": 1}',
        )
        self.spot_get_tickers = Entry(
            "tickers", '["public", "spot"]', "GET", '{"cost": 1}'
        )
        self.spot_get_order_book = Entry(
            "order_book", '["public", "spot"]', "GET", '{"cost": 1}'
        )
        self.spot_get_trades = Entry(
            "trades", '["public", "spot"]', "GET", '{"cost": 1}'
        )
        self.spot_get_candlesticks = Entry(
            "candlesticks", '["public", "spot"]', "GET", '{"cost": 1}'
        )
        self.spot_get_time = Entry(
            "time", '["public", "spot"]', "GET", '{"cost": 1}'
        )
        self.margin_get_currency_pairs = Entry(
            "currency_pairs", '["public", "margin"]', "GET", '{"cost": 1}'
        )
        self.margin_get_currency_pairs_currency_pair = Entry(
            "currency_pairs/{currency_pair}",
            '["public", "margin"]',
            "GET",
            '{"cost": 1}',
        )
        self.margin_get_funding_book = Entry(
            "funding_book", '["public", "margin"]', "GET", '{"cost": 1}'
        )
        self.margin_get_cross_currencies = Entry(
            "cross/currencies", '["public", "margin"]', "GET", '{"cost": 1}'
        )
        self.margin_get_cross_currencies_currency = Entry(
            "cross/currencies/{currency}",
            '["public", "margin"]',
            "GET",
            '{"cost": 1}',
        )
        self.margin_get_uni_currency_pairs = Entry(
            "uni/currency_pairs", '["public", "margin"]', "GET", '{"cost": 1}'
        )
        self.margin_get_uni_currency_pairs_currency_pair = Entry(
            "uni/currency_pairs/{currency_pair}",
            '["public", "margin"]',
            "GET",
            '{"cost": 1}',
        )
        self.flash_swap_get_currencies = Entry(
            "currencies", '["public", "flash_swap"]', "GET", '{"cost": 1}'
        )
        self.futures_get_settle_contracts = Entry(
            "{settle}/contracts", '["public", "futures"]', "GET", '{"cost": 1}'
        )
        self.futures_get_settle_contracts_contract = Entry(
            "{settle}/contracts/{contract}",
            '["public", "futures"]',
            "GET",
            '{"cost": 1}',
        )
        self.futures_get_settle_order_book = Entry(
            "{settle}/order_book", '["public", "futures"]', "GET", '{"cost": 1}'
        )
        self.futures_get_settle_trades = Entry(
            "{settle}/trades", '["public", "futures"]', "GET", '{"cost": 1}'
        )
        self.futures_get_settle_candlesticks = Entry(
            "{settle}/candlesticks", '["public", "futures"]', "GET", '{"cost": 1}'
        )
        self.futures_get_settle_premium_index = Entry(
            "{settle}/premium_index",
            '["public", "futures"]',
            "GET",
            '{"cost": 1}',
        )
        self.futures_get_settle_tickers = Entry(
            "{settle}/tickers", '["public", "futures"]', "GET", '{"cost": 1}'
        )
        self.futures_get_settle_funding_rate = Entry(
            "{settle}/funding_rate", '["public", "futures"]', "GET", '{"cost": 1}'
        )
        self.futures_get_settle_insurance = Entry(
            "{settle}/insurance", '["public", "futures"]', "GET", '{"cost": 1}'
        )
        self.futures_get_settle_contract_stats = Entry(
            "{settle}/contract_stats",
            '["public", "futures"]',
            "GET",
            '{"cost": 1}',
        )
        self.futures_get_settle_index_constituents_index = Entry(
            "{settle}/index_constituents/{index}",
            '["public", "futures"]',
            "GET",
            '{"cost": 1}',
        )
        self.futures_get_settle_liq_orders = Entry(
            "{settle}/liq_orders", '["public", "futures"]', "GET", '{"cost": 1}'
        )
        self.delivery_get_settle_contracts = Entry(
            "{settle}/contracts", '["public", "delivery"]', "GET", '{"cost": 1}'
        )
        self.delivery_get_settle_contracts_contract = Entry(
            "{settle}/contracts/{contract}",
            '["public", "delivery"]',
            "GET",
            '{"cost": 1}',
        )
        self.delivery_get_settle_order_book = Entry(
            "{settle}/order_book", '["public", "delivery"]', "GET", '{"cost": 1}'
        )
        self.delivery_get_settle_trades = Entry(
            "{settle}/trades", '["public", "delivery"]', "GET", '{"cost": 1}'
        )
        self.delivery_get_settle_candlesticks = Entry(
            "{settle}/candlesticks",
            '["public", "delivery"]',
            "GET",
            '{"cost": 1}',
        )
        self.delivery_get_settle_tickers = Entry(
            "{settle}/tickers", '["public", "delivery"]', "GET", '{"cost": 1}'
        )
        self.delivery_get_settle_insurance = Entry(
            "{settle}/insurance", '["public", "delivery"]', "GET", '{"cost": 1}'
        )
        self.options_get_underlyings = Entry(
            "underlyings", '["public", "options"]', "GET", '{"cost": 1}'
        )
        self.options_get_expirations = Entry(
            "expirations", '["public", "options"]', "GET", '{"cost": 1}'
        )
        self.options_get_contracts = Entry(
            "contracts", '["public", "options"]', "GET", '{"cost": 1}'
        )
        self.options_get_contracts_contract = Entry(
            "contracts/{contract}", '["public", "options"]', "GET", '{"cost": 1}'
        )
        self.options_get_settlements = Entry(
            "settlements", '["public", "options"]', "GET", '{"cost": 1}'
        )
        self.options_get_settlements_contract = Entry(
            "settlements/{contract}",
            '["public", "options"]',
            "GET",
            '{"cost": 1}',
        )
        self.options_get_order_book = Entry(
            "order_book", '["public", "options"]', "GET", '{"cost": 1}'
        )
        self.options_get_tickers = Entry(
            "tickers", '["public", "options"]', "GET", '{"cost": 1}'
        )
        self.options_get_underlying_tickers_underlying = Entry(
            "underlying/tickers/{underlying}",
            '["public", "options"]',
            "GET",
            '{"cost": 1}',
        )
        self.options_get_candlesticks = Entry(
            "candlesticks", '["public", "options"]', "GET", '{"cost": 1}'
        )
        self.options_get_underlying_candlesticks = Entry(
            "underlying/candlesticks",
            '["public", "options"]',
            "GET",
            '{"cost": 1}',
        )
        self.options_get_trades = Entry(
            "trades", '["public", "options"]', "GET", '{"cost": 1}'
        )
        self.earn_get_uni_currencies = Entry(
            "uni/currencies", '["public", "earn"]', "GET", '{"cost": 1}'
        )
        self.earn_get_uni_currencies_currency = Entry(
            "uni/currencies/{currency}",
            '["public", "earn"]',
            "GET",
            '{"cost": 1}',
        )
        self.withdrawals_post_withdrawals = Entry(
            "withdrawals", '["private", "withdrawals"]', "POST", '{"cost": 20}'
        )
        self.withdrawals_delete_withdrawals_withdrawal_id = Entry(
            "withdrawals/{withdrawal_id}",
            '["private", "withdrawals"]',
            "DELETE",
            '{"cost": 1}',
        )
        self.wallet_get_deposit_address = Entry(
            "deposit_address", '["private", "wallet"]', "GET", '{"cost": 1}'
        )
        self.wallet_get_withdrawals = Entry(
            "withdrawals", '["private", "wallet"]', "GET", '{"cost": 1}'
        )
        self.wallet_get_deposits = Entry(
            "deposits", '["private", "wallet"]', "GET", '{"cost": 1}'
        )
        self.wallet_get_sub_account_transfers = Entry(
            "sub_account_transfers", '["private", "wallet"]', "GET", '{"cost": 1}'
        )
        self.wallet_get_withdraw_status = Entry(
            "withdraw_status", '["private", "wallet"]', "GET", '{"cost": 1}'
        )
        self.wallet_get_sub_account_balances = Entry(
            "sub_account_balances",
            '["private", "wallet"]',
            "GET",
            '{"cost": 2.5}',
        )
        self.wallet_get_sub_account_margin_balances = Entry(
            "sub_account_margin_balances",
            '["private", "wallet"]',
            "GET",
            '{"cost": 2.5}',
        )
        self.wallet_get_sub_account_futures_balances = Entry(
            "sub_account_futures_balances",
            '["private", "wallet"]',
            "GET",
            '{"cost": 2.5}',
        )
        self.wallet_get_sub_account_cross_margin_balances = Entry(
            "sub_account_cross_margin_balances",
            '["private", "wallet"]',
            "GET",
            '{"cost": 2.5}',
        )
        self.wallet_get_saved_address = Entry(
            "saved_address", '["private", "wallet"]', "GET", '{"cost": 1}'
        )
        self.wallet_get_fee = Entry(
            "fee", '["private", "wallet"]', "GET", '{"cost": 1}'
        )
        self.wallet_get_total_balance = Entry(
            "total_balance", '["private", "wallet"]', "GET", '{"cost": 2.5}'
        )
        self.wallet_get_small_balance = Entry(
            "small_balance", '["private", "wallet"]', "GET", '{"cost": 1}'
        )
        self.wallet_get_small_balance_history = Entry(
            "small_balance_history", '["private", "wallet"]', "GET", '{"cost": 1}'
        )
        self.wallet_post_transfers = Entry(
            "transfers", '["private", "wallet"]', "POST", '{"cost": 2.5}'
        )
        self.wallet_post_sub_account_transfers = Entry(
            "sub_account_transfers",
            '["private", "wallet"]',
            "POST",
            '{"cost": 2.5}',
        )
        self.wallet_post_sub_account_to_sub_account = Entry(
            "sub_account_to_sub_account",
            '["private", "wallet"]',
            "POST",
            '{"cost": 2.5}',
        )
        self.wallet_post_small_balance = Entry(
            "small_balance", '["private", "wallet"]', "POST", '{"cost": 1}'
        )
        self.subaccounts_get_sub_accounts = Entry(
            "sub_accounts", '["private", "subAccounts"]', "GET", '{"cost": 2.5}'
        )
        self.subaccounts_get_sub_accounts_user_id = Entry(
            "sub_accounts/{user_id}",
            '["private", "subAccounts"]',
            "GET",
            '{"cost": 2.5}',
        )
        self.subaccounts_get_sub_accounts_user_id_keys = Entry(
            "sub_accounts/{user_id}/keys",
            '["private", "subAccounts"]',
            "GET",
            '{"cost": 2.5}',
        )
        self.subaccounts_get_sub_accounts_user_id_keys_key = Entry(
            "sub_accounts/{user_id}/keys/{key}",
            '["private", "subAccounts"]',
            "GET",
            '{"cost": 2.5}',
        )
        self.subaccounts_post_sub_accounts = Entry(
            "sub_accounts", '["private", "subAccounts"]', "POST", '{"cost": 2.5}'
        )
        self.subaccounts_post_sub_accounts_user_id_keys = Entry(
            "sub_accounts/{user_id}/keys",
            '["private", "subAccounts"]',
            "POST",
            '{"cost": 2.5}',
        )
        self.subaccounts_post_sub_accounts_user_id_lock = Entry(
            "sub_accounts/{user_id}/lock",
            '["private", "subAccounts"]',
            "POST",
            '{"cost": 2.5}',
        )
        self.subaccounts_post_sub_accounts_user_id_unlock = Entry(
            "sub_accounts/{user_id}/unlock",
            '["private", "subAccounts"]',
            "POST",
            '{"cost": 2.5}',
        )
        self.subaccounts_put_sub_accounts_user_id_keys_key = Entry(
            "sub_accounts/{user_id}/keys/{key}",
            '["private", "subAccounts"]',
            "PUT",
            '{"cost": 2.5}',
        )
        self.subaccounts_delete_sub_accounts_user_id_keys_key = Entry(
            "sub_accounts/{user_id}/keys/{key}",
            '["private", "subAccounts"]',
            "DELETE",
            '{"cost": 2.5}',
        )
        self.unified_get_accounts = Entry(
            "accounts",
            '["private", "unified"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.unified_get_account_mode = Entry(
            "account_mode",
            '["private", "unified"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.unified_get_borrowable = Entry(
            "borrowable",
            '["private", "unified"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.unified_get_transferable = Entry(
            "transferable",
            '["private", "unified"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.unified_get_loans = Entry(
            "loans",
            '["private", "unified"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.unified_get_loan_records = Entry(
            "loan_records",
            '["private", "unified"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.unified_get_interest_records = Entry(
            "interest_records",
            '["private", "unified"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.unified_get_estimate_rate = Entry(
            "estimate_rate",
            '["private", "unified"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.unified_get_currency_discount_tiers = Entry(
            "currency_discount_tiers",
            '["private", "unified"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.unified_get_risk_units = Entry(
            "risk_units",
            '["private", "unified"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.unified_get_unified_mode = Entry(
            "unified_mode",
            '["private", "unified"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.unified_get_loan_margin_tiers = Entry(
            "loan_margin_tiers",
            '["private", "unified"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.unified_post_account_mode = Entry(
            "account_mode",
            '["private", "unified"]',
            "POST",
            '{"cost": 1.3333333333333333}',
        )
        self.unified_post_loans = Entry(
            "loans",
            '["private", "unified"]',
            "POST",
            '{"cost": 13.333333333333334}',
        )
        self.unified_post_portfolio_calculator = Entry(
            "portfolio_calculator",
            '["private", "unified"]',
            "POST",
            '{"cost": 1.3333333333333333}',
        )
        self.unified_put_unified_mode = Entry(
            "unified_mode",
            '["private", "unified"]',
            "PUT",
            '{"cost": 1.3333333333333333}',
        )
        self.spot_get_fee = Entry(
            "fee", '["private", "spot"]', "GET", '{"cost": 1}'
        )
        self.spot_get_batch_fee = Entry(
            "batch_fee", '["private", "spot"]', "GET", '{"cost": 1}'
        )
        self.spot_get_accounts = Entry(
            "accounts", '["private", "spot"]', "GET", '{"cost": 1}'
        )
        self.spot_get_account_book = Entry(
            "account_book", '["private", "spot"]', "GET", '{"cost": 1}'
        )
        self.spot_get_open_orders = Entry(
            "open_orders", '["private", "spot"]', "GET", '{"cost": 1}'
        )
        self.spot_get_orders = Entry(
            "orders", '["private", "spot"]', "GET", '{"cost": 1}'
        )
        self.spot_get_orders_order_id = Entry(
            "orders/{order_id}", '["private", "spot"]', "GET", '{"cost": 1}'
        )
        self.spot_get_my_trades = Entry(
            "my_trades", '["private", "spot"]', "GET", '{"cost": 1}'
        )
        self.spot_get_price_orders = Entry(
            "price_orders", '["private", "spot"]', "GET", '{"cost": 1}'
        )
        self.spot_get_price_orders_order_id = Entry(
            "price_orders/{order_id}", '["private", "spot"]', "GET", '{"cost": 1}'
        )
        self.spot_post_batch_orders = Entry(
            "batch_orders", '["private", "spot"]', "POST", '{"cost": 0.4}'
        )
        self.spot_post_cross_liquidate_orders = Entry(
            "cross_liquidate_orders", '["private", "spot"]', "POST", '{"cost": 1}'
        )
        self.spot_post_orders = Entry(
            "orders", '["private", "spot"]', "POST", '{"cost": 0.4}'
        )
        self.spot_post_cancel_batch_orders = Entry(
            "cancel_batch_orders",
            '["private", "spot"]',
            "POST",
            '{"cost": 0.26666666666666666}',
        )
        self.spot_post_countdown_cancel_all = Entry(
            "countdown_cancel_all",
            '["private", "spot"]',
            "POST",
            '{"cost": 0.26666666666666666}',
        )
        self.spot_post_amend_batch_orders = Entry(
            "amend_batch_orders", '["private", "spot"]', "POST", '{"cost": 0.4}'
        )
        self.spot_post_price_orders = Entry(
            "price_orders", '["private", "spot"]', "POST", '{"cost": 0.4}'
        )
        self.spot_delete_orders = Entry(
            "orders",
            '["private", "spot"]',
            "DELETE",
            '{"cost": 0.26666666666666666}',
        )
        self.spot_delete_orders_order_id = Entry(
            "orders/{order_id}",
            '["private", "spot"]',
            "DELETE",
            '{"cost": 0.26666666666666666}',
        )
        self.spot_delete_price_orders = Entry(
            "price_orders",
            '["private", "spot"]',
            "DELETE",
            '{"cost": 0.26666666666666666}',
        )
        self.spot_delete_price_orders_order_id = Entry(
            "price_orders/{order_id}",
            '["private", "spot"]',
            "DELETE",
            '{"cost": 0.26666666666666666}',
        )
        self.spot_patch_orders_order_id = Entry(
            "orders/{order_id}", '["private", "spot"]', "PATCH", '{"cost": 0.4}'
        )
        self.margin_get_accounts = Entry(
            "accounts",
            '["private", "margin"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.margin_get_account_book = Entry(
            "account_book",
            '["private", "margin"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.margin_get_funding_accounts = Entry(
            "funding_accounts",
            '["private", "margin"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.margin_get_auto_repay = Entry(
            "auto_repay",
            '["private", "margin"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.margin_get_transferable = Entry(
            "transferable",
            '["private", "margin"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.margin_get_loans = Entry(
            "loans",
            '["private", "margin"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.margin_get_loans_loan_id = Entry(
            "loans/{loan_id}",
            '["private", "margin"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.margin_get_loans_loan_id_repayment = Entry(
            "loans/{loan_id}/repayment",
            '["private", "margin"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.margin_get_loan_records = Entry(
            "loan_records",
            '["private", "margin"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.margin_get_loan_records_loan_record_id = Entry(
            "loan_records/{loan_record_id}",
            '["private", "margin"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.margin_get_borrowable = Entry(
            "borrowable",
            '["private", "margin"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.margin_get_cross_accounts = Entry(
            "cross/accounts",
            '["private", "margin"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.margin_get_cross_account_book = Entry(
            "cross/account_book",
            '["private", "margin"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.margin_get_cross_loans = Entry(
            "cross/loans",
            '["private", "margin"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.margin_get_cross_loans_loan_id = Entry(
            "cross/loans/{loan_id}",
            '["private", "margin"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.margin_get_cross_repayments = Entry(
            "cross/repayments",
            '["private", "margin"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.margin_get_cross_interest_records = Entry(
            "cross/interest_records",
            '["private", "margin"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.margin_get_cross_transferable = Entry(
            "cross/transferable",
            '["private", "margin"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.margin_get_cross_estimate_rate = Entry(
            "cross/estimate_rate",
            '["private", "margin"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.margin_get_cross_borrowable = Entry(
            "cross/borrowable",
            '["private", "margin"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.margin_get_uni_estimate_rate = Entry(
            "uni/estimate_rate",
            '["private", "margin"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.margin_get_uni_loans = Entry(
            "uni/loans",
            '["private", "margin"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.margin_get_uni_loan_records = Entry(
            "uni/loan_records",
            '["private", "margin"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.margin_get_uni_interest_records = Entry(
            "uni/interest_records",
            '["private", "margin"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.margin_get_uni_borrowable = Entry(
            "uni/borrowable",
            '["private", "margin"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.margin_post_auto_repay = Entry(
            "auto_repay",
            '["private", "margin"]',
            "POST",
            '{"cost": 1.3333333333333333}',
        )
        self.margin_post_loans = Entry(
            "loans",
            '["private", "margin"]',
            "POST",
            '{"cost": 1.3333333333333333}',
        )
        self.margin_post_merged_loans = Entry(
            "merged_loans",
            '["private", "margin"]',
            "POST",
            '{"cost": 1.3333333333333333}',
        )
        self.margin_post_loans_loan_id_repayment = Entry(
            "loans/{loan_id}/repayment",
            '["private", "margin"]',
            "POST",
            '{"cost": 1.3333333333333333}',
        )
        self.margin_post_cross_loans = Entry(
            "cross/loans",
            '["private", "margin"]',
            "POST",
            '{"cost": 1.3333333333333333}',
        )
        self.margin_post_cross_repayments = Entry(
            "cross/repayments",
            '["private", "margin"]',
            "POST",
            '{"cost": 1.3333333333333333}',
        )
        self.margin_post_uni_loans = Entry(
            "uni/loans",
            '["private", "margin"]',
            "POST",
            '{"cost": 1.3333333333333333}',
        )
        self.margin_patch_loans_loan_id = Entry(
            "loans/{loan_id}",
            '["private", "margin"]',
            "PATCH",
            '{"cost": 1.3333333333333333}',
        )
        self.margin_patch_loan_records_loan_record_id = Entry(
            "loan_records/{loan_record_id}",
            '["private", "margin"]',
            "PATCH",
            '{"cost": 1.3333333333333333}',
        )
        self.margin_delete_loans_loan_id = Entry(
            "loans/{loan_id}",
            '["private", "margin"]',
            "DELETE",
            '{"cost": 1.3333333333333333}',
        )
        self.flash_swap_get_currencies_private = Entry(
            "currencies", '["private", "flash_swap"]', "GET", '{"cost": 1}'
        )
        self.flash_swap_get_currency_pairs = Entry(
            "currency_pairs", '["private", "flash_swap"]', "GET", '{"cost": 1}'
        )
        self.flash_swap_get_orders = Entry(
            "orders", '["private", "flash_swap"]', "GET", '{"cost": 1}'
        )
        self.flash_swap_get_orders_order_id = Entry(
            "orders/{order_id}", '["private", "flash_swap"]', "GET", '{"cost": 1}'
        )
        self.flash_swap_post_orders = Entry(
            "orders", '["private", "flash_swap"]', "POST", '{"cost": 1}'
        )
        self.flash_swap_post_orders_preview = Entry(
            "orders/preview", '["private", "flash_swap"]', "POST", '{"cost": 1}'
        )
        self.futures_get_settle_accounts = Entry(
            "{settle}/accounts", '["private", "futures"]', "GET", '{"cost": 1}'
        )
        self.futures_get_settle_account_book = Entry(
            "{settle}/account_book",
            '["private", "futures"]',
            "GET",
            '{"cost": 1}',
        )
        self.futures_get_settle_positions = Entry(
            "{settle}/positions", '["private", "futures"]', "GET", '{"cost": 1}'
        )
        self.futures_get_settle_positions_contract = Entry(
            "{settle}/positions/{contract}",
            '["private", "futures"]',
            "GET",
            '{"cost": 1}',
        )
        self.futures_get_settle_dual_comp_positions_contract = Entry(
            "{settle}/dual_comp/positions/{contract}",
            '["private", "futures"]',
            "GET",
            '{"cost": 1}',
        )
        self.futures_get_settle_orders = Entry(
            "{settle}/orders", '["private", "futures"]', "GET", '{"cost": 1}'
        )
        self.futures_get_settle_orders_timerange = Entry(
            "{settle}/orders_timerange",
            '["private", "futures"]',
            "GET",
            '{"cost": 1}',
        )
        self.futures_get_settle_orders_order_id = Entry(
            "{settle}/orders/{order_id}",
            '["private", "futures"]',
            "GET",
            '{"cost": 1}',
        )
        self.futures_get_settle_my_trades = Entry(
            "{settle}/my_trades", '["private", "futures"]', "GET", '{"cost": 1}'
        )
        self.futures_get_settle_my_trades_timerange = Entry(
            "{settle}/my_trades_timerange",
            '["private", "futures"]',
            "GET",
            '{"cost": 1}',
        )
        self.futures_get_settle_position_close = Entry(
            "{settle}/position_close",
            '["private", "futures"]',
            "GET",
            '{"cost": 1}',
        )
        self.futures_get_settle_liquidates = Entry(
            "{settle}/liquidates", '["private", "futures"]', "GET", '{"cost": 1}'
        )
        self.futures_get_settle_auto_deleverages = Entry(
            "{settle}/auto_deleverages",
            '["private", "futures"]',
            "GET",
            '{"cost": 1}',
        )
        self.futures_get_settle_fee = Entry(
            "{settle}/fee", '["private", "futures"]', "GET", '{"cost": 1}'
        )
        self.futures_get_settle_risk_limit_tiers = Entry(
            "{settle}/risk_limit_tiers",
            '["private", "futures"]',
            "GET",
            '{"cost": 1}',
        )
        self.futures_get_settle_price_orders = Entry(
            "{settle}/price_orders",
            '["private", "futures"]',
            "GET",
            '{"cost": 1}',
        )
        self.futures_get_settle_price_orders_order_id = Entry(
            "{settle}/price_orders/{order_id}",
            '["private", "futures"]',
            "GET",
            '{"cost": 1}',
        )
        self.futures_post_settle_positions_contract_margin = Entry(
            "{settle}/positions/{contract}/margin",
            '["private", "futures"]',
            "POST",
            '{"cost": 1}',
        )
        self.futures_post_settle_positions_contract_leverage = Entry(
            "{settle}/positions/{contract}/leverage",
            '["private", "futures"]',
            "POST",
            '{"cost": 1}',
        )
        self.futures_post_settle_positions_contract_risk_limit = Entry(
            "{settle}/positions/{contract}/risk_limit",
            '["private", "futures"]',
            "POST",
            '{"cost": 1}',
        )
        self.futures_post_settle_dual_mode = Entry(
            "{settle}/dual_mode", '["private", "futures"]', "POST", '{"cost": 1}'
        )
        self.futures_post_settle_dual_comp_positions_contract_margin = Entry(
            "{settle}/dual_comp/positions/{contract}/margin",
            '["private", "futures"]',
            "POST",
            '{"cost": 1}',
        )
        self.futures_post_settle_dual_comp_positions_contract_leverage = Entry(
            "{settle}/dual_comp/positions/{contract}/leverage",
            '["private", "futures"]',
            "POST",
            '{"cost": 1}',
        )
        self.futures_post_settle_dual_comp_positions_contract_risk_limit = (
            Entry(
                "{settle}/dual_comp/positions/{contract}/risk_limit",
                '["private", "futures"]',
                "POST",
                '{"cost": 1}',
            )
        )
        self.futures_post_settle_orders = Entry(
            "{settle}/orders", '["private", "futures"]', "POST", '{"cost": 0.4}'
        )
        self.futures_post_settle_batch_orders = Entry(
            "{settle}/batch_orders",
            '["private", "futures"]',
            "POST",
            '{"cost": 0.4}',
        )
        self.futures_post_settle_countdown_cancel_all = Entry(
            "{settle}/countdown_cancel_all",
            '["private", "futures"]',
            "POST",
            '{"cost": 0.4}',
        )
        self.futures_post_settle_batch_cancel_orders = Entry(
            "{settle}/batch_cancel_orders",
            '["private", "futures"]',
            "POST",
            '{"cost": 0.4}',
        )
        self.futures_post_settle_price_orders = Entry(
            "{settle}/price_orders",
            '["private", "futures"]',
            "POST",
            '{"cost": 0.4}',
        )
        self.futures_put_settle_orders_order_id = Entry(
            "{settle}/orders/{order_id}",
            '["private", "futures"]',
            "PUT",
            '{"cost": 1}',
        )
        self.futures_delete_settle_orders = Entry(
            "{settle}/orders",
            '["private", "futures"]',
            "DELETE",
            '{"cost": 0.26666666666666666}',
        )
        self.futures_delete_settle_orders_order_id = Entry(
            "{settle}/orders/{order_id}",
            '["private", "futures"]',
            "DELETE",
            '{"cost": 0.26666666666666666}',
        )
        self.futures_delete_settle_price_orders = Entry(
            "{settle}/price_orders",
            '["private", "futures"]',
            "DELETE",
            '{"cost": 0.26666666666666666}',
        )
        self.futures_delete_settle_price_orders_order_id = Entry(
            "{settle}/price_orders/{order_id}",
            '["private", "futures"]',
            "DELETE",
            '{"cost": 0.26666666666666666}',
        )
        self.delivery_get_settle_accounts = Entry(
            "{settle}/accounts",
            '["private", "delivery"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.delivery_get_settle_account_book = Entry(
            "{settle}/account_book",
            '["private", "delivery"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.delivery_get_settle_positions = Entry(
            "{settle}/positions",
            '["private", "delivery"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.delivery_get_settle_positions_contract = Entry(
            "{settle}/positions/{contract}",
            '["private", "delivery"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.delivery_get_settle_orders = Entry(
            "{settle}/orders",
            '["private", "delivery"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.delivery_get_settle_orders_order_id = Entry(
            "{settle}/orders/{order_id}",
            '["private", "delivery"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.delivery_get_settle_my_trades = Entry(
            "{settle}/my_trades",
            '["private", "delivery"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.delivery_get_settle_position_close = Entry(
            "{settle}/position_close",
            '["private", "delivery"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.delivery_get_settle_liquidates = Entry(
            "{settle}/liquidates",
            '["private", "delivery"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.delivery_get_settle_settlements = Entry(
            "{settle}/settlements",
            '["private", "delivery"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.delivery_get_settle_price_orders = Entry(
            "{settle}/price_orders",
            '["private", "delivery"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.delivery_get_settle_price_orders_order_id = Entry(
            "{settle}/price_orders/{order_id}",
            '["private", "delivery"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.delivery_post_settle_positions_contract_margin = Entry(
            "{settle}/positions/{contract}/margin",
            '["private", "delivery"]',
            "POST",
            '{"cost": 1.3333333333333333}',
        )
        self.delivery_post_settle_positions_contract_leverage = Entry(
            "{settle}/positions/{contract}/leverage",
            '["private", "delivery"]',
            "POST",
            '{"cost": 1.3333333333333333}',
        )
        self.delivery_post_settle_positions_contract_risk_limit = Entry(
            "{settle}/positions/{contract}/risk_limit",
            '["private", "delivery"]',
            "POST",
            '{"cost": 1.3333333333333333}',
        )
        self.delivery_post_settle_orders = Entry(
            "{settle}/orders",
            '["private", "delivery"]',
            "POST",
            '{"cost": 1.3333333333333333}',
        )
        self.delivery_post_settle_price_orders = Entry(
            "{settle}/price_orders",
            '["private", "delivery"]',
            "POST",
            '{"cost": 1.3333333333333333}',
        )
        self.delivery_delete_settle_orders = Entry(
            "{settle}/orders",
            '["private", "delivery"]',
            "DELETE",
            '{"cost": 1.3333333333333333}',
        )
        self.delivery_delete_settle_orders_order_id = Entry(
            "{settle}/orders/{order_id}",
            '["private", "delivery"]',
            "DELETE",
            '{"cost": 1.3333333333333333}',
        )
        self.delivery_delete_settle_price_orders = Entry(
            "{settle}/price_orders",
            '["private", "delivery"]',
            "DELETE",
            '{"cost": 1.3333333333333333}',
        )
        self.delivery_delete_settle_price_orders_order_id = Entry(
            "{settle}/price_orders/{order_id}",
            '["private", "delivery"]',
            "DELETE",
            '{"cost": 1.3333333333333333}',
        )
        self.options_get_my_settlements = Entry(
            "my_settlements",
            '["private", "options"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.options_get_accounts = Entry(
            "accounts",
            '["private", "options"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.options_get_account_book = Entry(
            "account_book",
            '["private", "options"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.options_get_positions = Entry(
            "positions",
            '["private", "options"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.options_get_positions_contract = Entry(
            "positions/{contract}",
            '["private", "options"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.options_get_position_close = Entry(
            "position_close",
            '["private", "options"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.options_get_orders = Entry(
            "orders",
            '["private", "options"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.options_get_orders_order_id = Entry(
            "orders/{order_id}",
            '["private", "options"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.options_get_my_trades = Entry(
            "my_trades",
            '["private", "options"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.options_post_orders = Entry(
            "orders",
            '["private", "options"]',
            "POST",
            '{"cost": 1.3333333333333333}',
        )
        self.options_delete_orders = Entry(
            "orders",
            '["private", "options"]',
            "DELETE",
            '{"cost": 1.3333333333333333}',
        )
        self.options_delete_orders_order_id = Entry(
            "orders/{order_id}",
            '["private", "options"]',
            "DELETE",
            '{"cost": 1.3333333333333333}',
        )
        self.earn_get_uni_currencies_private = Entry(
            "uni/currencies",
            '["private", "earn"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.earn_get_uni_currencies_currency_private = Entry(
            "uni/currencies/{currency}",
            '["private", "earn"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.earn_get_uni_lends = Entry(
            "uni/lends",
            '["private", "earn"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.earn_get_uni_lend_records = Entry(
            "uni/lend_records",
            '["private", "earn"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.earn_get_uni_interests_currency = Entry(
            "uni/interests/{currency}",
            '["private", "earn"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.earn_get_uni_interest_records = Entry(
            "uni/interest_records",
            '["private", "earn"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.earn_get_uni_interest_status_currency = Entry(
            "uni/interest_status/{currency}",
            '["private", "earn"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.earn_post_uni_lends = Entry(
            "uni/lends",
            '["private", "earn"]',
            "POST",
            '{"cost": 1.3333333333333333}',
        )
        self.earn_put_uni_interest_reinvest = Entry(
            "uni/interest_reinvest",
            '["private", "earn"]',
            "PUT",
            '{"cost": 1.3333333333333333}',
        )
        self.earn_patch_uni_lends = Entry(
            "uni/lends",
            '["private", "earn"]',
            "PATCH",
            '{"cost": 1.3333333333333333}',
        )
        self.loan_get_collateral_orders = Entry(
            "collateral/orders",
            '["private", "loan"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.loan_get_collateral_orders_order_id = Entry(
            "collateral/orders/{order_id}",
            '["private", "loan"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.loan_get_collateral_repay_records = Entry(
            "collateral/repay_records",
            '["private", "loan"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.loan_get_collateral_collaterals = Entry(
            "collateral/collaterals",
            '["private", "loan"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.loan_get_collateral_total_amount = Entry(
            "collateral/total_amount",
            '["private", "loan"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.loan_get_collateral_ltv = Entry(
            "collateral/ltv",
            '["private", "loan"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.loan_get_collateral_currencies = Entry(
            "collateral/currencies",
            '["private", "loan"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.loan_get_multi_collateral_orders = Entry(
            "multi_collateral/orders",
            '["private", "loan"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.loan_get_multi_collateral_orders_order_id = Entry(
            "multi_collateral/orders/{order_id}",
            '["private", "loan"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.loan_get_multi_collateral_repay = Entry(
            "multi_collateral/repay",
            '["private", "loan"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.loan_get_multi_collateral_mortgage = Entry(
            "multi_collateral/mortgage",
            '["private", "loan"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.loan_get_multi_collateral_currency_quota = Entry(
            "multi_collateral/currency_quota",
            '["private", "loan"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.loan_get_multi_collateral_currencies = Entry(
            "multi_collateral/currencies",
            '["private", "loan"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.loan_get_multi_collateral_ltv = Entry(
            "multi_collateral/ltv",
            '["private", "loan"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.loan_get_multi_collateral_fixed_rate = Entry(
            "multi_collateral/fixed_rate",
            '["private", "loan"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.loan_post_collateral_orders = Entry(
            "collateral/orders",
            '["private", "loan"]',
            "POST",
            '{"cost": 1.3333333333333333}',
        )
        self.loan_post_collateral_repay = Entry(
            "collateral/repay",
            '["private", "loan"]',
            "POST",
            '{"cost": 1.3333333333333333}',
        )
        self.loan_post_collateral_collaterals = Entry(
            "collateral/collaterals",
            '["private", "loan"]',
            "POST",
            '{"cost": 1.3333333333333333}',
        )
        self.loan_post_multi_collateral_orders = Entry(
            "multi_collateral/orders",
            '["private", "loan"]',
            "POST",
            '{"cost": 1.3333333333333333}',
        )
        self.loan_post_multi_collateral_repay = Entry(
            "multi_collateral/repay",
            '["private", "loan"]',
            "POST",
            '{"cost": 1.3333333333333333}',
        )
        self.loan_post_multi_collateral_mortgage = Entry(
            "multi_collateral/mortgage",
            '["private", "loan"]',
            "POST",
            '{"cost": 1.3333333333333333}',
        )
        self.account_get_detail = Entry(
            "detail",
            '["private", "account"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.account_get_stp_groups = Entry(
            "stp_groups",
            '["private", "account"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.account_get_stp_groups_stp_id_users = Entry(
            "stp_groups/{stp_id}/users",
            '["private", "account"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.account_post_stp_groups = Entry(
            "stp_groups",
            '["private", "account"]',
            "POST",
            '{"cost": 1.3333333333333333}',
        )
        self.account_post_stp_groups_stp_id_users = Entry(
            "stp_groups/{stp_id}/users",
            '["private", "account"]',
            "POST",
            '{"cost": 1.3333333333333333}',
        )
        self.account_delete_stp_groups_stp_id_users = Entry(
            "stp_groups/{stp_id}/users",
            '["private", "account"]',
            "DELETE",
            '{"cost": 1.3333333333333333}',
        )
        self.rebate_get_agency_transaction_history = Entry(
            "agency/transaction_history",
            '["private", "rebate"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
        self.rebate_get_agency_commission_history = Entry(
            "agency/commission_history",
            '["private", "rebate"]',
            "GET",
            '{"cost": 1.3333333333333333}',
        )
