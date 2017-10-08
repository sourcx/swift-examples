import Foundation

protocol HootsTimerProtocol {
    func timeRemainingOnTimer(_ timer: HootsTimer, timeRemaining: TimeInterval)
    func timerHasFinished(_ timer: HootsTimer)
}

// MARK: - ∏ower to the Hoots!
class HootsTimer {

    var timer: Timer? = nil
    var startTime: Date?
    var duration: TimeInterval = 360      // default = 6 minutes
    var elapsedTime: TimeInterval = 0
    var delegate: HootsTimerProtocol?

    var isStopped: Bool {
        return timer == nil && elapsedTime == 0
    }

    var isPaused: Bool {
        return timer == nil && elapsedTime > 0
    }

    @objc dynamic func timerAction() {
        guard let startTime = startTime else {
            return
        }

        elapsedTime = -startTime.timeIntervalSinceNow

        let secondsRemaining = (duration - elapsedTime).rounded()

        if secondsRemaining <= 0 {
            resetTimer()
            delegate?.timerHasFinished(self)
        } else {
            delegate?.timeRemainingOnTimer(self, timeRemaining: secondsRemaining)
        }
    }

    func startTimer() {
        startTime = Date()
        elapsedTime = 0
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction),
                                     userInfo: nil, repeats: true)
        timerAction()
    }

    func resumeTimer() {
        startTime = Date(timeIntervalSinceNow: -elapsedTime)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction),
                                     userInfo: nil, repeats: true)
        timerAction()
    }

    func stopTimer() {
        // really just pauses the timer
        timer?.invalidate()
        timer = nil
        timerAction()
    }

    func resetTimer() {
        // stop the timer & reset back to start
        timer?.invalidate()
        timer = nil
        startTime = nil
        duration = 360
        elapsedTime = 0

        timerAction()
    }
}

