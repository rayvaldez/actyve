Use the Ruby on Rails framework.

Your models must:

# • Include at least one has_many, at least one belongs_to, and at least two has_many :through relationships

  - A USER has_many ACTIVITIES, and has_many EXERCISES through ACTIVITIES. The EXERCISE model
  has_many ACTIVITIES, and has_many USERS through ACTIVITIES.

# • Include a many-to-many relationship implemented with has_many :through associations. The join table must include a user-submittable attribute — that is to say, some attribute other than its foreign keys that can be submitted by the app's user

  - The join table will be the ACTIVITIES model. The user_id and the exercise_id will be the
    foreign keys. There will be a number of submittable attributes a USER can input:

  - ACTIVITY
    Name: (Give the activity a title)
    Location:
    Duration:
    Calories burned:
    Comments:

# Your models must include reasonable validations for the simple attributes. You don't need to add every possible validation or duplicates, such as presence and a minimum length, but the models should defend against invalid data.

  - I will ensure models and forms will have the appropriate validations to prevent bad data from
  being persisted to the database.

# You must include at least one class level ActiveRecord scope method. a. Your scope method must be chainable, meaning that you must use ActiveRecord Query methods within it (such as .where and .order) rather than native ruby methods (such as #find_all or #sort).

There are a couple of scope methods I can implement for a USER to query:

  - All ACTIVITIES from that USER
  - All ACTIVITIES from a specific EXERCISE


# Your application must provide standard user authentication, including signup, login, logout, and passwords.

# Your authentication system must also allow login from some other service. Facebook, Twitter, Foursquare, Github, etc...

  - I will allow login through facebook.

# You must include and make use of a nested resource with the appropriate RESTful URLs.

# • You must include a nested new route with form that relates to the parent resource

   - The ACTIVITY model will be nested under the EXERCISE model. A USER will choose a type of     EXERCISE to post to, so the route will look something like exercises/1/activities/new

# • You must include a nested index or show route

Your forms should correctly display validation errors. a. Your fields should be enclosed within a fields_with_errors class b. Error messages describing the validation failures must be present within the view.

Your application must be, within reason, a DRY (Do-Not-Repeat-Yourself) rails app.

# • Logic present in your controllers should be encapsulated as methods in your models.

# • Your views should use helper methods and partials when appropriate.

# • Follow patterns in the Rails Style Guide and the Ruby Style Guide.

Do not use scaffolding to build your project. Your goal here is to learn. Scaffold is a way to get up and running quickly, but learning a lot is not one of the benefits of scaffolding.
