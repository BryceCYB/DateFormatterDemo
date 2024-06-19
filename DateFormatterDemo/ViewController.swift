//
//  ViewController.swift
//  DateFormatterDemo
//
//  Created by Bryce Chan on 19/6/2024.
//

import UIKit

struct DateFormatterObject {
    var date: String?
    var format: String
    var timeZone: String
    var locales: String
}

class ViewController: UIViewController {
    let tableView = UITableView()
    
    var dateFormatterObjects = [DateFormatterObject]()
    var formats = [String]()
    var timeZones = [TimeZone]()
    var locales = [Locale]()
    var targetDates = [String]()
    
    // Time zone
    let timeZoneUTC = Foundation.TimeZone(identifier: "UTC")
    let timeZoneHongKong = Foundation.TimeZone(identifier: "Asia/Hong_Kong")
    let timeZoneEST = Foundation.TimeZone(identifier: "US/Eastern")
    
    // Locale
    let localeEnUSPosix = Locale(identifier: "en_US_POSIX")
    let localeZhHk = Locale(identifier: "zh_hk")
    let localeZhCn = Locale(identifier: "zh_cn")
    let localeEn = Locale(identifier: "en")
    
    // Target date
    let date1 = "2024-06-17 00:00:00"
    let date2 = "2017-01-27T18:36:36Z"
    let date3 = "Mon, 08, Aug 2008 20:00:01 GMT"
    
    // Formats
    let format1 = "yyyy-MM-dd HH:mm:ss"
    let format2 = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
    let format3 = "E, dd, MM yyyy HH:mm:ss zzz"

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupArrays()
        setUpTestObjects()
    }

    func setupTableView() {
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
    }
    
    func setupArrays() {
        formats = [format1, format2, format3]
        timeZones = [timeZoneUTC!, timeZoneHongKong!, timeZoneEST!]
        locales = [localeEnUSPosix, localeZhHk, localeZhCn, localeEn]
        targetDates = [date1, date2, date3]
    }
    
    func setUpTestObjects() {
        // Date 1 & format 1
        withoutTimeZoneAndLocale(format: format1, targetDate: date1)
        differentTimeZonesWithoutLocale(format: format1, targetDate: date1)
        differentLocalesWithoutTimeZone(format: format1, targetDate: date1)
        mixLocalesAndTimeZone(format: format1, targetDate: date1)
        
        // Date 2 & format 2
        withoutTimeZoneAndLocale(format: format2, targetDate: date2)
        differentTimeZonesWithoutLocale(format: format2, targetDate: date2)
        differentLocalesWithoutTimeZone(format: format2, targetDate: date2)
        mixLocalesAndTimeZone(format: format2, targetDate: date2)
        
        // Date 3 & format 3
        withoutTimeZoneAndLocale(format: format3, targetDate: date3)
        differentTimeZonesWithoutLocale(format: format3, targetDate: date3)
        differentLocalesWithoutTimeZone(format: format3, targetDate: date3)
        mixLocalesAndTimeZone(format: format3, targetDate: date3)
    }
    
    func withoutTimeZoneAndLocale(format: String, targetDate: String) {
        let dateString = getDateString(targetDate: targetDate, dateFormat: format, timeZone: nil, locale: nil)
        dateFormatterObjects.append(DateFormatterObject(date: dateString, format: format, timeZone: "nil", locales: "nil"))
    }
    
    func differentTimeZonesWithoutLocale(format: String, targetDate: String) {
        timeZones.forEach { timeZone in
            let dateString = getDateString(targetDate: targetDate, dateFormat: format, timeZone: timeZone, locale: nil)
            dateFormatterObjects.append(DateFormatterObject(date: dateString, format: format, timeZone: timeZone.description, locales: "nil"))
        }
    }
    
    func differentLocalesWithoutTimeZone(format: String, targetDate: String) {
        locales.forEach { locale in
            let dateString = getDateString(targetDate: targetDate, dateFormat: format, timeZone: nil, locale: locale)
            dateFormatterObjects.append(DateFormatterObject(date: dateString, format: format, timeZone: "nil", locales: locale.description))
        }
    }
    
    func mixLocalesAndTimeZone(format: String, targetDate: String) {
        locales.forEach { locale in
            timeZones.forEach { timeZone in
                let dateString = getDateString(targetDate: targetDate, dateFormat: format, timeZone: timeZone, locale: locale)
                dateFormatterObjects.append(DateFormatterObject(date: dateString, format: format, timeZone: timeZone.description, locales: locale.description))
            }
        }
    }
    
    func getDateString(targetDate: String, dateFormat: String, timeZone: TimeZone?, locale: Locale?) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        
        if let timeZone = timeZone {
            dateFormatter.timeZone = timeZone
        }
        
        if let locale = locale {
            dateFormatter.locale = locale
        }
        
        if let date = dateFormatter.date(from: targetDate) {
            return dateFormatter.string(from: date)
        }
        
        return nil
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dateFormatterObjects.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        cell.formatLabel.text = "Format: " + dateFormatterObjects[indexPath.row].format
        cell.timeZoneLabel.text = "Time Zone: " + dateFormatterObjects[indexPath.row].timeZone
        cell.localeLabel.text = "Locale: " + dateFormatterObjects[indexPath.row].locales
        
        if let date = dateFormatterObjects[indexPath.row].date {
            cell.dateLabel.text = "Date: " + date
            cell.backgroundColor = .clear
        } else {
            cell.dateLabel.text = "Fail to retrieve date string"
            cell.backgroundColor = .systemPink
        }
        
        return cell
    }
}
