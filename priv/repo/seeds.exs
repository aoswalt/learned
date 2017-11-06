# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Learned.Repo.insert!(%Learned.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
#
#     mix ecto.reset will rebuild the database with seeding

alias Learned.Repo

user_list = ~w(Admin Tester Person Random)

alias Learned.User

Repo.delete_all User
user_list
|> Enum.map(fn u -> Repo.insert!(%User{name: u}) end)

post_list = [
  "Test post",
  "More testing",
  "Some other test",
  "another one",
  "random message",
  "lorem ipsum dolor sit amet",
  "Et minus necessitatibus et quia accusantium tenetur esse. Temporibus et totam aspernatur est beatae adipisci corporis. Velit omnis aut magnam. Corrupti iure dolore architecto qui officia optio odio.",
  "Molestiae pariatur vel et aliquam omnis qui optio exercitationem. Aliquid non molestias quaerat esse magni sit. Nihil architecto esse repellat atque tenetur reprehenderit. Perferendis voluptatem qui voluptatem id id nostrum aperiam.",
  "Atque aut ipsam repudiandae adipisci. Aliquid harum nesciunt temporibus non. Dolor fuga tempore debitis sed temporibus molestiae minima. Qui dicta quo suscipit consectetur vel esse est.\nUllam doloremque fugiat est nemo. Magnam saepe sit minima id. Itaque est illum quo. Nemo mollitia quos excepturi dolores.",
]

alias Learned.Post

Repo.delete_all Post
# TODO(adam): make this generate based on list
Repo.insert!(%Post{text: Enum.at(post_list, 0), user_id: 1})
Repo.insert!(%Post{text: Enum.at(post_list, 1), user_id: 3})
Repo.insert!(%Post{text: Enum.at(post_list, 2), user_id: 2})
Repo.insert!(%Post{text: Enum.at(post_list, 3), user_id: 4})
Repo.insert!(%Post{text: Enum.at(post_list, 4), user_id: 1})
Repo.insert!(%Post{text: Enum.at(post_list, 5), user_id: 3})
Repo.insert!(%Post{text: Enum.at(post_list, 6), user_id: 3})
Repo.insert!(%Post{text: Enum.at(post_list, 7), user_id: 2})
Repo.insert!(%Post{text: Enum.at(post_list, 8), user_id: 1})
