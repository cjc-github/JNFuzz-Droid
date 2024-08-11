# exception, Once triggered, the analysis of the current apk is stopped
class ToolsException(Exception):
    def __init__(self, error_info):
        super().__init__(self)
        self.error_info = error_info

    def __str__(self):
        return self.error_info


# Once triggered, the program stops
class HaveException(Exception):
    def __init__(self, error_info):
        super().__init__(self)
        self.error_info = error_info

    def __str__(self):
        return self.error_info
