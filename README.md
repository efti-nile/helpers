# helpers

## Computer Vision default Jupyter imports

```python
import base64
import io
import itertools
import json
import os
import pickle
import re
import shutil
import sys
from collections import OrderedDict, defaultdict, namedtuple
import datetime as dt
from pathlib import Path
from pprint import pformat, pprint
from typing import Any

import cv2
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
from IPython.display import HTML, display
from PIL import Image, ImageDraw, ImageFont

# the parent folder considered as the repository root
repo_root = Path.cwd().parent
if str(repo_root) not in sys.path:
    sys.path.append(str(repo_root))
```

## Starship

```bash
curl -sS https://starship.rs/install.sh | sh
```

## Windsurf

Put in `.vscode/settings.json`:

```json
{
    "editor.lineNumbers": "relative",  // use relative line numbers
    "git.ignoreLimitWarning": true,    // don't give a fuck when too many files changed
    "vim.handleKeys": {
        "<C-p>": false                 // use Ctrl+P to switch the current file (as usual for VScode and the like)
    },
}
```

## CLI configs

- `.zshrc` is the configuration file for the Zsh shell.
- `.vimrc` is the configuration file for the Vim text editor.
- `.tmux.conf` is the configuration file for the Tmux terminal multiplexer.
- `aliases.sh` sets aliases.

## `infection.sh`

This script installs the necessary tools and configurations for a newly created Ubuntu or Debian server. The following environment variables can be set:

- `NEW_USER`: name for the new user (default: ft)
- `INSTALL_DOCKER`: if set, Docker will be installed
- `INSTALL_XFCE`:   if set, Xfce will be installed
- `INSTALL_VNC`:    if set, a VNC server will be installed and set up

Use:

```bash
wget https://github.com/efti-nile/helpers/raw/main/infection.sh
chmod +x infection.sh
NEW_USER=Jhon INSTALL_DOCKER=1 source infection.sh
```
