import os
import stat

from utils.logging_config import setup_logging

log = setup_logging(name=__name__)


# Check whether the file is an elf file
def if_elf_file(filepath):
    if not os.path.exists(filepath):
        log.error(f' [!] file path {filepath} does not exits.')
        return False
    try:
        file_states = os.stat(filepath)
        file_mode = file_states[stat.ST_MODE]
        if not stat.S_ISREG(file_mode) or stat.S_ISLNK(file_mode):
            return False

        with open(filepath, 'rb') as f:
            header = (bytearray(f.read(4))[1:4]).decode(encoding="utf-8")
            if header in ["ELF"]:
                return True
    except UnicodeDecodeError as e:
        pass

    return False
