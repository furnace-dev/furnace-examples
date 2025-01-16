from collections import Optional, List, Dict
from collections.optional import _NoneType
from small_time.small_time import from_timestamp
from .types import *


@value
struct Exchange:
    """
    Base exchange class.
    """

    var id: Optional[String]
    var name: Optional[String]
    var certified: Bool  # if certified by the CCXT dev team
    var pro: Bool  # if it is integrated with CCXT Pro for WebSocket support
    var is_alias: Bool  # whether this exchange is an alias to another exchange
    # rate limiter settings
    var enableRateLimit: Bool
    var rateLimit: Int  # milliseconds = seconds * 1000
    var timeout: Int  # milliseconds = seconds * 1000
    var verbose: Bool

    fn __init__(out self, config: Dict[String, Any]):
        self.id = String("")
        self.name = String("")
        self.certified = False
        self.pro = False
        self.is_alias = False
        self.enableRateLimit = True
        self.rateLimit = 2000
        self.timeout = 10000
        self.verbose = True

    fn __del__(owned self):
        pass

    @staticmethod
    fn iso8601(timestamp: Int) raises -> String:
        var tm = from_timestamp(float(timestamp))
        return tm.isoformat()

    @staticmethod
    fn yymmdd(timestamp: Int, infix: String = "") raises -> String:
        var ts = from_timestamp(float(timestamp))
        return ts.format("YYMMDD")

    fn safe_currency(self, currencyId: Str, currency: Currency) -> Currency:
        if (currencyId is None) and (currency is not None):
            return currency
        # if (self.currencies_by_id is not None) and (currencyId in self.currencies_by_id) and (self.currencies_by_id[currencyId] is not None):
        #     return self.currencies_by_id[currencyId]
        # code = currencyId
        # if currencyId is not None:
        #     code = self.common_currency_code(currencyId.upper())
        # return self.safe_currency_structure({
        #     id= currencyId,
        #     code= code,
        #     precision= None,
        # })
        if currency is None:
            return None
        code = currencyId
        var result = currency.value()
        result.id = currencyId
        result.code = code
        result.precision = Fixed.zero
        return result

    fn safe_currency_code(
        self, currencyId: Str, currency: Currency = None
    ) -> String:
        var currency_ = self.safe_currency(currencyId, currency)
        if currency_ is None:
            return ""
        var code = currency_.value().code
        return code.value() if code is not None else ""

    @staticmethod
    fn url_encode(query: Dict[String, Any]) -> String:
        var s = String()
        var first = True
        for k_v in query.items():
            var k = k_v[].key
            var v = k_v[].value
            if first:
                first = False
            else:
                s += "&"
            s += k + "=" + str(v)
        return s
