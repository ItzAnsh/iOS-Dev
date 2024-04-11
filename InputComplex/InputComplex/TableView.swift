//
//  TableView.swift
//  InputComplex
//
//  Created by Ansh Chitkara on 10/04/24.
//

import UIKit

class TableView: UITableViewController {
    @IBOutlet weak var newField: UITextField!
    @IBOutlet weak var newField2: UITextField!
    @IBOutlet weak var newField3: UITextField!
    
    @IBOutlet weak var checkInDatePicker: UIDatePicker!
    
    @IBOutlet weak var checkoutDatePicker: UIDatePicker!
    
    @IBOutlet weak var checkOutDateLabel: UILabel!
    
    @IBOutlet weak var checkInDateLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let midnight = Calendar.current.startOfDay(for: Date())
        
        checkInDatePicker.minimumDate = midnight
    }
    
    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        let fname = newField.text ?? ""
        let lname = newField2.text ?? ""
        let email = newField3.text ?? ""
        
        print("fname: \(fname) lname: \(lname) email: \(email)")
    }
    
    func updateViews() {
        checkoutDatePicker.minimumDate = Calendar.current.date(byAdding: .day, value: 1, to: checkInDatePicker.date)
        
        checkInDateLabel.text = checkInDatePicker.date.formatted(date: .abbreviated, time: .omitted)
        
        checkOutDateLabel.text = checkoutDatePicker.date.formatted(date: .abbreviated, time: .omitted)
    }
    
    @IBAction func CheckInPickerChange(_ sender: UIDatePicker) {
        updateViews()
    }

}
