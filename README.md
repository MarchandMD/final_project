## Final project for Mod 3 Turing 2208 cohort: Lunch and Learn

Brief overview

### Learning Goals (requested section 1)
- Describe very briefly but clearly what the project does.
- State if it is out-of-the-box user-friendly, so it’s clear to the user.
- List its most useful/innovative/noteworthy features.
- State its goals/what problem(s) it solves.
- Note and briefly describe any key concepts (technical, philosophical, or both) important to the user’s understanding.
- Link to any supplementary blog posts or project main pages.
- Note its development status.
- Include badges.
- If possible, include screenshots and demo videos.

### How to clone and setup application

1. `git clone <this repo>`
2. `cd` into the repo on your local machine
3. bundle (or `bundle install`)
4. `rails g rspec:install`
5. `bundle exec figaro install`
6.


Include any essential instructions for:
- Getting it
- Installing It
- Configuring It
- Running it

### Where you can get your own API keys

[Edamam API Key setup here](https://www.edamam.com/)
You'll want the Recipes API (at the time of writing this - January 2023 - there are 4 possible APIs: Recipes, Recipe Content Management, Food, Nutrition Analysis; use the Recipes one)

[Edamam API documentation here](https://developer.edamam.com/edamam-docs-recipe-api)

API key can be passed in params as `app_key`; you'll also need to pass an `app_id`, which is also generated while generating an api_key. 

### Happy path endpoint usage

blah blah blah

### gems installed

- `rubocop`
- `faraday`
- `figaro`
- `jsonapi-serializer`
- `pry-rails`
- `rspec-rails`
- `simplecov`
- `webmock`
- `vcr`

### Contributing
- Me!

### TODO
- Next steps
- Features planned

### Contact
- Submit a PR and just add some comments there! Happy to meet you!

### License
the standard MIT stuff
