# GenHTML5
CLI to genereate html 5 classes based on the standard using json generated from this project: https://github.com/tawesoft/html5spec . In hind sight, it might have been better to parse a working project in a different lang considering this json has a lot of issues and is incomplete. 

This is designed to be used with another project, it may have to be tweaked for your use cases and probably wont work out of the box.

```bash
OVERVIEW: A utility to generate Swift HTML5 classes from the spec

USAGE: gen_html5 process [--overwrite] [--input <input>] [--output <output>]

OPTIONS:
  -f, --overwrite         Automatically overwrite existing files
  -i, --input <input>     Path to folder with files
  -o, --output <output>   Destination to write output
  --version               Show the version.
  -h, --help              Show help information.
```

