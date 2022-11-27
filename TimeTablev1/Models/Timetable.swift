//
//  Timetable.swift
//  TimeTablev1
//
//  Created by Иса on 23.11.2022.
//



enum Weeks: String, CaseIterable {
    case monday = "пн"
    case tuesday = "вт"
    case wednesday = "ср"
    case thursday = "чт"
    case friday = "пт"
    case saturday = "сб"
}

struct Lesson {
    let name: String
}

struct Day {
    var week: Weeks
    var lessons: [Lesson]
    
    func getLessons() -> [Lesson] {
        return lessons
    }
}

class Week {
    var weeks: [Weeks: [Lesson]] = [:]
    
//    func getWeeks() -> [Weeks] {        // возврат ключей
//        Weeks.allCases
//    }
//
//    func getLessons(with: Weeks) -> [Lesson]{
//        guard with != nil else { return [] }
//        return weeks[with] ?? []
//    }
//
//    func newLessonForWeek(_ with: Lesson, week: Weeks) {
//        guard week != nil else { return }
////        weeks[week] =
//    }
}

//struct Week {
//    var week: [Day]
//}
//

