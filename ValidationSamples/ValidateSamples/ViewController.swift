//
//  ViewController.swift
//  ValidationSamples
//
//  Created by sweetman on 4/28/17.
//  Copyright © 2017 tinfish. All rights reserved.
//

import UIKit
import Validate

class ViewController: UIViewController {

    @IBOutlet weak var toggle: UISwitch!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var integerTextField: ValidatedTextField!
    @IBOutlet weak var passwordTextField: ValidatedTextField!
    
    var erroredFields: [OnField] = []
    
    @IBAction func didToggle(_ sender: Any) {
        updateToggle()
    }
    
    @IBAction func textFieldDidChange(_ sender: ValidatedTextField) {
        switch sender {
        case integerTextField:
            updateIntegerInput()
        case passwordTextField:
            updatePasswordInput()
        default:
            break
        }
    }
    
    func updateToggle() {
        switch validateSwitchIsOn() {
        case .valid(let value):
            label.text = value
        case .invalid(let error):
            label.text = error.reason
            showFieldError(error)
        }
    }
    
    func updateIntegerInput() {
        switch validateIntegerInput() {
        case .valid:
            integerTextField.applyNeutralStyle()
        case .invalid(let error):
            showFieldError(error)
        }
    }
    
    func updatePasswordInput() {
        switch validatePasswordInput() {
        case .valid:
            passwordTextField.applyNeutralStyle()
        case .invalid(let error):
            showFieldError(error)
        }
    }
    
    func reset() {
        erroredFields.forEach { $0.applyNeutralStyle() }
        erroredFields = []
    }
    
    func showFieldError(_ error: OnField) {
        if !erroredFields.contains(where: { $0 === error }) {
            erroredFields.append(error)
        }
        error.applyInvalidStyle()
    }
    
    @IBAction func sendMyThing(_ sender: UIButton?) {
        reset()
        let alert: UIAlertController
        switch validateInputs() {
        case .valid(let myThing):
            let message = "\(myThing.statement)\n\(myThing.number)\n\(myThing.password)"
            alert = UIAlertController(title: "It's valid!",
                                      message: message,
                                      preferredStyle: .alert)
        case .invalid(let error):
            error.errors.forEach {
                if let error = $0 as? OnField { showFieldError(error) }
            }
            alert = UIAlertController(title: "It's not valid :(",
                                      message: error.reason,
                                      preferredStyle: .alert)
        }
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

// MARK: Validations

extension ViewController {
    
    func validateSwitchIsOn() -> ValidationResult<String, OnField> {
        switch toggle.isOn {
        case true:
            return .valid("The switch is A-OK")
        case false:
            return .invalid(OnField(reason: "The switch should be on.", field: toggle))
        }
    }
    
    func validateIntegerInput() -> ValidationResult<Int, OnField> {
        guard let int = Int(integerTextField.text ?? "") else {
            return .invalid(OnField(reason: "Please input an integer.",
                                    field: integerTextField))
        }
        guard int < 30 else {
            return .invalid(OnField(reason: "The integer must be less than 30.",
                                    field: integerTextField))
        }
        return .valid(int)
    }
    
    func validatePasswordInput() -> ValidationResult<String, OnFieldMultiple> {
        guard let password = passwordTextField.text else {
            return .invalid(OnFieldMultiple(errors: [OnReason("Please add a password.")],
                                            field: passwordTextField))
        }
        
        var errors: [OnReason] = []
        
        if password.isShorter(than: 8) {
            errors.append(OnReason("Password must be at least 8 characters."))
        }
        if !password.containsMixedCase {
            errors.append(OnReason("Password must contain capital and lowercase letters."))
        }
        guard errors.count == 0 else {
            return .invalid(OnFieldMultiple(errors: errors, field: passwordTextField))
        }
        return .valid(password)
    }
    
    func validateInputs() -> ValidationResult<MyThing, OnMultiple> {
        let statementInput = validateSwitchIsOn()
        let numberInput = validateIntegerInput()
        let passwordInput = validatePasswordInput()
        
        switch (statementInput, numberInput, passwordInput) {
        case (.valid(let statement), .valid(let number), .valid(let password)):
            return .valid(MyThing(statement: statement, number: number, password: password))
        default:
            return .invalid(OnMultiple(
                statementInput.errors +
                numberInput.errors +
                passwordInput.errors))
        }
    }
}

// MARK: Model Object

struct MyThing {
    let statement: String
    let number: Int
    let password: String
}

// MARK: Styles

extension UISwitch: ValidationAppearanceInvalid, ValidationAppearanceNeutral {
    public func applyInvalidStyle(error: ValidationError) {
        tintColor = .red
    }
    
    public func applyNeutralStyle() {
        tintColor = .white
    }
}

class ValidatedTextField: UITextField, ValidationAppearanceInvalid, ValidationAppearanceNeutral {
    @IBOutlet var errorReasonLabel: UILabel!
    
    func applyInvalidStyle(error: ValidationError) {
        layer.borderColor = UIColor.red.cgColor
        errorReasonLabel.text = error.reason
    }
    
    func applyNeutralStyle() {
        layer.borderColor = UIColor.white.cgColor
        errorReasonLabel.text = nil
    }
}
