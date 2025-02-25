defmodule PillPal.AccountsTest do
  use PillPal.DataCase

  alias PillPal.Accounts

  describe "users" do
    alias PillPal.Accounts.User

    @invalid_attrs %{id: nil, name: nil, email: nil, avatar: nil}

    test "list_users/0 returns all users" do
      user = Factory.insert(:user)
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = Factory.insert(:user)
      assert Accounts.get_user!(user.id) == user
    end

    test "get_user_by_email/1 returns the user with given email" do
      user = Factory.insert(:user)
      assert Accounts.get_user_by_email(user.email) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{
        name: "some name",
        email: "some email",
        avatar: "some avatar"
      }

      assert {:ok, %User{} = user} = Accounts.create_user(valid_attrs)

      assert user.name == "some name"
      assert user.email == "some email"
      assert user.avatar == "some avatar"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = Factory.insert(:user)

      update_attrs = %{
        name: "some updated name",
        email: "some updated email",
        avatar: "some updated avatar"
      }

      assert {:ok, %User{} = user} = Accounts.update_user(user, update_attrs)
      assert user.name == "some updated name"
      assert user.email == "some updated email"
      assert user.avatar == "some updated avatar"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = Factory.insert(:user)
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = Factory.insert(:user)
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = Factory.insert(:user)
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end
end
