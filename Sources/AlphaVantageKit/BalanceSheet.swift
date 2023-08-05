//
//  CashFlow.swift
//
//
//  Created by Josh Levine on 07/27/2023
//

import Foundation

public struct BalanceSheetRequest: ApiRequest {
  public typealias Response = BalanceSheetResponse

  public let symbol: String
  
  public init(symbol: String) {
    self.symbol = symbol
  }

  public var queryItems: [URLQueryItem] {
    return [
      URLQueryItem(name: "function", value: "BALANCE_SHEET"),
      URLQueryItem(name: "symbol", value: symbol),
    ]
  }
}

public struct BalanceSheetResponse: Decodable {
  public var symbol: String
  public var annualReports: [Statement]
  public var quarterlyReports: [Statement]
  
  public struct Statement: Decodable {
    public var fiscalDateEnding: String
    public var reportedCurrency: String
    public var totalAssets: Int
    public var totalCurrentAssets: Int
    public var cashAndCashEquivalentsAtCarryingValue: Int
    public var cashAndShortTermInvestments: Int
    public var inventory: Int
    public var currentNetReceivables: Int
    public var totalNonCurrentAssets: Int
    public var propertyPlantEquipment: Int
    public var accumulatedDepreciationAmortizationPPE: Int
    public var intangibleAssets: Int
    public var intangibleAssetsExcludingGoodwill: Int
    public var goodwill: Int
    public var investments: Int
    public var longTermInvestments: Int
    public var shortTermInvestments: Int
    public var otherCurrentAssets: Int
    public var otherNonCurrentAssets: Int
    public var totalLiabilities: Int
    public var totalCurrentLiabilities: Int
    public var currentAccountsPayable: Int
    public var deferredRevenue: Int
    public var currentDebt: Int
    public var shortTermDebt: Int
    public var totalNonCurrentLiabilities: Int
    public var capitalLeaseObligations: Int
    public var longTermDebt: Int
    public var currentLongTermDebt: Int
    public var longTermDebtNoncurrent: Int
    public var shortLongTermDebtTotal: Int
    public var otherCurrentLiabilities: Int
    public var otherNonCurrentLiabilities: Int
    public var totalShareholderEquity: Int
    public var treasuryStock: Int
    public var retainedEarnings: Int
    public var commonStock: Int
    public var commonStockSharesOutstanding: Int
    
