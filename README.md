# Bwoken ROX Client

**[Bwoken](https://github.com/bendyworks/bwoken) client for [ROX Center](https://github.com/lotaris/rox-center).**

[![Gem Version](https://badge.fury.io/rb/rox-client-bwoken.png)](http://badge.fury.io/rb/rox-client-bwoken)

## Installation

In your Gemfile:

```rb
gem 'rox-client-bwoken', '~> 0.1.0'
```

Manually:

    gem install rox-client-bwoken

## Usage

The `rox-bwoken` command is simply a wrapper around `bwoken`:

```
rox-bwoken test --family iphone --simulator --formater rox
```

If you haven't done it already, follow the [ROX client setup procedure](https://github.com/lotaris/rox-client-ruby#setup).

To track a test, you must assign it a ROX test key generated from your ROX Center server.

**NOTE: currently, all the tests in your test suite must be assigned a test key for the client to work.**

Test keys are assigned to a test by adding a special annotation in the name:

```rb
test("Main menu display Home and return to menu @rox(395f01a2b247)", function(target, app) {
  var window = app.mainWindow();
  window.tableViews()["mainMenu"].cells()["Home"].tap();
  assertEquals("Home", app.navigationBar().staticTexts()[0].value(), "User should be on Home screen");
});
```

## Contributing

* [Fork](https://help.github.com/articles/fork-a-repo)
* Create a topic branch - `git checkout -b my_feature`
* Push to your branch - `git push origin my_feature`
* Create a [pull request](http://help.github.com/pull-requests/) from your branch

Please add a [changelog](CHANGELOG.md) entry with your name for new features and bug fixes.

## License

The Bwoken ROX Client is licensed under the [MIT License](http://opensource.org/licenses/MIT).
See [LICENSE.txt](LICENSE.txt) for the full license.
