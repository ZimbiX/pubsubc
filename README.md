# pubsubc

[![CI status](https://github.com/ZimbiX/pubsubc/actions/workflows/main.yml/badge.svg?branch=master)](https://github.com/ZimbiX/pubsubc/actions/workflows/main.yml) [![Gem Version](https://badge.fury.io/rb/pubsubc.svg)](https://rubygems.org/gems/pubsubc)

A simple command-line client for [Google Cloud Pub/Sub](https://cloud.google.com/pubsub).

Created as a learning exercise, but also useful since the `gcloud pubsub` utility:

- Doesn't support the Pub/Sub emulator
- Doesn't provide a continuous subscribe command

## Contents

<!-- MarkdownTOC autolink=true -->

- [Intro](#intro)
- [Installation](#installation)
  - [Direct](#direct)
  - [Bundler](#bundler)
- [Usage](#usage)
  - [Subscribe](#subscribe)
  - [Publish message](#publish-message)
  - [Publish generated messages](#publish-generated-messages)
- [Example](#example)
- [Help info](#help-info)
- [Contributing](#contributing)
- [Development](#development)
  - [Pre-push hook](#pre-push-hook)
  - [Release](#release)

<!-- /MarkdownTOC -->

## Intro

Features:

- Subscribe to a topic, continuously logging all messages as they arrive
- Publish a string message to a topic (creating a subscription automatically)
- Publish automatically-generated messages continuously at a given interval
- Supports connecting to either a local emulator or the remote real Pub/Sub

## Installation

The executable is distributed through RubyGems.

### Direct

You can install it to your system directly using:

```bash
gem install pubsubc
```

And then if you're using rbenv:

```bash
rbenv rehash
```

You can then run it with:

```bash
pubsubc
```

### Bundler

Or, just add it to the `Gemfile` of your project:

```ruby
gem 'pubsubc'
```

And then run it with:

```bash
bundle exec pubsubc
```

## Usage

### Subscribe

To subscribe and continuously log all messages from the topic:

```bash
pubsubc sub
```

### Publish message

To publish a single message to the topic:

```bash
pubsubc pub msg "G'day"
```

### Publish generated messages

To publish a generated message to the topic every second:

```bash
pubsubc pub gen --interval 1000
```

## Example

Example with a generator and several subscribers:

![](doc/example-with-generator-and-several-subscribers.png)

The generator was run with:

```bash
pubsubc pub gen --interval 1
```

And each subscriber:

```bash
pubsubc sub
```

## Help info

Output of `pubsubc --help`:

```
Usage:
    pubsubc [OPTIONS] SUBCOMMAND [ARG] ...

  A simple command-line client for Google Cloud Pub/Sub.

  Created as a learning exercise, but also useful since the 'gcloud pubsub' commands don't support the emulator, and it doesn't provide a continuous subscribe command.

  To start the emulator:

      docker-compose up -d pubsub

  To clean up:

      gcloud pubsub topics delete my-topic
      gcloud pubsub subscriptions delete my-subscription

Parameters:
    SUBCOMMAND                          subcommand
    [ARG] ...                           subcommand arguments

Subcommands:
    pub                                 Publishing messages to the topic
    sub                                 Subscribe to messages on the topic
    shell                               Get a Ruby shell to interact with Pub/Sub

Options:
    --topic TOPIC_NAME                  The name of the Pub/Sub topic (default: "my-topic")
    --subscription SUBSCRIPTION_NAME    The name of the Pub/Sub subscription within the topic (default: "my-subscription")
    --remote                            Connect to the real Pub/Sub, rather than a local Pub/Sub emulator
    --emulator-host EMULATOR_HOST       The host and port of the Pub/Sub emulator (default: $PUBSUB_EMULATOR_HOST, or "localhost:8085")
    -h, --help                          print help
```

Suffix `--help` to any subcommand to see the usage info for it.

## Contributing

Pull requests welcome! =)

## Development

### Pre-push hook

This hook runs style checks and tests.

To set up the pre-push hook:

```bash
echo -e "#\!/bin/bash\n\$(dirname \$0)/../../auto/pre-push-hook" > .git/hooks/pre-push
chmod +x .git/hooks/pre-push
```

### Release

To release a new version:

```bash
auto/release/update-version && auto/release/tag && auto/release/publish
```

This takes care of the whole process:

- Incrementing the version number (the patch number by default)
- Tagging & pushing commits
- Publishing the gem to RubyGems
- Creating a draft GitHub release

To increment the minor or major versions instead of the patch number, run `auto/release/update-version` with `--minor` or `--major`.
