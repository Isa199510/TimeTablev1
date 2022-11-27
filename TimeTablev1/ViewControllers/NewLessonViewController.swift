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
    
    var forTitleLessonLabel: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        updateNewLessonVC()
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
    
    @objc private func nameLessonTextFieldDidChanged() {
        guard let nameLesson = nameLessonTextField.text else { return }
        saveButtonOutlet.isEnabled = !nameLesson.isEmpty
    }
    
    private func updateNewLessonVC() {
        saveButtonOutlet.isEnabled = false
        nameLessonTextField.addTarget(
            self,
            action: #selector(nameLessonTextFieldDidChanged),
            for: .editingChanged
        )
        nameLessonTextField.text = nameLessonForEdit?.name
        nameLessonTextField.becomeFirstResponder()
        if let forTitleLessonLabel = forTitleLessonLabel {
            titleLessonLabel.text = forTitleLessonLabel
        }
    }
}
