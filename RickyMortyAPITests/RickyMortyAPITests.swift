//
//  RickyMortyAPITests.swift
//  RickyMortyAPITests
//
//  Created by Rashad Abdul-Salam on 3/27/25.
//

import Testing
import Foundation
@testable import RickyMortyAPI

struct RickyMortyAPITests {

    @Test func example() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
    }
    
    @Test func testDateFormatterShouldProperlyFormatDates() {
            let utcDate = "2017-11-04T22:39:48.055Z"
            let challengeDate = "Nov 4, 2017"
            
            let formattedDate = DateFormatter.formattedPublishDate(utcDate)
            print("Formatted Date: \(formattedDate)")
            #expect(formattedDate == challengeDate, "FormattedDate and ChallengeDate should match.")
        }
}
