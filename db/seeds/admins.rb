admins = [
    {
        first_name: "Joe", 
        last_name: "Cembrok",
        email: "joe@joe.com",
        district_id: 1,
        password: "joe"
    }
]

Admin.delete_all
Admin.create!(admins)