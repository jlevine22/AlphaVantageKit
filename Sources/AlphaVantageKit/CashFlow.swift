//
//  CashFlow.swift
//
//
//  Created by Josh Levine on 07/27/2023
//

import Foundation

public struct CashFlowRequest: ApiRequest {
  public typealias Response = CashFlowResponse

  public let symbol: String
  
  public init(symbol: String) {
    self.symbol = symbol
  }

  public var queryItems: [URLQueryItem] {
    return [
      URLQueryItem(name: "function", value: "CASH_FLOW"),
      URLQueryItem(name: "symbol", value: symbol),
    ]
  }
}

public struct CashFlowResponse: Decodable {
  public var symbol: String
  public var annualReports: [Statement]
  public var quarterlyReports: [Statement]
    
  public struct Statement: Decodable {
    public var fiscalDateEnding: String
    public var operatingCashflow: Int
    public var paymentsForOperatingActivities: Int
    public var proceedsFromOperatingActivities: Int
    public var changeInOperatingLiabilities: Int
    public var changeInOperatingAssets: Int
    public var depreciationDepletionAndAmortization: Int
    public var capitalExpenditures: Int
    public var changeInReceivables: Int
    public var changeInInventory: Int
    public var profitLoss: Int
    public var cashflowFromInvestment: Int
    public var cashflowFromFinancing: Int
    public var proceedsFromRepaymentsOfShortTermDebt: Int
    public var paymentsForRepurchaseOfCommonStock: Int
    public var paymentsForRepurchaseOfEquity: Int
    public var paymentsForRepurchaseOfPreferredStock: Int
    public var dividendPayout: Int
    public var dividendPayoutCommonStock: Int
    public var dividendPayoutPreferredStock: Int
    public var proceedsFromIssuanceOfCommonStock: Int
    public var proceedsFromIssuanceOfLongTermDebtAndCapitalSecuritiesNet: Int
    public var proceedsFromIssuanceOfPreferredStock: Int
    public var proceedsFromRepurchaseOfEquity: Int
    public var proceedsFromSaleOfTreasuryStock: Int
    public var changeInCashAndCashEquivalents: Int
    public var changeInExchangeRate: Int
    public var netIncome: Int
    
    public init(from decoder: Decoder) throws {
      let container = try decoder.container(keyedBy: CodingKeys.self)
      
      fiscalDateEnding = try container.decode(String.self, forKey: .fiscalDateEnding)
      operatingCashflow = Int(try container.decode(String.self, forKey: .operatingCashflow)) ?? 0
      paymentsForOperatingActivities = Int(try container.decode(String.self, forKey: .paymentsForOperatingActivities)) ?? 0
      proceedsFromOperatingActivities = Int(try container.decode(String.self, forKey: .proceedsFromOperatingActivities)) ?? 0
      changeInOperatingLiabilities = Int(try container.decode(String.self, forKey: .changeInOperatingLiabilities)) ?? 0
      changeInOperatingAssets = Int(try container.decode(String.self, forKey: .changeInOperatingAssets)) ?? 0
      depreciationDepletionAndAmortization = Int(try container.decode(String.self, forKey: .depreciationDepletionAndAmortization)) ?? 0
      capitalExpenditures = Int(try container.decode(String.self, forKey: .capitalExpenditures)) ?? 0
      changeInReceivables = Int(try container.decode(String.self, forKey: .changeInReceivables)) ?? 0
      changeInInventory = Int(try container.decode(String.self, forKey: .changeInInventory)) ?? 0
      profitLoss = Int(try container.decode(String.self, forKey: .profitLoss)) ?? 0
      cashflowFromInvestment = Int(try container.decode(String.self, forKey: .cashflowFromInvestment)) ?? 0
      cashflowFromFinancing = Int(try container.decode(String.self, forKey: .cashflowFromFinancing)) ?? 0
      proceedsFromRepaymentsOfShortTermDebt = Int(try container.decode(String.self, forKey: .proceedsFromRepaymentsOfShortTermDebt)) ?? 0
      paymentsForRepurchaseOfCommonStock = Int(try container.decode(String.self, forKey: .paymentsForRepurchaseOfCommonStock)) ?? 0
      paymentsForRepurchaseOfEquity = Int(try container.decode(String.self, forKey: .paymentsForRepurchaseOfEquity)) ?? 0
      paymentsForRepurchaseOfPreferredStock = Int(try container.decode(String.self, forKey: .paymentsForRepurchaseOfPreferredStock)) ?? 0
      dividendPayout = Int(try container.decode(String.self, forKey: .dividendPayout)) ?? 0
      dividendPayoutCommonStock = Int(try container.decode(String.self, forKey: .dividendPayoutCommonStock)) ?? 0
      dividendPayoutPreferredStock = Int(try container.decode(String.self, forKey: .dividendPayoutPreferredStock)) ?? 0
      proceedsFromIssuanceOfCommonStock = Int(try container.decode(String.self, forKey: .proceedsFromIssuanceOfCommonStock)) ?? 0
      proceedsFromIssuanceOfLongTermDebtAndCapitalSecuritiesNet = Int(try container.decode(String.self, forKey: .proceedsFromIssuanceOfLongTermDebtAndCapitalSecuritiesNet)) ?? 0
      proceedsFromIssuanceOfPreferredStock = Int(try container.decode(String.self, forKey: .proceedsFromIssuanceOfPreferredStock)) ?? 0
      proceedsFromRepurchaseOfEquity = Int(try container.decode(String.self, forKey: .proceedsFromRepurchaseOfEquity)) ?? 0
      proceedsFromSaleOfTreasuryStock = Int(try container.decode(String.self, forKey: .proceedsFromSaleOfTreasuryStock)) ?? 0
      changeInCashAndCashEquivalents = Int(try container.decode(String.self, forKey: .changeInCashAndCashEquivalents)) ?? 0
      changeInExchangeRate = Int(try container.decode(String.self, forKey: .changeInExchangeRate)) ?? 0
      netIncome = Int(try container.decode(String.self, forKey: .netIncome)) ?? 0
    }
    
    private enum CodingKeys: String, CodingKey {
      case fiscalDateEnding, operatingCashflow, paymentsForOperatingActivities
      case proceedsFromOperatingActivities, changeInOperatingLiabilities, changeInOperatingAssets
      case depreciationDepletionAndAmortization, capitalExpenditures, changeInReceivables
      case changeInInventory, profitLoss, cashflowFromInvestment
      case cashflowFromFinancing, proceedsFromRepaymentsOfShortTermDebt, paymentsForRepurchaseOfCommonStock
      case paymentsForRepurchaseOfEquity, paymentsForRepurchaseOfPreferredStock, dividendPayout
      case dividendPayoutCommonStock, dividendPayoutPreferredStock, proceedsFromIssuanceOfCommonStock
      case proceedsFromIssuanceOfLongTermDebtAndCapitalSecuritiesNet, proceedsFromIssuanceOfPreferredStock
      case proceedsFromRepurchaseOfEquity, proceedsFromSaleOfTreasuryStock, changeInCashAndCashEquivalents
      case changeInExchangeRate, netIncome
    }
  }

}

