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
    
    let checkInDatePickerCellIndexPath = IndexPath(row: 1, section: 1)
    let checkOutDatePickerCellIndexPath = IndexPath(row: 1, section: 2)
    let checkInDateLabelCellIndexPath = IndexPath(row: 0, section: 1)
    let checkOutDateLabelCellIndexPath = IndexPath(row: 0, section: 2)
    
    var isCheckInDatePickerVisible: Bool = false {
        didSet {
            checkInDatePicker.isHidden = !isCheckInDatePickerVisible
        }
    }
    
    var isCheckOutDatePickerVisible: Bool = false {
        didSet {
            checkoutDatePicker.isHidden = !isCheckOutDatePickerVisible
        }
    }
    

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

    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case checkInDatePickerCellIndexPath where isCheckInDatePickerVisible == false:
            return 0
            
        case checkInDatePickerCellIndexPath where isCheckOutDatePickerVisible == false:
            return 0
            default: return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case checkInDatePickerCellIndexPath: return 190
        case checkOutDatePickerCellIndexPath: return 190
        default: return UITableView.automaticDimension
        }
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
        if (indexPath == checkInDateLabelCellIndexPath && isCheckOutDatePickerVisible == false) {
            isCheckInDatePickerVisible.toggle()
        } else if (indexPath == checkOutDatePickerCellIndexPath && isCheckInDatePickerVisible == false) {
            isCheckOutDatePickerVisible.toggle()
        } else if (indexPath == checkInDateLabelCellIndexPath || indexPath == checkInDateLabelCellIndexPath) {
            
        }
        
        tableView.beginUpdates()
        tableView.endUpdates()
    }
}
