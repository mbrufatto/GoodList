//
//  AddTaskViewController.swift
//  GoodList
//
//  Created by Marcio Habigzang Brufatto on 08/01/21.
//

import Foundation
import UIKit
import RxSwift

class AddTaskViewController: UIViewController {
    
    @IBOutlet weak var prioritySegmentedControll: UISegmentedControl!
    @IBOutlet weak var taskTitleTextField: UITextField!
    
    private let taskSubject = PublishSubject<Task>()
    
    var taskSubjectObservable: Observable<Task> {
        return taskSubject.asObserver()
    }
    
    @IBAction func save() {
        guard let priority = Priority(rawValue: self.prioritySegmentedControll.selectedSegmentIndex), let title = self.taskTitleTextField.text else {
            return
        }
        
        let task = Task(title: title, priority: priority)
        taskSubject.onNext(task)
        
        self.dismiss(animated: true, completion: nil)
    }
}
