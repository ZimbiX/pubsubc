# pubsubc

[![CI status](https://github.com/ZimbiX/pubsubc/actions/workflows/main.yml/badge.svg?branch=master)](https://github.com/ZimbiX/pubsubc/actions/workflows/main.yml) [![Gem Version](https://badge.fury.io/rb/pubsubc.svg)](https://rubygems.org/gems/pubsubc)



## Contents

<!-- MarkdownTOC autolink=true -->

- [Intro](#intro)
- [Installation](#installation)
- [Usage](#usage)
- [Example](#example)
- [More usage info](#more-usage-info)
- [Contributing](#contributing)
- [Development](#development)
  - [Pre-push hook](#pre-push-hook)
  - [Release](#release)

<!-- /MarkdownTOC -->

## Intro

TODO: FEATURE LIST

## Installation

The executable is distributed as a gem. You can install it from GitHub Packages directly like so:

```bash
$ gem install pubsubc
```

And then if you're using rbenv:

```bash
$ rbenv rehash
```

## Usage

```bash
$ pubsubc TODO
```

## Example

TODO: EXAMPLE

## More usage info

See:

```bash
$ pubsubc --help
```

## Contributing

Pull requests welcome! =)

## Development

### Pre-push hook

This hook runs style checks and tests.

To set up the pre-push hook:

```bash
$ echo -e "#\!/bin/bash\n\$(dirname \$0)/../../auto/pre-push-hook" > .git/hooks/pre-push
chmod +x .git/hooks/pre-push
```

### Release

To release a new version:

```bash
$ auto/release/update-version && auto/release/tag && auto/release/publish
```

This takes care of the whole process:

- Incrementing the version number (the patch number by default)
- Tagging & pushing commits
- Publishing the gem to RubyGems
- Creating a draft GitHub release

To increment the minor or major versions instead of the patch number, run `auto/release/update-version` with `--minor` or `--major`.
