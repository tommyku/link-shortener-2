# Link shortener bot 2

Host your own link shortener that works with a bot. Just send the link
to a bot and it'll take care of the rest for you. Demo:
[@AutoExpireShortLinkBot](http://t.me/AutoExpireShortLinkBot)

This version has no external database dependency, and it you can spin
it up with just one command.

## Getting Started

1. Install Docker and Docker Compose in your local machine or server
1. Create a Telegram bot by talking to [@BotFather](https://telegram.me/BotFather)
1. Create and fill in the credentials to the `env.yml` file, see `env.yml.example` for the template
1. run `docker-compose up -d` from the project root folder
1. Send a link to your bot from Telegram, you should be see reply like (you will need to set up a [backend](https://github.com/tommyku/link-shortener-front-end) too.)

```
YOU: http://example.com
BOT: Wow, try http://randomhost.name/abcdefgh
```

### Prerequisites

1. Following the Docker [installation guide](https://docs.docker.com/engine/installation/).
1. Install [Docker Compose](https://docs.docker.com/compose/)
1. Create a Telegram bot with [@BotFather](https://telegram.me/BotFather)

### Installing

After cloning the repo, you should create and fill in the credentials to the `env.yml` file, see `env.yml.example` for the template

To run locally using Docker:

``` bash
$ docker-compose up
```

To run without Docker (requires locally installed Ruby 2.3.1+):

``` bash
$ mkdir -p /run/links # sudo if this doesn't work
$ bundle install
$ bundle exec ruby bot/link-shortener-bot.rb &
$ bundle exec ruby web/app.rb &
$ bundle exec ruby autoremove/app.rb &
```

## Deployment

On the deployment machine:

``` bash
$ docker-compose up -d
```

## Built With

* [Docker](https://www.docker.com/) - For building and deploying the image
* [atipugin/telegram-bot-ruby](https://github.com/atipugin/telegram-bot-ruby) - Telegram API wrapper
* [tommyku/telegram-bot-starter](https://github.com/tommyku/telegram-bot-starter) - A telegram bot Boilerplate
