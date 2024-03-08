# Development environment guide

## Preparing

Clone `ruby-on-strum-gem-name` repository:

```bash
git clone https://github.com/on-strum/ruby-on-strum-gem-name.git
cd  ruby-gem
```

Configure latest Ruby environment:

```bash
echo 'ruby-3.2.0' > .ruby-version
cp .circleci/gemspec_latest on_strum-gem_name.gemspec
```

## Commiting

Commit your changes excluding `.ruby-version`, `on_strum-gem_name.gemspec`

```bash
git add . ':!.ruby-version' ':!on_strum-gem_name.gemspec'
git commit -m 'Your new awesome on_strum-gem_name feature'
```
