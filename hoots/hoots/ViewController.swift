import Cocoa

class ViewController: NSViewController {
    // The @IBOutlet attribute links these variables to the Interface Builder.
    // Main.storyboard contains:
    // <connections>
    //   <outlet property="nameField" destination="xdO-aA-d9h" id="ier-Zg-LsQ"/>
    //   <outlet property="resultLabel" destination="6Pn-i5-GVm" id="Yw3-Dx-yZJ"/>
    //   <outlet property="titleLabel" destination="fTF-WJ-MsK" id="7Yb-jK-QS1"/>
    // </connections>
    @IBOutlet
    weak var nameField: NSTextField!

    @IBOutlet
    weak var resultLabel: NSTextField!

    @IBOutlet
    weak var titleLabel: NSTextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        optionals()
    }

    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }

    // Functions are linked with IBAction attribute.
    // IBAction is used by Interface Builder to expose a method as a connection
    // point between user interface elements and app code.
    @IBAction
    func hootsButtonClicked(_ sender: Any) {
        var name = nameField.stringValue
        if name.isEmpty {
            name = "Trolls"
        }
        // String interpolation with \()
        resultLabel.stringValue = "Fight! Many goblins and \(name)!"
    }

    func optionals() {
        let possibleNumber = "123"
        let convertedNumber = Int(possibleNumber)

        // Typecheck
        if let number = convertedNumber as? Int {
            print("Number is of type Int")
            print(number)
        }
        if let number = convertedNumber as? Int? {
            print("Number is of type Int?")
            print(number)
        }
    }
}
