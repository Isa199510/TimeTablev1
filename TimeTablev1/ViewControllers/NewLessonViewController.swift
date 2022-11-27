//
//  NewLessonViewController.swift
//  TimeTablev1
//
//  Created by Иса on 24.11.2022.
//

import UIKit

class NewLessonViewController: UIViewController {
    
    @IBOutlet var titleLessonLabel: UILabel!
    @IBOutlet var nameLessonTextField: UITextField!
    
    @IBOutlet var saveButtonOutlet: UIButton!
    
    var delegate: NewLessonViewControllerDelegate!
    var nameLessonForEdit: Lesson?
    var indexForNameLessonEdit: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        nameLessonTextField.text = nameLessonForEdit?.name
    }
    
    func configure(nameLesson: String) {
        nameLessonTextField.text = nameLesson
    }

    @IBAction func cancelPressedButton() {
        dismiss(animated: true)
    }
    
    @IBAction func savePressedButton() {
        guard let nameLesson = nameLessonTextField.text else { return }
        delegate.setLesson(
            Lesson(name: nameLesson),
            index: indexForNameLessonEdit
        )
        dismiss(animated: true)
    }
}
