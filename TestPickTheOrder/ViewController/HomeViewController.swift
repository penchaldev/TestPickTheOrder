//
//  ViewController.swift
//  TestPickTheOrder
//
//  Created by Penchal on 01/09/20.
//  Copyright © 2020 senix.com. All rights reserved.
//

import UIKit
import iOSDropDown

class HomeViewController: UIViewController {

    @IBOutlet weak var questionDescription: UILabel!
    @IBOutlet weak var questionSubHeading: UILabel!
    @IBOutlet weak var statementOne: UILabel!
    @IBOutlet weak var statementTwo: UILabel!
    @IBOutlet weak var statementThree: UILabel!
    @IBOutlet weak var answersSectionHeading: UILabel!
    @IBOutlet weak var answerOne: UILabel!
    @IBOutlet weak var answerTwo: UILabel!
    @IBOutlet weak var answerThree: UILabel!
    @IBOutlet weak var firstStatementOptions: DropDown!
    @IBOutlet weak var secondStatementOptions: DropDown!
    @IBOutlet weak var thirdStatementOptions: DropDown!

    let statements = [" This is the first sentence, example for having more words when compared to the third one", " This is the Second sentence, example for having more words when compared to the third one", " This is the third sentence"]
    var dropdownOptions = ["1", "2", "3"]

    override func viewDidLoad() {
        super.viewDidLoad()
        setDropdown()
        self.displayMultipleChoiceQuestion()
    }

    func displayMultipleChoiceQuestion() {

        // setting corner radius and border width
        statementOne.layer.borderWidth = 1.0
        statementOne.layer.cornerRadius = 10
        statementTwo.layer.borderWidth = 1.0
        statementTwo.layer.cornerRadius = 10
        statementThree.layer.borderWidth = 1.0
        statementThree.layer.cornerRadius = 10

        questionDescription.text = " Question : Select the following options in the sequence order using dropdown field. And display the correct order belowbased on selection"
        questionSubHeading.text = "* The given statements are in jumbled order. Use the dropdown to set the correct order"
        answersSectionHeading.text = "Here the question will be ordered in the correct sequence"

        //Three Statements
        statementOne.text = statements[2]
        statementTwo.text = statements[1]
        statementThree.text = statements[0]
    }

//MARK: - Setting dropdop values and updating Answer section -
    func setDropdown() {

        //Initial dropdown options
        firstStatementOptions.optionArray = dropdownOptions
        secondStatementOptions.optionArray = dropdownOptions
        thirdStatementOptions.optionArray = dropdownOptions
//        thirdStatementOptions.optionIds = [1,2,3]

        //First statement dropdown selection
        firstStatementOptions.didSelect { (selectedOption, index, id) in
            print("Selected Option:\(selectedOption) and Selected Index \(index)")

            let selectedOptionValue = Int(selectedOption)
            switch selectedOptionValue {
            case 1:
                print("First option is :\(selectedOption)")
                // Update label text in selected section
                self.answerOne.text = self.statements[index + 2]

                //Remove this option from dropdowns
                self.dropdownOptions.remove(at: index)
                print("dropdownOptions: \(self.dropdownOptions)")

                self.secondStatementOptions.optionArray = self.dropdownOptions
                self.thirdStatementOptions.optionArray = self.dropdownOptions


            case 2:
                print("First option is :\(selectedOption)")
                // Update label text in selected section
                self.answerTwo.text = self.statements[index + 1]

                //Remove this option from dropdowns
                self.dropdownOptions.remove(at: index)

                self.secondStatementOptions.optionArray = self.dropdownOptions
                self.thirdStatementOptions.optionArray = self.dropdownOptions



            case 3:
                print("First option is :\(selectedOption)")
                // Update label text in selected section
                self.answerThree.text = self.statements[index]

                //Remove this option from dropdowns
                self.dropdownOptions.remove(at: index)

                self.secondStatementOptions.optionArray = self.dropdownOptions
                self.thirdStatementOptions.optionArray = self.dropdownOptions

            case .none:
                return
            case .some(_):
                return
            }
        }

        //Second statement dropdown selection
        secondStatementOptions.didSelect { (selectedOption, index, id) in
            print("Selected Option:\(selectedOption) and Selected Index \(index)")

            let selectedOptionValue = Int(selectedOption)
            switch selectedOptionValue {
            case 1:
                print("First option is :\(selectedOption)")
                // Update label text in selected section
                self.answerOne.text = self.statements[index + 1]

                //Remove this option from dropdowns
                self.dropdownOptions.remove(at: index)
                self.firstStatementOptions.optionArray = self.dropdownOptions
                self.thirdStatementOptions.optionArray = self.dropdownOptions


            case 2:
                print("First option is :\(selectedOption)")
                // Update label text in selected section
                self.answerTwo.text = self.statements[index + 1]

                //Remove this option from dropdowns
                self.dropdownOptions.remove(at: index)

                self.firstStatementOptions.optionArray = self.dropdownOptions
                self.thirdStatementOptions.optionArray = self.dropdownOptions

            case 3:
                print("First option is :\(selectedOption)")
                // Update label text in selected section
                self.answerThree.text = self.statements[index]

                //Remove this option from dropdowns
                self.dropdownOptions.remove(at: index)

                self.firstStatementOptions.optionArray = self.dropdownOptions
                self.thirdStatementOptions.optionArray = self.dropdownOptions

            case .none:
                return
            case .some(_):
                return
            }

        }

        //Third statement dropdown selection
        thirdStatementOptions.didSelect { (selectedOption, index, id) in
            print("Selected Option:\(selectedOption) and Selected Index \(index)")

            let selectedOptionValue = Int(selectedOption)
            switch selectedOptionValue {
            case 1:
                print("First option is :\(selectedOption)")
                // Update label text in selected section
                self.answerOne.text = self.statements[index]

                //Remove this option from dropdowns
                self.dropdownOptions.remove(at: index)

                self.firstStatementOptions.optionArray = self.dropdownOptions
                self.secondStatementOptions.optionArray = self.dropdownOptions

            case 2:
                print("First option is :\(selectedOption)")
                // Update label text in selected section
                self.answerTwo.text = self.statements[index]

                //Remove this option from dropdowns
                self.dropdownOptions.remove(at: index)

                self.firstStatementOptions.optionArray = self.dropdownOptions
                self.secondStatementOptions.optionArray = self.dropdownOptions

            case 3:
                print("First option is :\(selectedOption)")
                // Update label text in selected section
                self.answerThree.text = self.statements[index]

                //Remove this option from dropdowns
                self.dropdownOptions.remove(at: index)

                self.firstStatementOptions.optionArray = self.dropdownOptions
                self.secondStatementOptions.optionArray = self.dropdownOptions

            case .none:
                return
            case .some(_):
                return
            }
        }
    }

//MARK: - Clear selected Options -
    @IBAction func clearOptions(_ sender: Any) {
        answerOne.text = ""
        answerTwo.text = ""
        answerThree.text = ""
        setDropdown()

        self.dropdownOptions = ["1", "2", "3"]
        self.firstStatementOptions.optionArray = self.dropdownOptions
        self.secondStatementOptions.optionArray = self.dropdownOptions
        self.thirdStatementOptions.optionArray = self.dropdownOptions

    }
}








