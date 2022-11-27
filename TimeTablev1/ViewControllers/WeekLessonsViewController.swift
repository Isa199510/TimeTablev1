//
//  WeekLessonsViewController.swift
//  TimeTablev1
//
//  Created by Иса on 23.11.2022.
//

import UIKit

protocol NewLessonViewControllerDelegate {
    func setLesson(_ lesson: Lesson, index: Int?)
}

class WeekLessonsViewController: UIViewController {
    
    @IBOutlet var weekSegmenteds: UISegmentedControl!
    @IBOutlet var tableView: UITableView!
    
    var weeks = Array(repeating: [Lesson](), count: 7)

    override func viewDidLoad() {
        super.viewDidLoad()

        for (index, week) in Weeks.allCases.enumerated() {
            weekSegmenteds.setTitle(week.rawValue, forSegmentAt: index)
        }
    }
    
    @IBAction func weekSegmentedControlAction(_ sender: UISegmentedControl) {
        tableView.reloadData()
    }
}

extension WeekLessonsViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let newLessonVC = segue.destination as? NewLessonViewController else { return }
        newLessonVC.delegate = self
        guard let tableRowSelected = tableView.indexPathForSelectedRow else { return }
        newLessonVC.nameLessonForEdit = weeks[weekSegmenteds.selectedSegmentIndex][tableRowSelected.row]
        newLessonVC.indexForNameLessonEdit = tableView.indexPathForSelectedRow?.row
    }
}

extension WeekLessonsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        weeks[weekSegmenteds.selectedSegmentIndex].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cellLesson = tableView.dequeueReusableCell(withIdentifier: "cellLesson", for: indexPath) as? LessonViewCell
        else { return UITableViewCell() }
        let weekSCSelected = weekSegmenteds.selectedSegmentIndex

        if !weeks[weekSCSelected].isEmpty {
            let nameLesson = weeks[weekSCSelected][indexPath.row].name
            cellLesson.configure(nameLesson: nameLesson)
            return cellLesson
        }
        return cellLesson
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "editLesson", sender: indexPath )
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            weeks[weekSegmenteds.selectedSegmentIndex].remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

extension WeekLessonsViewController: NewLessonViewControllerDelegate {
    
    func setLesson(_ lesson: Lesson, index: Int?) {
        if let index = index {
            weeks[weekSegmenteds.selectedSegmentIndex][index] = lesson
        } else {
            weeks[weekSegmenteds.selectedSegmentIndex].append(lesson)
        }
        tableView.reloadData()
    }
}
