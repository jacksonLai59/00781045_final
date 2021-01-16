//
//  FinalWidget.swift
//  FinalWidget
//
//  Created by User10 on 2021/1/13.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }
    
    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []
        
        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate)
            let timeline = Timeline(entries: entries,
                                    policy: .after(currentDate.addingTimeInterval(3)))
            entries.append(entry)
        }
        
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    
}

struct FinalWidgetEntryView : View {
    var entry: Provider.Entry
    //    var number = Int.random(in: 1..<10)
    var body: some View {
        //        Text(entry.date, style: .time)
        ZStack{
            Image("1")
            let userDefaults = UserDefaults(suiteName: "group.00781045")
            if let messages = userDefaults?.string(forKey: "name") {
                Text("Hey, \(messages)")
                    .background(Color.init(red: 1, green: 1, blue: 1))
                    .offset(x: 0, y: 30)
            }
        }
        
    }
}

@main
struct FinalWidget: Widget {
    
    let kind: String = "FinalWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            FinalWidgetEntryView(entry: entry)        }
            .configurationDisplayName("My Widget")
            .description("This is an example widget.")
    }
}

struct FinalWidget_Previews: PreviewProvider {
    static var previews: some View {
        FinalWidgetEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
