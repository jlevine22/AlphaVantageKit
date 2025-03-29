//
//  TimeSeries.swift
//

import Foundation

public struct TimeSeriesDailyRequest: ApiRequest {
  public typealias Response = TimeSeriesDailyResponse

  public let symbol: String
  public let outputSize: OutputSize
  
  public init(symbol: String, outputSize: OutputSize) {
    self.symbol = symbol
      self.outputSize = outputSize
  }

  public var queryItems: [URLQueryItem] {
    return [
      URLQueryItem(name: "function", value: "TIME_SERIES_DAILY"),
      URLQueryItem(name: "symbol", value: symbol),
      URLQueryItem(name: "outputsize", value: outputSize == .full ? "full" : "compact")
    ]
  }
}

public enum OutputSize: String, Decodable {
  case compact = "Compact"
  case full = "Full size"
}

public struct TimeSeriesDailyMeta: Decodable {
  public var information: String
  public var symbol: String
  public var lastRefreshed: Foundation.Date
  public var outputSize: OutputSize
  public var timeZone: String

  private enum CodingKeys: String, CodingKey {
    case information = "1. Information"
    case symbol = "2. Symbol"
    case lastRefreshed = "3. Last Refreshed"
    case outputSize = "4. Output Size"
    case timeZone = "5. Time Zone"
  }
  
  public init(from decoder: Decoder) throws {
    let container: KeyedDecodingContainer<TimeSeriesDailyMeta.CodingKeys> = try decoder.container(keyedBy: TimeSeriesDailyMeta.CodingKeys.self)
    self.information = try container.decode(String.self, forKey: TimeSeriesDailyMeta.CodingKeys.information)
    self.symbol = try container.decode(String.self, forKey: TimeSeriesDailyMeta.CodingKeys.symbol)
    self.outputSize = try container.decode(OutputSize.self, forKey: TimeSeriesDailyMeta.CodingKeys.outputSize)
    self.timeZone = try container.decode(String.self, forKey: TimeSeriesDailyMeta.CodingKeys.timeZone)
    
    let lastRefreshed = try container.decode(AVDate.self, forKey: TimeSeriesDailyMeta.CodingKeys.lastRefreshed)
    let dateComponents = DateComponents(calendar: .current, timeZone: TimeZone(identifier: timeZone), year: Int(lastRefreshed.year), month: Int(lastRefreshed.month), day: Int(lastRefreshed.day), hour: 17, minute: 0, second: 0)
    self.lastRefreshed = dateComponents.date!
  }
}

public struct TimeSeriesDailyRow: Codable {
  public var open: String
  public var high: String
  public var low: String
  public var close: String
  public var volume: String?
  
  private enum CodingKeys: String, CodingKey {
    case open = "1. open"
    case high = "2. high"
    case low = "3. low"
    case close = "4. close"
    case volume = "5. volume"
  }
}

public struct TimeSeriesDailyResponse {
  public var meta: TimeSeriesDailyMeta
  public var rows: Dictionary<Foundation.Date, TimeSeriesDailyRow>

  private enum CodingKeys: String, CodingKey {
    case meta = "Meta Data"
    case rows = "Time Series (Daily)"
  }
}

extension TimeSeriesDailyResponse: Decodable {
  public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    let meta = try container.decode(TimeSeriesDailyMeta.self, forKey: .meta)
    let rowsContainer = try container.nestedContainer(keyedBy: DynamicKey.self, forKey: .rows)
    var rows = Dictionary<Foundation.Date, TimeSeriesDailyRow>()
    try rowsContainer.allKeys.forEach { key in
      let row = try rowsContainer.decode(TimeSeriesDailyRow.self, forKey: key)
      switch AVDate.parse(key.stringValue) {
      case .success(let date):
        let dateComponents = DateComponents(calendar: .current, timeZone: TimeZone(identifier: meta.timeZone), year: Int(date.year), month: Int(date.month), day: Int(date.day), hour: 17, minute: 0, second: 0)
        if let date = dateComponents.date {
          rows[date] = row
        } else {
          throw NSError(domain: "", code: 0)
        }
      case .failure(let err):
        throw err
      }
    }
    self.init(meta: meta, rows: rows)
  }
}
