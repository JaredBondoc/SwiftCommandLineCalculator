import Foundation

class Calculator {
    
    func evaluate(mathExpression: [String]) -> Int {
        var stack = [Int]()
        var currentOperator = "+"
        
        for element in mathExpression {
            //checks if element is a number or a math expression. If it is a number then apply the current operator (+,-,/,x or %) to it
            if let operand = Int(element) {
                switch currentOperator {
                    //if + then add that number to the stack
                case "+":
                    stack.append(operand)
                    //if - then add the negative of that number to the stack
                case "-":
                    stack.append(-operand)
                    //if multiplication then remove last number from stack and then mulitply by the current operand. This is to ensure multiplication is done before addition or subtraction.
                case "x":
                    let lastOperand = stack.removeLast()
                    stack.append(lastOperand * operand)
                    //same logic as multiplication just replace * with /
                case "/":
                    let lastOperand = stack.removeLast()
                    stack.append(lastOperand / operand)
                    //same logic now just %
                case "%":
                    let lastOperand = stack.removeLast()
                    stack.append(lastOperand % operand)
                    //if any other input other than the operators then error code.
                default:
                    print("provide proper input")
                    exit(1)
                }
                //checking if the current element is not an operand, if so then update to next operater in the provided math equation.
            } else if ["+", "-", "x", "/", "%"].contains(element) {
                currentOperator = element
            } else {
                //if input is not an integer or operand must be invalid input, thus exit
                print("Invalid input format")
                exit(1)
            }
        }
        //add the entire stack together which contains all the manipulated numbers from the previous step  to get the final result.
        return stack.reduce(0, +)
    }
    
    func calculate(args: [String]) -> String {
        let result = evaluate(mathExpression: args)
        return String(result);
        }
    }
    

 
