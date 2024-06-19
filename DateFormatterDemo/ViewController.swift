//
//  ViewController.swift
//  DateFormatterDemo
//
//  Created by Bryce Chan on 19/6/2024.
//

import UIKit

class ViewController: UIViewController {
    let tableView = UITableView()
    
    var dateStrings = [String]()
    
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
    let twentyFourHoursDate = "2024-06-17 00:00:00"
    let testDate = "2017-01-27T18:36:36Z"
    let dateWithDay = "Mon, 08, Aug 2008 20:00:01 GMT"

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        
        // Add dates to tableView data source
        let flashOffer = "yyyy-MM-dd HH:mm:ss"
        dateStrings.append(getDateString(targetDate: twentyFourHoursDate, dateFormat: flashOffer, timeZone: timeZoneHongKong, locale: nil))
        dateStrings.append(getDateString(targetDate: testDate, dateFormat: flashOffer, timeZone: timeZoneHongKong, locale: nil))
        dateStrings.append(getDateString(targetDate: twentyFourHoursDate, dateFormat: flashOffer, timeZone: timeZoneHongKong, locale: localeEnUSPosix))
        dateStrings.append(getDateString(targetDate: testDate, dateFormat: flashOffer, timeZone: timeZoneHongKong, locale: localeEnUSPosix))
        dateStrings.append(getDateString(targetDate: twentyFourHoursDate, dateFormat: flashOffer, timeZone: timeZoneEST, locale: nil))
        dateStrings.append(getDateString(targetDate: testDate, dateFormat: flashOffer, timeZone: timeZoneEST, locale: nil))
        dateStrings.append(getDateString(targetDate: twentyFourHoursDate, dateFormat: flashOffer, timeZone: nil, locale: nil))
        dateStrings.append(getDateString(targetDate: testDate, dateFormat: flashOffer, timeZone: nil, locale: nil))
        
        // ISO8601DateTransform from Pods
        let iso8601 = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        dateStrings.append(getDateString(targetDate: twentyFourHoursDate, dateFormat: iso8601, timeZone: timeZoneHongKong, locale: nil))
        dateStrings.append(getDateString(targetDate: testDate, dateFormat: iso8601, timeZone: timeZoneHongKong, locale: nil))
        dateStrings.append(getDateString(targetDate: twentyFourHoursDate, dateFormat: iso8601, timeZone: timeZoneHongKong, locale: localeEnUSPosix))
        dateStrings.append(getDateString(targetDate: testDate, dateFormat: iso8601, timeZone: timeZoneHongKong, locale: localeEnUSPosix))
        dateStrings.append(getDateString(targetDate: twentyFourHoursDate, dateFormat: iso8601, timeZone: timeZoneEST, locale: nil))
        dateStrings.append(getDateString(targetDate: testDate, dateFormat: iso8601, timeZone: timeZoneEST, locale: nil))
        dateStrings.append(getDateString(targetDate: twentyFourHoursDate, dateFormat: iso8601, timeZone: nil, locale: nil))
        dateStrings.append(getDateString(targetDate: testDate, dateFormat: iso8601, timeZone: nil, locale: nil))
        
        let pnModel = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateStrings.append(getDateString(targetDate: twentyFourHoursDate, dateFormat: pnModel, timeZone: timeZoneHongKong, locale: nil))
        dateStrings.append(getDateString(targetDate: testDate, dateFormat: pnModel, timeZone: timeZoneHongKong, locale: nil))
        dateStrings.append(getDateString(targetDate: twentyFourHoursDate, dateFormat: pnModel, timeZone: timeZoneHongKong, locale: localeEnUSPosix))
        dateStrings.append(getDateString(targetDate: testDate, dateFormat: pnModel, timeZone: timeZoneHongKong, locale: localeEnUSPosix))
        dateStrings.append(getDateString(targetDate: twentyFourHoursDate, dateFormat: pnModel, timeZone: timeZoneEST, locale: nil))
        dateStrings.append(getDateString(targetDate: testDate, dateFormat: pnModel, timeZone: timeZoneEST, locale: nil))
        dateStrings.append(getDateString(targetDate: twentyFourHoursDate, dateFormat: pnModel, timeZone: nil, locale: nil))
        dateStrings.append(getDateString(targetDate: testDate, dateFormat: pnModel, timeZone: nil, locale: nil))
        
        let pnModelWithE = "E, dd, MM yyyy HH:mm:ss zzz"
        dateStrings.append(getDateString(targetDate: twentyFourHoursDate, dateFormat: pnModelWithE, timeZone: timeZoneHongKong, locale: nil))
        dateStrings.append(getDateString(targetDate: testDate, dateFormat: pnModelWithE, timeZone: timeZoneHongKong, locale: nil))
        dateStrings.append(getDateString(targetDate: dateWithDay, dateFormat: pnModelWithE, timeZone: timeZoneHongKong, locale: localeEnUSPosix))
        dateStrings.append(getDateString(targetDate: dateWithDay, dateFormat: pnModelWithE, timeZone: timeZoneHongKong, locale: localeEnUSPosix))
        dateStrings.append(getDateString(targetDate: dateWithDay, dateFormat: pnModelWithE, timeZone: timeZoneEST, locale: nil))
        dateStrings.append(getDateString(targetDate: dateWithDay, dateFormat: pnModelWithE, timeZone: timeZoneEST, locale: nil))
        dateStrings.append(getDateString(targetDate: dateWithDay, dateFormat: pnModelWithE, timeZone: nil, locale: nil))
        dateStrings.append(getDateString(targetDate: dateWithDay, dateFormat: pnModelWithE, timeZone: nil, locale: nil))
    }

    func setupTableView() {
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
    }
    
    func getDateString(targetDate: String, dateFormat: String, timeZone: TimeZone?, locale: Locale?) -> String {
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
        
        return "Fail to retrieve date string"
    }
}

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return dateStrings.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.textLabel?.text = dateStrings[indexPath.row]
    return cell
  }
}
