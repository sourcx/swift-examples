import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var timeLeftField: NSTextField!
    @IBOutlet weak var eggImageView: NSImageView!
    @IBOutlet weak var startButton: NSButton!
    @IBOutlet weak var stopButton: NSButton!
    @IBOutlet weak var resetButton: NSButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    // MARK: - IBActions - menus
    @IBAction func startTimerMenuItemSelected(_ sender: Any) {
        startButtonClicked(sender)
    }

    @IBAction func stopTimerMenuItemSelected(_ sender: Any) {
        stopButtonClicked(sender)
    }

    @IBAction func resetTimerMenuItemSelectedLol(_ sender: Any) {
        resetButtonClicked(sender)
    }

    // MARK: - Buttons
    @IBAction func resetButtonClicked(_ sender: Any) {
    }

    @IBAction func stopButtonClicked(_ sender: Any) {
    }

    @IBAction func startButtonClicked(_ sender: Any) {
    }
}
