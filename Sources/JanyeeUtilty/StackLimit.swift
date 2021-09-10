import Darwin // Unnecessary if you already have Foundation imported

public func getStackByteLimit() -> rlimit? {
    var limits = rlimit()

    guard getrlimit(RLIMIT_STACK, &limits) != -1 else {
        perror("Error with getrlimit")
        return nil
    }

    return limits
}

public func setStackLimit(bytes: UInt64) -> Bool {
    guard let max = getStackByteLimit()?.rlim_max else {
        return false
    }

    var limits = rlimit(rlim_cur: bytes, rlim_max: max)

    guard setrlimit(RLIMIT_STACK, &limits) != -1 else {
        perror("Error with setrlimit")
        return false
    }

    return true
}
