from ccxt.base.types import Entry


@value
struct ImplicitAPI:
    var public_get_announcement_urgent: Entry
    var public_get_chat: Entry
    var public_get_chat_channels: Entry
    var public_get_chat_connected: Entry
    var public_get_chat_pinned: Entry
    var public_get_funding: Entry
    var public_get_guild: Entry
    var public_get_instrument: Entry
    var public_get_instrument_active: Entry
    var public_get_instrument_activeandindices: Entry
    var public_get_instrument_activeintervals: Entry
    var public_get_instrument_compositeindex: Entry
    var public_get_instrument_indices: Entry
    var public_get_instrument_usdvolume: Entry
    var public_get_insurance: Entry
    var public_get_leaderboard: Entry
    var public_get_liquidation: Entry
    var public_get_orderbook_l2: Entry
    var public_get_porl_nonce: Entry
    var public_get_quote: Entry
    var public_get_quote_bucketed: Entry
    var public_get_schema: Entry
    var public_get_schema_websockethelp: Entry
    var public_get_settlement: Entry
    var public_get_stats: Entry
    var public_get_stats_history: Entry
    var public_get_stats_historyusd: Entry
    var public_get_trade: Entry
    var public_get_trade_bucketed: Entry
    var public_get_wallet_assets: Entry
    var public_get_wallet_networks: Entry
    var private_get_address: Entry
    var private_get_apikey: Entry
    var private_get_execution: Entry
    var private_get_execution_tradehistory: Entry
    var private_get_globalnotification: Entry
    var private_get_leaderboard_name: Entry
    var private_get_order: Entry
    var private_get_porl_snapshots: Entry
    var private_get_position: Entry
    var private_get_user: Entry
    var private_get_user_affiliatestatus: Entry
    var private_get_user_checkreferralcode: Entry
    var private_get_user_commission: Entry
    var private_get_user_csa: Entry
    var private_get_user_depositaddress: Entry
    var private_get_user_executionhistory: Entry
    var private_get_user_getwallettransferaccounts: Entry
    var private_get_user_margin: Entry
    var private_get_user_quotefillratio: Entry
    var private_get_user_quotevalueratio: Entry
    var private_get_user_staking: Entry
    var private_get_user_staking_instruments: Entry
    var private_get_user_staking_tiers: Entry
    var private_get_user_tradingvolume: Entry
    var private_get_user_unstakingrequests: Entry
    var private_get_user_wallet: Entry
    var private_get_user_wallethistory: Entry
    var private_get_user_walletsummary: Entry
    var private_get_useraffiliates: Entry
    var private_get_userevent: Entry
    var private_post_address: Entry
    var private_post_chat: Entry
    var private_post_guild: Entry
    var private_post_guild_archive: Entry
    var private_post_guild_join: Entry
    var private_post_guild_kick: Entry
    var private_post_guild_leave: Entry
    var private_post_guild_sharestrades: Entry
    var private_post_order: Entry
    var private_post_order_cancelallafter: Entry
    var private_post_order_closeposition: Entry
    var private_post_position_isolate: Entry
    var private_post_position_leverage: Entry
    var private_post_position_risklimit: Entry
    var private_post_position_transfermargin: Entry
    var private_post_user_addsubaccount: Entry
    var private_post_user_cancelwithdrawal: Entry
    var private_post_user_communicationtoken: Entry
    var private_post_user_confirmemail: Entry
    var private_post_user_confirmwithdrawal: Entry
    var private_post_user_logout: Entry
    var private_post_user_preferences: Entry
    var private_post_user_requestwithdrawal: Entry
    var private_post_user_unstakingrequests: Entry
    var private_post_user_updatesubaccount: Entry
    var private_post_user_wallettransfer: Entry
    var private_put_guild: Entry
    var private_put_order: Entry
    var private_delete_order: Entry
    var private_delete_order_all: Entry
    var private_delete_user_unstakingrequests: Entry

    fn __init__(out self):
        self.public_get_announcement_urgent = Entry(
            "announcement/urgent", "public", "GET", '{"cost": 5}'
        )
        self.public_get_chat = Entry("chat", "public", "GET", '{"cost": 5}')
        self.public_get_chat_channels = Entry(
            "chat/channels", "public", "GET", '{"cost": 5}'
        )
        self.public_get_chat_connected = Entry(
            "chat/connected", "public", "GET", '{"cost": 5}'
        )
        self.public_get_chat_pinned = Entry(
            "chat/pinned", "public", "GET", '{"cost": 5}'
        )
        self.public_get_funding = Entry(
            "funding", "public", "GET", '{"cost": 5}'
        )
        self.public_get_guild = Entry("guild", "public", "GET", '{"cost": 5}')
        self.public_get_instrument = Entry(
            "instrument", "public", "GET", '{"cost": 5}'
        )
        self.public_get_instrument_active = Entry(
            "instrument/active", "public", "GET", '{"cost": 5}'
        )
        self.public_get_instrument_activeandindices = Entry(
            "instrument/activeAndIndices", "public", "GET", '{"cost": 5}'
        )
        self.public_get_instrument_activeintervals = Entry(
            "instrument/activeIntervals", "public", "GET", '{"cost": 5}'
        )
        self.public_get_instrument_compositeindex = Entry(
            "instrument/compositeIndex", "public", "GET", '{"cost": 5}'
        )
        self.public_get_instrument_indices = Entry(
            "instrument/indices", "public", "GET", '{"cost": 5}'
        )
        self.public_get_instrument_usdvolume = Entry(
            "instrument/usdVolume", "public", "GET", '{"cost": 5}'
        )
        self.public_get_insurance = Entry(
            "insurance", "public", "GET", '{"cost": 5}'
        )
        self.public_get_leaderboard = Entry(
            "leaderboard", "public", "GET", '{"cost": 5}'
        )
        self.public_get_liquidation = Entry(
            "liquidation", "public", "GET", '{"cost": 5}'
        )
        self.public_get_orderbook_l2 = Entry(
            "orderBook/L2", "public", "GET", '{"cost": 5}'
        )
        self.public_get_porl_nonce = Entry(
            "porl/nonce", "public", "GET", '{"cost": 5}'
        )
        self.public_get_quote = Entry("quote", "public", "GET", '{"cost": 5}')
        self.public_get_quote_bucketed = Entry(
            "quote/bucketed", "public", "GET", '{"cost": 5}'
        )
        self.public_get_schema = Entry("schema", "public", "GET", '{"cost": 5}')
        self.public_get_schema_websockethelp = Entry(
            "schema/websocketHelp", "public", "GET", '{"cost": 5}'
        )
        self.public_get_settlement = Entry(
            "settlement", "public", "GET", '{"cost": 5}'
        )
        self.public_get_stats = Entry("stats", "public", "GET", '{"cost": 5}')
        self.public_get_stats_history = Entry(
            "stats/history", "public", "GET", '{"cost": 5}'
        )
        self.public_get_stats_historyusd = Entry(
            "stats/historyUSD", "public", "GET", '{"cost": 5}'
        )
        self.public_get_trade = Entry("trade", "public", "GET", '{"cost": 5}')
        self.public_get_trade_bucketed = Entry(
            "trade/bucketed", "public", "GET", '{"cost": 5}'
        )
        self.public_get_wallet_assets = Entry(
            "wallet/assets", "public", "GET", '{"cost": 5}'
        )
        self.public_get_wallet_networks = Entry(
            "wallet/networks", "public", "GET", '{"cost": 5}'
        )
        self.private_get_address = Entry(
            "address", "private", "GET", '{"cost": 5}'
        )
        self.private_get_apikey = Entry(
            "apiKey", "private", "GET", '{"cost": 5}'
        )
        self.private_get_execution = Entry(
            "execution", "private", "GET", '{"cost": 5}'
        )
        self.private_get_execution_tradehistory = Entry(
            "execution/tradeHistory", "private", "GET", '{"cost": 5}'
        )
        self.private_get_globalnotification = Entry(
            "globalNotification", "private", "GET", '{"cost": 5}'
        )
        self.private_get_leaderboard_name = Entry(
            "leaderboard/name", "private", "GET", '{"cost": 5}'
        )
        self.private_get_order = Entry("order", "private", "GET", '{"cost": 5}')
        self.private_get_porl_snapshots = Entry(
            "porl/snapshots", "private", "GET", '{"cost": 5}'
        )
        self.private_get_position = Entry(
            "position", "private", "GET", '{"cost": 5}'
        )
        self.private_get_user = Entry("user", "private", "GET", '{"cost": 5}')
        self.private_get_user_affiliatestatus = Entry(
            "user/affiliateStatus", "private", "GET", '{"cost": 5}'
        )
        self.private_get_user_checkreferralcode = Entry(
            "user/checkReferralCode", "private", "GET", '{"cost": 5}'
        )
        self.private_get_user_commission = Entry(
            "user/commission", "private", "GET", '{"cost": 5}'
        )
        self.private_get_user_csa = Entry(
            "user/csa", "private", "GET", '{"cost": 5}'
        )
        self.private_get_user_depositaddress = Entry(
            "user/depositAddress", "private", "GET", '{"cost": 5}'
        )
        self.private_get_user_executionhistory = Entry(
            "user/executionHistory", "private", "GET", '{"cost": 5}'
        )
        self.private_get_user_getwallettransferaccounts = Entry(
            "user/getWalletTransferAccounts", "private", "GET", '{"cost": 5}'
        )
        self.private_get_user_margin = Entry(
            "user/margin", "private", "GET", '{"cost": 5}'
        )
        self.private_get_user_quotefillratio = Entry(
            "user/quoteFillRatio", "private", "GET", '{"cost": 5}'
        )
        self.private_get_user_quotevalueratio = Entry(
            "user/quoteValueRatio", "private", "GET", '{"cost": 5}'
        )
        self.private_get_user_staking = Entry(
            "user/staking", "private", "GET", '{"cost": 5}'
        )
        self.private_get_user_staking_instruments = Entry(
            "user/staking/instruments", "private", "GET", '{"cost": 5}'
        )
        self.private_get_user_staking_tiers = Entry(
            "user/staking/tiers", "private", "GET", '{"cost": 5}'
        )
        self.private_get_user_tradingvolume = Entry(
            "user/tradingVolume", "private", "GET", '{"cost": 5}'
        )
        self.private_get_user_unstakingrequests = Entry(
            "user/unstakingRequests", "private", "GET", '{"cost": 5}'
        )
        self.private_get_user_wallet = Entry(
            "user/wallet", "private", "GET", '{"cost": 5}'
        )
        self.private_get_user_wallethistory = Entry(
            "user/walletHistory", "private", "GET", '{"cost": 5}'
        )
        self.private_get_user_walletsummary = Entry(
            "user/walletSummary", "private", "GET", '{"cost": 5}'
        )
        self.private_get_useraffiliates = Entry(
            "userAffiliates", "private", "GET", '{"cost": 5}'
        )
        self.private_get_userevent = Entry(
            "userEvent", "private", "GET", '{"cost": 5}'
        )
        self.private_post_address = Entry(
            "address", "private", "POST", '{"cost": 5}'
        )
        self.private_post_chat = Entry("chat", "private", "POST", '{"cost": 5}')
        self.private_post_guild = Entry(
            "guild", "private", "POST", '{"cost": 5}'
        )
        self.private_post_guild_archive = Entry(
            "guild/archive", "private", "POST", '{"cost": 5}'
        )
        self.private_post_guild_join = Entry(
            "guild/join", "private", "POST", '{"cost": 5}'
        )
        self.private_post_guild_kick = Entry(
            "guild/kick", "private", "POST", '{"cost": 5}'
        )
        self.private_post_guild_leave = Entry(
            "guild/leave", "private", "POST", '{"cost": 5}'
        )
        self.private_post_guild_sharestrades = Entry(
            "guild/sharesTrades", "private", "POST", '{"cost": 5}'
        )
        self.private_post_order = Entry(
            "order", "private", "POST", '{"cost": 1}'
        )
        self.private_post_order_cancelallafter = Entry(
            "order/cancelAllAfter", "private", "POST", '{"cost": 5}'
        )
        self.private_post_order_closeposition = Entry(
            "order/closePosition", "private", "POST", '{"cost": 5}'
        )
        self.private_post_position_isolate = Entry(
            "position/isolate", "private", "POST", '{"cost": 1}'
        )
        self.private_post_position_leverage = Entry(
            "position/leverage", "private", "POST", '{"cost": 1}'
        )
        self.private_post_position_risklimit = Entry(
            "position/riskLimit", "private", "POST", '{"cost": 5}'
        )
        self.private_post_position_transfermargin = Entry(
            "position/transferMargin", "private", "POST", '{"cost": 1}'
        )
        self.private_post_user_addsubaccount = Entry(
            "user/addSubaccount", "private", "POST", '{"cost": 5}'
        )
        self.private_post_user_cancelwithdrawal = Entry(
            "user/cancelWithdrawal", "private", "POST", '{"cost": 5}'
        )
        self.private_post_user_communicationtoken = Entry(
            "user/communicationToken", "private", "POST", '{"cost": 5}'
        )
        self.private_post_user_confirmemail = Entry(
            "user/confirmEmail", "private", "POST", '{"cost": 5}'
        )
        self.private_post_user_confirmwithdrawal = Entry(
            "user/confirmWithdrawal", "private", "POST", '{"cost": 5}'
        )
        self.private_post_user_logout = Entry(
            "user/logout", "private", "POST", '{"cost": 5}'
        )
        self.private_post_user_preferences = Entry(
            "user/preferences", "private", "POST", '{"cost": 5}'
        )
        self.private_post_user_requestwithdrawal = Entry(
            "user/requestWithdrawal", "private", "POST", '{"cost": 5}'
        )
        self.private_post_user_unstakingrequests = Entry(
            "user/unstakingRequests", "private", "POST", '{"cost": 5}'
        )
        self.private_post_user_updatesubaccount = Entry(
            "user/updateSubaccount", "private", "POST", '{"cost": 5}'
        )
        self.private_post_user_wallettransfer = Entry(
            "user/walletTransfer", "private", "POST", '{"cost": 5}'
        )
        self.private_put_guild = Entry("guild", "private", "PUT", '{"cost": 5}')
        self.private_put_order = Entry("order", "private", "PUT", '{"cost": 1}')
        self.private_delete_order = Entry(
            "order", "private", "DELETE", '{"cost": 1}'
        )
        self.private_delete_order_all = Entry(
            "order/all", "private", "DELETE", '{"cost": 1}'
        )
        self.private_delete_user_unstakingrequests = Entry(
            "user/unstakingRequests", "private", "DELETE", '{"cost": 5}'
        )
