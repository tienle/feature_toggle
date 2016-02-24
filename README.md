# Feature Toggle

## Introduction

This gem allows to manage (enable/disable) application features on the fly depending on predefined states (e.g beta, paid user).
There is a UI for toggling the relation (feature matrix) between features and states.

![Image of UI]
(http://i.imgur.com/FC8zrvC.png)


Terms:

**feature**: Define a feature

**state**: Define a state (beta, paid user, etc...)

## Usage

#### 1) Install the Gem

Add to your Gemfile:
```ruby
  gem 'features_toggle'
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

#### 3) Usage
Include this helper into your `application_helper.rb`

```ruby
module ApplicationHelper
  include FeatureToggle::FeaturesHelper
end
```

From the view (eg. Haml)

```haml
  - if feature? :employee_file
    = render 'employee_file_partial'
```

Or

```ruby
FeatureToggle.on?(:employee_file, state_context)
```
With `state_context` is the `self` binding for state's `value` block.

So, the feature will be enabled if we have turned on it for one of the states that meet the `value` condition.


You could toggle feature programmatically by:

```ruby
  FeatureToggle::Feature.create(feature: 'employee_file', state: 'premium', enable: true)
```



Happy coding!

--------

This project rocks and uses MIT-LICENSE.
