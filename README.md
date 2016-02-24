= FeatureToggle

## Introduction

This gem allows to manage (enable/disable) application features on the fly depending on predefined states (e.g beta, paid user).
There is an UI for toggling the relation (feature matrix) between features and states.

![Image of UI]
(http://imgur.com/CvrN2n7)

**feature**: Define a feature
**state**: Define a state (beta, paid user, etc...)

## Usage

#### 1) Install the Gem

Add to your Gemfile:
```ruby
  gem 'feature_toggle'
```

#### 2) Configuration

Mount the feature management page to `routes.rb`

```ruby
  mount FeatureToggle::Engine => "/feature_toggle"
```

**Add an "feature_toggle.rb" initializer**

Setup the feature toggle page

```ruby
  FeatureToggle.setup do |config|
    config.layout = 'admin'
    config.authentication_method = :authenticate_admin!
  end
```

Describe the different features and states

```ruby
  FeatureToggle.define do
    feature :employment_settings do
      desc "Employment settings"
    end

    feature :employee_file do
      desc "Access employee file"

      feature :create
      feature :destroy
    end

    state :premium do
      desc "Premium plan"
      value { current_user.premium? }
    end

    state :free do
      desc "Trial user"
      value { current_user.free? }
    end
  end

```

You could toggle feature programmatically by:

```ruby
  FeatureToggle::Feature.create(feature: 'employee_file', state: 'premium', enable: true)
```

This project rocks and uses MIT-LICENSE.
