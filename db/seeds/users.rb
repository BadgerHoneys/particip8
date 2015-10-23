users = [
    {
        first_name: "Josh", 
        last_name: "Woodward",
        email: "josh@josh.com",
        password: "josh"
    },
    {
        first_name: "Zack", 
        last_name: "Downs",
        email: "zack@zack.com",
        password: "zack"
    },
    {
        first_name: "Paul", 
        last_name: "Darragh",
        email: "paul@paul.com",
        password: "paul"
    }
]
User.delete_all
User.create!(users)
