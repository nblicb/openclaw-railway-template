---
name: query-token-info
description: |
  Query token details by keyword, contract address, or chain. Search tokens, get metadata and social links,
  retrieve real-time market data (price, price trend, volume, holders, liquidity), and fetch K-Line candlestick charts.
  Use this skill when users search tokens, check token prices, view market data, or request kline/candlestick charts.
metadata:
  author: binance-web3-team
  version: "1.0"
---

# Query Token Info Skill

## Overview

| API | Function | Use Case |
|-----|----------|----------|
| Token Search | Search tokens | Find tokens by name, symbol, or contract address |
| Token Metadata | Static info | Get token details,name,symbol,logo, social links, creator address |
| Token Dynamic Data | Real-time market data | Price, volume, holders, liquidity, market cap |
| Token K-Line | Candlestick charts | OHLCV data for technical analysis |

## Use Cases

1. **Search Tokens**: Find tokens by name, symbol, or contract address across chains
2. **Project Research**: Get token metadata, social links, and creator info
3. **Market Analysis**: Real-time price, volume, holder distribution, and liquidity data
4. **Chart Analysis**: K-Line candlestick data for technical analysis

## Supported Chains

| Chain Name | chainId |
|------------|---------|
| BSC | 56 |
| Base | 8453 |
| Solana | CT_501 |

---

## API 1: Token Search

### Method: GET

**URL**:
```
https://web3.binance.com/bapi/defi/v5/public/wallet-direct/buw/wallet/market/token/search
```

**Request Parameters**:

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| keyword | string | Yes | Search keyword (name/symbol/contract address) |
| chainIds | string | No | Chain ID list, comma-separated, e.g., `56,8453,CT_501` |
| orderBy | string | No | Sort field, e.g., `volume24h` |

**Request Headers**:
```
Accept-Encoding: identity
User-Agent: binance-web3/1.0 (Skill)
```

**Response Fields**:

| Field | Type | Description |
|-------|------|-------------|
| chainId | string | Chain ID |
| contractAddress | string | Contract address |
| tokenId | string | Token unique ID |
| name | string | Token name |
| symbol | string | Token symbol |
| icon | string | Icon URL path (prefix with `https://bin.bnbstatic.com`) |
| price | string | Current price (USD) |
| percentChange24h | string | 24-hour price change (%) |
| volume24h | string | 24-hour trading volume (USD) |
| marketCap | string | Market cap (USD) |
| liquidity | string | Liquidity (USD) |
| tagsInfo | object | Tag information |
| links | array | Social links list |
| createTime | number | Creation timestamp (ms) |
| holdersTop10Percent | string | Top 10 holders percentage (%) |

---

## API 2: Token Metadata

### Method: GET

**URL**:
```
https://web3.binance.com/bapi/defi/v1/public/wallet-direct/buw/wallet/dex/market/token/meta/info
```

**Request Parameters**:

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| chainId | string | Yes | Chain ID |
| contractAddress | string | Yes | Token contract address |

**Request Headers**:
```
Accept-Encoding: identity
User-Agent: binance-web3/1.0 (Skill)
```

**Response Fields**:

| Field | Type | Description |
|-------|------|-------------|
| tokenId | string | Token unique ID |
| name | string | Token name |
| symbol | string | Token symbol |
| chainId | string | Chain ID |
| chainName | string | Chain name |
| contractAddress | string | Contract address |
| decimals | number | Token decimals |
| icon | string | Icon URL path |
| links | array | Social links list |
| createTime | number | Creation timestamp (ms) |
| creatorAddress | string | Creator address |
| description | string | Token description |

---

## API 3: Token Dynamic Data

### Method: GET

**URL**:
```
https://web3.binance.com/bapi/defi/v4/public/wallet-direct/buw/wallet/market/token/dynamic/info
```

**Request Parameters**:

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| chainId | string | Yes | Chain ID |
| contractAddress | string | Yes | Token contract address |

**Request Headers**:
```
Accept-Encoding: identity
User-Agent: binance-web3/1.0 (Skill)
```

**Response Fields**:

### Price Related
| Field | Type | Description |
|-------|------|-------------|
| price | string | Current price (USD) |
| priceHigh24h | string | 24-hour high price |
| priceLow24h | string | 24-hour low price |
| percentChange5m | string | 5-minute price change (%) |
| percentChange1h | string | 1-hour price change (%) |
| percentChange4h | string | 4-hour price change (%) |
| percentChange24h | string | 24-hour price change (%) |

### Volume
| Field | Type | Description |
|-------|------|-------------|
| volume24h | string | 24-hour total volume (USD) |
| volume24hBuy | string | 24-hour buy volume |
| volume24hSell | string | 24-hour sell volume |

### Market Data
| Field | Type | Description |
|-------|------|-------------|
| marketCap | string | Market cap (USD) |
| fdv | string | Fully diluted valuation |
| liquidity | string | Liquidity (USD) |
| holders | string | Total holder count |
| top10HoldersPercentage | string | Top 10 holders percentage (%) |

---

## API 4: Token K-Line (Candlestick)

### Method: GET

**URL**:
```
https://dquery.sintral.io/u-kline/v1/k-line/candles
```

**Request Parameters**:

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| address | string | Yes | Token contract address |
| platform | string | Yes | Chain platform: `ethereum`, `bsc`, `solana`, `base` |
| interval | string | Yes | Kline interval: `1s`,`1min`,`5min`,`15min`,`30min`,`1h`,`4h`,`1d`,`1w`,`1m` |
| limit | number | No | Number of candles (priority over `from`) |
| from | number | No | Start timestamp (ms) |
| to | number | No | End timestamp (ms) |

**Request Headers**:
```
Accept-Encoding: identity
User-Agent: binance-web3/1.0 (Skill)
```

**Response**: 2D array `[open, high, low, close, volume, timestamp, count]`

---

## Notes

1. Icon URL requires prefix: `https://bin.bnbstatic.com` + icon path
2. All numeric fields are string format, convert when using
3. K-Line uses `platform` (ethereum/bsc/solana/base) instead of `chainId`
4. K-Line response is a 2D array, parse by index
