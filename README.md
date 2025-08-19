# Mahmoud Ismail Resume

This repository contains the source files for generating Mahmoud Ismail's CV using [RenderCV](https://rendercv.com/). The CV content and design are defined in [`Mahmoud_Ismail_CV.yaml`](Mahmoud_Ismail_CV.yaml), with custom templates in the [`sb2nov`](sb2nov/) and [`markdown`](markdown/) directories.

## Installation

1. Install Python 3.10 or newer.
2. Install RenderCV with all dependencies:
   ```sh
   pip install "rendercv[full]"
   ```

## Rendering the CV

To generate the CV (PDF, Typst, Markdown, HTML, PNG):

```sh
rendercv render "Mahmoud_Ismail_CV.yaml"
```

The output will be in the [`rendercv_output`](rendercv_output/) directory.

To automatically re-render on changes:

```sh
rendercv render --watch "Mahmoud_Ismail_CV.yaml"
```

For more details, see the [RenderCV User Guide](https://docs.rendercv.com/user_guide/)
