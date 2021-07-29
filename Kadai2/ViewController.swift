//
//  ViewController.swift
//  Kadai2
//
//  Created by Rin on 2021/07/27.
//

import UIKit

private enum AirthmaticOperations {
    case addition
    case subtaction
    case multiplication
    case division
    
    init?(selectedSegmentIndex: Int) {
        switch selectedSegmentIndex {
        case 0:
            self = .addition
        case 1:
            self = .subtaction
        case 2:
            self = .multiplication
        case 3:
            self = .division
        default:
            return nil
        }
    }
}

final class ViewController: UIViewController {
    @IBOutlet private weak var textField1: UITextField!
    @IBOutlet private weak var textField2: UITextField!
    @IBOutlet private weak var airthmaticOperationsSegmentedControl: UISegmentedControl!
    @IBOutlet private weak var calculateResultLabel: UILabel!

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    @IBAction private func didTapButton(_ sender: UIButton) {
        calculateResultLabel.text = makeResultText()
    }

    private func makeResultText() -> String {
        guard let airthmaticOperation = AirthmaticOperations.init(selectedSegmentIndex: airthmaticOperationsSegmentedControl.selectedSegmentIndex) else {
            return "演算子を取得できませんでした"
        }

        let num1 = Double(textField1.text ?? "") ?? 0
        let num2 = Double(textField2.text ?? "") ?? 0

        switch airthmaticOperation {
        case .addition:
            return String(num1 + num2)
        case .subtaction:
            return String(num1 - num2)
        case .multiplication:
            return String(num1 * num2)
        case .division:
            if num2 == 0 {
                return "割る数には0以外を入力してください"
            } else {
                return String(num1 / num2)
            }
        }
    }
}
