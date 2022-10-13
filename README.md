<p align="center">
  <img src="https://user-images.githubusercontent.com/25312635/195507951-fe64657c-9114-4d78-b04e-444e6d5bbcc4.png" />
</p>

mayavoz is a Pytorch-based opensource toolkit for speech enhancement. It is designed to save time for audio researchers. Is provides easy to use pretrained audio enhancement models and facilitates highly customisable custom model training .

| **[Quick Start]()** | **[Installation]()** | **[Tutorials]()** | **[Available Recipes]()**
## Key features :key:

* Various pretrained models nicely integrated with huggingface 	:hugs: that users can select and use without any hastle.
* :package: Ability to train and validation your own custom speech enhancement models with just under 10 lines of code!
* :magic_wand: A command line tool that facilitates training of highly customisable speech enhacement models from the terminal itself!
* :zap: Supports multi-gpu training integrated with Pytorch Lightning.

## Quick Start :fire:
``` python
from mayavoz import Mayamodel

model = Mayamodel.from_pretrained("mayavoz/waveunet")
model("noisy_audio.wav")
```

## Installation
Only Python 3.8+ is officially supported (though it might work with Python 3.7)

- With Pypi
```
pip install mayavoz
```

- With conda

```
conda env create -f environment.yml
conda activate mayavoz
```

- From source code
```
git clone url
cd mayavoz
pip install -e .
```
