//
//  AddToDoViewController.swift
//  ToDoListApp
//
//  Created by Veronica Cheung on 31/5/2020.
//  Copyright © 2020 Veronica Cheung. All rights reserved.
//

import UIKit
import CoreData

class AddToDoViewController: UIViewController {
    
    var previousVC = ToDoTableViewController()

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    @IBOutlet weak var datePicker1: UIDatePicker!
    @IBOutlet weak var datePicker2: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let _: ClosedRange<Date> = {
            let calendar = Calendar.current
            let startComponents = DateComponents(year: 2022, month: 1, day: 1)
            let endComponents = DateComponents(year: 2023, month: 12, day: 31, hour: 23, minute: 59, second: 59)
            return calendar.date(from:startComponents)!
                ...
                calendar.date(from:endComponents)!
        }()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addTapped(_ sender: Any) {
        // we have to grab this view context to be able to work with Core Data
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {

          // we are creating a new ToDoCD object here, naming it toDo
          let toDo = ToDoCD(entity: ToDoCD.entity(), insertInto: context)

          // if the titleTextField has text, we will call that text titleText
          if let titleText = titleTextField.text {
              // we will take the titleText and assign that value to toDo.name
              // this .name and .important came from the attributes you typed in on the Core Data page!
              toDo.name = titleText
              toDo.important = importantSwitch.isOn
              toDo.dueDate = datePicker2.date
              toDo.doDate = datePicker1.date
          }

          try? context.save()

          navigationController?.popViewController(animated: true)
        }
        
     /*   let toDo = ToDo()

        
        if let titleText = titleTextField.text {
          toDo.name = titleText
          toDo.important = importantSwitch.isOn
        }
        previousVC.toDos.append(toDo)
        previousVC.tableView.reloadData()
        navigationController?.popViewController(animated: true) */
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
