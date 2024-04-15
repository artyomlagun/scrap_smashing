# Scrapping Smashing Magazine
There is a website called Smashing Magazine, which uploads wallpapers for the
desktop each month. It's not efficient to manually visit the site every month
and check for new content, so let's automate this task.

## Getting started

Prerequisites: Ruby 3.2.2.

```bash
# 1. Install dependencies.
bundle install
```

To start using this CLI tool you have to call `bin/smashing --month MMYYYY --resolution 640x480` in the terminal.
`MMYYYY` - `MM` should be in range from 01 to 12, `YYYY` - should be between 2000 and current year (2024).
As for `resolution` argument: you can define another one, but
pay attention, that tool just checks the presence of resolution.
In case when images are absent in set resolution the tool will skip them.

All images will be downloaded into folder `downloads/%{MMYYYY}/%{resolution}/`.
