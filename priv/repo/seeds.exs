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

alias Learned.Repo

user_list = ~w(Admin Tester Person Random)

alias Learned.User

Repo.delete_all User
user_list
|> Enum.map(fn u -> Repo.insert!(%User{name: u}) end)

til_list = [
  "Test TIL",
  "More testing",
  "Some other test",
  "another one",
  "random message",
  "lorem ipsum dolor sit amet",
]

alias Learned.Til

Repo.delete_all Til
# TODO(adam): make this generate based on list
Repo.insert!(%Til{text: Enum.at(til_list, 0), user_id: 1})
Repo.insert!(%Til{text: Enum.at(til_list, 1), user_id: 3})
Repo.insert!(%Til{text: Enum.at(til_list, 2), user_id: 2})
Repo.insert!(%Til{text: Enum.at(til_list, 3), user_id: 4})
Repo.insert!(%Til{text: Enum.at(til_list, 4), user_id: 1})
Repo.insert!(%Til{text: Enum.at(til_list, 4), user_id: 3})