    public init(from decoder: Decoder) throws {
      let container = try decoder.container(keyedBy: CodingKeys.self)
      
      fiscalDateEnding = try container.decode(String.self, forKey: .fiscalDateEnding)
      reportedCurrency = try container.decode(String.self, forKey: .reportedCurrency)
      totalAssets = Int(try container.decode(String.self, forKey: .totalAssets)) ?? 0
      totalCurrentAssets = Int(try container.decode(String.self, forKey: .totalCurrentAssets)) ?? 0
      cashAndCashEquivalentsAtCarryingValue = Int(try container.decode(String.self, forKey: .cashAndCashEquivalentsAtCarryingValue)) ?? 0
      cashAndShortTermInvestments = Int(try container.decode(String.self, forKey: .cashAndShortTermInvestments)) ?? 0
      inventory = Int(try container.decode(String.self, forKey: .inventory)) ?? 0
      currentNetReceivables = Int(try container.decode(String.self, forKey: .currentNetReceivables)) ?? 0
      totalNonCurrentAssets = Int(try container.decode(String.self, forKey: .totalNonCurrentAssets)) ?? 0
      propertyPlantEquipment = Int(try container.decode(String.self, forKey: .propertyPlantEquipment)) ?? 0
      accumulatedDepreciationAmortizationPPE = Int(try container.decode(String.self, forKey: .accumulatedDepreciationAmortizationPPE)) ?? 0
      intangibleAssets = Int(try container.decode(String.self, forKey: .intangibleAssets)) ?? 0
      intangibleAssetsExcludingGoodwill = Int(try container.decode(String.self, forKey: .intangibleAssetsExcludingGoodwill)) ?? 0
      goodwill = Int(try container.decode(String.self, forKey: .goodwill)) ?? 0
      investments = Int(try container.decode(String.self, forKey: .investments)) ?? 0
      longTermInvestments = Int(try container.decode(String.self, forKey: .longTermInvestments)) ?? 0
      shortTermInvestments = Int(try container.decode(String.self, forKey: .shortTermInvestments)) ?? 0
      otherCurrentAssets = Int(try container.decode(String.self, forKey: .otherCurrentAssets)) ?? 0
      otherNonCurrentAssets = Int(try container.decode(String.self, forKey: .otherNonCurrentAssets)) ?? 0
      totalLiabilities = Int(try container.decode(String.self, forKey: .totalLiabilities)) ?? 0
      totalCurrentLiabilities = Int(try container.decode(String.self, forKey: .totalCurrentLiabilities)) ?? 0
      currentAccountsPayable = Int(try container.decode(String.self, forKey: .currentAccountsPayable)) ?? 0
      deferredRevenue = Int(try container.decode(String.self, forKey: .deferredRevenue)) ?? 0
      currentDebt = Int(try container.decode(String.self, forKey: .currentDebt)) ?? 0
      shortTermDebt = Int(try container.decode(String.self, forKey: .shortTermDebt)) ?? 0
      totalNonCurrentLiabilities = Int(try container.decode(String.self, forKey: .totalNonCurrentLiabilities)) ?? 0
      capitalLeaseObligations = Int(try container.decode(String.self, forKey: .capitalLeaseObligations)) ?? 0
      longTermDebt = Int(try container.decode(String.self, forKey: .longTermDebt)) ?? 0
      currentLongTermDebt = Int(try container.decode(String.self, forKey: .currentLongTermDebt)) ?? 0
      longTermDebtNoncurrent = Int(try container.decode(String.self, forKey: .longTermDebtNoncurrent)) ?? 0
      shortLongTermDebtTotal = Int(try container.decode(String.self, forKey: .shortLongTermDebtTotal)) ?? 0
      otherCurrentLiabilities = Int(try container.decode(String.self, forKey: .otherCurrentLiabilities)) ?? 0
      otherNonCurrentLiabilities = Int(try container.decode(String.self, forKey: .otherNonCurrentLiabilities)) ?? 0
      totalShareholderEquity = Int(try container.decode(String.self, forKey: .totalShareholderEquity)) ?? 0
      treasuryStock = Int(try container.decode(String.self, forKey: .treasuryStock)) ?? 0
      retainedEarnings = Int(try container.decode(String.self, forKey: .retainedEarnings)) ?? 0
      commonStock = Int(try container.decode(String.self, forKey: .commonStock)) ?? 0
      commonStockSharesOutstanding = Int(try container.decode(String.self, forKey: .commonStockSharesOutstanding)) ?? 0
    }
    
    enum CodingKeys: String, CodingKey {
      case fiscalDateEnding, reportedCurrency, totalAssets, totalCurrentAssets
      case cashAndCashEquivalentsAtCarryingValue, cashAndShortTermInvestments
      case inventory, currentNetReceivables, totalNonCurrentAssets
      case propertyPlantEquipment, accumulatedDepreciationAmortizationPPE
      case intangibleAssets, intangibleAssetsExcludingGoodwill, goodwill
      case investments, longTermInvestments, shortTermInvestments
      case otherCurrentAssets, otherNonCurrentAssets
      case totalLiabilities, totalCurrentLiabilities, currentAccountsPayable
      case deferredRevenue, currentDebt, shortTermDebt, totalNonCurrentLiabilities
      case capitalLeaseObligations, longTermDebt, currentLongTermDebt
      case longTermDebtNoncurrent, shortLongTermDebtTotal, otherCurrentLiabilities
      case otherNonCurrentLiabilities, totalShareholderEquity, treasuryStock
      case retainedEarnings, commonStock, commonStockSharesOutstanding
    }
  }


}

