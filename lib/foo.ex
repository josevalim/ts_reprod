defmodule MyApp.Repo do
  use Ecto.Repo, otp_app: :foo, adapter: Ecto.Adapters.Postgres
end

defmodule MyApp.SomeSchema do
  defstruct [:some_field, :some_assocs]
end

defmodule MyApp.SomeOtherSchema do
  defstruct [:field_1]
end

defmodule MyApp.Seeds do
  def seed() do
    Ecto.Migrator.with_repo(MyApp.Repo, fn repo ->
      for i <- 1..100//1 do
        %MyApp.SomeSchema{
          some_field: "foo",
          some_assocs: [
            %MyApp.SomeOtherSchema{
              field_1: "bar"
            }
          ]
        }
        |> repo.insert!()
      end
    end)
  end
end
