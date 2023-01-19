## Lunch and Learn - API consumption, aggregation and exposure

I am actively seeking employment!

If this profile or repo looks promising, please contact me! I'd love to start a conversation: <MichaelDavidMarchand@gmail.com>

|ToC|
|---|
|[Learning Goals](#learning-goals)|  
[Setup](#setup)
[Endpoints](#endpoints)
[API keys needed](#api-keys-needed)
[To Do](#to-do)


## Learning Goals
- Consumes multiple APIs and then aggregates them into JSON data and exposes them 
- Uses APIs that require authentication
- Serializes data into JSON using multiple techniques: Gems and hand-rolling
- Use test-driven development as well as BDD
- Teach OOP fundamentals such as abstraction and encapsulation
- Access and expose YouTube resources via their publicly available API

### Setup

1. `git clone <this repo>`
2. `cd` into the repo on your local machine
3. bundle (or `bundle install`)
4. `rails g rspec:install`
5. `bundle exec figaro install`


### Endpoints

- `localhost:3000/api/v1/recipes`
- `localhost:3000/api/v1/recipes?country=<country_here>`
- `localhost:3000/api/v1/learning_resources?country=<country_here>`


### API keys needed

[Edamam API Key setup here](https://www.edamam.com/)
You'll want the Recipes API (at the time of writing this - January 2023 - there are 4 possible APIs: Recipes, Recipe Content Management, Food, Nutrition Analysis; use the Recipes one)

[Edamam API documentation here](https://developer.edamam.com/edamam-docs-recipe-api)

API key can be passed in params as `app_key`; you'll also need to pass an `app_id`, which is also generated while generating an api_key.

### To do

- record video of endpoints in action
- record video of test suite
- grab screenshot of wireframes
- add remaining endpoints
- add remaining required API documentation

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

