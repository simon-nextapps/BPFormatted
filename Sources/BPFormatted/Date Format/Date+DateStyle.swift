//
//  Date+DateStyle.swift
//  
//
//  Created by Simon Salomons on 13/06/2021.
//

import Foundation

extension Date.BPFormatStyle {

    /// Predefined date styles varied in lengths or the components included. The exact format depends on the locale.
    public struct DateStyle: Codable, Hashable {
        internal let style: Style

        /// Excludes the date part.
        public static var omitted: Date.BPFormatStyle.DateStyle {
            return DateStyle(style: .omitted)
        }

        /// Shows date components in their numeric form. For example, "10/21/2015".
        public static var numeric: Date.BPFormatStyle.DateStyle {
            return DateStyle(style: .numeric)
        }

        /// Shows date components in their abbreviated form if possible. For example, "Oct 21, 2015".
        public static var abbreviated: Date.BPFormatStyle.DateStyle {
            return DateStyle(style: .abbreviated)
        }

        /// Shows date components in their long form if possible. For example, "October 21, 2015".
        public static var long: Date.BPFormatStyle.DateStyle {
            return DateStyle(style: .long)
        }

        /// Shows the complete day. For example, "Wednesday, October 21, 2015".
        public static var complete: Date.BPFormatStyle.DateStyle {
            return DateStyle(style: .complete)
        }

        internal var symbols: Symbols {
            switch style {
            case .omitted:
                return Symbols()
            case .abbreviated:
                return Date.BPFormatStyle.dateTime
                    .year(.defaultDigits)
                    .month(.abbreviated)
                    .day(.defaultDigits)
                    .symbols
            case .numeric:
                return Date.BPFormatStyle.dateTime
                    .year(.defaultDigits)
                    .month(.defaultDigits)
                    .day(.defaultDigits)
                    .symbols
            case .long:
                return Date.BPFormatStyle.dateTime
                    .year(.defaultDigits)
                    .month(.wide)
                    .day(.defaultDigits)
                    .symbols
            case .complete:
                return Date.BPFormatStyle.dateTime
                    .year(.defaultDigits)
                    .month(.wide)
                    .day(.defaultDigits)
                    .weekday(.wide)
                    .symbols
            }
        }

        internal var dateFormatterStyle: DateFormatter.Style {
            switch style {
            case .omitted:
                return .none
            case .abbreviated:
                return .medium
            case .numeric:
                return .short
            case .long:
                return .long
            case .complete:
                return .full
            }
        }

        internal enum Style: Codable, Hashable {
            case omitted
            case numeric
            case abbreviated
            case long
            case complete
        }
    }
}
