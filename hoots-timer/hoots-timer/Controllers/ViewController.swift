import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var timeLeftField: NSTextField!
    @IBOutlet weak var eggImageView: NSImageView!
    @IBOutlet weak var startButton: NSButton!
    @IBOutlet weak var stopButton: NSButton!
    @IBOutlet weak var resetButton: NSButton!

    var hootsTimer = HootsTimer()

    override func viewDidLoad() {
        super.viewDidLoad()
        hootsTimer.delegate = self
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
    @IBAction func startButtonClicked(_ sender: Any) {
        if hootsTimer.isPaused {
            hootsTimer.resumeTimer()
        } else {
            hootsTimer.duration = 360
            hootsTimer.startTimer()
        }
    }

    @IBAction func stopButtonClicked(_ sender: Any) {
        hootsTimer.stopTimer()
    }

    @IBAction func resetButtonClicked(_ sender: Any) {
        hootsTimer.resetTimer()
        updateDisplay(for: 360)
    }
}

// Implement the protocol that was declared in HootsTimer.swift so that
// this class can be the delegate to recieve events from le Timer.
extension ViewController: HootsTimerProtocol {

    func timeRemainingOnTimer(_ timer: HootsTimer, timeRemaining: TimeInterval) {
        updateDisplay(for: timeRemaining)
    }

    func timerHasFinished(_ timer: HootsTimer) {
        updateDisplay(for: 0)
    }
}

// The error disappears because ViewController now has the two functions required by EggTimerProtocol.
// However both these functions are calling updateDisplay which doesn't exist yet.
// Here is another extension for ViewController which contains the display functions:
extension ViewController {

    // MARK: - Display
    func updateDisplay(for timeRemaining: TimeInterval) {
        timeLeftField.stringValue = textToDisplay(for: timeRemaining)
        eggImageView.image = imageToDisplay(for: timeRemaining)
    }

    private func textToDisplay(for timeRemaining: TimeInterval) -> String {
        if timeRemaining == 0 {
            return "Done!"
        }

        let minutesRemaining = floor(timeRemaining / 60)
        let secondsRemaining = timeRemaining - (minutesRemaining * 60)

        let secondsDisplay = String(format: "%02d", Int(secondsRemaining))
        let timeRemainingDisplay = "\(Int(minutesRemaining)):\(secondsDisplay)"

        return timeRemainingDisplay
    }

    private func imageToDisplay(for timeRemaining: TimeInterval) -> NSImage? {
        let percentageComplete = 100 - (timeRemaining / 360 * 100)

        if hootsTimer.isStopped {
            let stoppedImageName = (timeRemaining == 0) ? "100" : "stopped"
            return NSImage(named: NSImage.Name(rawValue: stoppedImageName))
        }

        let imageName: String
        switch percentageComplete {
        case 0 ..< 25:
            imageName = "0"
        case 25 ..< 50:
            imageName = "25"
        case 50 ..< 75:
            imageName = "50"
        case 75 ..< 100:
            imageName = "75"
        default:
            imageName = "100"
        }

        return NSImage(named: NSImage.Name(rawValue: imageName))
    }

}
