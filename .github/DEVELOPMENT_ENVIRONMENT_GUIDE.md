# Development environment guide

## Preparing

Clone `ruby-on-strum-healthcheck` repository:

```bash
git clone https://github.com/on-strum/ruby-on-strum-healthcheck.git
cd  ruby-gem
```

Configure latest Ruby environment:

```bash
echo 'ruby-3.2.0' > .ruby-version
cp .circleci/gemspec_latest on_strum-healthcheck.gemspec
```

## Commiting

Commit your changes excluding `.ruby-version`, `on_strum-healthcheck.gemspec`

```bash
git add . ':!.ruby-version' ':!on_strum-healthcheck.gemspec'
git commit -m 'Your new awesome on_strum-healthcheck feature'
```
