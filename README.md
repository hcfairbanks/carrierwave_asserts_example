# carrierwave_asserts gem example app

This app is an example of the minitest carrierwave_assets gem.

These additional asserts are modeld after the carrierwave

rspec spec helpers. Look at the tests/uploader/picture_uploader_test.rb for ussage of the carrierwave_asserts gem

The app requires xxx and xxx

The can be installed as follows:
## Installation

### Dependencies

```imagemagick libmagickwand-dev```

You can install them on ubuntu as follows

```sudo apt-get install imagemagick libmagickwand-dev```


This app requires the following gems

```
gem 'carrierwave', '~> 1.0'
gem 'carrierwave_asserts', git: 'https://github.com/hcfairbanks/carrierwave_asserts'
gem "rmagick", "~> 2.13.1"
```

This app was made using the following. The asserts gem may work with other versions.
ruby version
Rails 5.1.4

rails version
ruby 2.4.0p0

after installin the app, run rails test to see the carrierwave_asserts work.
