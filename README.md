# Validate

Inspired by [Result](https://github.com/antitypical/Result), but a little more specialized for building data and user input validations.

Create a validation:
```swift
func validateIsOn(toggle: UISwitch) -> ValidationResult<String, OnField> {
    switch toggle.isOn {
    case true:
        return .valid("The switch is A-OK")
    case false:
        return .invalid(OnField(reason: "The switch should be on.", field: toggle))
    }
}
```

Use the validation:
```swift
let toggle = UISwitch()
let toggleMessageLabel = UILabel()

func updateToggleMessage() {
    switch validateIsOn(toggle: toggle) {
    case .valid(let message):
        toggleMessageLabel.text = message
    case .invalid(let error):
        toggleMessageLabel.text = error.reason
    }
}
```

Compose multiple results into a single validation:
```swift
struct Inputs {
  let message: String
  let value: Int
}

let textField = UITextField()

func validateIntegerInput() -> ValidationResult<Int, OnField> {
    guard let int = Int(textField.text ?? "") else {
        return .invalid(OnField(reason: "Please input an integer.", field: textField))
    }
    return .valid(int)
}

func validateInputs() -> ValidationResult<Inputs, OnMultiple> {
  let messageInput = validateSwitchIsOn()
  let integerInput = validateIntegerInput()

  switch (messageInput, integerInput) {
    case (.valid(let message), .valid(let value)):
      return .valid(Inputs(message: message,  value: value))
    default:
      return .invalid(OnMultiple(integerInput.errors + messageInput.errors))
  }
}
```

