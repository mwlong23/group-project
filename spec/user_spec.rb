require('spec_helper')


describe(User) do
  it("ensures the length of password is at least 8 characters") do
    user = User.new({:password => "a".*(6),first_name: "a".*(3), last_name: "a".*(14)})
    expect(user.save()).to(eq(false))
  end
  it("ensures the length of password is at most 25 characters") do
    user = User.new({password: "a".*(26),first_name: "a".*(3), last_name: "a".*(14)})
    expect(user.save()).to(eq(false))
  end
  it("ensures a pasword between 8 and 25 characters will sucessfully save") do
    user = User.new({password: "a".*(15),  first_name: "a".*(3), last_name: "a".*(14)})
    expect(user.save()).to(eq(true))
  end
  it("ensures a first_name contains at least 2 characters") do
    user = User.new({password: "a".*(15), first_name: "a".*(1), last_name: "a".*(14)})
    expect(user.save()).to(eq(false))
  end
  it("ensures a first_name contains at most 15 characters") do
    user = User.new({password: "a".*(15), first_name: "a".*(16), last_name: "a".*(14)})
    expect(user.save()).to(eq(false))
  end
  it("ensures a first_name between 2 and 15 chars will be created") do
    user = User.new({password: "a".*(15), first_name: "a".*(14), last_name: "a".*(14)})
    expect(user.save()).to(eq(true))
  end
  it("ensures a last_name  contains at least 2 characters") do
    user = User.new({password: "a".*(15), first_name: "a".*(14), last_name: "a".*(1)})
    expect(user.save()).to(eq(false))
  end
  it("ensures a last_name contains at most 15 characters") do
    user = User.new({password: "a".*(15), first_name: "a".*(14), last_name: "a".*(16)})
    expect(user.save()).to(eq(false))
  end
  it("ensures a last_name between 2 and 15 chars will be created") do
    user = User.new({password: "a".*(15), first_name: "a".*(14), last_name: "a".*(14)})
    expect(user.save()).to(eq(true))
  end
end
