//
//  IncomeStatement.swift
//
//
//  Created by Josh Levine on 07/27/2023
//

import Foundation

public struct IncomeStatementRequest: ApiRequest {
  public typealias Response = IncomeStatementResponse

  public let symbol: String
  
  public init(symbol: String) {
    self.symbol = symbol
  }

  public var queryItems: [URLQueryItem] {
    return [
      URLQueryItem(name: "function", value: "INCOME_STATEMENT"),
      URLQueryItem(name: "symbol", value: symbol),
    ]
  }
}

public struct IncomeStatementResponse: Decodable {
  public var symbol: String
  public var annualReports: [IncomeStatement]
  public var quarterlyReports: [IncomeStatement]
    
  public struct IncomeStatement: Decodable {
    public var fiscalDateEnding: String
    public var reportedCurrency: String
    public var grossProfit: Int
    public var totalRevenue: Int
    public var costOfRevenue: Int
    public var costofGoodsAndServicesSold: Int
    public var operatingIncome: Int
    public var sellingGeneralAndAdministrative: Int
    public var researchAndDevelopment: Int
    public var operatingExpenses: Int
    public var investmentIncomeNet: Int
    public var netInterestIncome: Int
    public var interestIncome: Int
    public var interestExpense: Int
    public var nonInterestIncome: Int
    public var otherNonOperatingIncome: Int
    public var depreciation: Int
    public var depreciationAndAmortization: Int
    public var incomeBeforeTax: Int
    public var incomeTaxExpense: Int
    public var interestAndDebtExpense: Int
    public var netIncomeFromContinuingOperations: Int
    public var comprehensiveIncomeNetOfTax: Int
    public var ebit: Int
    public var ebitda: Int
    public var netIncome: Int
    
    public init(from decoder: Decoder) throws {
      let container = try decoder.container(keyedBy: CodingKeys.self)
      
      fiscalDateEnding = try container.decode(String.self, forKey: .fiscalDateEnding)
      reportedCurrency = try container.decode(String.self, forKey: .reportedCurrency)
      
      grossProfit = Int(try container.decode(String.self, forKey: .grossProfit)) ?? 0
      totalRevenue = Int(try container.decode(String.self, forKey: .totalRevenue)) ?? 0
      costOfRevenue = Int(try container.decode(String.self, forKey: .costOfRevenue)) ?? 0
      costofGoodsAndServicesSold = Int(try container.decode(String.self, forKey: .costofGoodsAndServicesSold)) ?? 0
      operatingIncome = Int(try container.decode(String.self, forKey: .operatingIncome)) ?? 0
      sellingGeneralAndAdministrative = Int(try container.decode(String.self, forKey: .sellingGeneralAndAdministrative)) ?? 0
      researchAndDevelopment = Int(try container.decode(String.self, forKey: .researchAndDevelopment)) ?? 0
      operatingExpenses = Int(try container.decode(String.self, forKey: .operatingExpenses)) ?? 0
      investmentIncomeNet = Int(try container.decode(String.self, forKey: .investmentIncomeNet)) ?? 0
      netInterestIncome = Int(try container.decode(String.self, forKey: .netInterestIncome)) ?? 0
      interestIncome = Int(try container.decode(String.self, forKey: .interestIncome)) ?? 0
      interestExpense = Int(try container.decode(String.self, forKey: .interestExpense)) ?? 0
      nonInterestIncome = Int(try container.decode(String.self, forKey: .nonInterestIncome)) ?? 0
      otherNonOperatingIncome = Int(try container.decode(String.self, forKey: .otherNonOperatingIncome)) ?? 0
      depreciation = Int(try container.decode(String.self, forKey: .depreciation)) ?? 0
      depreciationAndAmortization = Int(try container.decode(String.self, forKey: .depreciationAndAmortization)) ?? 0
      incomeBeforeTax = Int(try container.decode(String.self, forKey: .incomeBeforeTax)) ?? 0
      incomeTaxExpense = Int(try container.decode(String.self, forKey: .incomeTaxExpense)) ?? 0
      interestAndDebtExpense = Int(try container.decode(String.self, forKey: .interestAndDebtExpense)) ?? 0
      netIncomeFromContinuingOperations = Int(try container.decode(String.self, forKey: .netIncomeFromContinuingOperations)) ?? 0
      comprehensiveIncomeNetOfTax = Int(try container.decode(String.self, forKey: .comprehensiveIncomeNetOfTax)) ?? 0
      ebit = Int(try container.decode(String.self, forKey: .ebit)) ?? 0
      ebitda = Int(try container.decode(String.self, forKey: .ebitda)) ?? 0
      netIncome = Int(try container.decode(String.self, forKey: .netIncome)) ?? 0
    }
    
    private enum CodingKeys: String, CodingKey {
      case fiscalDateEnding, reportedCurrency, grossProfit, totalRevenue, costOfRevenue
      case costofGoodsAndServicesSold, operatingIncome, sellingGeneralAndAdministrative
      case researchAndDevelopment, operatingExpenses, investmentIncomeNet
      case netInterestIncome, interestIncome, interestExpense
      case nonInterestIncome, otherNonOperatingIncome, depreciation
      case depreciationAndAmortization, incomeBeforeTax, incomeTaxExpense
      case interestAndDebtExpense, netIncomeFromContinuingOperations, comprehensiveIncomeNetOfTax
      case ebit, ebitda, netIncome
    }
  }
}

